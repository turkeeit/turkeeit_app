const connection = require("../config/dbconfig");

function addSubcategory(req, res) {
  const { name, category_id } = req.body;

  if (!name || !category_id) {
    return res.status(400).json({ error: "name and category_id required" });
  }

  const sql = "INSERT INTO subcategory (name, category_id) VALUES (?, ?)";

  connection.query(sql, [name, category_id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Failed to add subcategory" });
    }

    res.json({
      message: "Subcategory added successfully",
      id: result.insertId,
    });
  });
}

module.exports = addSubcategory;
