const express = require("express");
const connection = require("../config/dbconfig");

function updateUserDetails(req, res) {
  console.log("update user details ...");

  const user_id = req.headers.mobile_number;
  const { name, gender, address } = req.body;

  if (!name || !gender || !address) {
    return res
      .status(400)
      .json({ error: "name, gender, address are required" });
  }

  // Otherwise, update the quantity
  const updateQuery = `UPDATE users SET name='${name}', gender='${gender}', address='${address}' WHERE user_id = '${user_id}'`;

  connection.query(updateQuery, (err, result) => {
    if (err) {
      console.error("Error in updating user details :", err);
      return res.status(500).json({ error: "Error updating user details" });
    }

    return res
      .status(200)
      .json({ message: "user details  updated successfully" });
  });
}

module.exports = updateUserDetails;
