const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function editAddress(req, res) {
  const mobile_number = req.headers.mobile_number;
  let user_id = mobile_number;
  console.log("Add address ..", user_id);
  let address = req.body.address;
  let flat_no = address.flat_no;
  let building_name = address.building_name;
  let area_name = address.area_name;
  let landmark = address.landmark;
  let city = address.city;
  let state = address.state;
  let pincode = address.pincode;

  let updateAddress = `update users set address='${address}' where user_id='${user_id}'`;
  // let updateAddress = `update addresses set user_id=${user_id},flat_no=${flat_no},building_name=${building_name},area_name=${area_name},landmark=${landmark}, city=${city},state=${state},pincode=${pincode}`;
  connection.query(updateAddress, function (err, result) {
    if (err) {
      console.log("error in inserting user detais", err);
      return;
    }
  });

  res.status(200).json({
    message: "Address Updated successfully",
  });
}

module.exports = editAddress;
