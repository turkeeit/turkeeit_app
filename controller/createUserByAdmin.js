const connection = require("../config/dbconfig");

function createUserByAdmin(req, res) {
  console.log("Creating new user...");

  const user_id = req.headers.mobile_number;
  const { name, gender, address } = req.body;

  if (!user_id || !name || !gender || !address) {
    return res
      .status(400)
      .json({ error: "user_id, name, gender, and address are required" });
  }

  const insertQuery = `INSERT INTO users (user_id, name, gender, address) VALUES (?, ?, ?, ?)`;

  connection.query(
    insertQuery,
    [user_id, name, gender, address],
    (err, result) => {
      if (err) {
        console.error("Error inserting user:", err);
        return res.status(500).json({ error: "Error creating user" });
      }

      return res.status(201).json({ message: "User created successfully" });
    }
  );
}

module.exports = createUserByAdmin;
