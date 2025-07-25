const connection = require("../config/dbconfig");

function editPartnerDetails(req, res) {
  console.log("Editing partner details ...");

  const partner_id = req.headers.mobile_number;
  const { name, gender, address, service_category, experience } = req.body;

  if (!partner_id || !name || !gender || !address) {
    return res
      .status(400)
      .json({ error: "partner_id, name, gender and address are required" });
  }

  const updateQuery = `UPDATE partners SET name = ?, gender=?, address=?, service_category=?, experience=? where mobile_number = ?`;

  connection.query(
    updateQuery,
    [name, gender, address, service_category, experience, partner_id],
    (err, result) => {
      if (err) {
        console.error("Error updating partner :", err);
        return res.status(500).json({ error: "Error updating partner " });
      }

      if (result.affectedRows === 0) {
        return res.status(404).json({ error: "partner not found" });
      }

      return res.status(200).json({ message: "Partner updated successfully" });
    }
  );
}

module.exports = editPartnerDetails;
