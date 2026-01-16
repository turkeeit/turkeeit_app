const connection = require("../config/dbconfig");

function getPartnerOrderDetails(req, res) {
  console.log("Fetching specific partner order details...");

  const partner_id = req.headers.mobile_number; // partner id / mobile
  const order_id = req.headers.order_id; // /partner/order/:order_id
  console.log(partner_id, order_id);
  // ✅ Validation
  if (!partner_id || !order_id) {
    return res.status(400).json({
      success: false,
      message: "Partner token and order_id are required",
    });
  }

  const orderQuery = `
    SELECT
      po.id AS partner_order_id,
      po.order_id,
      po.service_name,
      po.service_category,
      po.booking_date,
      po.booking_time,
      po.order_status,

      po.total_amount,
      po.partner_earning,
      po.admin_commission,
      po.payment_mode,
      po.payment_status,

      po.customer_otp,
      po.otp_verified,

      po.service_address,
      po.latitude,
      po.longitude,

      po.partner_accept_time,
      po.service_start_time,
      po.service_end_time,
      po.created_at,

      u.name AS name,
      u.user_id AS user_mobile
    FROM partner_orders po
    JOIN users u ON po.user_id = u.user_id
    WHERE po.partner_id = ?
      AND po.order_id = ?
    LIMIT 1
  `;

  console.log(orderQuery);

  connection.query(orderQuery, [partner_id, order_id], (err, results) => {
    if (err) {
      console.error("DB Error:", err);
      return res.status(500).json({
        success: false,
        message: "Database error",
      });
    }

    if (results.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Order not found or not assigned to this partner",
      });
    }

    return res.status(200).json({
      success: true,
      data: results[0],
    });
  });
}

module.exports = getPartnerOrderDetails;
