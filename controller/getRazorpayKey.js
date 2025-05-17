const connection = require("../config/dbconfig");
require("dotenv").config();

function getRazorpayKey(req, res) {
  console.log("Fetching razorpay key details...");

  try {
    // Read mobile number from headers
    const mobile_number = req.headers.mobile_number;

    // Validation
    if (!mobile_number) {
      return res.status(400).json({ message: "Mobile number is required" });
    }

    const razorpay_key_id = process.env.razorpay_key_id;
    console.log(razorpay_key_id);

    res.status(200).json({
      key_id: razorpay_key_id,
      mobile_number: mobile_number,
    });
  } catch (err) {
    console.log(`err ${err}`);
  }
}

module.exports = getRazorpayKey;
