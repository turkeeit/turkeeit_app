const connection = require("../config/dbconfig");

function getPartnerPayoutList(req, res) {
  console.log("Fetching payout list for partner...");

  const mobile_number = req.headers.mobile_number || req.headers.partner_mobile;
  const direct_partner_id = req.headers.partner_id;

  if (!mobile_number && !direct_partner_id) {
    return res.status(400).json({
      success: false,
      message:
        "Partner authentication failed. Mobile number or partner_id missing.",
    });
  }

  function fetchPayouts(partner_id) {
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
        po.payment_mode,
        po.order_status AS partner_order_status,

        s.image_url AS service_image_url

      FROM partner_payouts pp
      LEFT JOIN partner_orders po ON po.id = pp.partner_order_id
      LEFT JOIN services s ON s.id = po.service_id
      WHERE pp.partner_id = ?
      ORDER BY pp.id DESC
    `;

    connection.query(query, [partner_id], (err, results) => {
      if (err) {
        console.error("Error fetching partner payouts:", err);
        return res.status(500).json({
          success: false,
          message: "Database error while fetching payouts",
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

  if (direct_partner_id) {
    return fetchPayouts(direct_partner_id);
  }

  const getPartnerQuery = `
    SELECT id 
    FROM partners 
    WHERE mobile_number = ?
    LIMIT 1
  `;

  connection.query(getPartnerQuery, [mobile_number], (err, result) => {
    if (err) {
      console.error("Error fetching partner:", err);
      return res.status(500).json({
        success: false,
        message: "Error fetching partner",
      });
    }

    if (result.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Partner not found",
      });
    }

    const partner_id = result[0].id;
    fetchPayouts(partner_id);
  });
}

module.exports = getPartnerPayoutList;
