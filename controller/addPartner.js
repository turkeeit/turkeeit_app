const connection = require("../config/dbconfig");

function addPartner(req, res) {
  const {
    mobile_number,
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
    !mobile_number ||
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
    return res.status(400).json({
      message: "All fields are required",
    });
  }

  const insertPartnerQuery = `
    INSERT INTO partners
    (mobile_number, name, gender, service_category_id, experience)
    VALUES (?, ?, ?, ?, ?)
  `;

  connection.query(
    insertPartnerQuery,
    [mobile_number, name, gender, service_category_id, experience],
    (partnerErr, partnerResult) => {
      if (partnerErr) {
        console.log("Error inserting partner:", partnerErr);
        return res.status(500).json({
          message: "Error inserting partner",
        });
      }

      const insertAddressQuery = `
        INSERT INTO addresses
        (user_id, flat_no, building_name, area_name, landmark, city, state, pincode)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
      `;

      connection.query(
        insertAddressQuery,
        [
          mobile_number,
          flat_no,
          building_name,
          area_name,
          landmark,
          city,
          state,
          pincode,
        ],
        (addressErr) => {
          if (addressErr) {
            console.log("Error inserting address:", addressErr);
            return res.status(500).json({
              message: "Error inserting address",
            });
          }

          const fetchQuery = `
            SELECT
              p.id,
              p.name,
              p.mobile_number,
              p.gender,
              p.service_category_id,
              sc.name AS service_category_name,
              p.experience,
              a.flat_no,
              a.building_name,
              a.area_name,
              a.landmark,
              a.city,
              a.state,
              a.pincode,
              p.created_at,
              p.modified_at
            FROM partners p
            LEFT JOIN category sc
              ON p.service_category_id = sc.id
            LEFT JOIN addresses a
              ON a.user_id = p.mobile_number
            WHERE p.id = ?
          `;

          connection.query(
            fetchQuery,
            [partnerResult.insertId],
            (fetchErr, results) => {
              if (fetchErr) {
                console.log("Error fetching partner details:", fetchErr);
                return res.status(500).json({
                  message: "Error fetching partner details",
                });
              }

              return res.status(200).json({
                message: "Partner inserted successfully",
                partner: results[0],
              });
            },
          );
        },
      );
    },
  );
}

module.exports = addPartner;
