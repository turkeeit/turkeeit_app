const connection = require("../config/dbconfig");

function editPartnerDetails(req, res) {
  console.log("Editing partner details...");

  const partner_id = req.headers.mobile_number;

  const {
    name,
    gender,
    service_category_id,
    experience,
    flat_no,
    building_name,
    area_name,
    landmark,
    city,
    state,
    pincode,
  } = req.body;

  if (
    !partner_id ||
    !name ||
    !gender ||
    !service_category_id ||
    experience === undefined ||
    !flat_no ||
    !building_name ||
    !area_name ||
    !landmark ||
    !city ||
    !state ||
    !pincode
  ) {
    console.log("Required fields are missing");
    return res.status(400).json({
      error:
        "name, gender, service_category_id, experience, flat_no, building_name, area_name, landmark, city, state and pincode are required",
    });
  }

  const updatePartnerQuery = `
    UPDATE partners
    SET
      name = ?,
      gender = ?,
      service_category_id = ?,
      experience = ?
    WHERE mobile_number = ?
  `;

  connection.query(
    updatePartnerQuery,
    [name, gender, service_category_id, experience, partner_id],
    (partnerErr, partnerResult) => {
      if (partnerErr) {
        console.log("Error updating partner:", partnerErr);
        return res.status(500).json({ error: "Error updating partner" });
      }

      if (partnerResult.affectedRows === 0) {
        console.log("Partner not found");
        return res.status(404).json({ error: "Partner not found" });
      }

      const checkAddressQuery = `
        SELECT * FROM addresses WHERE user_id = ?
      `;

      connection.query(
        checkAddressQuery,
        [partner_id],
        (checkErr, checkResult) => {
          if (checkErr) {
            console.log("Error checking address:", checkErr);
            return res.status(500).json({ error: "Error checking address" });
          }

          // address exists -> update
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
              pincode = ?
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
                partner_id,
              ],
              (addressErr, addressResult) => {
                if (addressErr) {
                  console.log("Error updating address:", addressErr);
                  return res
                    .status(500)
                    .json({ error: "Error updating address" });
                }

                console.log("Partner and address updated successfully");

                return res.status(200).json({
                  message: "Partner details updated successfully",
                });
              },
            );
          } else {
            // address does not exist -> insert
            const insertAddressQuery = `
            INSERT INTO addresses
            (user_id, flat_no, building_name, area_name, landmark, city, state, pincode)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
          `;

            connection.query(
              insertAddressQuery,
              [
                partner_id,
                flat_no,
                building_name,
                area_name,
                landmark,
                city,
                state,
                pincode,
              ],
              (insertErr, insertResult) => {
                if (insertErr) {
                  console.log("Error inserting address:", insertErr);
                  return res
                    .status(500)
                    .json({ error: "Error inserting address" });
                }

                console.log(
                  "Partner updated and address inserted successfully",
                );

                return res.status(200).json({
                  message: "Partner details updated successfully",
                });
              },
            );
          }
        },
      );
    },
  );
}

module.exports = editPartnerDetails;
