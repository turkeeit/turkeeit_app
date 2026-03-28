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

    const {
      address,
      total_price,
      cart_items,
      service_date,
      service_time,
      payment_method,
    } = req.body;

    // ✅ validation
    if (
      !user_id ||
      !address ||
      !total_price ||
      !service_date ||
      !service_time ||
      !payment_method ||
      !Array.isArray(cart_items) ||
      cart_items.length === 0
    ) {
      return res.status(400).json({
        error: "Missing required fields",
      });
    }

    // ✅ allow only COD or ONLINE
    if (!["COD", "ONLINE"].includes(payment_method)) {
      return res.status(400).json({
        error: "payment_method must be either COD or ONLINE",
      });
    }

    const order_id = uuidv4();

    let razorpay_order_id = null;
    let payment_id = null;
    let order_status = "pending";
    let payment_status = "pending";

    // ✅ ONLINE PAYMENT CASE
    if (payment_method === "ONLINE") {
      const options = {
        amount: Number(total_price) * 100, // Razorpay expects paise
        currency: "INR",
        receipt: `rcpt_${Date.now()}`,
      };

      const razorpayOrder = await razorpay.orders.create(options);
      razorpay_order_id = razorpayOrder.id;

      order_status = "pending";
      payment_status = "initiated";
    }

    // ✅ COD CASE
    if (payment_method === "COD") {
      order_status = "confirmed";
      payment_status = "pending";
    }

    const insertOrderQuery = `
      INSERT INTO orders
      (
        order_id,
        user_id,
        status,
        total_price,
        address,
        payment_id,
        razorpay_order_id,
        service_date,
        service_time,
        payment_method,
        payment_status
      )
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    connection.query(
      insertOrderQuery,
      [
        order_id,
        user_id,
        order_status,
        total_price,
        address,
        payment_id,
        razorpay_order_id,
        service_date,
        service_time,
        payment_method,
        payment_status,
      ],
      (orderErr, orderResult) => {
        if (orderErr) {
          console.error("Failed to insert order:", orderErr);
          return res.status(500).json({ error: "Failed to save order." });
        }

        const orderItemsValues = cart_items.map((item) => {
          const quantity = item.quantity || item.qty || 1;
          const price = Number(item.price) || 0;

          return [order_id, item.service_id, quantity, price, quantity * price];
        });

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
              order_id,
              razorpay_order_id,
              payment_method,
              order_status,
              payment_status,
            });
          },
        );
      },
    );
  } catch (err) {
    console.error("Create order error:", err);
    return res.status(500).json({ error: "Failed to create order." });
  }
}

module.exports = createOrder;
