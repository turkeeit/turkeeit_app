const connection = require("../config/dbconfig");

function getAllPartnerOrder(req, res) {
  console.log("Fetching all partner orders...");

  const query = `SELECT * FROM partner_orders`;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    res.status(200).json({
      message: "partner orders retrieved successfully",
      partner_orders: results,
    });
  });
}

module.exports = getAllPartnerOrder;
