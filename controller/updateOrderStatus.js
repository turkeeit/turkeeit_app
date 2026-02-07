const express = require("express");
const connection = require("../config/dbconfig");
const { v4: uuidv4 } = require("uuid");

function updateOrderStatus(req, res) {
  console.log("update order status ...");

  const user_id = req.headers.mobile_number;
  const mode_of_payment = req.headers.modeofpayment;
  let { order_id, payment_id, status, razorpay_id } = req.body;
  console.log("update order status", user_id, order_id);
  console.log(
    `user_id=${user_id} order_id=${order_id} payment_id=${payment_id} razorpay_id=${razorpay_id}`,
  );
  console.log("Mode of payment is ", mode_of_payment);
  if (!user_id || !order_id) {
    return res.status(400).json({ error: "order_id, payment_id are required" });
  }

  if (mode_of_payment == "COD") {
    const codOrderId = `cod_${uuidv4().replace(/-/g, "").slice(0, 8)}`;
    console.log(codOrderId);
    payment_id = codOrderId;
  } else if (mode_of_payment == "Online") {
    if (!payment_id) {
      return res
        .status(400)
        .json({ error: "order_id, payment_id are required" });
    }
  } else {
    return res.status(400).json({ error: "mode of payment is not right" });
  }

  // Otherwise, update the quantity
  console.log(status, razorpay_id, user_id);
  const updateQuery = `UPDATE orders SET payment_id='${payment_id}', status='${status}', razorpay_order_id='${razorpay_id}' WHERE user_id = '${user_id}' AND order_id = '${order_id}'`;

  connection.query(updateQuery, (err, result) => {
    if (err) {
      console.error("Error updating order status :", err);
      return res.status(500).json({ error: "Error updating order item" });
    }

    return res
      .status(200)
      .json({ message: "order status  updated successfully" });
  });
}

module.exports = updateOrderStatus;
