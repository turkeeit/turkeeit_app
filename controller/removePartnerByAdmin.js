const connection = require("../config/dbconfig");

function removePartnerByAdmin(req, res) {
  console.log("Admin removing partner...");

  const mobile_number = req.headers.mobile_number;

  if (!mobile_number) {
    return res.status(400).json({
      error: "mobile_number is required in headers",
    });
  }

  // Step 1: Delete partner address from addresses table
  const deleteAddressQuery = `
    DELETE FROM addresses
    WHERE user_id = ?
  `;

  connection.query(
    deleteAddressQuery,
    [mobile_number],
    (addressErr, addressResult) => {
      if (addressErr) {
        console.error("Error deleting partner address:", addressErr);
        return res.status(500).json({
          error: "Error deleting partner address",
        });
      }

      // Step 2: Delete partner from partners table
      const deletePartnerQuery = `
      DELETE FROM partners
      WHERE mobile_number = ?
    `;

      connection.query(
        deletePartnerQuery,
        [mobile_number],
        (partnerErr, partnerResult) => {
          if (partnerErr) {
            console.error("Error deleting partner:", partnerErr);
            return res.status(500).json({
              error: "Error deleting partner",
            });
          }

          if (partnerResult.affectedRows === 0) {
            return res.status(404).json({
              error: "Partner not found",
            });
          }

          return res.status(200).json({
            message: "Partner and related address deleted successfully",
          });
        },
      );
    },
  );
}

module.exports = removePartnerByAdmin;
