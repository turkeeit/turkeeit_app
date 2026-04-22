const connection = require("../config/dbconfig");

function getPartnerPayoutList(req, res) {
  console.log("Fetching payout list for partner...");

  const partner_id = req.headers.mobile_number || req.headers.partner_id;

  if (!partner_id) {
    return res.status(400).json({
      success: false,
      message: "partner_id is required",
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

      po.service_name,
      po.service_category,
      po.booking_date,
      po.booking_time,
      po.order_status AS partner_order_status

    FROM partner_payouts pp
    LEFT JOIN partner_orders po ON po.id = pp.partner_order_id
    WHERE pp.partner_id = ?
    ORDER BY pp.id DESC
  `;

  connection.query(query, [partner_id], (err, results) => {
    if (err) {
      console.error("Error fetching partner payouts:", err);
      return res.status(500).json({
        success: false,
        message: "Database error while fetching partner payouts",
      });
    }

    return res.status(200).json({
      success: true,
      message: "Partner payout list fetched successfully",
      count: results.length,
      payouts: results,
    });
  });
}

module.exports = getPartnerPayoutList;
