const connection = require("../config/dbconfig");

function getBookedSlots(req, res) {
  connection.query(
    `SELECT order_id,DATE_FORMAT(service_date,'%Y-%m-%d') as service_date, service_time FROM orders`,
    (err, rows) => {
      if (err) {
        console.error("Get booked slots error:", err);
        return res.status(500).json({
          success: false,
          message: "Failed to fetch booked slots",
        });
      }

      return res.status(200).json(rows);
    },
  );
}

module.exports = getBookedSlots;
