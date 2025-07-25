const express = require("express");
const connection = require("../config/dbconfig");

function removeOrder(req, res) {
  console.log("Removing order...");

  const { order_id } = req.body; // Get service ID from request body
  console.log(order_id);
  // Validate ID
  if (!order_id) {
    return res.status(400).json({ error: "Order ID is required" });
  }

  // Check if service exists before deleting
  const checkQuery = `SELECT * FROM orders WHERE order_id = ?`;
  connection.query(checkQuery, [order_id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    // Delete the service
    const deleteQuery = `DELETE FROM orders WHERE order_id = ?`;
    connection.query(deleteQuery, [order_id], (deleteErr) => {
      if (deleteErr) {
        console.error("Error deleting order:", deleteErr);
        return res.status(500).json({ error: "Failed to delete order" });
      }

      res.status(200).json({ message: "Order deleted successfully" });
    });
  });
}

module.exports = removeOrder;
