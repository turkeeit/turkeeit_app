require("dotenv").config();
const Razorpay = require("razorpay");
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
    service_date,
    service_time,
    payment_method,
  } = req.body;

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
    return res.status(400).json({ error: "Missing required fields" });
  }

  const order_id = uuidv4();

  let razorpay_order_id = null;
  let payment_id = null;
  let order_status = "pending";
  let payment_status = "pending";

  try {
    // ✅ ONLINE PAYMENT CASE
    if (payment_method === "ONLINE") {
      const options = {
        amount: Number(total_price) * 100,
        currency: "INR",
        receipt: `rcptid_${Date.now()}`,
        payment_capture: 1,
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

        const orderItemsValues = cart_items.map((item) => [
          order_id,
          item.service_id,
          item.quantity || item.qty || 1,
          item.price,
          (item.quantity || item.qty || 1) * item.price,
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
