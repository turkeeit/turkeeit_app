require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const twilio = require("twilio");
const VerifyJWT = require("./middlewares/verifyJWT");
const userRegister = require("./controller/userRegister");
const getUserDetails = require("./controller/getUserDetails");
const addAddress = require("./controller/addAddress");
const editAddress = require("./controller/editAddress");
const getAddress = require("./controller/getAddresses");
const removeAddress = require("./controller/deleteAddress");
const addService = require("./controller/addService");
const editService = require("./controller/editService");
const getServiceDetails = require("./controller/getServiceDetails");
const removeService = require("./controller/removeService");
const getAllServices = require("./controller/getAllServices");
const createOrder = require("./controller/createOrder");
const getOrderDetails = require("./controller/getOrderDetails");
const addToCart = require("./controller/addToCart");
const editCartItem = require("./controller/editCart");
const removeCartItem = require("./controller/removeCartItem");
const getCartItems = require("./controller/getAllCartItems");
const connection = require("./config/dbconfig");
const loginController = require("./controller/loginController");
const verifyToken = require("./controller/VerifyJWTToken");
const createRazorPayOrder = require("./controller/createRazorPayOrder");
const verifyRazorpaySignature = require("./controller/verifyRazorpaySignature");
const updateOrderStatus = require("./controller/updateOrderStatus");
const removeAllCartItem = require("./controller/removeAllCartItem");
const getAllOrders = require("./controller/getAllOrders");
const updateUserDetails = require("./controller/updateUserDetails");
const getRazorpayKey = require("./controller/getRazorpayKey");
const axios = require("axios");
const path = require("path");
const checkCodAvailability = require("./controller/checkCodAvailability");
const partnerLoginController = require("./controller/partnerLoginController");
const getPartnerOrders = require("./controller/getPartnerOrders");
const getAllUsers = require("./controller/getAllUsers");
const editUser = require("./controller/editUser");
const removeOrder = require("./controller/removeOrder");
const getPaymentList = require("./controller/getPaymentList");
const loginPartnerController = require("./controller/loginPartnerController");
const editPartnerDetails = require("./controller/editPartnerDetails");
const getAllPartners = require("./controller/getAllPartners");
const getPartnerDetails = require("./controller/getPartnerDetails");
const VerifyPartnerJWT = require("./middlewares/verifyPartnerJWT");
const getAllOrdersAdmin = require("./controller/getAllOrdersAdmin");
const getAllUsersAdmin = require("./controller/getAllUsersAdmin");
const addPartner = require("./controller/addPartner");
const assignPartnerToOrder = require("./controller/assignPartnerToOrder");
const getAllPartnerOrder = require("./controller/getAllPartnerOrder");
const createUserByAdmin = require("./controller/createUserByAdmin");
const removeUserByAdmin = require("./controller/removeUserByAdmin");
const removePartnerByAdmin = require("./controller/removePartnerByAdmin");
const removePartnerOrderByAdmin = require("./controller/removePartnerOrderByAdmin");
const getDetailsPartnerOrderByAdmin = require("./controller/getDetailsPartnerOrderByAdmin");

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());
app.use("/uploads", express.static(path.join(__dirname, "public/uploads")));

// Twilio credentials from .env file
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const twilioPhone = process.env.TWILIO_PHONE;
const client = new twilio(accountSid, authToken);

let otpStorage = {}; // Store OTPs temporarily (use a DB in production)

// 📌 Send OTP API
app.post("/api/sendOtp", async (req, res) => {
  console.log(req.headers)
  const mobile_number = req.headers.mobile_number;
  console.log(req.headers);
  console.log(mobile_number);
  const otp = Math.floor(100000 + Math.random() * 900000); // Generate 6-digit OTP
  console.log(`otp is`, otp);
  let expiration_time = Date.now() + 5 * 60 * 1000;
  console.log(`expiration time is `, expiration_time);
  let is_used = "false";

  try {
    // const message = await client.messages.create({
    //   body: `Your OTP is: ${otp}`,
    //   from: process.env.TWILIO_PHONE_NUMBER,
    //   to: "+91" + mobile_number,
    // });

    // const message = await sendOtp(mobile_number, otp);
    const message = { data: "true" };
    if (message && message.data) {
      let query = `insert into user_otps(user_id,otp_code,expiration_time,is_used) values(${mobile_number},${otp},${expiration_time},${is_used})`;
      await connection.query(query, function (err, results) {
        if (err) {
          console.log(`error in execution of query`, err);
          return;
        }
        console.log("otp is inserted with id", results);
        res.status(200).json({ message: "OTP sent successfully!" });
      });
    }
  } catch (error) {
    res
      .status(500)
      .json({ error: "Failed to send OTP", details: error.message });
  }
});

async function sendOtp(mobileNumber, otp) {
  const message = `Your OTP is ${otp}. Do not share it.`;
  console.log("send otp ");
  try {
    const response = await axios.get("https://www.fast2sms.com/dev/bulkV2", {
      params: {
        authorization:
          "x3URC5j9bXPEcOW7yZzIlM2uHiBSv8fmkwG0rgtKhNA4qFpLQ1nkJuqtYfc7rZRsMpyI9vWAx54adPSK",
        sender_id: "FSTSMS",
        message: message,
        language: "english",
        route: "q",
        numbers: mobileNumber,
      },
      headers: {
        "cache-control": "no-cache",
      },
    });

    console.log(response.data);
    return response;
  } catch (error) {
    console.error("Error sending OTP:", error.response?.data || error.message);
    return null;
  }
}

// 📌 Verify OTP API
app.post(
  "/api/verifyOtp",
  async (req, res, next) => {
    console.log(req.headers);
    const otp = req.headers.otp;
    console.log("otp", otp);
    const mobile_number = req.headers.mobile_number;

    let storedOtp;
    //get otp from database;

    let query = `select otp_code from user_otps where user_id=${mobile_number} order by created_at desc`;
    await connection.query(query, function (err, results) {
      if (err) {
        console.log("error in query execution", err);
        return;
      }
      console.log("select query executed", results[0].otp_code);
      storedOtp = results[0].otp_code;
      console.log("storeOtp", storedOtp);
      if (storedOtp && storedOtp == otp) {
        next();
      } else {
        res.status(400).json({ message: "Invalid or expired OTP" });
      }
    });
  },
  loginController
);

app.post("/api/user/register", VerifyJWT, userRegister);
app.get("/api/getUserDetails", VerifyJWT, getUserDetails);
app.post("/api/addAddress", VerifyJWT, addAddress);
app.put("/api/editAddress", VerifyJWT, editAddress);
app.get("/api/getAddress", VerifyJWT, getAddress);
app.delete("/api/removeAddress", VerifyJWT, removeAddress);
app.post("/api/addService", VerifyJWT, addService);
app.put("/api/editService", VerifyJWT, editService);
app.get("/api/getServiceDetails",  getServiceDetails);
app.delete("/api/removeService", VerifyJWT, removeService);
app.get("/api/getAllServices",  getAllServices);
app.post("/api/createOrder", VerifyJWT, createOrder);
app.get("/api/getOrderDetails", VerifyJWT, getOrderDetails);
app.post("/api/addToCart", VerifyJWT, addToCart);
app.put("/api/editCartItem", VerifyJWT, editCartItem);
app.delete("/api/removeCartItem", VerifyJWT, removeCartItem);
app.get("/api/getCartItem", VerifyJWT, getCartItems);
app.post("/api/verifyToken", verifyToken);
app.post("/api/create-order", createRazorPayOrder);
app.post("/verify-signature", verifyRazorpaySignature);
app.put("/api/updateOrderStatus", VerifyJWT, updateOrderStatus);
app.delete("/api/removeAllCartItem", VerifyJWT, removeAllCartItem);
app.get("/api/getAllOrders", VerifyJWT, getAllOrders);
app.put("/api/updateUserDetails", VerifyJWT, updateUserDetails);
app.get("/api/getRazorpayKey", VerifyJWT, getRazorpayKey);
app.get("/api/checkCodAvailability", VerifyJWT, checkCodAvailability);

// partner app routes
app.get("/api/getAllUsers", VerifyJWT, getAllUsers);
app.put("/api/editUser", VerifyJWT, editUser);
app.delete("/api/removeOrder", VerifyJWT, removeOrder);

//partner routes
app.post(
  "/api/partner/verifyOtp",
  async (req, res, next) => {
    console.log(req.headers);
    const otp = req.headers.otp;
    console.log("otp", otp);
    const mobile_number = req.headers.mobile_number;

    let storedOtp;
    //get otp from database;

    let query = `select otp_code from user_otps where user_id=${mobile_number} order by created_at desc`;
    await connection.query(query, function (err, results) {
      if (err) {
        console.log("error in query execution", err);
        return;
      }
      console.log("select query executed", results[0].otp_code);
      storedOtp = results[0].otp_code;
      console.log("storeOtp", storedOtp);
      if (storedOtp && storedOtp == otp) {
        next();
      } else {
        res.status(400).json({ message: "Invalid or expired OTP" });
      }
    });
  },
  loginPartnerController
);
app.put("/api/partner/update", VerifyPartnerJWT, editPartnerDetails);
app.get("/api/partner/getPartnerDetails", VerifyPartnerJWT, getPartnerDetails);

//admin routes

//user routes
app.get("/api/admin/getAllUsers", getAllUsersAdmin);
app.put("/api/admin/editUser", editUser);
app.post("/api/admin/addUser", createUserByAdmin);
app.delete("/api/admin/removeUser", removeUserByAdmin);
app.get("/api/admin/getUserDetails", getUserDetails);

//service routes
app.get("/api/admin/getAllServices", getAllServices);
app.post("/api/admin/addService", addService);
app.put("/api/admin/editService", editService);
app.delete("/api/admin/removeService", removeService);
app.get("/api/admin/getServiceDetails", getServiceDetails);

//order routes
app.get("/api/admin/getAllOrders", getAllOrdersAdmin);
app.delete("/api/admin/removeOrder", removeOrder);
app.post("/api/admin/partner/assinged/order", assignPartnerToOrder);
app.get("/api/admin/getOrderDetails", getOrderDetails);

//partner routes
app.get("/api/admin/partner/list", getAllPartners);
app.post("/api/admin/partner/add", addPartner);
app.put("/api/admin/updatePartner", editPartnerDetails);
app.delete("/api/admin/removePartner", removePartnerByAdmin);
app.get("/api/admin/getPartnerDetails", getPartnerDetails);

//partner orders
app.get("/api/admin/partner/assinged/getAllOrders", getAllPartnerOrder);
app.get("/api/admin/getPartnerOrderDetails", getDetailsPartnerOrderByAdmin);
app.get("/api/admin/partner/removePartnerOrder", removePartnerOrderByAdmin);
app.get("/api/admin/getPaymentList", getPaymentList);

//blog page
 app.get("/api/blogs", (req, res) => {
 console.log("-- blog details--");
  connection.query(
    "SELECT id, title, description, content, city, slug FROM blogs ORDER BY created_at DESC",
    (err, result) => {
      if (err){ 
             console.log(err);
	      return res.status(500).send(err);}
     console.log("-- blog result--");
     console.log(result);
      res.json(result);
    }
  );
});


app.get("/api/blogs/:id", (req, res) => {
	  const { id } = req.params;
	  connection.query(
		      "SELECT * FROM blogs WHERE id = ?",
		      [id],
		      (err, result) => {
			            if (err) return res.status(500).send(err);
			            if (result.length === 0) return res.status(404).json({ message: "Blog not found" });
			            res.json(result[0]);
			          }
		    );
});
// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT,  () => console.log(`Server running on port ${PORT}`));
