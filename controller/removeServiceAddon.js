const connection = require("../config/dbconfig");

function removeServiceAddon(req, res) {
  console.log("Removing service addon mapping...");

  const { id, main_service_id, addon_service_id } = req.body;

  if (!id && !(main_service_id && addon_service_id)) {
    return res.status(400).json({
      success: false,
      message: "Provide either id or both main_service_id and addon_service_id",
    });
  }

  let deleteQuery = "";
  let params = [];

  if (id) {
    deleteQuery = `DELETE FROM service_addon WHERE id = ?`;
    params = [id];
  } else {
    deleteQuery = `
      DELETE FROM service_addon
      WHERE main_service_id = ? AND addon_service_id = ?
    `;
    params = [main_service_id, addon_service_id];
  }

  connection.query(deleteQuery, params, (err, result) => {
    if (err) {
      console.error("Error removing service addon mapping:", err);
      return res.status(500).json({
        success: false,
        message: "Failed to remove service addon mapping",
      });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({
        success: false,
        message: "Service addon mapping not found",
      });
    }

    return res.status(200).json({
      success: true,
      message: "Service addon mapping removed successfully",
    });
  });
}

module.exports = removeServiceAddon;
