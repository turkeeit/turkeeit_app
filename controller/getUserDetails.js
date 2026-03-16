const connection = require("../config/dbconfig");

function getUserDetails(req, res) {
  console.log("Fetching user details...");

  const mobile_number = req.headers.mobile_number;

  if (!mobile_number) {
    return res.status(400).json({ message: "Mobile number is required" });
  }

  const getUserQuery = "SELECT * FROM users WHERE user_id = ?";

  connection.query(getUserQuery, [mobile_number], (err, userResult) => {
    if (err) {
      console.error("Error fetching user:", err);
      return res.status(500).json({
        message: "Server error while fetching user",
      });
    }

    if (userResult.length === 0) {
      return res.status(404).json({ message: "User not found" });
    }

    const user = userResult[0];

    const getAddressQuery = `
      SELECT flat_no, building_name, area_name, landmark, city, state, pincode
      FROM addresses
      WHERE user_id = ?
    `;

    connection.query(getAddressQuery, [mobile_number], (err, addressResult) => {
      if (err) {
        console.error("Error fetching address:", err);
        return res.status(500).json({
          message: "Server error while fetching address",
        });
      }

      res.status(200).json({
        message: "User fetched successfully",
        user: {
          name: user.name,
          user_id: user.user_id,
          gender: user.gender,
          address: addressResult,
        },
      });
    });
  });
}

module.exports = getUserDetails;
