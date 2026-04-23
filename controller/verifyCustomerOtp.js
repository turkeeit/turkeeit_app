const connection = require("../config/dbconfig");

function verifyCustomerOtp(req, res) {
  console.log("Verifying customer OTP...");

  // token verify middleware should already set mobile number
  const partner_mobile_number =
    req.headers.mobile_number || req.user?.mobile_number;

  const { partner_order_id, customer_otp } = req.body;

  if (!partner_mobile_number) {
    return res.status(401).json({
      success: false,
      message: "Unauthorized partner",
    });
  }

  if (!partner_order_id || !customer_otp) {
    return res.status(400).json({
      success: false,
      message: "partner_order_id and customer_otp are required",
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
        SELECT id, partner_id, customer_otp AS db_otp, otp_verified, order_status
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

          if (String(order.order_status).toLowerCase() !== "in_progress") {
            return res.status(400).json({
              success: false,
              message: "OTP can only be verified when service is in progress",
            });
          }

          if (Number(order.otp_verified) === 1) {
            return res.status(400).json({
              success: false,
              message: "OTP already verified",
            });
          }

          if (String(order.db_otp) !== String(customer_otp)) {
            return res.status(400).json({
              success: false,
              message: "Invalid OTP",
            });
          }

          const updateQuery = `
            UPDATE partner_orders
            SET
              otp_verified = 1,
              updated_at = CURRENT_TIMESTAMP
            WHERE id = ? AND partner_id = ?
          `;

          connection.query(
            updateQuery,
            [partner_order_id, partner_id],
            (updateErr, updateResult) => {
              if (updateErr) {
                console.error("Error updating OTP status:", updateErr);
                return res.status(500).json({
                  success: false,
                  message: "Database error while verifying OTP",
                });
              }

              if (updateResult.affectedRows === 0) {
                return res.status(404).json({
                  success: false,
                  message: "OTP verification update failed",
                });
              }

              return res.status(200).json({
                success: true,
                message: "Customer OTP verified successfully",
                data: {
                  partner_order_id,
                  partner_id,
                  partner_mobile_number,
                  otp_verified: 1,
                },
              });
            },
          );
        },
      );
    },
  );
}

module.exports = verifyCustomerOtp;
