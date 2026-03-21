/* instead of this addAddress controller we r using editAddress controller
for adding and updating address in addresses table */

const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function addAddress(req, res) {
  console.log("Add address ..");
  const mobile_number = req.headers.mobile_number;
  let user_id = mobile_number;
  let address = req.body.address;

  let flat_no = address.flat_no;
  let building_name = address.building_name;
  let area_name = address.area_name;
  let landmark = address.landmark;
  let city = address.city;
  let state = address.state;
  let pincode = address.pincode;
  let insertAddress = `insert into addresses(user_id,flat_no,building_name,area_name,landmark,city,state,pincode) values('${user_id}','${flat_no}','${building_name}','${area_name}','${landmark}','${city}','${state}','${pincode}')`;
  connection.query(insertAddress, function (err, result) {
    if (err) {
      console.log("error in inserting user details");
      return;
    }

    res.status(200).json({
      message: "Address inserted successfully",
    });
  });
}

module.exports = addAddress;
