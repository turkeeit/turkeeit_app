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

const fileFilter = (req, file, cb) => {
  const allowedTypes = /jpeg|jpg|png|gif/;
  const ext = allowedTypes.test(path.extname(file.originalname).toLowerCase());
  const mime = allowedTypes.test(file.mimetype);

  if (ext && mime) {
    cb(null, true);
  } else {
    cb(new Error("Only image files (jpeg, jpg, png, gif) are allowed"));
  }
};

const upload = multer({
  storage,
  fileFilter,
  limits: { fileSize: 5 * 1024 * 1024 }, // 5MB max
}).single("image_url");

// Controller function
function addService(req, res) {
  console.log("add service start....");
  upload(req, res, function (err) {
    if (err instanceof multer.MulterError) {
      console.log(err);
      return res.status(400).json({ error: err.message });
    } else if (err) {
      return res.status(400).json({ error: err.message });
    }

    const { name, price, category, description } = req.body;
    const file = req.file;

    console.log(name);
    console.log(price);
    console.log(category);
    console.log(description);
    console.log(file.filename);

    // Validate inputs
    if (!name || !price || !category || !description || !file) {
      return res
        .status(400)
        .json({ error: "All fields including image are required" });
    }

    let parsedDescription;

    try {
      parsedDescription = JSON.parse(description);
    } catch (e) {
      return res.status(400).json({ error: "Invalid JSON in description" });
    }

    const image_url = `/uploads/${file.filename}`;

    const query = `
      INSERT INTO services (name, price, image_url, category, description, created_at, modified_at) 
      VALUES (?, ?, ?, ?, ?, NOW(), NOW())`;

    connection.query(
      query,
      [name, price, image_url, category, JSON.stringify(parsedDescription)],
      (dbErr, result) => {
        if (dbErr) {
          console.error("Database error:", dbErr);
          return res.status(500).json({ error: "Database error" });
        }

        res.status(201).json({
          message: "Service added successfully",
          service_id: result.insertId,
        });
      }
    );
  });
}

module.exports = addService;
