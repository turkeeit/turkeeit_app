const connection = require("../config/dbconfig");

function removeService(req, res) {
  console.log("Removing service...");

  const { id } = req.body;

  if (!id) {
    return res.status(400).json({ error: "Service ID is required" });
  }

  // Check if service exists
  const checkQuery = `SELECT * FROM services WHERE id = ?`;

  connection.query(checkQuery, [id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Service not found" });
    }

    // Delete service includes
    connection.query(
      "DELETE FROM service_includes WHERE service_id = ?",
      [id],
      (includeErr) => {
        if (includeErr) {
          console.error("Error deleting service includes:", includeErr);
          return res
            .status(500)
            .json({ error: "Failed to delete service includes" });
        }

        // Delete service excludes
        connection.query(
          "DELETE FROM service_excludes WHERE service_id = ?",
          [id],
          (excludeErr) => {
            if (excludeErr) {
              console.error("Error deleting service excludes:", excludeErr);
              return res
                .status(500)
                .json({ error: "Failed to delete service excludes" });
            }

            // Delete service from addon table
            connection.query(
              "DELETE FROM service_addon WHERE main_service_id = ? OR addon_service_id = ?",
              [id, id],
              (addonErr) => {
                if (addonErr) {
                  console.error("Error deleting service addons:", addonErr);
                  return res
                    .status(500)
                    .json({ error: "Failed to delete service addons" });
                }

                // Finally delete service
                connection.query(
                  "DELETE FROM services WHERE id = ?",
                  [id],
                  (deleteErr) => {
                    if (deleteErr) {
                      console.error("Error deleting service:", deleteErr);
                      return res
                        .status(500)
                        .json({ error: "Failed to delete service" });
                    }

                    return res.status(200).json({
                      success: true,
                      message: "Service and related data deleted successfully",
                    });
                  },
                );
              },
            );
          },
        );
      },
    );
  });
}

module.exports = removeService;
