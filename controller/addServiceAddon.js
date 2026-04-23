const connection = require("../config/dbconfig");

function addServiceAddon(req, res) {
  console.log("Adding service addon mapping...");

  const { main_service_id, addon_service_id } = req.body;

  if (!main_service_id || !addon_service_id) {
    return res.status(400).json({
      success: false,
      message: "main_service_id and addon_service_id are required",
    });
  }

  if (Number(main_service_id) === Number(addon_service_id)) {
    return res.status(400).json({
      success: false,
      message: "Main service and addon service cannot be same",
    });
  }

  const checkMainServiceQuery = `
    SELECT id, name, service_type
    FROM services
    WHERE id = ?
  `;

  connection.query(
    checkMainServiceQuery,
    [main_service_id],
    (mainErr, mainResult) => {
      if (mainErr) {
        console.error("Error checking main service:", mainErr);
        return res.status(500).json({
          success: false,
          message: "Error checking main service",
        });
      }

      if (mainResult.length === 0) {
        return res.status(404).json({
          success: false,
          message: "Main service not found",
        });
      }

      if (mainResult[0].service_type !== "main") {
        return res.status(400).json({
          success: false,
          message: "Selected main_service_id is not a main service",
        });
      }

      const checkAddonServiceQuery = `
      SELECT id, name, service_type
      FROM services
      WHERE id = ?
    `;

      connection.query(
        checkAddonServiceQuery,
        [addon_service_id],
        (addonErr, addonResult) => {
          if (addonErr) {
            console.error("Error checking addon service:", addonErr);
            return res.status(500).json({
              success: false,
              message: "Error checking addon service",
            });
          }

          if (addonResult.length === 0) {
            return res.status(404).json({
              success: false,
              message: "Addon service not found",
            });
          }

          if (addonResult[0].service_type !== "additional") {
            return res.status(400).json({
              success: false,
              message: "Selected addon_service_id is not an additional service",
            });
          }

          const checkDuplicateQuery = `
        SELECT id
        FROM service_addon
        WHERE main_service_id = ? AND addon_service_id = ?
      `;

          connection.query(
            checkDuplicateQuery,
            [main_service_id, addon_service_id],
            (duplicateErr, duplicateResult) => {
              if (duplicateErr) {
                console.error(
                  "Error checking duplicate mapping:",
                  duplicateErr,
                );
                return res.status(500).json({
                  success: false,
                  message: "Error checking duplicate mapping",
                });
              }

              if (duplicateResult.length > 0) {
                return res.status(400).json({
                  success: false,
                  message:
                    "This addon is already mapped with the selected main service",
                });
              }

              const insertQuery = `
            INSERT INTO service_addon (main_service_id, addon_service_id)
            VALUES (?, ?)
          `;

              connection.query(
                insertQuery,
                [main_service_id, addon_service_id],
                (insertErr, insertResult) => {
                  if (insertErr) {
                    console.error(
                      "Error adding service addon mapping:",
                      insertErr,
                    );
                    return res.status(500).json({
                      success: false,
                      message: "Failed to add service addon mapping",
                    });
                  }

                  return res.status(201).json({
                    success: true,
                    message: "Service addon mapping added successfully",
                    data: {
                      id: insertResult.insertId,
                      main_service_id: Number(main_service_id),
                      main_service_name: mainResult[0].name,
                      addon_service_id: Number(addon_service_id),
                      addon_service_name: addonResult[0].name,
                    },
                  });
                },
              );
            },
          );
        },
      );
    },
  );
}

module.exports = addServiceAddon;
