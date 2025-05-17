const express = require("express");
const connection = require("../config/dbconfig");

function getServiceDetails(req, res) {
  console.log("Fetching service details...");

  const id = req.headers.service_id; // Get service ID from query params

  // Validate ID
  if (!id) {
    return res.status(400).json({ error: "Service ID is required" });
  }

  const query = `SELECT * FROM services WHERE id = ?`;

  connection.query(query, [id], (err, results) => {
    if (err) {
      console.error("Error fetching service details:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Service not found" });
    }

    const service = results[0];

    res.status(200).json(service);
  });
}

module.exports = getServiceDetails;
