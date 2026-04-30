const connection = require("../config/dbconfig");

function getPartnerAllOrders(req, res) {
  console.log("Fetching orders list for partner...");
  console.log("mobile_number from token:", req.headers.mobile_number);

  // ✅ mobile_number should come from VerifyPartnerJWT middleware
  const mobile_number = req.headers.mobile_number;

  if (!mobile_number) {
    return res.status(401).json({
      success: false,
      message: "Partner token mobile number missing",
    });
  }

  const getPartnerQuery = `
    SELECT id 
    FROM partners 
    WHERE mobile_number = ?
    LIMIT 1
  `;

  connection.query(
    getPartnerQuery,
    [mobile_number],
    (partnerErr, partnerResult) => {
      if (partnerErr) {
        console.error("Error fetching partner:", partnerErr);
        return res.status(500).json({
          success: false,
          message: "Error fetching partner",
        });
      }

      if (partnerResult.length === 0) {
        return res.status(404).json({
          success: false,
          message: "Partner not found",
        });
      }

      const partner_id = partnerResult[0].id;
      console.log("partner_id:", partner_id);

      const getOrdersQuery = `
      SELECT
        po.*,
        s.image_url
      FROM partner_orders po
      LEFT JOIN services s ON po.service_id = s.id
      WHERE po.partner_id = ?
      ORDER BY po.id DESC
    `;

      connection.query(getOrdersQuery, [partner_id], (err, results) => {
        if (err) {
          console.error("Database error:", err);
          return res.status(500).json({
            success: false,
            message: "Database error",
          });
        }

        return res.status(200).json({
          success: true,
          message: "Partner orders fetched successfully",

          // ✅ Even empty list should return 200
          order_list: results,
        });
      });
    },
  );
}

module.exports = getPartnerAllOrders;
