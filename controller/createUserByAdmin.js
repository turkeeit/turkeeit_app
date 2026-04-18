const connection = require("../config/dbconfig");

function createUserByAdmin(req, res) {
  console.log("Creating new user...");

  const { user_id, name, gender, address } = req.body;

  if (!user_id || !name || !gender || !address) {
    return res.status(400).json({
      error: "user_id, name, gender and address are required",
    });
  }

  const { flat_no, building_name, area_name, landmark, city, state, pincode } =
    address;

  if (
    !flat_no ||
    !building_name ||
    !area_name ||
    !landmark ||
    !city ||
    !state ||
    !pincode
  ) {
    return res.status(400).json({
      error:
        "flat_no, building_name, area_name, landmark, city, state and pincode are required",
    });
  }

  const checkUserQuery = `SELECT * FROM users WHERE user_id = ?`;

  connection.query(checkUserQuery, [user_id], (checkErr, checkResult) => {
    if (checkErr) {
      console.error("Error checking user:", checkErr);
      return res.status(500).json({ error: "Error checking user" });
    }

    if (checkResult.length > 0) {
      return res.status(400).json({ error: "User already exists" });
    }

    const insertUserQuery = `
      INSERT INTO users (user_id, name, gender, created_at, modified_at)
      VALUES (?, ?, ?, NOW(), NOW())
    `;

    connection.query(
      insertUserQuery,
      [user_id, name, gender],
      (userErr, userResult) => {
        if (userErr) {
          console.error("Error inserting user:", userErr);
          return res.status(500).json({ error: "Error creating user" });
        }

        const insertAddressQuery = `
          INSERT INTO addresses (
            user_id,
            flat_no,
            building_name,
            area_name,
            landmark,
            city,
            state,
            pincode,
            created_at,
            modified_at
          )
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())
        `;

        connection.query(
          insertAddressQuery,
          [
            user_id,
            flat_no,
            building_name,
            area_name,
            landmark,
            city,
            state,
            pincode,
          ],
          (addressErr, addressResult) => {
            if (addressErr) {
              console.error("Error inserting address:", addressErr);
              return res.status(500).json({ error: "Error creating address" });
            }

            return res.status(201).json({
              success: true,
              message: "User created successfully",
            });
          },
        );
      },
    );
  });
}

module.exports = createUserByAdmin;
