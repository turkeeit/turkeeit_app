const connection = require("../config/dbconfig");

function removePartnerOrderByAdmin(req, res) {
  console.log("Admin removing partner order...");

  const partner_order_id = req.headers.partner_order_id;

  if (!partner_order_id) {
    return res
      .status(400)
      .json({ error: "partner_order_id is required in headers" });
  }

  const deleteQuery = `DELETE FROM partner_orders WHERE id = ?`;

  connection.query(deleteQuery, [partner_order_id], (err, result) => {
    if (err) {
      console.error("Error deleting partner order:", err);
      return res.status(500).json({ error: "Error deleting partner order" });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Partner order not found" });
    }

    return res
      .status(200)
      .json({ message: "Partner order deleted successfully" });
  });
}

module.exports = removePartnerOrderByAdmin;
