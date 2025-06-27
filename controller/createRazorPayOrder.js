require("dotenv").config();
const Razorpay = require("razorpay");
const crypto = require("crypto");

const razorpay = new Razorpay({
  key_id: process.env.keyid,
  key_secret: process.env.secretid,
});

async function createRazorPayOrder(req, res) {
  console.log("inside create order", req);

  const { amount } = req.body;
  const options = {
    amount: amount * 100,
    currency: "INR",
    receipt: `rcptid_${Date.now()}`,
    payment_capture: 1,
  };
  try {
    const order = await razorpay.orders.create(options);
    res.json(order);
  } catch (err) {
    res.status(500).json({ error: "Failed to create Razorpay order" });
  }
}

module.exports = createRazorPayOrder;
