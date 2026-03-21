require("dotenv").config();
const crypto = require("crypto");

async function verifyRazorpaySignature(req, res) {
  console.log("inside verify signature ");
  const { razorpay_order_id, razorpay_payment_id, razorpay_signature } =
    req.body;

  const generated_signature = crypto
    .createHmac("sha256", process.env.secretid)
    .update(razorpay_order_id + "|" + razorpay_payment_id)
    .digest("hex");

  console.log("Generated Signature:", generated_signature); // generated signature value

  if (generated_signature === razorpay_signature) {
    res.json({ status: "success", message: "Payment verified" });
  } else {
    res.status(400).json({ status: "failure", message: "Invalid signature" });
  }
}

module.exports = verifyRazorpaySignature;
