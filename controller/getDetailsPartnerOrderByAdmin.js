const connection = require("../config/dbconfig");

function getDetailsPartnerOrderByAdmin(req, res) {
  console.log("Admin fetching detailed breakdown of a partner order...");

  const partner_order_id = req.headers.partner_order_id;

  if (!partner_order_id) {
    return res.status(400).json({
      success: false,
      message: "partner_order_id is required in headers",
    });
  }

  const partnerOrderQuery = `
    SELECT * 
    FROM partner_orders 
    WHERE id = ?
  `;

  connection.query(partnerOrderQuery, [partner_order_id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({
        success: false,
        message: "Database error",
        error: err.message,
      });
    }

    if (results.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Partner order not found",
      });
    }

    return res.status(200).json({
      success: true,
      message: "Partner order details retrieved successfully",
      partner_order: results[0], // return full row data
    });
  });
}

module.exports = getDetailsPartnerOrderByAdmin;
