const connection = require("../config/dbconfig");

function getPartnerDetails(req, res) {
  console.log("Fetching partner details...");

  const mobile_number = req.headers.mobile_number;

  if (!mobile_number) {
    return res.status(400).json({
      message: "Mobile number is required",
    });
  }

  const query = `
    SELECT 
      p.name,
      p.mobile_number,
      p.gender,
      p.service_category_id,
      p.experience,

      a.flat_no,
      a.building_name,
      a.area_name,
      a.landmark,
      a.city,
      a.state,
      a.pincode

    FROM partners p
    LEFT JOIN addresses a 
      ON a.user_id = p.mobile_number

    WHERE p.mobile_number = ?
  `;

  connection.query(query, [mobile_number], (err, results) => {
    if (err) {
      console.error("Error fetching partner:", err);
      return res.status(500).json({
        message: "Server error while fetching partner details",
      });
    }

    if (results.length === 0) {
      return res.status(404).json({
        message: "Partner not found",
      });
    }

    const data = results[0];

    return res.status(200).json({
      message: "Partner fetched successfully",
      partner: {
        name: data.name,
        mobile_number: data.mobile_number,
        gender: data.gender,
        service_category_id: data.service_category_id,
        experience: data.experience,

        address: {
          flat_no: data.flat_no,
          building_name: data.building_name,
          area_name: data.area_name,
          landmark: data.landmark,
          city: data.city,
          state: data.state,
          pincode: data.pincode,
        },
      },
    });
  });
}

module.exports = getPartnerDetails;
