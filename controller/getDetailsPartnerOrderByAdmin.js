const connection = require("../config/dbconfig");

function getDetailsPartnerOrderByAdmin(req, res) {
  console.log("Admin fetching detailed breakdown of a partner order...");

  const partner_order_id = req.headers.partner_order_id;

  if (!partner_order_id) {
    return res
      .status(400)
      .json({ error: "partner_order_id is required in headers" });
  }

  const query = `SELECT id, partner_order_id, total_order_amount, platform_fee, taxes, partner_earning, payment_status, paid_at, created_at 
                 FROM partner_orders WHERE id = ?`;

  connection.query(query, [partner_order_id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Partner order not found" });
    }

    const order = results[0];

    // Compute commission and payout details
    const total_amount = parseFloat(order.total_order_amount);
    const platform_fee = parseFloat(order.platform_fee);
    const taxes = parseFloat(order.taxes);
    const partner_earning = parseFloat(order.partner_earning);

    const breakdown = {
      total_order_amount: total_amount,
      platform_fee: platform_fee,
      taxes: taxes,
      partner_earning: partner_earning,
      platform_commission_percent:
        ((platform_fee / total_amount) * 100).toFixed(2) + "%",
      tax_percent: ((taxes / total_amount) * 100).toFixed(2) + "%",
      amount_to_be_paid_to_partner: partner_earning,
    };

    res.status(200).json({
      message:
        "Partner order details with earnings breakdown retrieved successfully",
      partner_order: order,
      breakdown: breakdown,
    });
  });
}

module.exports = getDetailsPartnerOrderByAdmin;
