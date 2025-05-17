const express = require("express");
const connection = require("../config/dbconfig");

function removeCartItem(req, res) {
  console.log("Removing cart item...");

  const service_id = req.headers.service_id;
  const user_id = req.headers.mobile_number;

  if (!user_id || !service_id) {
    return res
      .status(400)
      .json({ error: "user_id and service_id are required" });
  }

  const deleteQuery = `DELETE FROM cart WHERE user_id = ? AND service_id = ?`;

  connection.query(deleteQuery, [user_id, service_id], (err, result) => {
    if (err) {
      console.error("Error removing cart item:", err);
      return res.status(500).json({ error: "Error removing cart item" });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Cart item not found" });
    }

    return res.status(200).json({ message: "Cart item removed successfully" });
  });
}

module.exports = removeCartItem;
