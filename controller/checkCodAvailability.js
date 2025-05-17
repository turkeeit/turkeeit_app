const express = require("express");
const jwt = require("jsonwebtoken");
require("dotenv").config();
const connection = require("../config/dbconfig");

function checkCodAvailability(req, res) {
  console.log("checking cod avail able ...");
  console.log("Fetching user address...");

  // Get user ID from headers (mobile_number is used as user_id)
  const mobile_number = req.headers.mobile_number;

  if (!mobile_number) {
    return res.status(400).json({ error: "Mobile number is required" });
  }

  const COD_Available = process.env.COD_Available;
  const Online_Available = process.env.Online_Available;

  if (COD_Available) {
    if (Online_Available) {
      res.status(200).json({ cod_available: true, online_available: true });
    } else {
      res.status(200).json({ cod_available: true, online_available: false });
    }
  } else {
    if (Online_Available) {
      res.status(200).json({ cod_available: false, online_available: false });
    } else {
      res.status(200).json({ cod_available: false, online_available: false });
    }
  }
}

module.exports = checkCodAvailability;
