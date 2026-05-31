const connection = require("../config/dbconfig");

function adminGetAllServices(req, res) {
  console.log("Fetching services...");

  const query = `
    SELECT 
      c.name AS category_name,
      sc.name AS subcategory_name,

      s.id,
      s.name,
      s.price,
      s.image_url,
      s.subcategory_id,
      s.notes,
      s.performed_by,
      s.duration_min,
      s.duration_max,
      s.tools_used,
      s.service_type,
      s.created_at,
      s.modified_at,

      si.description AS include_description,
      se.description AS exclude_description

    FROM services s

    JOIN subcategory sc 
      ON s.subcategory_id = sc.id

    JOIN category c 
      ON sc.category_id = c.id

    LEFT JOIN service_includes si
      ON s.id = si.service_id

    LEFT JOIN service_excludes se
      ON s.id = se.service_id

    ORDER BY c.id, sc.id
  `;

  connection.query(query, (err, rows) => {
    if (err) {
      console.log("error fetching services", err);

      return res.status(500).json({
        message: "Database error",
      });
    }

    let result = [];

    rows.forEach((row) => {
      let subcategory = result.find(
        (item) =>
          item.category_name === row.category_name &&
          item.subcategory_name === row.subcategory_name,
      );

      if (!subcategory) {
        subcategory = {
          category_name: row.category_name,
          subcategory_name: row.subcategory_name,
          services: [],
        };

        result.push(subcategory);
      }

      let existingService = subcategory.services.find(
        (service) => service.id === row.id,
      );

      // ================= CREATE NEW SERVICE =================

      if (!existingService) {
        existingService = {
          id: row.id,
          name: row.name,
          price: row.price,
          image_url: row.image_url,
          subcategory_id: row.subcategory_id,
          notes: row.notes,
          performed_by: row.performed_by,
          duration_min: row.duration_min,
          duration_max: row.duration_max,
          tools_used: row.tools_used,
          service_type: row.service_type,
          created_at: row.created_at,
          modified_at: row.modified_at,

          service_includes: [],
          service_excludes: [],
        };

        subcategory.services.push(existingService);
      }

      // ================= ADD INCLUDE =================

      if (
        row.include_description &&
        !existingService.service_includes.includes(row.include_description)
      ) {
        existingService.service_includes.push(row.include_description);
      }

      // ================= ADD EXCLUDE =================

      if (
        row.exclude_description &&
        !existingService.service_excludes.includes(row.exclude_description)
      ) {
        existingService.service_excludes.push(row.exclude_description);
      }
    });

    res.status(200).json(result);
  });
}

module.exports = adminGetAllServices;
