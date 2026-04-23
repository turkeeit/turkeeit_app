const connection = require("../config/dbconfig");

function getServiceAddonsByMainService(req, res) {
  console.log("Fetching addon mappings by main service...");

  const main_service_id =
    req.query.main_service_id || req.headers.main_service_id;

  if (!main_service_id) {
    return res.status(400).json({
      success: false,
      message: "main_service_id is required",
    });
  }

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
    WHERE sa.main_service_id = ?
    ORDER BY sa.id DESC
  `;

  connection.query(query, [main_service_id], (err, results) => {
    if (err) {
      console.error("Error fetching mappings by main service:", err);
      return res.status(500).json({
        success: false,
        message: "Failed to fetch mappings",
      });
    }

    return res.status(200).json({
      success: true,
      message: "Mappings fetched successfully",
      total: results.length,
      data: results,
    });
  });
}

module.exports = getServiceAddonsByMainService;
