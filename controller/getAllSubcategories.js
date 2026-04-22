const connection = require("../config/dbconfig");

function getAllSubcategories(req, res) {
  console.log("Fetching all subcategories...");

  const query = `
    SELECT 
      s.id,
      s.name,
      s.category_id,
      c.name AS category_name
    FROM subcategory s
    JOIN category c ON s.category_id = c.id
    ORDER BY s.id 
  `;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    return res.status(200).json({
      message: "Subcategories retrieved successfully",
      subcategories: results,
    });
  });
}

module.exports = getAllSubcategories;
