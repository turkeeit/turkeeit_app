const connection = require("../config/dbconfig");

function getPartnerOrderDetails(req, res) {
  console.log("Fetching specific partner order details...");

  const mobile_number = req.headers.mobile_number;
  const order_id = req.headers.order_id;

  if (!mobile_number) {
    return res.status(401).json({
      success: false,
      message: "Partner token mobile number missing",
    });
  }

  if (!order_id) {
    return res.status(400).json({
      success: false,
      message: "order_id is required",
    });
  }

  const getPartnerQuery = `SELECT id FROM partners WHERE mobile_number = ?`;

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

      const orderQuery = `
      SELECT
        po.*,
        p.name AS partner_name,
        p.mobile_number AS partner_mobile,
        u.name AS customer_name,
        u.user_id AS customer_mobile,
        s.image_url AS service_image_url
      FROM partner_orders po
      JOIN partners p ON p.id = po.partner_id
      LEFT JOIN users u ON u.user_id = po.user_id
      LEFT JOIN services s ON s.id = po.service_id
      WHERE po.partner_id = ?
        AND po.order_id = ?
      LIMIT 1
    `;

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
          message: "Fetched Partner order Details successfully",
          data: results[0],
        });
      });
    },
  );
}

module.exports = getPartnerOrderDetails;
