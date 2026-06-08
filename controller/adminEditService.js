const connection = require("../config/dbconfig");

function adminEditService(req, res) {
  const {
    id,
    name,
    price,
    subcategory_id,
    image_url,
    notes,
    service_type,
    duration_min,
    duration_max,
    performed_by,
    tools_used,
    service_includes,
    service_excludes,
    service_addons,
  } = req.body;

  if (!id || !name) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  let includes = [];
  let excludes = [];
  let addons = [];

  try {
    includes = Array.isArray(service_includes)
      ? service_includes
      : JSON.parse(service_includes || "[]");

    excludes = Array.isArray(service_excludes)
      ? service_excludes
      : JSON.parse(service_excludes || "[]");

    addons = Array.isArray(service_addons)
      ? service_addons
      : JSON.parse(service_addons || "[]");
  } catch {
    return res.status(400).json({ error: "Invalid JSON" });
  }

  let query = `
    UPDATE services SET
      name=?,
      price=?,
      subcategory_id=?,
      notes=?,
      service_type=?,
      duration_min=?,
      duration_max=?,
      performed_by=?,
      tools_used=?,
      modified_at=NOW()
  `;

  const params = [
    name,
    price,
    subcategory_id,
    notes,
    service_type,
    duration_min || null,
    duration_max || null,
    performed_by || null,
    tools_used || null,
  ];

  if (image_url) {
    query += `, image_url=?`;
    params.push(image_url);
  }

  query += ` WHERE id=?`;
  params.push(id);

  // ================= UPDATE SERVICE =================

  connection.query(query, params, (err) => {
    if (err) {
      console.error(err);

      return res.status(500).json({
        error: "Service update failed",
      });
    }

    // ================= DELETE OLD INCLUDES =================

    connection.query(
      "DELETE FROM service_includes WHERE service_id=?",
      [id],
      (includeDeleteErr) => {
        if (includeDeleteErr) {
          console.error(includeDeleteErr);

          return res.status(500).json({
            error: "Failed to delete service includes",
          });
        }

        // ================= INSERT NEW INCLUDES =================

        if (includes.length > 0) {
          const includeValues = includes.map((item) => [id, 'check', item]);

          connection.query(
            `
              INSERT INTO service_includes
              (
                service_id,
                icon,
                description
              )
              VALUES ?
            `,
            [includeValues],
            (includeInsertErr) => {
              if (includeInsertErr) {
                console.error(includeInsertErr);
              }
            },
          );
        }
      },
    );

    // ================= DELETE OLD EXCLUDES =================

    connection.query(
      "DELETE FROM service_excludes WHERE service_id=?",
      [id],
      (excludeDeleteErr) => {
        if (excludeDeleteErr) {
          console.error(excludeDeleteErr);

          return res.status(500).json({
            error: "Failed to delete service excludes",
          });
        }

        // ================= INSERT NEW EXCLUDES =================

        if (excludes.length > 0) {
          const excludeValues = excludes.map((item) => [id, 'check', item]);

          connection.query(
            `
              INSERT INTO service_excludes
              (
                service_id,
                icon,
                description
              )
              VALUES ?
            `,
            [excludeValues],
            (excludeInsertErr) => {
              if (excludeInsertErr) {
                console.error(excludeInsertErr);
              }
            },
          );
        }
      },
    );

    // ================= DELETE OLD ADDONS =================

    connection.query(
      "DELETE FROM service_addon WHERE main_service_id=?",
      [id],
      (addonDeleteErr) => {
        if (addonDeleteErr) {
          console.error(addonDeleteErr);

          return res.status(500).json({
            error: "Failed to delete service addons",
          });
        }

        // ================= INSERT NEW ADDONS =================

        if (addons.length > 0) {
          const addonValues = addons.map((item) => [id, item.addon_service_id]);

          connection.query(
            `
              INSERT INTO service_addon
              (
                main_service_id,
                addon_service_id
              )
              VALUES ?
            `,
            [addonValues],
            (addonInsertErr) => {
              if (addonInsertErr) {
                console.error(addonInsertErr);
              }
            },
          );
        }
      },
    );

    return res.json({
      success: true,
      message: "Service updated successfully",
    });
  });
}

module.exports = adminEditService;
