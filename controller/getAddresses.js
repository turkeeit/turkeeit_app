const express = require("express");
const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function getAddress(req, res) {
  console.log("Fetching user address...");

  // Get user ID from headers (mobile_number is used as user_id)
  const mobile_number = req.headers.mobile_number;

  if (!mobile_number) {
    return res.status(400).json({ error: "Mobile number is required" });
  }

  let query = "SELECT * FROM addresses WHERE user_id = ?";

  connection.query(query, [mobile_number], (err, results) => {
    if (err) {
      console.error("Error fetching user address:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: "No address found for this user" });
    }

    // Convert results into an array of JSON objects
    const addresses = results.map((row) => ({
      id: row.id,
      user_id: row.user_id,
      flat_no: row.flat_no,
      building_name: row.building_name,
      area_name: row.area_name,
      landmark: row.landmark,
      city: row.city,
      state: row.state,
      pincode: row.pincode,
    }));

    res.status(200).json({ addresses });
  });
}

module.exports = getAddress;
