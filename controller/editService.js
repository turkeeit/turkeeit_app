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
  destination: function (req, file, cb) {
    cb(null, uploadDir);
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});
const upload = multer({
  storage,
  limits: { fileSize: 5 * 1024 * 1024 },
}).single("image_url"); // use 'image_url' as the field name

function editService(req, res) {
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      return res.status(400).json({ error: err.message });
    } else if (err) {
      return res.status(400).json({ error: err.message });
    }

    const { id, name, price, category, description } = req.body;

    // Validate required fields
    if (!id || !name || !price || !category || !description) {
      return res.status(400).json({ error: "All fields are required" });
    }

    let parsedDescription;
    try {
      parsedDescription = JSON.parse(description);
    } catch (e) {
      return res.status(400).json({ error: "Invalid JSON in description" });
    }

    // Build dynamic update query
    let query = `
      UPDATE services 
      SET name = ?, price = ?, category = ?, description = ?, modified_at = NOW()`;

    const params = [name, price, category, JSON.stringify(parsedDescription)];

    if (req.file) {
      const imagePath = `/uploads/${req.file.filename}`;
      query += `, image_url = ?`;
      params.push(imagePath);
    }

    query += ` WHERE id = ?`;
    params.push(id);

    connection.query(query, params, (err, result) => {
      if (err) {
        console.error("Error updating service:", err);
        return res.status(500).json({ error: "Database error" });
      }

      if (result.affectedRows === 0) {
        return res.status(404).json({ error: "Service not found" });
      }

      res.status(200).json({ message: "Service updated successfully" });
    });
  });
}

module.exports = editService;
