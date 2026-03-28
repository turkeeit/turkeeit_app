require("dotenv").config();
const Razorpay = require("razorpay");
const connection = require("../config/dbconfig");
const { v4: uuidv4 } = require("uuid");

const razorpay = new Razorpay({
  key_id: process.env.keyid,
  key_secret: process.env.secretid,
});

async function createOrder(req, res) {
  try {
    const user_id = req.headers.mobile_number;

    const { address, total_price, cart_items, service_date, service_time } =
      req.body;

    if (
      !user_id ||
      !address ||
      !total_price ||
      !service_date ||
      !service_time ||
      !Array.isArray(cart_items) ||
      cart_items.length === 0
    ) {
      return res.status(400).json({
        error: "Missing required fields",
      });
    }

    const order_id = uuidv4();

    // 🔥 STEP 1: Create Razorpay order
    const razorpayOptions = {
      amount: Number(total_price) * 100,
      currency: "INR",
      receipt: `rcpt_${Date.now()}`,
      payment_capture: 1,
    };

    const razorpayOrder = await razorpay.orders.create(razorpayOptions);

    // 🔥 STEP 2: Insert into orders table
    const insertOrderQuery = `
      INSERT INTO orders (
        order_id,
        user_id,
        status,
        total_price,
        address,
        payment_id,
        payment_method,
        payment_status,
        razorpay_order_id,
        razorpay_payment_id,
        razorpay_signature,
        service_date,
        service_time
      )
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const orderValues = [
      order_id,
      user_id,
      "pending",
      Number(total_price),
      address,
      null,
      null,
      "pending",
      razorpayOrder.id, // ✅ save here
      null,
      null,
      service_date,
      service_time,
    ];

    connection.query(insertOrderQuery, orderValues, (orderErr) => {
      if (orderErr) {
        console.error("Failed to insert order:", orderErr);
        return res.status(500).json({
          error: "Failed to save order.",
        });
      }

      // 🔥 STEP 3: Insert order items
      const orderItemsValues = cart_items.map((item) => [
        order_id,
        item.service_id,
        Number(item.quantity || 1),
        Number(item.price || 0),
        Number(item.quantity || 1) * Number(item.price || 0),
      ]);

      const insertItemsQuery = `
        INSERT INTO order_items (
          order_id,
          service_id,
          quantity,
          price,
          total_price
        )
        VALUES ?
      `;

      connection.query(insertItemsQuery, [orderItemsValues], (itemsErr) => {
        if (itemsErr) {
          console.error("Failed to insert order items:", itemsErr);
          return res.status(500).json({
            error: "Failed to save order items.",
          });
        }

        return res.status(200).json({
          message: "Order created successfully",
          order_id: order_id,
          razorpay_order_id: razorpayOrder.id, // 🔥 important
          status: "pending",
          payment_status: "pending",
          payment_method: null,
          payment_id: null,
        });
      });
    });
  } catch (error) {
    console.error("createOrder error:", error);
    return res.status(500).json({
      error: "Server error while creating order.",
    });
  }
}

module.exports = createOrder;
