const connection = require("../config/dbconfig");

function getAllPayoutsAdmin(req, res) {
  console.log("Fetching all payouts for admin...");

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

      po.service_name,
      po.service_category,
      po.booking_date,
      po.booking_time,

      o.payment_method,
      o.payment_status

    FROM partner_payouts pp

    LEFT JOIN partner_orders po ON po.id = pp.partner_order_id
    LEFT JOIN orders o ON o.order_id = pp.order_id

    ORDER BY pp.id DESC
  `;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching payouts:", err);
      return res.status(500).json({
        success: false,
        message: "Database error while fetching payouts",
      });
    }

    return res.status(200).json({
      success: true,
      message: "Payout list fetched successfully",
      count: results.length,
      payouts: results,
    });
  });
}

module.exports = getAllPayoutsAdmin;
