const express = require("express");
const connection = require("../config/dbconfig");

function removeService(req, res) {
  console.log("Removing service...");

  const { id } = req.body; // Get service ID from request body

  // Validate ID
  if (!id) {
    return res.status(400).json({ error: "Service ID is required" });
  }

  // Check if service exists before deleting
  const checkQuery = `SELECT * FROM services WHERE id = ?`;
  connection.query(checkQuery, [id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: "Service not found" });
    }

    // Delete the service
    const deleteQuery = `DELETE FROM services WHERE id = ?`;
    connection.query(deleteQuery, [id], (deleteErr) => {
      if (deleteErr) {
        console.error("Error deleting service:", deleteErr);
        return res.status(500).json({ error: "Failed to delete service" });
      }

      res.status(200).json({ message: "Service deleted successfully" });
    });
  });
}

module.exports = removeService;
