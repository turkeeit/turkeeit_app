const connection = require("../config/dbconfig");

function getPartnerPayoutSummary(req, res) {
  console.log("Partner payout summary API");

  // Get partner id from header
  const partner_id = req.headers.mobile_number;

  // Validation
  if (!partner_id) {
    return res.status(400).json({
      success: false,
      message: "partner_id is required",
    });
  }

  // Simple query
  const query = `
    SELECT 
      SUM(partner_earning) AS total_earned,
      SUM(CASE WHEN payout_status = 'paid' THEN partner_earning ELSE 0 END) AS total_paid,
      SUM(CASE WHEN payout_status = 'pending' THEN partner_earning ELSE 0 END) AS total_pending
    FROM partner_payouts
    WHERE partner_id = ?
  `;

  connection.query(query, [partner_id], (err, result) => {
    if (err) {
      console.log("Error:", err);
      return res.status(500).json({
        success: false,
        message: "Database error",
      });
    }

    const data = result[0];

    // If no data, return 0
    return res.status(200).json({
      success: true,
      summary: {
        total_earned: data.total_earned || 0,
        total_paid: data.total_paid || 0,
        total_pending: data.total_pending || 0,
      },
    });
  });
}

module.exports = getPartnerPayoutSummary;
