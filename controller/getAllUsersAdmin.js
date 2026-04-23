const connection = require("../config/dbconfig");

function getAllUsers(req, res) {
  const query = `
  SELECT 
    u.user_id,
    u.name,
    u.gender,
    a.flat_no,
    a.building_name,
    a.area_name,
    a.landmark,
    a.city,
    a.state,
    a.pincode
  FROM users u
  LEFT JOIN addresses a ON u.user_id = a.user_id 
  ORDER BY u.created_at DESC
`;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    const users = results.map((row) => ({
      user_id: row.user_id,
      name: row.name,
      gender: row.gender,
      address:
        row.flat_no ||
        row.building_name ||
        row.area_name ||
        row.landmark ||
        row.city ||
        row.state ||
        row.pincode
          ? {
              flat_no: row.flat_no,
              building_name: row.building_name,
              area_name: row.area_name,
              landmark: row.landmark,
              city: row.city,
              state: row.state,
              pincode: row.pincode,
            }
          : null,
    }));

    return res.status(200).json({
      message: "Users retrieved successfully",
      users,
    });
  });
}

module.exports = getAllUsers;
