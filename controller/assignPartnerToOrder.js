const connection = require("../config/dbconfig");

async function assignPartnerToOrder(req, res) {
  const { order_id, partner_id } = req.body;

  if (!order_id || !partner_id) {
    return res.status(400).json({
      success: false,
      message: "order_id and partner_id are required.",
    });
  }

  // Step 1: Check if already assigned
  connection.query(
    "SELECT id FROM partner_orders WHERE order_id = ?",
    [order_id],
    (err, results) => {
      if (err) {
        console.error("Error checking assignment:", err);
        return res
          .status(500)
          .json({ success: false, message: "Database error" });
      }

      if (results.length > 0) {
        return res.status(409).json({
          success: false,
          message: "Order already assigned to a partner.",
        });
      }

      // Step 2: Get order details from `orders` table
      const orderQuery = `
        SELECT order_id, user_id, status, total_price, address, payment_id, razorpay_order_id
        FROM orders
        WHERE order_id = ?
      `;

      connection.query(orderQuery, [order_id], (orderErr, orderData) => {
        if (orderErr) {
          console.error("Error fetching order:", orderErr);
          return res
            .status(500)
            .json({ success: false, message: "Database error" });
        }

        if (orderData.length === 0) {
          return res
            .status(404)
            .json({ success: false, message: "Order not found." });
        }

        const order = orderData[0];

        // Step 3: Calculate breakdown
        const totalAmount = parseFloat(order.total_price) || 0;
        const platformCommissionPercent = 10;
        const platformFee = 20;
        const taxRate = 18;

        const platformCommission =
          (totalAmount * platformCommissionPercent) / 100;
        const taxAmount = (platformFee * taxRate) / 100;
        const partnerEarning =
          totalAmount - platformCommission - platformFee - taxAmount;

        // Step 4: Insert into partner_orders with all details
        const insertQuery = `
          INSERT INTO partner_orders (
            order_id, partner_id, status, assigned_at,
            address, total_amount, payment_id, razorpay_order_id, user_id,
            platform_commission_percent, platform_fee, tax_rate, tax_amount, partner_earning
          )
          VALUES (?, ?, 'assigned', NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;

        connection.query(
          insertQuery,
          [
            order.order_id,
            partner_id,
            order.address,
            totalAmount,
            order.payment_id,
            order.razorpay_order_id,
            order.user_id,
            platformCommissionPercent,
            platformFee,
            taxRate,
            taxAmount,
            partnerEarning,
          ],
          (insertErr, insertResult) => {
            if (insertErr) {
              console.error("Error assigning partner:", insertErr);
              return res.status(500).json({
                success: false,
                message: "Database error",
                error: insertErr.message,
              });
            }

            return res.status(200).json({
              success: true,
              message:
                "Partner assigned successfully with full details stored.",
              assignment_id: insertResult.insertId,
            });
          }
        );
      });
    }
  );
}

module.exports = assignPartnerToOrder;
