const connection = require("../config/dbconfig");

function markPayoutPaid(req, res) {
  console.log("Marking payout as paid...");

  const { payout_id, payout_method, payout_reference_id } = req.body;

  if (!payout_id || !payout_method) {
    return res.status(400).json({
      success: false,
      message: "payout_id and payout_method are required",
    });
  }

  const allowedMethods = ["upi", "bank_transfer", "cash", "manual"];

  if (!allowedMethods.includes(String(payout_method).toLowerCase())) {
    return res.status(400).json({
      success: false,
      message: "Invalid payout_method",
    });
  }

  const checkQuery = `
    SELECT id, payout_status
    FROM partner_payouts
    WHERE id = ?
    LIMIT 1
  `;

  connection.query(checkQuery, [payout_id], (checkErr, checkResults) => {
    if (checkErr) {
      console.error("Error checking payout:", checkErr);
      return res.status(500).json({
        success: false,
        message: "Database error while checking payout",
      });
    }

    if (checkResults.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Payout not found",
      });
    }

    const payout = checkResults[0];

    if (payout.payout_status === "paid") {
      return res.status(400).json({
        success: false,
        message: "Payout is already marked as paid",
      });
    }

    const updateQuery = `
      UPDATE partner_payouts
      SET
        payout_status = ?,
        payout_method = ?,
        payout_reference_id = ?,
        paid_at = NOW(),
        updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `;

    const values = [
      "paid",
      String(payout_method).toLowerCase(),
      payout_reference_id || null,
      payout_id,
    ];

    connection.query(updateQuery, values, (updateErr, updateResult) => {
      if (updateErr) {
        console.error("Error updating payout:", updateErr);
        return res.status(500).json({
          success: false,
          message: "Database error while updating payout",
        });
      }

      if (updateResult.affectedRows === 0) {
        return res.status(404).json({
          success: false,
          message: "Payout update failed",
        });
      }

      return res.status(200).json({
        success: true,
        message: "Payout marked as paid successfully",
        data: {
          payout_id,
          payout_status: "paid",
          payout_method: String(payout_method).toLowerCase(),
          payout_reference_id: payout_reference_id || null,
        },
      });
    });
  });
}

module.exports = markPayoutPaid;
