const express = require("express");
const connection = require("../config/dbconfig");

function removeAllCartItem(req, res) {
  console.log("Removing All Cart cart item...");

  const user_id = req.headers.mobile_number;

  if (!user_id) {
    return res
      .status(400)
      .json({ error: "user_id and service_id are required" });
  }

  const deleteQuery = `DELETE FROM cart WHERE user_id = ?`;

  connection.query(deleteQuery, [user_id], (err, result) => {
    if (err) {
      console.error("Error removing all cart item:", err);
      return res.status(500).json({ error: "Error removing cart item" });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Cart items not found" });
    }

    return res.status(200).json({ message: "Cart items removed successfully" });
  });
}

module.exports = removeAllCartItem;
