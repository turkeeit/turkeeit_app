require("dotenv").config();
const Razorpay = require("razorpay");
const crypto = require("crypto");
const connection = require("../config/dbconfig");
const { v4: uuidv4 } = require("uuid");

const razorpay = new Razorpay({
  key_id: process.env.keyid,
  key_secret: process.env.secretid,
});

async function createOrder(req, res) {
  const user_id = req.headers.mobile_number;
  const {
    address,
    total_price,
    cart_items,
    payment_id,
    service_date,
    service_time,
  } = req.body;

  if (
    !user_id ||
    !address ||
    !total_price ||
    !Array.isArray(cart_items) ||
    cart_items.length === 0
  ) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  const order_id = uuidv4();

  const options = {
    amount: total_price * 100,
    currency: "INR",
    receipt: `rcptid_${Date.now()}`,
    payment_capture: 1,
  };

  try {
    const order = await razorpay.orders.create(options); // generate razorPayID

    // Step 1: Insert into `orders` table
    const insertOrderQuery = `
      INSERT INTO orders (order_id, user_id, status, total_price, address,payment_id, razorpay_order_id, service_date, service_time)
      VALUES (?, ?, 'pending', ?, ?,?,?,?,?)
    `;

    connection.query(
      insertOrderQuery,
      [
        order_id,
        user_id,
        total_price,
        address,
        payment_id,
        order.id,
        service_date,
        service_time,
      ],
      (orderErr, orderResult) => {
        if (orderErr) {
          console.error("Failed to insert order:", orderErr);
          return res.status(500).json({ error: "Failed to save order." });
        }

        // Step 2: Insert cart items into `order_items`
        const orderItemsValues = cart_items.map((item) => [
          order_id,
          item.service_id,
          item.quantity,
          item.price,
          item.quantity * item.price,
        ]);

        const insertItemsQuery = `
          INSERT INTO order_items (order_id, service_id, quantity, price, total_price)
          VALUES ?
        `;

        connection.query(
          insertItemsQuery,
          [orderItemsValues],
          (itemsErr, itemsResult) => {
            if (itemsErr) {
              console.error("Failed to insert order items:", itemsErr);
              return res
                .status(500)
                .json({ error: "Failed to save order items." });
            }

            return res.status(200).json({
              message: "Order created successfully",
              order_id: order_id,
              razorpay_order_id: order.id,
            });
          },
        );
      },
    );
  } catch (err) {
    console.error("Razorpay error:", err);
    return res.status(500).json({ error: "Failed to create Razorpay order." });
  }
}

module.exports = createOrder;
