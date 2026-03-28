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
    razorpay_payment_id,
    razorpay_signature,
    payment_method,
  } = req.body;

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

  // ================= COD FLOW =================
  if (payment_method === "COD") {
    const generatedPaymentId = `cod_${uuidv4().replace(/-/g, "").slice(0, 8)}`;

    const query = `
      UPDATE orders
      SET
        payment_id = ?,
        payment_method = ?,
        status = ?,
        payment_status = ?
      WHERE user_id = ? AND order_id = ?
    `;

    const values = [
      generatedPaymentId,
      "COD",
      order_status || "confirmed",
      payment_status || "pending",
      user_id,
      order_id,
    ];

    return connection.query(query, values, (err, result) => {
      if (err) {
        console.error("COD update error:", err);
        return res.status(500).json({
          error: "Failed to update COD order",
        });
      }

      if (result.affectedRows === 0) {
        return res.status(404).json({
          error: "Order not found",
        });
      }

      return res.status(200).json({
        message: "COD order updated successfully",
        order_id,
        payment_id: generatedPaymentId,
        payment_method: "COD",
        payment_status: "pending",
      });
    });
  }

  // ================= ONLINE FLOW =================
  if (payment_method === "ONLINE") {
    if (!razorpay_order_id || !razorpay_payment_id || !razorpay_signature) {
      return res.status(400).json({
        error:
          "razorpay_order_id, razorpay_payment_id and razorpay_signature are required",
      });
    }

    const finalPaymentId = payment_id || razorpay_payment_id;

    const query = `
      UPDATE orders
      SET
        payment_id = ?,
        payment_method = ?,
        status = ?,
        payment_status = ?,
        razorpay_order_id = ?,
        razorpay_payment_id = ?,
        razorpay_signature = ?
      WHERE user_id = ? AND order_id = ?
    `;

    const values = [
      finalPaymentId,
      "ONLINE",
      order_status || "confirmed",
      payment_status || "paid",
      razorpay_order_id,
      razorpay_payment_id,
      razorpay_signature,
      user_id,
      order_id,
    ];

    return connection.query(query, values, (err, result) => {
      if (err) {
        console.error("ONLINE update error:", err);
        return res.status(500).json({
          error: "Failed to update ONLINE order",
        });
      }

      if (result.affectedRows === 0) {
        return res.status(404).json({
          error: "Order not found",
        });
      }

      return res.status(200).json({
        message: "ONLINE order updated successfully",
        order_id,
        payment_id: finalPaymentId,
        payment_method: "ONLINE",
        payment_status: "paid",
        razorpay_order_id,
        razorpay_payment_id,
        razorpay_signature,
      });
    });
  }
}

module.exports = updateOrderStatus;
