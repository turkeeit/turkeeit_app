require("dotenv").config();
const connection = require("../config/dbconfig");

function editAddress(req, res) {
  const mobile_number = req.headers.mobile_number;
  const user_id = mobile_number;

  console.log("Edit address ..", user_id);
  console.log("Request body:", req.body);

  const address = req.body.address || null;

  if (!address) {
    return res.status(400).json({
      message: "Address data is required. Send body as { address: { ... } }",
    });
  }

  const flat_no = address.flat_no;
  const building_name = address.building_name;
  const area_name = address.area_name;
  const landmark = address.landmark;
  const city = address.city;
  const state = address.state;
  const pincode = address.pincode;

  if (
    !flat_no ||
    !building_name ||
    !area_name ||
    !landmark ||
    !city ||
    !state ||
    !pincode
  ) {
    return res.status(400).json({
      message: "All address fields are required",
    });
  }

  const checkAddressQuery = `SELECT * FROM addresses WHERE user_id = ?`;

  connection.query(checkAddressQuery, [user_id], function (err, result) {
    if (err) {
      console.log("error checking address", err);
      return res.status(500).json({ message: "Database error" });
    }

    if (result.length > 0) {
      const updateAddressQuery = `
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
        function (err) {
          if (err) {
            console.log("error updating address", err);
            return res.status(500).json({ message: "Error updating address" });
          }

          return res.status(200).json({
            message: "Address updated successfully",
          });
        },
      );
    } else {
      const insertAddressQuery = `
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
        function (err) {
          if (err) {
            console.log("error inserting address", err);
            return res.status(500).json({ message: "Error adding address" });
          }

          return res.status(200).json({
            message: "Address added successfully",
          });
        },
      );
    }
  });
}

module.exports = editAddress;
