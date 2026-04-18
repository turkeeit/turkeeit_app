const connection = require("../config/dbconfig");

function getAllOrdersAdmin(req, res) {
  console.log("Fetching orders list...");

  const ordersQuery = `
    SELECT
      id,
      order_id,
      user_id,
      status,
      total_price,
      address,
      payment_id,
      razorpay_order_id,
      created_at,
      modified_at,
      service_date,
      service_time,
      payment_method,
      payment_status,
      razorpay_payment_id,
      razorpay_signature
    FROM orders
    ORDER BY id DESC
  `;

  connection.query(ordersQuery, async (err, orders) => {
    if (err) {
      console.error("Database error while fetching orders:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (orders.length === 0) {
      return res.status(404).json({ error: "No orders found" });
    }

    try {
      const orderListWithItems = await Promise.all(
        orders.map((order) => {
          return new Promise((resolve, reject) => {
            const itemsQuery = `
              SELECT
                oi.id,
                oi.order_id,
                oi.service_id,
                oi.quantity,
                oi.price,
                oi.total_price,
                oi.created_at,
                oi.modified_at,
                s.name AS service_name,
                s.image_url AS service_image,
                s.service_type,
                s.duration_min,
                s.duration_max
              FROM order_items oi
              JOIN services s ON s.id = oi.service_id
              WHERE oi.order_id = ?
            `;

            connection.query(itemsQuery, [order.order_id], (itemErr, items) => {
              if (itemErr) {
                console.error(
                  `Error fetching items for order ${order.order_id}:`,
                  itemErr,
                );
                return reject(itemErr);
              }

              resolve({
                ...order,
                address: order.address
                  ? order.address.replace(/\n/g, ", ")
                  : "",
                order_items: items,
              });
            });
          });
        }),
      );

      return res.status(200).json({
        success: true,
        message: "Order details retrieved successfully",
        order_list: orderListWithItems,
      });
    } catch (error) {
      console.error("Unexpected error:", error);
      return res.status(500).json({ error: "Something went wrong" });
    }
  });
}

module.exports = getAllOrdersAdmin;
