const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

const secretKey = process.env.secretKey;

function loginController(req, res) {
  console.log("login controller");

  const mobile_number = req.headers.mobilenumber;

  // check mobile number
  if (!mobile_number) {
    return res.status(400).json({
      success: false,
      message: "Mobile number is required",
    });
  }

  const payload = {
    mobile_number: mobile_number,
  };

  const token = jwt.sign(payload, secretKey, {
    expiresIn: "365d",
  });

  console.log("Generated token", token);

  // IMPORTANT:
  // check by user_id column, not by id column
  const getUserDetails = `SELECT * FROM users WHERE user_id = ?`;

  connection.query(getUserDetails, [mobile_number], function (err, results) {
    if (err) {
      console.log("error in getting user with user_id", err);
      return res.status(500).json({
        success: false,
        message: "Database error while checking user",
      });
    }

    // if user already exists, do not insert again
    if (results.length > 0) {
      return res.status(200).json({
        success: true,
        message: "User login successfully",
        token: token,
        user: results[0],
      });
    }

    // if user does not exist, insert new user
    const insertUser = `
      INSERT INTO users (user_id, name, gender)
      VALUES (?, '', '')
    `;

    connection.query(insertUser, [mobile_number], function (err, result) {
      if (err) {
        console.log("error in inserting user details", err);

        // if duplicate entry happens due to race condition,
        // still allow login
        if (err.code === "ER_DUP_ENTRY") {
          return res.status(200).json({
            success: true,
            message: "User login successfully",
            token: token,
          });
        }

        return res.status(500).json({
          success: false,
          message: "Error in inserting user details",
        });
      }

      return res.status(200).json({
        success: true,
        message: "User inserted successfully",
        token: token,
        user: {
          id: result.insertId,
          user_id: mobile_number,
          name: "",
          gender: "",
        },
      });
    });
  });
}

module.exports = loginController;
