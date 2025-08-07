const connection = require("../config/dbconfig");

function removeUserByAdmin(req, res) {
  console.log("Admin removing user...");

  const user_id = req.headers.mobile_number;

  if (!user_id) {
    return res
      .status(400)
      .json({ error: "user_id (mobile_number) is required" });
  }

  const deleteQuery = `DELETE FROM users WHERE user_id = ?`;

  connection.query(deleteQuery, [user_id], (err, result) => {
    if (err) {
      console.error("Error deleting user:", err);
      return res.status(500).json({ error: "Error deleting user" });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    return res.status(200).json({ message: "User deleted successfully" });
  });
}

module.exports = removeUserByAdmin;
