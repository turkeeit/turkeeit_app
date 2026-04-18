const connection = require("../config/dbconfig");

function getCategoryDetails(req, res) {
  const { id } = req.query;

  if (!id) {
    return res.status(400).json({ error: "Category ID is required" });
  }

  const sql = `SELECT * FROM category WHERE id = ?`;

  connection.query(sql, [id], (err, results) => {
    if (err) {
      console.error("Error fetching category details:", err);
      return res
        .status(500)
        .json({ error: "Failed to fetch category details" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Category not found" });
    }

    return res.status(200).json({
      success: true,
      category: results[0],
    });
  });
}

module.exports = getCategoryDetails;
