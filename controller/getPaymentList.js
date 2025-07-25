const express = require("express");
const connection = require("../config/dbconfig");

function getPaymentList(req, res) {
  console.log("Fetching payment list...");

  const query = `SELECT order_id,total_price,payment_id,razorpay_order_id FROM orders `;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Payment not found" });
    }

    res.status(200).json({
      message: "Payment details retrieved successfully",
      payment_list: results,
    });
  });
}

module.exports = getPaymentList;
