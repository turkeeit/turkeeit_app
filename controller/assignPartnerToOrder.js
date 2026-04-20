const connection = require("../config/dbconfig");

function assignPartnerToOrder(req, res) {
  const { order_id, partner_id } = req.body;

  if (!order_id || !partner_id) {
    return res.status(400).json({
      success: false,
      message: "order_id and partner_id are required.",
    });
  }

  // 1) Check if this order is already assigned
  const checkQuery = `
    SELECT id
    FROM partner_orders
    WHERE order_id = ?
  `;

  connection.query(checkQuery, [order_id], (checkErr, checkResults) => {
    if (checkErr) {
      console.error("Error checking assignment:", checkErr);
      return res.status(500).json({
        success: false,
        message: "Database error while checking assignment",
      });
    }

    if (checkResults.length > 0) {
      return res.status(409).json({
        success: false,
        message: "Order already assigned to a partner.",
      });
    }

    // 2) Fetch order details from orders table
    const orderQuery = `
      SELECT
        order_id,
        user_id,
        status,
        total_price,
        address,
        service_date,
        service_time,
        payment_method,
        payment_status
      FROM orders
      WHERE order_id = ?
    `;

    connection.query(orderQuery, [order_id], (orderErr, orderResults) => {
      if (orderErr) {
        console.error("Error fetching order:", orderErr);
        return res.status(500).json({
          success: false,
          message: "Database error while fetching order",
        });
      }

      if (orderResults.length === 0) {
        return res.status(404).json({
          success: false,
          message: "Order not found.",
        });
      }

      const order = orderResults[0];

      // 3) Fetch service details from order_items + services + subcategories
      const serviceQuery = `
        SELECT
          oi.service_id,
          s.name AS service_name,
          sc.name AS service_category
        FROM order_items oi
        LEFT JOIN services s ON s.id = oi.service_id
        LEFT JOIN subcategory sc ON sc.id = s.subcategory_id
        WHERE oi.order_id = ?
        LIMIT 1
      `;

      connection.query(
        serviceQuery,
        [order_id],
        (serviceErr, serviceResults) => {
          if (serviceErr) {
            console.error("Error fetching service details:", serviceErr);
            return res.status(500).json({
              success: false,
              message: "Database error while fetching service details",
            });
          }

          if (serviceResults.length === 0) {
            return res.status(404).json({
              success: false,
              message: "Service details not found for this order.",
            });
          }

          const service = serviceResults[0];

          // 4) Calculate admin commission and partner earning
          const totalAmount = parseFloat(order.total_price) || 0;
          const adminCommission = Math.round((totalAmount * 10) / 100);
          const partnerEarning = Math.round(totalAmount - adminCommission);

          // 5) Generate partner order id (because partner_orders.id is varchar)
          const partnerOrderId = `PO_${Date.now()}`;

          // 6) Insert into partner_orders
          const insertQuery = `
          INSERT INTO partner_orders (
            id,
            order_id,
            partner_id,
            user_id,
            service_id,
            service_name,
            service_category,
            booking_date,
            booking_time,
            order_status,
            total_amount,
            partner_earning,
            admin_commission,
            payment_mode,
            payment_status,
            service_address
          )
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, "assigned", ?, ?, ?, ?, ?, ?)
        `;

          const values = [
            partnerOrderId,
            order.order_id,
            String(partner_id),
            order.user_id,
            String(service.service_id),
            service.service_name,
            service.service_category || null,
            order.service_date,
            order.service_time,
            order.total_price,
            partnerEarning,
            adminCommission,
            order.payment_method || "online",
            order.payment_status || "pending",
            order.address,
          ];

          connection.query(insertQuery, values, (insertErr) => {
            if (insertErr) {
              console.error("Error assigning partner:", insertErr);
              return res.status(500).json({
                success: false,
                message: "Database error while assigning partner",
                error: insertErr.message,
              });
            }

            return res.status(200).json({
              success: true,
              message: "Partner assigned successfully.",
              partner_order_id: partnerOrderId,
            });
          });
        },
      );
    });
  });
}

module.exports = assignPartnerToOrder;
