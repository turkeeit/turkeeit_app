const connection = require("../config/dbconfig");

function getAllServiceAddons(req, res) {
  console.log("Fetching all service addon mappings...");

  const query = `
    SELECT
      sa.id,
      sa.main_service_id,
      ms.name AS main_service_name,
      sa.addon_service_id,
      ads.name AS addon_service_name,
      sa.created_at
    FROM service_addon sa
    INNER JOIN services ms ON sa.main_service_id = ms.id
    INNER JOIN services ads ON sa.addon_service_id = ads.id
    ORDER BY sa.id DESC
  `;

  connection.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching service addon mappings:", err);
      return res.status(500).json({
        success: false,
        message: "Failed to fetch service addon mappings",
      });
    }

    return res.status(200).json({
      success: true,
      message: "Service addon mappings fetched successfully",
      total: results.length,
      data: results,
    });
  });
}

module.exports = getAllServiceAddons;
