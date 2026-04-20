const connection = require("../config/dbconfig");

const updatePartnerOrderStatus = (req, res) => {
  try {
    const partner_id = req.headers.partner_id; // partner id from token/header
    const { order_id, order_status, cancellation_reason } = req.body;

    if (!partner_id || !order_id || !order_status) {
      return res.status(400).json({
        success: false,
        message: "partner_id, order_id and order_status are required",
      });
    }

    const allowedStatuses = [
      "assigned",
      "accepted",
      "rejected",
      "in_progress",
      "completed",
    ];

    if (!allowedStatuses.includes(order_status)) {
      return res.status(400).json({
        success: false,
        message: "Invalid order status",
      });
    }

    let updateFields = `order_status = ?, updated_at = CURRENT_TIMESTAMP`;
    let params = [order_status];

    if (order_status === "accepted") {
      updateFields += `, partner_accept_time = NOW()`;
    }

    if (order_status === "in_progress") {
      updateFields += `, service_start_time = NOW()`;
    }

    if (order_status === "completed") {
      updateFields += `, service_end_time = NOW()`;
    }

    if (order_status === "rejected") {
      if (!cancellation_reason) {
        return res.status(400).json({
          success: false,
          message: "cancellation_reason is required when rejecting an order",
        });
      }
      updateFields += `, cancellation_reason = ?, canceled_by = ?`;
      params.push(cancellation_reason, "partner");
    }

    params.push(partner_id, order_id);

    const checkQuery = `
      SELECT id, order_status
      FROM partner_orders
      WHERE partner_id = ? AND order_id = ?
      LIMIT 1
    `;

    connection.query(
      checkQuery,
      [partner_id, order_id],
      (checkErr, checkResult) => {
        if (checkErr) {
          console.error("Check query error:", checkErr);
          return res.status(500).json({
            success: false,
            message: "Database error while checking order",
          });
        }

        if (checkResult.length === 0) {
          return res.status(404).json({
            success: false,
            message: "Order not found or not assigned to this partner",
          });
        }

        const currentStatus = checkResult[0].order_status;

        if (currentStatus === "completed") {
          return res.status(400).json({
            success: false,
            message: "Completed order cannot be updated",
          });
        }

        const updateQuery = `
        UPDATE partner_orders
        SET ${updateFields}
        WHERE partner_id = ? AND order_id = ?
      `;

        connection.query(updateQuery, params, (updateErr, updateResult) => {
          if (updateErr) {
            console.error("Update query error:", updateErr);
            return res.status(500).json({
              success: false,
              message: "Error while updating order status",
            });
          }

          return res.status(200).json({
            success: true,
            message: "Order status updated successfully",
            affectedRows: updateResult.affectedRows,
          });
        });
      },
    );
  } catch (error) {
    console.error("Controller error:", error);
    return res.status(500).json({
      success: false,
      message: "Internal server error",
    });
  }
};

module.exports = updatePartnerOrderStatus;
