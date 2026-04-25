const connection = require("../config/dbconfig");

function getPartnerAllOrders(req, res) {
  console.log("Fetching orders list for partner...");
  console.log("mobile_number from token:", req.headers.mobile_number);

  const mobile_number = req.headers.mobile_number;

  if (!mobile_number) {
    return res.status(400).json({ error: "Mobile number required" });
  }

  const getPartnerQuery = `SELECT id FROM partners WHERE mobile_number = ?`;

  connection.query(
    getPartnerQuery,
    [mobile_number],
    (partnerErr, partnerResult) => {
      if (partnerErr) {
        console.log("Error fetching partner:", partnerErr);
        return res.status(500).json({ error: "Error fetching partner" });
      }

      if (partnerResult.length === 0) {
        return res.status(404).json({ error: "Partner not found" });
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
          console.log("Database error:", err);
          return res.status(500).json({ error: "Database error" });
        }

        if (results.length === 0) {
          return res.status(404).json({
            error: "No orders found for this partner",
          });
        }

        console.log("Success record found", results);

        return res.status(200).json({
          message: "Order details retrieved successfully",
          order_list: results,
        });
      });
    },
  );
}

module.exports = getPartnerAllOrders;
