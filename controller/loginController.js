const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

const secretKey = process.env.secretKey;

function loginController(req, res) {
  console.log("login controller");

  const mobile_number = req.headers.mobilenumber;
  let user_id = mobile_number;

  const payload = {
    mobile_number: req.headers.mobilenumber,
  };

  const expirationTime = "90d";

  const options = {
    expiresIn: expirationTime,
  };

  const token = jwt.sign(payload, secretKey, options);
  console.log("Generated token", token);

  let getUserDetails = `select * from users where id='${user_id}'`;
  connection.query(getUserDetails, function (err, results) {
    if (err) {
      console.log("error in getting user with user_id", err);
      return;
    }
    if (results.length === 0) {
      let insertUser = `insert into users(user_id,name,gender,address) values(${user_id},'','','')`;
      connection.query(insertUser, function (err, result) {
        if (err) {
          console.log("error in inserting user detais", err);
          return;
        }
        res.status(200).json({
          message: "User inserted successfully",
          token: token,
        });
      });
    } else {
      res.status(200).json({
        message: "User login successfully",
        token: token,
      });
    }
  });
}

module.exports = loginController;
