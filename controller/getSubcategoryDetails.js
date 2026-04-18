const connection = require("../config/dbconfig");

function getSubcategoryDetails(req, res) {
  const { id } = req.query;

  if (!id) {
    return res.status(400).json({ error: "id required" });
  }

  const sql = `
    SELECT 
      s.id,
      s.name,
      s.category_id,
      c.name AS category_name
    FROM subcategory s
    JOIN category c ON s.category_id = c.id
    WHERE s.id = ?
  `;

  connection.query(sql, [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Database error" });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: "Subcategory not found" });
    }

    res.json(result[0]);
  });
}

module.exports = getSubcategoryDetails;
