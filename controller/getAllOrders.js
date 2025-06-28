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

  const query = `SELECT * FROM orders WHERE user_id = ? AND status != 'pending'`;

  connection.query(query, [user_id], async (err, orders) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (orders.length === 0) {
      return res.status(404).json({ error: "No orders found for this user" });
    }

    try {
      // Fetch order_items + service details for each order
      const orderListWithItems = await Promise.all(
        orders.map((order) => {
          return new Promise((resolve, reject) => {
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

            connection.query(itemsQuery, [order.order_id], (itemErr, items) => {
              if (itemErr) {
                console.error(
                  `Error fetching items for order ${order.order_id}:`,
                  itemErr
                );
                return reject(itemErr);
              }

              // Attach items to each order
              resolve({
                ...order,
                order_items: items,
              });
            });
          });
        })
      );

      // Respond with orders + their items
      res.status(200).json({
        message: "Order details retrieved successfully",
        order_list: orderListWithItems,
      });
    } catch (e) {
      console.error("Unexpected error:", e);
      res.status(500).json({ error: "Something went wrong" });
    }
  });
}

module.exports = getAllOrders;
