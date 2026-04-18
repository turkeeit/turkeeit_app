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
    duration_min,
    duration_max,
    performed_by,
    tools_used,
  ];

  if (image_url) {
    query += `, image_url=?`;
    params.push(image_url);
  }

  query += ` WHERE id=?`;
  params.push(id);

  connection.query(query, params, (err) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Service update failed" });
    }

    // update includes
    connection.query(
      "DELETE FROM service_includes WHERE service_id=?",
      [id],
      () => {
        if (includes.length) {
          const values = includes.map((item) => [id, null, item]);

          connection.query(
            "INSERT INTO service_includes (service_id, icon, description) VALUES ?",
            [values],
          );
        }
      },
    );

    // update excludes
    connection.query(
      "DELETE FROM service_excludes WHERE service_id=?",
      [id],
      () => {
        if (excludes.length) {
          const values = excludes.map((item) => [id, null, item]);

          connection.query(
            "INSERT INTO service_excludes (service_id, icon, description) VALUES ?",
            [values],
          );
        }
      },
    );

    // update addons
    connection.query(
      "DELETE FROM service_addon WHERE main_service_id=?",
      [id],
      () => {
        if (addons.length) {
          const values = addons.map((item) => [id, item.addon_service_id]);

          connection.query(
            "INSERT INTO service_addon (main_service_id, addon_service_id) VALUES ?",
            [values],
          );
        }
      },
    );

    return res.json({ message: "Service updated successfully" });
  });
}

module.exports = adminEditService;
