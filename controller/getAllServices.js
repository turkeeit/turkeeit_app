const express = require("express");
const connection = require("../config/dbconfig");

function getAllServices(req, res) {
  console.log("Fetching all services...");

  const query = `SELECT * FROM services`;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    res.status(200).json({
      message: "Services retrieved successfully",
      services: results,
    });
  });
}

module.exports = getAllServices;
