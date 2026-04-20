const connection = require("../config/dbconfig");

function acceptPartnerOrder(req, res) {
  console.log("Accept order API");

  const mobile_number = req.headers.mobile_number;
  const { order_id } = req.body;

  if (!mobile_number || !order_id) {
    return res.status(400).json({
      message: "order_id is required",
    });
  }

  // 1. Get partner id
  connection.query(
    "SELECT id FROM partners WHERE mobile_number = ?",
    [mobile_number],
    (err, partnerRes) => {
      if (err) {
        console.log("Partner fetch error", err);
        return res.status(500).json({ message: "Server error" });
      }

      if (partnerRes.length === 0) {
        return res.status(404).json({ message: "Partner not found" });
      }

      const partner_id = partnerRes[0].id;

      // 2. Check order
      connection.query(
        "SELECT order_status FROM partner_orders WHERE order_id = ? AND partner_id = ?",
        [order_id, partner_id],
        (err, orderRes) => {
          if (err) {
            console.log("Order check error", err);
            return res.status(500).json({ message: "Server error" });
          }

          if (orderRes.length === 0) {
            return res.status(404).json({
              message: "Order not found for this partner",
            });
          }

          if (orderRes[0].order_status !== "assigned") {
            return res.status(400).json({
              message: "Order already processed",
            });
          }

          // 3. Update status
          connection.query(
            "UPDATE partner_orders SET order_status = 'accepted', partner_accept_time = NOW() WHERE order_id = ? AND partner_id = ?",
            [order_id, partner_id],
            (err) => {
              if (err) {
                console.log("Update error", err);
                return res.status(500).json({ message: "Update failed" });
              }

              return res.status(200).json({
                message: "Order accepted successfully",
              });
            },
          );
        },
      );
    },
  );
}

module.exports = acceptPartnerOrder;
