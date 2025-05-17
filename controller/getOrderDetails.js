const express = require("express");
const connection = require("../config/dbconfig");

function getOrderDetails(req, res) {
  console.log("Fetching order details...");

  const order_id = req.query.order_id;

  if (!order_id) {
    return res.status(400).json({ error: "Order ID is required" });
  }

  const query = `SELECT * FROM orders WHERE id = ?`;

  connection.query(query, [order_id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    res.status(200).json({
      message: "Order details retrieved successfully",
      order: results[0],
    });
  });
}

module.exports = getOrderDetails;
