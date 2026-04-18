const connection = require("../config/dbconfig");

function editUser(req, res) {
  console.log("Editing user details...");

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

  const updateUserQuery = `
    UPDATE users 
    SET name = ?, gender = ?, modified_at = NOW()
    WHERE user_id = ?
  `;

  connection.query(
    updateUserQuery,
    [name, gender, user_id],
    (userErr, userResult) => {
      if (userErr) {
        console.error("Error updating user:", userErr);
        return res.status(500).json({ error: "Error updating user details" });
      }

      if (userResult.affectedRows === 0) {
        return res.status(404).json({ error: "User not found" });
      }

      const checkAddressQuery = `SELECT * FROM addresses WHERE user_id = ?`;

      connection.query(
        checkAddressQuery,
        [user_id],
        (checkErr, checkResult) => {
          if (checkErr) {
            console.error("Error checking address:", checkErr);
            return res.status(500).json({ error: "Error checking address" });
          }

          if (checkResult.length > 0) {
            const updateAddressQuery = `
          UPDATE addresses
          SET 
            flat_no = ?,
            building_name = ?,
            area_name = ?,
            landmark = ?,
            city = ?,
            state = ?,
            pincode = ?,
            modified_at = NOW()
          WHERE user_id = ?
        `;

            connection.query(
              updateAddressQuery,
              [
                flat_no,
                building_name,
                area_name,
                landmark,
                city,
                state,
                pincode,
                user_id,
              ],
              (addressErr) => {
                if (addressErr) {
                  console.error("Error updating address:", addressErr);
                  return res
                    .status(500)
                    .json({ error: "Error updating address" });
                }

                return res.status(200).json({
                  success: true,
                  message: "User and address updated successfully",
                });
              },
            );
          } else {
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
              (insertErr) => {
                if (insertErr) {
                  console.error("Error inserting address:", insertErr);
                  return res
                    .status(500)
                    .json({ error: "Error saving address" });
                }

                return res.status(200).json({
                  success: true,
                  message: "User updated and address added successfully",
                });
              },
            );
          }
        },
      );
    },
  );
}

module.exports = editUser;
