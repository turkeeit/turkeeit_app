const express = require("express");
const connection = require("../config/dbconfig");

function editCartItem(req, res) {
  console.log("Editing cart item...");

  const { user_id, service_id, quantity } = req.body;

  if (!user_id || !service_id || quantity === undefined) {
    return res
      .status(400)
      .json({ error: "user_id, service_id, and quantity are required" });
  }

  if (quantity <= 0) {
    // If quantity is 0, remove the item from the cart
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
    // Otherwise, update the quantity
    const updateQuery = `UPDATE cart SET quantity = ?, modified_at = NOW() WHERE user_id = ? AND service_id = ?`;

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
      }
    );
  }
}

module.exports = editCartItem;
