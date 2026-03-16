const express = require("express");
const connection = require("../config/dbconfig");

function getAllSubcategories(req, res) {
  console.log("Fetching all categories...");

  const query = `SELECT * FROM subcategory`;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    res.status(200).json({
      message: "Subcategories retrieved successfully",
      category: results,
    });
  });
}

module.exports = getAllSubcategories;
