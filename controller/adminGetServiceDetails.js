const connection = require("../config/dbconfig");

function adminGetServiceDetails(req, res) {
  console.log("Fetching service details...");

  const id = req.headers.service_id;

  if (!id) {
    return res.status(400).json({ error: "Service ID is required" });
  }

  const serviceQuery = `SELECT * FROM services WHERE id = ?`;

  connection.query(serviceQuery, [id], (err, serviceResults) => {
    if (err) {
      console.error("Error fetching service:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (serviceResults.length === 0) {
      return res.status(404).json({ error: "Service not found" });
    }

    const service = serviceResults[0];

    const includesQuery = `SELECT description FROM service_includes WHERE service_id = ?`;
    const excludesQuery = `SELECT description FROM service_excludes WHERE service_id = ?`;

    const addonsQuery = `
      SELECT 
        sa.main_service_id,
        sa.addon_service_id,
        s.name,
        s.price
      FROM service_addon sa
      JOIN services s 
        ON sa.addon_service_id = s.id
      WHERE sa.main_service_id = ?
    `;

    // INCLUDES
    connection.query(includesQuery, [id], (incErr, includesResults) => {
      if (incErr) {
        console.error("Error fetching includes:", incErr);
        return res.status(500).json({ error: "Includes error" });
      }

      // EXCLUDES
      connection.query(excludesQuery, [id], (excErr, excludesResults) => {
        if (excErr) {
          console.error("Error fetching excludes:", excErr);
          return res.status(500).json({ error: "Excludes error" });
        }

        // ADDONS
        connection.query(addonsQuery, [id], (addErr, addonsResults) => {
          if (addErr) {
            console.error("Error fetching addons:", addErr);
            return res.status(500).json({ error: "Addons error" });
          }

          // 🔥 FORMAT DATA

          const formattedIncludes = includesResults.map(
            (item) => item.description,
          );

          const formattedExcludes = excludesResults.map(
            (item) => item.description,
          );

          const formattedAddons = addonsResults.map((item) => ({
            main_service_id: item.main_service_id,
            addon_service_id: item.addon_service_id,
            name: item.name,
            price: item.price,
          }));

          const finalResponse = {
            ...service,
            service_includes: formattedIncludes,
            service_excludes: formattedExcludes,
            service_addons: formattedAddons,
          };

          return res.status(200).json(finalResponse);
        });
      });
    });
  });
}

module.exports = adminGetServiceDetails;
