const multer = require("multer");
const path = require("path");
const fs = require("fs");
const connection = require("../config/dbconfig");

// ===== UPLOAD SETUP =====
const uploadDir = path.join(__dirname, "../public/uploads");
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => cb(null, Date.now() + "_" + file.originalname),
});

const upload = multer({ storage }).single("image_url");

// =====================================================

function adminEditService(req, res) {
  upload(req, res, function (err) {
    if (err) return res.status(400).json({ error: err.message });

    const {
      id,
      name,
      price,
      category_id,
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

    // ===== SAFE PARSE =====
    let includes = [];
    let excludes = [];
    let addons = [];

    try {
      includes = JSON.parse(service_includes || "[]");
      excludes = JSON.parse(service_excludes || "[]");
      addons = JSON.parse(service_addons || "[]");
    } catch {
      return res.status(400).json({ error: "Invalid JSON" });
    }

    // ===== UPDATE SERVICE =====
    let query = `
      UPDATE services SET
        name=?,
        price=?,
        category_id=?,
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
      category_id,
      notes,
      service_type,
      duration_min,
      duration_max,
      performed_by,
      tools_used,
    ];

    if (req.file) {
      query += `, image_url=?`;
      params.push(`/uploads/${req.file.filename}`);
    }

    query += ` WHERE id=?`;
    params.push(id);

    connection.query(query, params, (err) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: "Service update failed" });
      }

      // ===== INCLUDES =====
      connection.query(
        "DELETE FROM service_includes WHERE service_id=?",
        [id],
        () => {
          if (includes.length) {
            const values = includes.map((i) => [
              id,
              i.icon || "check",
              i.description,
            ]);

            connection.query(
              "INSERT INTO service_includes (service_id,icon,description) VALUES ?",
              [values],
            );
          }
        },
      );

      // ===== EXCLUDES =====
      connection.query(
        "DELETE FROM service_excludes WHERE service_id=?",
        [id],
        () => {
          if (excludes.length) {
            const values = excludes.map((e) => [
              id,
              e.icon || "cross",
              e.description,
            ]);

            connection.query(
              "INSERT INTO service_excludes (service_id,icon,description) VALUES ?",
              [values],
            );
          }
        },
      );

      // ===== ADDONS =====
      connection.query(
        "DELETE FROM service_addon WHERE main_service_id=?",
        [id],
        () => {
          if (addons.length) {
            const values = addons.map((a) => [id, a.addon_service_id]);

            connection.query(
              "INSERT INTO service_addon (main_service_id,addon_service_id) VALUES ?",
              [values],
            );
          }
        },
      );

      res.json({ message: "Service updated successfully" });
    });
  });
}

module.exports = adminEditService;
