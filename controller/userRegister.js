const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function userRegister(req, res) {
  console.log("user register controller..");
  const mobile_number = req.headers.mobile_number;
  let user_id = mobile_number;
  let gender = req.body.gender;
  let name = req.body.name;
  let addressList = req.body.address;

  let updateUserDetails = `update users set gender='${gender}',name='${name}' where user_id='${user_id}'`;
  connection.query(updateUserDetails, function (err, result) {
    if (err) {
      console.log("error in inserting user detais", err);
      return;
    }
    console.log(addressList.length);
    if (addressList.length > 0) {
      for (var i = 0; i < addressList.length; i++) {
        let flat_no = addressList[i].flat_no;
        let building_name = addressList[i].building_name;
        let area_name = addressList[i].area_name;
        let landmark = addressList[i].landmark;
        let city = addressList[i].city;
        let state = addressList[i].state;
        let pincode = addressList[i].pincode;
        let insertAddress = `insert into addresses(user_id,flat_no,building_name,area_name,landmark,city,state,pincode) values('${user_id}','${flat_no}','${building_name}','${area_name}','${landmark}','${city}','${state}','${pincode}')`;
        connection.query(insertAddress, function (err, result) {
          if (err) {
            console.log("error in inserting user detais", err);
            return;
          }
          let counter = addressList.length;
          console.log(counter, i);

          if (i === counter) {
            res.status(200).json({
              message: "User inserted successfully",
            });
          }
        });
      }
    } else {
      res.status(200).json({
        message: "User inserted successfully",
      });
    }
  });
}

module.exports = userRegister;
