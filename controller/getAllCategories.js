const express = require("express");
const connection = require("../config/dbconfig");

function getAllCategories(req, res) {
  console.log("Fetching all categories...");

  const query = `SELECT * FROM category`;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    res.status(200).json({
      message: "Categories retrieved successfully",
      category: results,
    });
  });
}

module.exports = getAllCategories;
