const connection = require("../config/dbconfig");
const { v4: uuidv4 } = require("uuid");

function assignPartnerToOrder(req, res) {
  console.log("Assigning partner to order...");

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
    LIMIT 1
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
      LIMIT 1
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

      if (!["confirmed", "pending_reassign"].includes(order.status)) {
        return res.status(400).json({
          success: false,
          message: `Order cannot be assigned in '${order.status}' status`,
        });
      }

      // 3) Fetch first service details
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

          // 5) Generate partner order id
          const partnerOrderId = `PO_${uuidv4()}`;

          // 6) Generate customer completion OTP
          const customerOtp = Math.floor(
            1000 + Math.random() * 9000,
          ).toString();

          const insertPartnerOrderQuery = `
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
              customer_otp,
              otp_verified,
              total_amount,
              partner_earning,
              admin_commission,
              payment_mode,
              payment_status,
              service_address
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
          `;

          const insertValues = [
            partnerOrderId,
            order.order_id,
            String(partner_id),
            order.user_id,
            String(service.service_id),
            service.service_name,
            service.service_category || null,
            order.service_date,
            order.service_time,
            "assigned",
            customerOtp, // customer_otp
            0, // otp_verified
            totalAmount,
            partnerEarning,
            adminCommission,
            (order.payment_method || "ONLINE").toUpperCase(),
            order.payment_status || "pending",
            order.address,
          ];

          const updateOrderQuery = `
            UPDATE orders
            SET status = ?, modified_at = CURRENT_TIMESTAMP
            WHERE order_id = ?
          `;

          connection.beginTransaction((txErr) => {
            if (txErr) {
              console.error("Transaction start error:", txErr);
              return res.status(500).json({
                success: false,
                message: "Failed to start transaction",
              });
            }

            connection.query(
              insertPartnerOrderQuery,
              insertValues,
              (insertErr) => {
                if (insertErr) {
                  return connection.rollback(() => {
                    console.error("Error assigning partner:", insertErr);
                    return res.status(500).json({
                      success: false,
                      message: "Database error while assigning partner",
                      error: insertErr.message,
                    });
                  });
                }

                connection.query(
                  updateOrderQuery,
                  ["assigned", order_id],
                  (updateErr, updateResult) => {
                    if (updateErr) {
                      return connection.rollback(() => {
                        console.error(
                          "Error updating orders table:",
                          updateErr,
                        );
                        return res.status(500).json({
                          success: false,
                          message: "Database error while updating main order",
                        });
                      });
                    }

                    if (updateResult.affectedRows === 0) {
                      return connection.rollback(() => {
                        return res.status(404).json({
                          success: false,
                          message:
                            "Order not found while updating main order status",
                        });
                      });
                    }

                    connection.commit((commitErr) => {
                      if (commitErr) {
                        return connection.rollback(() => {
                          console.error("Commit error:", commitErr);
                          return res.status(500).json({
                            success: false,
                            message: "Transaction commit failed",
                          });
                        });
                      }

                      return res.status(200).json({
                        success: true,
                        message: "Partner assigned successfully.",
                        partner_order_id: partnerOrderId,
                        order_id,
                        order_status: "assigned",
                        customer_otp: customerOtp,
                        otp_verified: 0,
                      });
                    });
                  },
                );
              },
            );
          });
        },
      );
    });
  });
}

module.exports = assignPartnerToOrder;
