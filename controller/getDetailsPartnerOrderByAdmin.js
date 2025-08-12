const connection = require("../config/dbconfig");

function getDetailsPartnerOrderByAdmin(req, res) {
  console.log("Admin fetching detailed breakdown of a partner order...");

  const partner_order_id = req.headers.partner_order_id;

  if (!partner_order_id) {
    return res.status(400).json({
      error: "partner_order_id is required in headers",
    });
  }

  // Step 1: Get partner_orders row
  const partnerOrderQuery = `
    SELECT id, order_id, partner_id, status, assigned_at, completed_at
    FROM partner_orders
    WHERE id = ?
  `;

  connection.query(
    partnerOrderQuery,
    [partner_order_id],
    (err, partnerOrderResults) => {
      if (err) {
        console.error("Database error:", err);
        return res.status(500).json({ error: "Database error" });
      }

      if (partnerOrderResults.length === 0) {
        return res.status(404).json({ error: "Partner order not found" });
      }

      const partnerOrder = partnerOrderResults[0];

      // Step 2: Get corresponding order details
      const orderQuery = `
      SELECT id, order_id, user_id, status, total_price, address, payment_id, razorpay_order_id, created_at, modified_at
      FROM orders
      WHERE order_id = ?
    `;

      connection.query(
        orderQuery,
        [partnerOrder.order_id],
        (err, orderResults) => {
          if (err) {
            console.error("Database error:", err);
            return res.status(500).json({ error: "Database error" });
          }

          if (orderResults.length === 0) {
            return res.status(404).json({ error: "Order not found" });
          }

          const order = orderResults[0];

          // Convert string to number
          const totalAmount = parseFloat(order.total_price) || 0;

          // Example fee calculation (change as needed)
          const platformFeePercent = 10; // 10%
          const taxPercent = 18; // 18% GST

          const platformFee = (platformFeePercent / 100) * totalAmount;
          const taxes = (taxPercent / 100) * platformFee; // tax on platform fee
          const partnerEarning = totalAmount - platformFee - taxes;

          const breakdown = {
            total_order_amount: totalAmount,
            platform_fee: platformFee,
            taxes: taxes,
            partner_earning: partnerEarning,
            platform_commission_percent: platformFeePercent + "%",
            tax_percent: taxPercent + "%",
            amount_to_be_paid_to_partner: partnerEarning,
          };

          res.status(200).json({
            message:
              "Partner order details with earnings breakdown retrieved successfully",
            partner_order: partnerOrder,
            order_details: order,
            breakdown: breakdown,
          });
        }
      );
    }
  );
}

module.exports = getDetailsPartnerOrderByAdmin;
