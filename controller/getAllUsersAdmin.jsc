const connection = require("../config/dbconfig");

function getAllUsers(req, res) {
  console.log("Fetching all users...");

  const query = `SELECT * FROM users`;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    res.status(200).json({
      message: "Users retrieved successfully",
      users: results,
    });
  });
}

module.exports = getAllUsers;
