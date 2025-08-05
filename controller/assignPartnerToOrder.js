// Assuming you're using mysql2 or sequelize
const connection = require("../config/dbconfig"); // your DB connection (adjust as needed)

async function assignPartnerToOrder(req, res) {
  const { order_id, partner_id } = req.body;

  if (!order_id || !partner_id) {
    return res.status(400).json({
      success: false,
      message: "order_id and partner_id are required.",
    });
  }

  // 1. Check if order already assigned
  const checkQuery = "SELECT id FROM partner_orders WHERE order_id = ?";
  connection.query(checkQuery, [order_id], (err, results) => {
    if (err) {
      console.error("Error checking assignment:", err);
      return res.status(500).json({
        success: false,
        message: "Database error",
        error: err.message,
      });
    }

    if (results.length > 0) {
      return res.status(409).json({
        success: false,
        message: "Order already assigned to a partner.",
      });
    }

    // 2. If not assigned, insert assignment
    const insertQuery = `
      INSERT INTO partner_orders (order_id, partner_id, status, assigned_at)
      VALUES (?, ?, 'assigned', NOW())
    `;
    connection.query(
      insertQuery,
      [order_id, partner_id],
      (insertErr, insertResult) => {
        if (insertErr) {
          console.error("Error assigning partner:", insertErr);
          return res.status(500).json({
            success: false,
            message: "Database error",
            error: insertErr.message,
          });
        }

        return res.status(200).json({
          success: true,
          message: "Partner assigned successfully.",
          assignment_id: insertResult.insertId,
        });
      }
    );
  });
}

module.exports = assignPartnerToOrder;
