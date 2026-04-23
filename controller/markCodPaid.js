const connection = require("../config/dbconfig");

function markCodPaid(req, res) {
  console.log("Marking COD payment as paid...");

  // token verify middleware should already set mobile number
  const partner_mobile_number =
    req.headers.mobile_number || req.user?.mobile_number;

  const { partner_order_id } = req.body;

  if (!partner_mobile_number) {
    return res.status(401).json({
      success: false,
      message: "Unauthorized partner",
    });
  }

  if (!partner_order_id) {
    return res.status(400).json({
      success: false,
      message: "partner_order_id is required",
    });
  }

  // 1) Find actual partner id from mobile number
  const getPartnerQuery = `
    SELECT id, mobile_number
    FROM partners
    WHERE mobile_number = ?
    LIMIT 1
  `;

  connection.query(
    getPartnerQuery,
    [partner_mobile_number],
    (partnerErr, partnerResults) => {
      if (partnerErr) {
        console.error("Error fetching partner:", partnerErr);
        return res.status(500).json({
          success: false,
          message: "Database error while fetching partner details",
        });
      }

      if (partnerResults.length === 0) {
        return res.status(404).json({
          success: false,
          message: "Partner not found",
        });
      }

      const partner_id = String(partnerResults[0].id);

      // 2) Check partner order belongs to this partner
      const getOrderQuery = `
        SELECT id, order_id, partner_id, payment_mode, payment_status, order_status
        FROM partner_orders
        WHERE id = ? AND partner_id = ?
        LIMIT 1
      `;

      connection.query(
        getOrderQuery,
        [partner_order_id, partner_id],
        (err, results) => {
          if (err) {
            console.error("Error fetching partner order:", err);
            return res.status(500).json({
              success: false,
              message: "Database error while fetching order",
            });
          }

          if (results.length === 0) {
            return res.status(404).json({
              success: false,
              message:
                "Partner order not found or not assigned to this partner",
            });
          }

          const order = results[0];

          if (String(order.payment_mode).toUpperCase() !== "COD") {
            return res.status(400).json({
              success: false,
              message: "This is not a COD order",
            });
          }

          if (String(order.payment_status).toLowerCase() === "paid") {
            return res.status(400).json({
              success: false,
              message: "Payment already marked as paid",
            });
          }

          if (String(order.order_status).toLowerCase() !== "completed") {
            return res.status(400).json({
              success: false,
              message: "Order must be completed before marking COD paid",
            });
          }

          connection.beginTransaction((txErr) => {
            if (txErr) {
              console.error("Transaction start error:", txErr);
              return res.status(500).json({
                success: false,
                message: "Failed to start transaction",
              });
            }

            // 3) Update partner_orders table
            const updatePartnerOrderQuery = `
              UPDATE partner_orders
              SET
                payment_status = 'paid',
                updated_at = CURRENT_TIMESTAMP
              WHERE id = ? AND partner_id = ?
            `;

            connection.query(
              updatePartnerOrderQuery,
              [partner_order_id, partner_id],
              (updateErr, updateResult) => {
                if (updateErr) {
                  return connection.rollback(() => {
                    console.error("Error updating partner_orders:", updateErr);
                    return res.status(500).json({
                      success: false,
                      message: "Error updating partner order payment",
                    });
                  });
                }

                if (updateResult.affectedRows === 0) {
                  return connection.rollback(() => {
                    return res.status(404).json({
                      success: false,
                      message: "Partner order update failed",
                    });
                  });
                }

                // 4) Update main orders table
                const updateOrderQuery = `
                  UPDATE orders
                  SET
                    payment_status = 'paid',
                    modified_at = CURRENT_TIMESTAMP
                  WHERE order_id = ?
                `;

                connection.query(
                  updateOrderQuery,
                  [order.order_id],
                  (orderErr, orderResult) => {
                    if (orderErr) {
                      return connection.rollback(() => {
                        console.error("Error updating orders table:", orderErr);
                        return res.status(500).json({
                          success: false,
                          message: "Error updating main order payment",
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
                        message: "COD payment marked as paid successfully",
                        data: {
                          partner_order_id,
                          order_id: order.order_id,
                          partner_id,
                          partner_mobile_number,
                          payment_status: "paid",
                        },
                      });
                    });
                  },
                );
              },
            );
          });
        },
      );
    },
  );
}

module.exports = markCodPaid;
