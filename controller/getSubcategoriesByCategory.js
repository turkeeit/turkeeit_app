const express = require("express");
const connection = require("../config/dbconfig");

function getSubcategoriesByCategory(req, res) {
  const category_id = req.params.categoryId;

  console.log("Fetching subcategories for category:", category_id);

  const query = `SELECT * FROM subcategory WHERE category_id = ?`;

  connection.query(query, [category_id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    res.status(200).json({
      message: "Subcategories retrieved successfully",
      subcategories: results,
    });
  });
}

module.exports = getSubcategoriesByCategory;
