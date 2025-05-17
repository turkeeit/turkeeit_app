const express = require("express");
const connection = require("../config/dbconfig");

function removeAddress(req, res) {
  console.log("Removing user address...");

  // Get user_id from headers (mobile_number is used as user_id)
  const mobile_number = req.headers.mobile_number;
  const address_id = req.body.address_id; // Address ID to delete

  if (!mobile_number) {
    return res.status(400).json({ error: "Mobile number is required" });
  }
  if (!address_id) {
    return res.status(400).json({ error: "Address ID is required" });
  }

  let query = "DELETE FROM addresses WHERE user_id = ? AND id = ?";

  connection.query(query, [mobile_number, address_id], (err, result) => {
    if (err) {
      console.error("Error removing user address:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (result.affectedRows === 0) {
      return res
        .status(404)
        .json({ message: "Address not found or already deleted" });
    }

    res.status(200).json({ message: "Address removed successfully" });
  });
}

module.exports = removeAddress;
