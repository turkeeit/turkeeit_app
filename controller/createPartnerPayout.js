const connection = require("../config/dbconfig");

function createPartnerPayout(req, res) {
  console.log("Creating partner payout...");

  const { partner_order_id } = req.body;

  if (!partner_order_id) {
    return res.status(400).json({
      success: false,
      message: "partner_order_id is required",
    });
  }

  // 1) Check payout already exists
  const checkPayoutQuery = `
    SELECT id, payout_status
    FROM partner_payouts
    WHERE partner_order_id = ?
    LIMIT 1
  `;

  connection.query(
    checkPayoutQuery,
    [partner_order_id],
    (payoutErr, payoutResults) => {
      if (payoutErr) {
        console.error("Error checking existing payout:", payoutErr);
        return res.status(500).json({
          success: false,
          message: "Database error while checking existing payout",
        });
      }

      if (payoutResults.length > 0) {
        return res.status(409).json({
          success: false,
          message: "Payout already created for this partner order",
        });
      }

      // 2) Fetch partner order details
      const partnerOrderQuery = `
      SELECT
        po.id AS partner_order_id,
        po.order_id,
        po.partner_id,
        po.order_status,
        po.total_amount,
        po.admin_commission,
        po.partner_earning
      FROM partner_orders po
      WHERE po.id = ?
      LIMIT 1
    `;

      connection.query(
        partnerOrderQuery,
        [partner_order_id],
        (partnerErr, partnerResults) => {
          if (partnerErr) {
            console.error("Error fetching partner order:", partnerErr);
            return res.status(500).json({
              success: false,
              message: "Database error while fetching partner order",
            });
          }

          if (partnerResults.length === 0) {
            return res.status(404).json({
              success: false,
              message: "Partner order not found",
            });
          }

          const partnerOrder = partnerResults[0];

          if (partnerOrder.order_status !== "completed") {
            return res.status(400).json({
              success: false,
              message:
                "Payout can only be created when partner order is completed",
            });
          }

          // 3) Check main order payment status
          const orderQuery = `
        SELECT order_id, payment_status, payment_method, status
        FROM orders
        WHERE order_id = ?
        LIMIT 1
      `;

          connection.query(
            orderQuery,
            [partnerOrder.order_id],
            (orderErr, orderResults) => {
              if (orderErr) {
                console.error("Error fetching main order:", orderErr);
                return res.status(500).json({
                  success: false,
                  message: "Database error while fetching main order",
                });
              }

              if (orderResults.length === 0) {
                return res.status(404).json({
                  success: false,
                  message: "Main order not found",
                });
              }

              const order = orderResults[0];

              if (order.payment_status !== "paid") {
                return res.status(400).json({
                  success: false,
                  message:
                    "Payout can only be created when customer payment status is paid",
                });
              }

              const totalOrderAmount = Number(partnerOrder.total_amount) || 0;
              const platformFee = Number(partnerOrder.admin_commission) || 0;
              const taxes = 0; // keep 0 for now unless you want separate tax logic
              const partnerEarning = Number(partnerOrder.partner_earning) || 0;

              const insertPayoutQuery = `
          INSERT INTO partner_payouts (
            partner_order_id,
            order_id,
            partner_id,
            total_order_amount,
            platform_fee,
            taxes,
            partner_earning,
            payout_status
          )
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `;

              const insertValues = [
                partnerOrder.partner_order_id,
                partnerOrder.order_id,
                partnerOrder.partner_id,
                totalOrderAmount,
                platformFee,
                taxes,
                partnerEarning,
                "pending",
              ];

              connection.query(
                insertPayoutQuery,
                insertValues,
                (insertErr, insertResult) => {
                  if (insertErr) {
                    console.error("Error creating payout:", insertErr);
                    return res.status(500).json({
                      success: false,
                      message: "Database error while creating payout",
                      error: insertErr.message,
                    });
                  }

                  return res.status(201).json({
                    success: true,
                    message: "Partner payout created successfully",
                    payout_id: insertResult.insertId,
                    data: {
                      partner_order_id: partnerOrder.partner_order_id,
                      order_id: partnerOrder.order_id,
                      partner_id: partnerOrder.partner_id,
                      total_order_amount: totalOrderAmount,
                      platform_fee: platformFee,
                      taxes,
                      partner_earning: partnerEarning,
                      payout_status: "pending",
                    },
                  });
                },
              );
            },
          );
        },
      );
    },
  );
}

module.exports = createPartnerPayout;
