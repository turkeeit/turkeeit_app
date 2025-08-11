const express = require("express");
const connection = require("../config/dbconfig");

function getOrderDetails(req, res) {
  console.log("Fetching order details...");

  const order_id = req.query.order_id;

  if (!order_id) {
    return res.status(400).json({ error: "Order ID is required" });
  }

  // Fetch order details
  const query = `SELECT * FROM orders WHERE order_id = ?`;

  connection.query(query, [order_id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Order not found" });
    }

    const order = results[0];

    // Fetch related order_items + service details
    const itemsQuery = `
      SELECT 
        oi.*, 
        s.name AS service_name, 
        s.price AS service_price,
        s.image_url AS service_image
      FROM order_items oi
      JOIN services s ON s.id = oi.service_id
      WHERE oi.order_id = ?
    `;

    connection.query(itemsQuery, [order_id], (itemErr, items) => {
      if (itemErr) {
        console.error(`Error fetching items for order ${order_id}:`, itemErr);
        return res.status(500).json({ error: "Database error fetching items" });
      }

      // Return order with its items
      res.status(200).json({
        message: "Order details retrieved successfully",
        order: {
          ...order,
          order_items: items,
        },
      });
    });
  });
}

module.exports = getOrderDetails;
