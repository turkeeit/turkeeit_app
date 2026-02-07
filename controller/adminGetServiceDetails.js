const express = require("express");
const connection = require("../config/dbconfig");

function adminGetServiceDetails(req, res) {
  console.log("Fetching service details...");
  // console.log(req.headers);

  const id = req.headers.service_id;

  if (!id) {
    return res.status(400).json({ error: "Service ID is required" });
  }

  // MAIN SERVICE
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

    // INCLUDES
    const includesQuery = `SELECT * FROM service_includes WHERE service_id = ?`;

    // EXCLUDES
    const excludesQuery = `SELECT * FROM service_excludes WHERE service_id = ?`;

    // ✅ ADDONS (JOIN WITH SERVICES)
    const addonsQuery = `SELECT 
      sa.main_service_id,
      sa.addon_service_id,
      s.id,
      s.name,
      s.image_url,
      s.price,
      s.duration_min,
      s.duration_max
   FROM service_addon sa
   JOIN services s 
     ON sa.addon_service_id = s.id
   WHERE sa.main_service_id=?`;

    // FETCH INCLUDES
    connection.query(includesQuery, [id], (incErr, includesResults) => {
      if (incErr) {
        console.error("Error fetching includes:", incErr);
        return res.status(500).json({ error: "Database error on includes" });
      }

      // FETCH EXCLUDES
      connection.query(excludesQuery, [id], (excErr, excludesResults) => {
        if (excErr) {
          console.error("Error fetching excludes:", excErr);
          return res.status(500).json({ error: "Database error on excludes" });
        }

        // ✅ FETCH ADDONS
        connection.query(addonsQuery, [id], (addErr, addonsResults) => {
          if (addErr) {
            console.error("Error fetching add-ons:", addErr);
            return res.status(500).json({ error: "Database error on add-ons" });
          }

          // FINAL RESPONSE
          const fullService = {
            ...service,
            service_includes: includesResults,
            service_excludes: excludesResults,
            service_addons: addonsResults,
          };

          res.status(200).json(fullService);
        });
      });
    });
  });
}

module.exports = adminGetServiceDetails;
