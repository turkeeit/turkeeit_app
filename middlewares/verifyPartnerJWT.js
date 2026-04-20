require("dotenv").config();
const jwt = require("jsonwebtoken");

function VerifyPartnerJWT(req, res, next) {
  console.log("---- headers----");
  console.log(req.headers);

  console.log("--- authorization header---");
  console.log(req.headers.authorization);

  const authorization = req.headers.authorization;

  // ✅ prevent crash
  if (!authorization) {
    console.log("Authorization header missing");
    return res.status(401).json({
      message: "Authorization token required",
    });
  }

  const token = authorization.split(" ")[1];

  if (!token) {
    console.log("Token missing");
    return res.status(401).json({
      message: "Token missing",
    });
  }

  const secretKey = process.env.partner_secretKey;

  jwt.verify(token, secretKey, (err, decoded) => {
    if (err) {
      console.log("error in jwt token verification", err);
      return res.status(401).json({
        message: "Invalid token or token expired",
      });
    }

    // same pattern as your existing code
    req.headers.mobile_number = decoded.mobile_number;
    req.headers.user_id = decoded.user_id;

    console.log("Partner token verified successfully");

    next();
  });
}

module.exports = VerifyPartnerJWT;
