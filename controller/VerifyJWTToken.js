const jwt = require("jsonwebtoken");
require("dotenv").config();

function verifyToken(req, res) {
  const token = req.headers.authorization?.split(" ")[1]; // Get token from header
  console.log("verifyJWTToken", token);

  if (!token) {
    return res.status(401).json({ message: "No token provided" });
  }

  jwt.verify(token, process.env.secretKey, (err, decoded) => {
    if (err) {
      return res.status(401).json({ message: "Invalid token" });
    }
    res.status(200).json({ message: "Token is valid", user: decoded });
  });
}

module.exports = verifyToken;
