const connection = require("../config/dbconfig");

function getPartnerDetails(req, res) {
  console.log("Fetching partner details...");

  // Read mobile number from headers
  const mobile_number = req.headers.mobile_number;

  // Validation
  if (!mobile_number) {
    return res.status(400).json({ message: "Mobile number is required" });
  }

  // Query to get user by mobile number
  const getPartnerDetailsQuery =
    "SELECT * FROM partners WHERE mobile_number = ?";

  connection.query(
    getPartnerDetailsQuery,
    [mobile_number],
    (err, partnerResult) => {
      if (err) {
        console.error("Error fetching partner:", err);
        return res
          .status(500)
          .json({ message: "Server error while fetching user" });
      }

      if (partnerResult.length === 0) {
        return res.status(404).json({ message: "Partner not found" });
      }

      const partner = partnerResult[0];

      // Return user data
      res.status(200).json({
        message: "Partner fetched successfully",
        partner: {
          name: partner.name,
          mobile_number: partner.mobile_number,
          gender: partner.gender,
          address: partner.address,
          service_category: partner.service_category,
          experience: partner.experience,
        },
      });
    }
  );
}

module.exports = getPartnerDetails;
