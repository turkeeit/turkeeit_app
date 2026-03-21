const connection = require("../config/dbconfig");

function editCartItem(req, res) {
  console.log("Editing cart item...");

  // 🔥 Get user_id from token (mobile_number)
  const user_id = req.headers.mobile_number;

  const { service_id, quantity } = req.body;

  if (!service_id || quantity === undefined) {
    return res
      .status(400)
      .json({ error: "service_id and quantity are required" });
  }

  if (!user_id) {
    return res.status(401).json({ error: "User not authenticated" });
  }

  if (quantity <= 0) {
    // Remove item
    const deleteQuery = `DELETE FROM cart WHERE user_id = ? AND service_id = ?`;

    connection.query(deleteQuery, [user_id, service_id], (err) => {
      if (err) {
        console.error("Error removing cart item:", err);
        return res.status(500).json({ error: "Error removing cart item" });
      }

      return res
        .status(200)
        .json({ message: "Cart item removed successfully" });
    });
  } else {
    // Update quantity
    const updateQuery = `
      UPDATE cart 
      SET quantity = ?, modified_at = NOW() 
      WHERE user_id = ? AND service_id = ?
    `;

    connection.query(
      updateQuery,
      [quantity, user_id, service_id],
      (err, result) => {
        if (err) {
          console.error("Error updating cart item:", err);
          return res.status(500).json({ error: "Error updating cart item" });
        }

        if (result.affectedRows === 0) {
          return res.status(404).json({ error: "Cart item not found" });
        }

        return res
          .status(200)
          .json({ message: "Cart item updated successfully" });
      },
    );
  }
}

module.exports = editCartItem;
