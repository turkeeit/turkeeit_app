const connection = require("../config/dbconfig");

function removePartnerByAdmin(req, res) {
  console.log("Admin removing partner...");

  const mobile_number = req.headers.mobile_number;

  if (!mobile_number) {
    return res
      .status(400)
      .json({ error: "mobile_number is required in headers" });
  }

  const deleteQuery = `DELETE FROM partners WHERE mobile_number = ?`;

  connection.query(deleteQuery, [mobile_number], (err, result) => {
    if (err) {
      console.error("Error deleting partner:", err);
      return res.status(500).json({ error: "Error deleting partner" });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Partner not found" });
    }

    return res.status(200).json({ message: "Partner deleted successfully" });
  });
}

module.exports = removePartnerByAdmin;
