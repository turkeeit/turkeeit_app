const connection = require("../config/dbconfig");

function getPartnerAllOrders(req, res) {
  console.log("Fetching orders list for partner...");
  console.log(req.headers.mobile_number);
  const mobile_number = req.headers.mobile_number;
  console.log(mobile_number);
  // Validate input
  if (!mobile_number) {
    return res.status(400).json({ error: "Mobile number required" });
  }

  const query = `SELECT * FROM partner_orders WHERE partner_id = ?`;

  connection.query(query, [mobile_number], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      console.log("no record found");
      return res.status(404).json({ error: "No orders found for this user" });
    }

    console.log("success record found", results);
    res.status(200).json({
      message: "Order details retrieved successfully",
      order_list: results,
    });
  });
}

module.exports = getPartnerAllOrders;
