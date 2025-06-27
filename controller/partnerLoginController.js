const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function partnerLoginController(req, res) {
  console.log("partner login controller ..");
  const { mobile_number, password } = req.body;
  console.log(mobile_number, password);
  if (!mobile_number || !password) {
    return res.status(401).send("mobile number/password not provided");
  }

  const sql = "SELECT * FROM partners WHERE mobile_number = ? AND password = ?";
  connection.query(sql, [mobile_number, password], (err, results) => {
    if (err) return res.status(500).send({ error: "DB error" });

    if (results.length > 0) {
      // In production, use hashed passwords and JWT
      console.log("login successful");
      res.status(200).send({
        success: true,
        message: "Login successful",
        token: mobile_number,
      });
    } else {
      console.log("login id password not match");
      res
        .status(401)
        .send({ success: false, message: "Invalid mobile or password" });
    }
  });
}

module.exports = partnerLoginController;
