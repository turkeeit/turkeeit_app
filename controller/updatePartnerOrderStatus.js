const connection = require("../config/dbconfig");

const updatePartnerOrderStatus = (req, res) => {
  console.log("Updating partner order status...");

  const partner_id = req.headers.partner_id;
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

  const validTransitions = {
    assigned: ["accepted", "rejected"],
    accepted: ["in_progress", "rejected"],
    in_progress: ["completed"],
    rejected: [],
    completed: [],
  };

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
          message: "Database error while checking partner order",
        });
      }

      if (checkResult.length === 0) {
        return res.status(404).json({
          success: false,
          message: "Order not found or not assigned to this partner",
        });
      }

      const currentStatus = checkResult[0].order_status;

      if (currentStatus === order_status) {
        return res.status(400).json({
          success: false,
          message: `Order is already in ${order_status} status`,
        });
      }

      if (
        validTransitions[currentStatus] &&
        !validTransitions[currentStatus].includes(order_status)
      ) {
        return res.status(400).json({
          success: false,
          message: `Invalid status transition from ${currentStatus} to ${order_status}`,
        });
      }

      let partnerUpdateFields = `order_status = ?, updated_at = CURRENT_TIMESTAMP`;
      const partnerParams = [order_status];

      if (order_status === "accepted") {
        partnerUpdateFields += `, partner_accept_time = NOW()`;
      }

      if (order_status === "in_progress") {
        partnerUpdateFields += `, service_start_time = NOW()`;
      }

      if (order_status === "completed") {
        partnerUpdateFields += `, service_end_time = NOW()`;
      }

      if (order_status === "rejected") {
        if (!cancellation_reason || !String(cancellation_reason).trim()) {
          return res.status(400).json({
            success: false,
            message: "cancellation_reason is required when rejecting an order",
          });
        }

        partnerUpdateFields += `, cancellation_reason = ?, canceled_by = ?`;
        partnerParams.push(cancellation_reason.trim(), "partner");
      }

      partnerParams.push(partner_id, order_id);

      const updatePartnerOrderQuery = `
      UPDATE partner_orders
      SET ${partnerUpdateFields}
      WHERE partner_id = ? AND order_id = ?
    `;

      const updateMainOrderQuery = `
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
          updatePartnerOrderQuery,
          partnerParams,
          (partnerErr, partnerResult) => {
            if (partnerErr) {
              return connection.rollback(() => {
                console.error("Partner order update error:", partnerErr);
                return res.status(500).json({
                  success: false,
                  message: "Failed to update partner order status",
                });
              });
            }

            if (partnerResult.affectedRows === 0) {
              return connection.rollback(() => {
                return res.status(404).json({
                  success: false,
                  message: "Partner order update failed",
                });
              });
            }

            connection.query(
              updateMainOrderQuery,
              [order_status, order_id],
              (orderErr, orderResult) => {
                if (orderErr) {
                  return connection.rollback(() => {
                    console.error("Main order update error:", orderErr);
                    return res.status(500).json({
                      success: false,
                      message: "Failed to update main order status",
                    });
                  });
                }

                if (orderResult.affectedRows === 0) {
                  return connection.rollback(() => {
                    return res.status(404).json({
                      success: false,
                      message: "Main order not found",
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
                    message: "Order status updated successfully in both tables",
                    order_id,
                    order_status,
                  });
                });
              },
            );
          },
        );
      });
    },
  );
};

module.exports = updatePartnerOrderStatus;
