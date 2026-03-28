const connection = require("../config/dbconfig");
const { v4: uuidv4 } = require("uuid");

function updateOrderStatus(req, res) {
  console.log("Updating order status...");

  const user_id = req.headers.mobile_number;

  let {
    order_id,
    payment_id,
    order_status,
    payment_status,
    razorpay_order_id,
    payment_method,
  } = req.body;

  console.log("req.headers =", req.headers);
  console.log("req.body =", req.body);

  if (!user_id || !order_id || !payment_method) {
    return res.status(400).json({
      error: "user_id, order_id and payment_method are required",
    });
  }

  payment_method = String(payment_method).toUpperCase();

  if (!["COD", "ONLINE"].includes(payment_method)) {
    return res.status(400).json({
      error: "payment_method must be either COD or ONLINE",
    });
  }

  let finalPaymentId = payment_id || null;
  let finalOrderStatus = order_status || "pending";
  let finalPaymentStatus = payment_status || "pending";
  let finalRazorpayOrderId = razorpay_order_id || null;

  if (payment_method === "COD") {
    finalPaymentId = `cod_${uuidv4().replace(/-/g, "").slice(0, 8)}`;
    finalOrderStatus = order_status || "confirmed";
    finalPaymentStatus = payment_status || "pending";
  }

  if (payment_method === "ONLINE") {
    if (!payment_id) {
      return res.status(400).json({
        error: "payment_id is required for ONLINE payment",
      });
    }

    finalOrderStatus = order_status || "confirmed";
    finalPaymentStatus = payment_status || "paid";
  }

  console.log("payment_method =", payment_method);
  console.log("finalPaymentId before update =", finalPaymentId);

  const updateQuery = `
    UPDATE orders
    SET
      payment_id = ?,
      status = ?,
      payment_status = ?,
      razorpay_order_id = ?
    WHERE user_id = ? AND order_id = ?
  `;

  connection.query(
    updateQuery,
    [
      finalPaymentId,
      finalOrderStatus,
      finalPaymentStatus,
      finalRazorpayOrderId,
      user_id,
      order_id,
    ],
    (err, result) => {
      if (err) {
        console.error("Error updating order status:", err);
        return res.status(500).json({ error: "Error updating order status" });
      }

      console.log("DB result =", result);

      if (result.affectedRows === 0) {
        return res.status(404).json({
          error: "Order not found",
        });
      }

      return res.status(200).json({
        message: "Order status updated successfully",
        order_id,
        payment_id: finalPaymentId,
        order_status: finalOrderStatus,
        payment_status: finalPaymentStatus,
        razorpay_order_id: finalRazorpayOrderId,
      });
    },
  );
}

module.exports = updateOrderStatus;
