const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function userRegister(req, res) {
  console.log("user register controller..");

  const user_id = req.headers.mobile_number;
  const { name, gender, address } = req.body;

  if (!user_id || !name || !gender) {
    return res.status(400).json({
      message: "mobile_number, name and gender are required",
    });
  }

  const addressString = JSON.stringify(address);

  const updateUserQuery =
    "UPDATE users SET name=?, gender=?, address=? WHERE user_id=?";

  connection.query(
    updateUserQuery,
    [name, gender, addressString, user_id],
    (err) => {
      if (err) {
        console.log("error updating user details", err);
        return res.status(500).json({ message: "Error updating user" });
      }

      if (!address || address.length === 0) {
        return res.status(200).json({
          message: "User registered successfully",
        });
      }

      let completed = 0;

      address.forEach((addr) => {
        const insertAddressQuery = `
        INSERT INTO addresses
        (user_id, flat_no, building_name, area_name, landmark, city, state, pincode)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
      `;

        connection.query(
          insertAddressQuery,
          [
            user_id,
            addr.flat_no,
            addr.building_name,
            addr.area_name,
            addr.landmark,
            addr.city,
            addr.state,
            addr.pincode,
          ],
          (err) => {
            if (err) {
              console.log("error inserting address", err);
              return res.status(500).json({
                message: "Error inserting address",
              });
            }

            completed++;

            if (completed === address.length) {
              return res.status(200).json({
                message: "User registered successfully",
              });
            }
          },
        );
      });
    },
  );
}

module.exports = userRegister;
