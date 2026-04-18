const connection = require("../config/dbconfig");

function removeUserByAdmin(req, res) {
  console.log("Admin removing user...");

  const user_id = req.headers.mobile_number;

  if (!user_id) {
    return res
      .status(400)
      .json({ error: "user_id (mobile_number) is required" });
  }

  // first delete address
  const deleteAddressQuery = `DELETE FROM addresses WHERE user_id = ?`;

  connection.query(deleteAddressQuery, [user_id], (addressErr) => {
    if (addressErr) {
      console.error("Error deleting address:", addressErr);
      return res.status(500).json({ error: "Error deleting address" });
    }

    // then delete user
    const deleteUserQuery = `DELETE FROM users WHERE user_id = ?`;

    connection.query(deleteUserQuery, [user_id], (userErr, result) => {
      if (userErr) {
        console.error("Error deleting user:", userErr);
        return res.status(500).json({ error: "Error deleting user" });
      }

      if (result.affectedRows === 0) {
        return res.status(404).json({ error: "User not found" });
      }

      return res.status(200).json({
        success: true,
        message: "User and address deleted successfully",
      });
    });
  });
}

module.exports = removeUserByAdmin;
