const connection = require("../config/dbconfig");

function addCategory(req, res) {
  const { name } = req.body;

  if (!name) {
    return res.status(400).json({ error: "Category name is required" });
  }

  const sql = `
    INSERT INTO category (name, created_at, modified_at)
    VALUES (?, NOW(), NOW())
  `;

  connection.query(sql, [name], (err, result) => {
    if (err) {
      console.error("Error adding category:", err);
      return res.status(500).json({ error: "Failed to add category" });
    }

    return res.status(201).json({
      success: true,
      message: "Category added successfully",
      category_id: result.insertId,
    });
  });
}

module.exports = addCategory;
