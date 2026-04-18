const connection = require("../config/dbconfig");

function editSubcategory(req, res) {
  const { id, name, category_id } = req.body;

  if (!id || !name || !category_id) {
    return res.status(400).json({ error: "id, name, category_id required" });
  }

  const sql = `
    UPDATE subcategory 
    SET name = ?, category_id = ?
    WHERE id = ?
  `;

  connection.query(sql, [name, category_id, id], (err) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Update failed" });
    }

    res.json({ message: "Subcategory updated successfully" });
  });
}

module.exports = editSubcategory;
