const connection = require("../config/dbconfig");

function updateUserDetails(req, res) {
  console.log("update user details...");

  const user_id = req.headers.mobile_number; // existing user
  const { name, gender } = req.body;

  if (!user_id || !name || !gender) {
    return res.status(400).json({
      message: "mobile_number, name and gender required",
    });
  }

  const updateUserQuery =
    "UPDATE users SET name = ?, gender = ? WHERE user_id = ?";

  connection.query(updateUserQuery, [name, gender, user_id], (err, results) => {
    if (err) {
      console.log("error updating user", err);
      return res.status(500).json({ message: "Error updating user" });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({
        message: "User not found",
      });
    }

    res.status(200).json({
      message: "User updated successfully",
    });
  });
}

module.exports = updateUserDetails;
