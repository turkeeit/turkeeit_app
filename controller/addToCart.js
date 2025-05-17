const express = require("express");
const connection = require("../config/dbconfig");

function addToCart(req, res) {
  console.log("Adding to cart...");
  const user_id = req.headers.mobile_number;
  const { name, price, image_url, quantity, service_id } = req.body;

  if (!name || !price || !image_url || !user_id || !service_id) {
    return res.status(400).json({
      error:
        "user_id, name, price, image_url, quantity and service_id are required",
    });
  }

  // Check if the service is already in the cart
  const checkQuery = `SELECT * FROM cart WHERE user_id = ? AND service_id = ?`;

  connection.query(checkQuery, [user_id, service_id], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Database error" });
    }

    if (results.length > 0) {
      // If service exists, update quantity
      const updateQuery = `
        UPDATE cart 
        SET quantity = quantity + ?, modified_at = NOW() 
        WHERE user_id = ? AND service_id = ?
      `;

      connection.query(updateQuery, [quantity, user_id, service_id], (err) => {
        if (err) {
          console.error("Error updating cart:", err);
          return res.status(500).json({ error: "Error updating cart" });
        }

        // Return the updated item
        const getUpdatedQuery = `SELECT * FROM cart WHERE user_id = ? AND service_id = ?`;
        connection.query(
          getUpdatedQuery,
          [user_id, service_id],
          (err, updatedRows) => {
            if (err) {
              return res
                .status(500)
                .json({ error: "Error fetching updated cart item" });
            }

            return res.status(200).json({
              message: "Cart updated successfully",
              cartItem: updatedRows[0],
            });
          }
        );
      });
    } else {
      // Insert new cart item
      const insertQuery = `
        INSERT INTO cart (user_id, service_id, name, price, image_url, quantity)
        VALUES (?, ?, ?, ?, ?, ?)
      `;

      connection.query(
        insertQuery,
        [user_id, service_id, name, price, image_url, quantity],
        (err, result) => {
          if (err) {
            console.error("Error adding to cart:", err);
            return res.status(500).json({ error: "Error adding to cart" });
          }

          const insertedId = result.insertId;

          // Now fetch the inserted item
          const selectQuery = `SELECT * FROM cart WHERE id = ?`;

          connection.query(selectQuery, [insertedId], (err, insertedRows) => {
            if (err || insertedRows.length === 0) {
              return res
                .status(500)
                .json({ error: "Error retrieving inserted cart item" });
            }

            return res.status(200).json({
              message: "Service added to cart successfully",
              cartItem: insertedRows[0],
            });
          });
        }
      );
    }
  });
}

module.exports = addToCart;
