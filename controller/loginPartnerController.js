const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

const secretKey = process.env.partner_secretKey;

function loginPartnerController(req, res) {
  console.log("login controller");

  const mobile_number = req.headers.mobile_number;
  let user_id = mobile_number;

  const payload = {
    mobile_number: req.headers.mobile_number,
  };

  const expirationTime = "365d";

  const options = {
    expiresIn: expirationTime,
  };

  const token = jwt.sign(payload, secretKey, options);
  console.log("Generated token", token);

  let getPartnerDetails = `select * from partners where mobile_number='${user_id}'`;
  connection.query(getPartnerDetails, function (err, results) {
    if (err) {
      console.log("error in getting user with user_id", err);
      return;
    }
    if (results.length === 0) {
      let insertUser = `insert into partners(mobile_number,name,gender,service_category_id,experience) values(${user_id},'','',1,'')`;
      connection.query(insertUser, function (err, result) {
        if (err) {
          console.log("error in inserting partner detais", err);
          return;
        }
        res.status(200).json({
          message: "Partner inserted successfully",
          token: token,
        });
      });
    } else {
      res.status(200).json({
        message: "Partners login successfully",
        token: token,
      });
    }
  });
}

module.exports = loginPartnerController;
