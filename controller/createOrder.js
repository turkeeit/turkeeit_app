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
      order_id,
      address,
      total_price,
      cart_items,
      service_date,
      service_time,
    } = req.body;

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

    // Always create fresh Razorpay order for latest total / retry flow
    const razorpayOptions = {
      amount: Number(total_price) * 100,
      currency: "INR",
      receipt: `rcpt_${Date.now()}`,
      payment_capture: 1,
    };

    const razorpayOrder = await razorpay.orders.create(razorpayOptions);

    // If order_id is passed, try to update same pending order
    if (order_id) {
      const checkOrderQuery = `
        SELECT * FROM orders
        WHERE order_id = ? AND user_id = ? AND status = 'pending'
        LIMIT 1
      `;

      connection.query(
        checkOrderQuery,
        [order_id, user_id],
        (checkErr, checkResults) => {
          if (checkErr) {
            console.error("Failed to check existing order:", checkErr);
            return res.status(500).json({
              error: "Failed to check existing order.",
            });
          }

          // Existing pending order found -> update same row
          if (checkResults.length > 0) {
            const updateOrderQuery = `
            UPDATE orders
            SET
              total_price = ?,
              address = ?,
              service_date = ?,
              service_time = ?,
              razorpay_order_id = ?,
              modified_at = CURRENT_TIMESTAMP
            WHERE order_id = ? AND user_id = ?
          `;

            const updateValues = [
              Number(total_price),
              address,
              service_date,
              service_time,
              razorpayOrder.id,
              order_id,
              user_id,
            ];

            connection.query(updateOrderQuery, updateValues, (updateErr) => {
              if (updateErr) {
                console.error("Failed to update existing order:", updateErr);
                return res.status(500).json({
                  error: "Failed to update existing order.",
                });
              }

              // Delete old order items
              const deleteItemsQuery = `DELETE FROM order_items WHERE order_id = ?`;

              connection.query(deleteItemsQuery, [order_id], (deleteErr) => {
                if (deleteErr) {
                  console.error("Failed to delete old order items:", deleteErr);
                  return res.status(500).json({
                    error: "Failed to refresh order items.",
                  });
                }

                // Insert latest order items
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

                connection.query(
                  insertItemsQuery,
                  [orderItemsValues],
                  (itemsErr) => {
                    if (itemsErr) {
                      console.error(
                        "Failed to insert updated order items:",
                        itemsErr,
                      );
                      return res.status(500).json({
                        error: "Failed to save updated order items.",
                      });
                    }

                    return res.status(200).json({
                      message: "Order updated successfully",
                      order_id: order_id,
                      razorpay_order_id: razorpayOrder.id,
                      status: "pending",
                      payment_status: "pending",
                      payment_method: null,
                      payment_id: null,
                    });
                  },
                );
              });
            });

            return;
          }

          // If provided order_id not found as pending, create new order
          return createNewOrder({
            user_id,
            address,
            total_price,
            cart_items,
            service_date,
            service_time,
            razorpayOrder,
            res,
          });
        },
      );

      return;
    }

    // No order_id passed -> create new order
    return createNewOrder({
      user_id,
      address,
      total_price,
      cart_items,
      service_date,
      service_time,
      razorpayOrder,
      res,
    });
  } catch (error) {
    console.error("createOrder error:", error);
    return res.status(500).json({
      error: "Server error while creating order.",
    });
  }
}

function createNewOrder({
  user_id,
  address,
  total_price,
  cart_items,
  service_date,
  service_time,
  razorpayOrder,
  res,
}) {
  const newOrderId = uuidv4();

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
    newOrderId,
    user_id,
    "pending",
    Number(total_price),
    address,
    null,
    null,
    "pending",
    razorpayOrder.id,
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

    const orderItemsValues = cart_items.map((item) => [
      newOrderId,
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
        order_id: newOrderId,
        razorpay_order_id: razorpayOrder.id,
        status: "pending",
        payment_status: "pending",
        payment_method: null,
        payment_id: null,
      });
    });
  });
}

module.exports = createOrder;
