const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function editAddress(req, res) {
  const mobile_number = req.headers.mobile_number;
  let user_id = mobile_number;

  console.log("Edit address ..", user_id);

  let address = req.body.address;

  let flat_no = address.flat_no;
  let building_name = address.building_name;
  let area_name = address.area_name;
  let landmark = address.landmark;
  let city = address.city;
  let state = address.state;
  let pincode = address.pincode;

  // Check if address exists
  let checkAddressQuery = `SELECT * FROM addresses WHERE user_id = ?`;

  connection.query(checkAddressQuery, [user_id], function (err, result) {
    if (err) {
      console.log("error checking address", err);
      return res.status(500).json({ message: "Database error" });
    }

    if (result.length > 0) {
      // ADDRESS EXISTS → UPDATE
      let updateAddressQuery = `
        UPDATE addresses 
        SET flat_no=?, building_name=?, area_name=?, landmark=?, city=?, state=?, pincode=? 
        WHERE user_id=?`;

      connection.query(
        updateAddressQuery,
        [
          flat_no,
          building_name,
          area_name,
          landmark,
          city,
          state,
          pincode,
          user_id,
        ],
        function (err, result) {
          if (err) {
            console.log("error updating address", err);
            return res.status(500).json({ message: "Error updating address" });
          }

          res.status(200).json({
            message: "Address Updated successfully",
          });
        },
      );
    } else {
      // ADDRESS NOT EXISTS → INSERT
      let insertAddressQuery = `
        INSERT INTO addresses 
        (user_id, flat_no, building_name, area_name, landmark, city, state, pincode)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;

      connection.query(
        insertAddressQuery,
        [
          user_id,
          flat_no,
          building_name,
          area_name,
          landmark,
          city,
          state,
          pincode,
        ],
        function (err, result) {
          if (err) {
            console.log("error inserting address", err);
            return res.status(500).json({ message: "Error adding address" });
          }

          res.status(200).json({
            message: "Address Added successfully",
          });
        },
      );
    }
  });
}

module.exports = editAddress;
