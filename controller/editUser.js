const connection = require("../config/dbconfig");

function editUser(req, res) {
  console.log("Editing cart item...");

  const user_id = req.headers.mobile_number;
  const { name, gender, address } = req.body;

  if (!user_id || !name || !gender || !address) {
    return res
      .status(400)
      .json({ error: "user_id, name, gender and address are required" });
  }

  const updateQuery = `UPDATE users SET name = ?, gender=?, address=? where user_id = ?`;

  connection.query(
    updateQuery,
    [name, gender, address, user_id],
    (err, result) => {
      if (err) {
        console.error("Error updating user :", err);
        return res.status(500).json({ error: "Error updating user " });
      }

      if (result.affectedRows === 0) {
        return res.status(404).json({ error: "user not found" });
      }

      return res.status(200).json({ message: "User updated successfully" });
    }
  );
}

module.exports = editUser;
