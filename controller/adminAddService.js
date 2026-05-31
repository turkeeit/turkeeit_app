const connection = require("../config/dbconfig");

function adminAddService(req, res) {
  console.log("Admin add service API called...");

  const {
    name,
    price,
    image_url,
    subcategory_id,
    notes,
    duration_min,
    duration_max,
    performed_by,
    tools_used,
    service_type,

    service_includes,
    service_excludes,
  } = req.body;

  // required fields check
  if (!name || !price || !image_url || !subcategory_id || !notes) {
    return res.status(400).json({
      success: false,
      message: "name, price, image_url, subcategory_id and notes are required",
    });
  }

  // service type default
  const finalServiceType = service_type || "main";

  const sql = `
    INSERT INTO services (
      name,
      price,
      image_url,
      subcategory_id,
      notes,
      performed_by,
      duration_min,
      duration_max,
      tools_used,
      service_type,
      created_at,
      modified_at
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())
  `;

  const values = [
    name,
    price,
    image_url,
    subcategory_id,
    notes,
    performed_by || null,
    duration_min || null,
    duration_max || null,
    tools_used || null,
    finalServiceType,
  ];

  connection.query(sql, values, (err, result) => {
    if (err) {
      console.error("Error adding service:", err);

      return res.status(500).json({
        success: false,
        message: "Database error",
        error: err.sqlMessage,
      });
    }

    const serviceId = result.insertId;

    // ================= INSERT SERVICE INCLUDES =================

    if (Array.isArray(service_includes) && service_includes.length > 0) {
      const includeValues = service_includes.map((item) => [
        serviceId,
        null,
        item,
      ]);

      const includeSql = `
        INSERT INTO service_includes
        (
          service_id,
          icon,
          description
        )
        VALUES ?
      `;

      connection.query(includeSql, [includeValues], (includeErr) => {
        if (includeErr) {
          console.error("Error adding service includes:", includeErr);
        }
      });
    }

    // ================= INSERT SERVICE EXCLUDES =================

    if (Array.isArray(service_excludes) && service_excludes.length > 0) {
      const excludeValues = service_excludes.map((item) => [
        serviceId,
        null,
        item,
      ]);

      const excludeSql = `
        INSERT INTO service_excludes
        (
          service_id,
          icon,
          description
        )
        VALUES ?
      `;

      connection.query(excludeSql, [excludeValues], (excludeErr) => {
        if (excludeErr) {
          console.error("Error adding service excludes:", excludeErr);
        }
      });
    }

    return res.status(201).json({
      success: true,
      message: "Service added successfully",
      service_id: serviceId,
    });
  });
}

module.exports = adminAddService;
