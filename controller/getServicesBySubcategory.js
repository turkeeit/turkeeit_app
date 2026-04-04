const express = require("express");
const connection = require("../config/dbconfig");

function getServicesBySubcategory(req, res) {
  const subcategory_id = req.params.subcategoryId;

  console.log("Fetching services for subcategory:", subcategory_id);

  const query = `SELECT * FROM services WHERE subcategory_id = ?`;

  connection.query(query, [subcategory_id], (err, results) => {
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

module.exports = getServicesBySubcategory;
