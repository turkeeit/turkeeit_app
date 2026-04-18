const connection = require("../config/dbconfig");

function editCategory(req, res) {
  const { id, name } = req.body;

  if (!id || !name) {
    return res.status(400).json({ error: "id and name are required" });
  }

  const checkSql = `SELECT * FROM category WHERE id = ?`;

  connection.query(checkSql, [id], (checkErr, checkResults) => {
    if (checkErr) {
      console.error("Error checking category:", checkErr);
      return res.status(500).json({ error: "Database error" });
    }

    if (checkResults.length === 0) {
      return res.status(404).json({ error: "Category not found" });
    }

    const updateSql = `
      UPDATE category
      SET name = ?, modified_at = NOW()
      WHERE id = ?
    `;

    connection.query(updateSql, [name, id], (err) => {
      if (err) {
        console.error("Error updating category:", err);
        return res.status(500).json({ error: "Failed to update category" });
      }

      return res.status(200).json({
        success: true,
        message: "Category updated successfully",
      });
    });
  });
}

module.exports = editCategory;
