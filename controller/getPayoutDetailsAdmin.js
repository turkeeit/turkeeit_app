const connection = require("../config/dbconfig");

function getPayoutDetailsAdmin(req, res) {
  console.log("Fetching payout details for admin...");

  const payout_id = req.query.payout_id;

  if (!payout_id) {
    return res.status(400).json({
      success: false,
      message: "payout_id is required",
    });
  }

  const query = `
    SELECT
      pp.id AS payout_id,
      pp.partner_order_id,
      pp.order_id,
      pp.partner_id,

      pp.total_order_amount,
      pp.platform_fee,
      pp.taxes,
      pp.partner_earning,

      pp.payout_status,
      pp.payout_method,
      pp.payout_reference_id,
      pp.paid_at,
      pp.created_at,
      pp.updated_at,

      po.user_id,
      po.service_id,
      po.service_name,
      po.service_category,
      po.booking_date,
      po.booking_time,
      po.order_status AS partner_order_status,
      po.payment_mode,
      po.payment_status AS partner_order_payment_status,

      o.status AS main_order_status,
      o.payment_method,
      o.payment_status AS main_order_payment_status,
      o.total_price,
      o.service_date,
      o.service_time,
      o.address

    FROM partner_payouts pp
    LEFT JOIN partner_orders po ON po.id = pp.partner_order_id
    LEFT JOIN orders o ON o.order_id = pp.order_id
    WHERE pp.id = ?
    LIMIT 1
  `;

  connection.query(query, [payout_id], (err, results) => {
    if (err) {
      console.error("Error fetching payout details:", err);
      return res.status(500).json({
        success: false,
        message: "Database error while fetching payout details",
      });
    }

    if (results.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Payout not found",
      });
    }

    return res.status(200).json({
      success: true,
      message: "Payout details fetched successfully",
      payout: results[0],
    });
  });
}

module.exports = getPayoutDetailsAdmin;
