const express = require("express");
const connection = require("../config/dbconfig");

function getAllCartItems(req, res) {
  const user_id = req.headers.mobile_number;
  console.log("Fetching all cart Items...");

  const query = `SELECT * FROM cart where user_id='${user_id}'`;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    res.status(200).json({
      message: "Services retrieved successfully",
      cartItems: results,
    });
  });
}

module.exports = getAllCartItems;
