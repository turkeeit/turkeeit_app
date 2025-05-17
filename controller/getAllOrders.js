const express = require("express");
const connection = require("../config/dbconfig");

function getAllOrders(req, res) {
  console.log("Fetching orders list...");

  const user_id = req.headers.mobile_number;

  // Validate input
  if (!user_id) {
    return res
      .status(400)
      .json({ error: "User ID (mobile number) is required in headers" });
  }

  const query = `SELECT * FROM orders WHERE user_id = ?`;

  connection.query(query, [user_id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "No orders found for this user" });
    }

    res.status(200).json({
      message: "Order details retrieved successfully",
      order_list: results,
    });
  });
}

module.exports = getAllOrders;
