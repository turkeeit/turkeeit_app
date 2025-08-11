const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function addPartner(req, res) {
  const { mobile_number, name, gender, address, service_category, experience } =
    req.body;

  let insertUser = `insert into partners(mobile_number,name,gender,address,service_category,experience) values('${mobile_number}','${name}','${gender}','${address}','${service_category}','${experience}')`;
  connection.query(insertUser, function (err, result) {
    if (err) {
      console.log("error in inserting partner detais", err);
      return;
    }
    res.status(200).json({
      message: "Partner inserted successfully",
    });
  });
}

module.exports = addPartner;
