const multer = require("multer");
const path = require("path");
const fs = require("fs");
const connection = require("../config/dbconfig");

// Ensure upload directory exists
const uploadDir = path.join(__dirname, "../public/uploads");
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

// Multer setup
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => cb(null, Date.now() + "-" + file.originalname),
});

const fileFilter = (req, file, cb) => {
  const allowedTypes = /jpeg|jpg|png|gif/;
  const ext = allowedTypes.test(path.extname(file.originalname).toLowerCase());
  const mime = allowedTypes.test(file.mimetype);

  if (ext && mime) cb(null, true);
  else cb(new Error("Only image files allowed"));
};

const upload = multer({
  storage,
  fileFilter,
  limits: { fileSize: 5 * 1024 * 1024 },
}).single("image_url");

// Controller
function addService(req, res) {
  upload(req, res, function (err) {
    if (err) return res.status(400).json({ error: err.message });

    const {
      name,
      price,
      category_id,
      notes,
      duration_min,
      duration_max,
      performed_by,
      tools_used,
      service_type,
    } = req.body;

    const file = req.file;

    // Validate inputs
    if (!name || !price || !category_id || !notes || !file) {
      return res.status(400).json({
        error: "name, price, category_id, notes & image required",
      });
    }

    const image_url = `/uploads/${file.filename}`;

    // ✅ CLEAN SQL
    const sql = `
      INSERT INTO services 
      (name, price, image_url, category_id, notes, performed_by,
       duration_min, duration_max, tools_used, service_type,
       created_at, modified_at) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())
    `;

    const values = [
      name,
      price,
      image_url,
      category_id,
      notes,
      performed_by || null,
      duration_min || null,
      duration_max || null,
      tools_used || null,
      service_type || null,
    ];

    connection.query(sql, values, (dbErr, result) => {
      if (dbErr) {
        console.error("Database error:", dbErr);
        return res.status(500).json({ error: dbErr.sqlMessage });
      }

      res.status(201).json({
        message: "Service added successfully",
        service_id: result.insertId,
      });
    });
  });
}

module.exports = addService;
