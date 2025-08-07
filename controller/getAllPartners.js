const connection = require("../config/dbconfig");

function  getAllPartners(req, res) {
  console.log("Fetching all partners...");

  const query = `SELECT * FROM partners`;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    res.status(200).json({
      message: "Partner retrieved successfully",
      partners_list: results,
    });
  });
}

module.exports = getAllPartners;
