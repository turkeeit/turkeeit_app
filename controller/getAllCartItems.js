const connection = require("../config/dbconfig");

function getCartItems(req, res) {
  console.log("Fetching cart items...");

  const user_id = req.headers.mobile_number; // Get user_id from headers
  console.log("Received user_id:", user_id); // Debug log

  if (!user_id) {
    return res.status(400).json({ error: "user_id is required" });
  }

  const selectQuery = `SELECT * FROM cart WHERE user_id='${user_id}'`; // Ensure it's treated as a string

  connection.query(selectQuery, (err, results) => {
    if (err) {
      console.error("Error fetching cart items:", err);
      return res.status(500).json({ error: "Error fetching cart items" });
    }

    console.log("Cart items fetched:", results); // Debug log

    return res.status(200).json({ cart_items: results });
  });
}

module.exports = getCartItems;
