const express = require("express");
const connection = require("../config/dbconfig");

function getServiceDetails(req, res) {
  console.log(req.headers);
  console.log("Fetching service details...");
  

  const id = req.headers.service_id;

  if (!id) {
    return res.status(400).json({ error: "Service ID is required" });
  }

  const serviceQuery = `SELECT * FROM services WHERE id = ?`;

  connection.query(serviceQuery, [id], (err, serviceResults) => {
    if (err) {
      console.error("Error fetching service details:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (serviceResults.length === 0) {
      return res.status(404).json({ error: "Service not found" });
    }

    const service = serviceResults[0];

    const includesQuery = `SELECT description FROM service_includes WHERE service_id = ?`;
    const excludesQuery = `SELECT description FROM service_excludes WHERE service_id = ?`;

    connection.query(includesQuery, [id], (incErr, includesResults) => {
      if (incErr) {
        console.error("Error fetching includes:", incErr);
        return res.status(500).json({ error: "Database error on includes" });
      }

      connection.query(excludesQuery, [id], (excErr, excludesResults) => {
        if (excErr) {
          console.error("Error fetching excludes:", excErr);
          return res.status(500).json({ error: "Database error on excludes" });
        }

        // Combine data
        const fullService = {
          ...service,
          service_includes: includesResults.map((item) => item.description),
          service_excludes: excludesResults.map((item) => item.description),
        };

        res.status(200).json(fullService);
      });
    });
  });
}

module.exports = getServiceDetails;
