-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 18, 2026 at 08:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turkeeit`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `flat_no` varchar(256) NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `area_name` varchar(256) NOT NULL,
  `landmark` varchar(256) NOT NULL,
  `city` varchar(256) NOT NULL,
  `state` varchar(256) NOT NULL,
  `pincode` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `flat_no`, `building_name`, `area_name`, `landmark`, `city`, `state`, `pincode`, `created_at`, `modified_at`) VALUES
(5, '9595454565', '101', 'Sai Residency', 'College Road', 'Near City Center Mall', 'Nashik', 'Maharashtra', '422005', '2026-03-13 18:07:59', '2026-04-17 18:52:38'),
(6, '9448889820', '88888', 'Sai Residency', 'Dombivli East', 'Near Railway Station', 'Mumbai', 'Maharashtra', '421201', '2026-03-15 11:41:00', '2026-03-15 11:41:32'),
(9, '9595889595', '1111', 'Nayra Residency', 'Kothrud', 'Near Metro', 'Pune', 'Maharashtra', '411038', '2026-03-19 13:17:09', '2026-03-19 13:17:09'),
(10, '8282646400', '5656', 'Om Residency', 'Dombivli East', 'Near Railway Station', 'Mumbai', 'Maharashtra', '421201', '2026-03-20 12:33:59', '2026-03-20 12:33:59'),
(11, '6565653333', '6010', 'Arjun Residancy', 'Dombivli East', 'Near Metro', 'Mumbai', 'Maharashtra', '421201', '2026-03-20 12:41:00', '2026-03-20 12:41:00'),
(12, '7878789898', '61188', 'Arjun Residancy', 'Dombivli East', 'Near Metro', 'Mumbai', 'Maharashtra', '421201', '2026-03-20 13:23:23', '2026-03-27 11:06:35'),
(13, '7878789898', '61188', 'Arjun Residancy', 'Dombivli East', 'Near Metro', 'Mumbai', 'Maharashtra', '421201', '2026-03-27 11:04:04', '2026-03-27 11:06:35'),
(14, '9845414750', '4444', 'Niya Residency', 'Hinjewadi', 'Near Metro Station', 'Pune', 'Maharashtra', '411038', '2026-03-27 11:40:09', '2026-03-27 11:40:09'),
(15, '9874459650', '', '', '', '', '', '', '', '2026-03-27 12:13:49', '2026-03-27 12:26:19'),
(16, '9874459650', '', '', '', '', '', '', '', '2026-03-27 12:23:36', '2026-03-27 12:26:19'),
(17, '9874459650', '', '', '', '', '', '', '', '2026-03-27 12:25:02', '2026-03-27 12:26:19'),
(18, '9874459650', '', '', '', '', '', '', '', '2026-03-27 12:38:10', '2026-03-27 12:40:58'),
(19, '9874459650', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '2026-03-27 12:47:56', '2026-03-27 12:47:56'),
(20, '8584878900', '3000', 'Daya Estate', 'Bahubali', 'Near Water Tank', 'Banglore', 'Karnatka', '123456', '2026-03-27 13:10:37', '2026-03-27 13:12:24'),
(21, '9999899998', '34444', 'Datta Krupa', 'Vijay Nagar', 'Near Water Tank', 'Pune', 'Maharashtra', '410001', '2026-03-27 13:24:01', '2026-03-27 13:45:21'),
(22, '6546541111', '5006', 'Brinda Residency', 'Indira Nagar', 'Near Eden Garden', 'Banglore', 'Karnatka', '410001', '2026-03-27 20:22:18', '2026-03-27 20:22:18'),
(23, '9000010000', '1011', 'Ravi Residency', 'Vijay Nagar', 'Near Metro Station', 'Mumbai', 'Maharashtra', '415412', '2026-03-27 22:05:08', '2026-03-27 22:05:08'),
(24, '8888884444', 'F514', 'Radha Residency', 'Vijay Nagar', 'Near Eden Garden', 'Pune', 'Maharastra', '411111', '2026-03-28 08:23:46', '2026-03-29 10:12:54'),
(25, '8568585885', 'H5410', 'ShivShakti Residency', 'Indira Nagar', 'Near Ahilya School', 'Banglore', 'Karnatka', '413000', '2026-03-29 10:18:46', '2026-03-29 10:18:46'),
(26, '7777777888', 'D0012', 'Siya Estate', 'kothrud', 'Near water tank', 'Pune', 'Maharashtra', '410003', '2026-03-29 13:28:35', '2026-03-29 13:28:35'),
(27, '6555555555', 'G4545', 'Radha Residency', 'Hinjewadi', 'Near Bus Stand', 'Pune', 'Maharashtra', '413251', '2026-03-29 13:38:13', '2026-03-29 13:38:13'),
(28, '7000000001', 'G0122', 'Ravi Estates', 'Reddy Colony', 'Near Hasarat Ganj', 'Pune', 'Maharashtra', '410001', '2026-04-03 06:36:00', '2026-04-03 06:36:00'),
(29, '9000000001', 'G501', 'Roy Estates', 'Reddy Colony', 'Near Airport', 'Mumbai', 'Maharashtra', '411004', '2026-04-03 07:37:26', '2026-04-03 07:37:26'),
(30, '9021954403', 'G505', 'Kailas Properties', 'Nalanda Colony', 'Near Water park', 'Mumbai', 'Maharashtra', '410045', '2026-04-03 18:34:54', '2026-04-03 18:34:54'),
(31, '9000000002', 'G124', 'Shriya Estate', 'Reddy colony', 'Near Airport', 'Mumbai', 'Maharashtra', '410089', '2026-04-04 07:41:23', '2026-04-04 07:41:23'),
(32, '9025252120', 'F890', 'radha estate', 'shivaji colony', 'near bus stan', 'mumbai', 'maharashtra', '413256', '2026-04-04 08:41:34', '2026-04-04 09:31:26'),
(33, '7575752525', 'GC412', 'ABC', 'XYZ', 'NEAR PQR', 'MUMBAI', 'MAHARASHTRA', '412356', '2026-04-09 05:48:42', '2026-04-09 05:50:47'),
(34, '9639639630', 'M789', 'Aastha Properties', 'ravi nagar', 'near metro', 'banglore', 'karnatka', '410001', '2026-04-12 09:12:45', '2026-04-12 09:12:45'),
(35, '8523852300', 'f349', 'Aaradhya Properties', 'Chand Minar', 'Near Hajrat ganj', 'Banglore', 'Karnatka', '410011', '2026-04-13 07:35:10', '2026-04-13 07:35:10'),
(36, '8787878787', 'G342', 'Akanksha Estates', 'Vrinda Colony', 'Near Eaden Garden', 'Mumbai', 'Maharashtra', '412516', '2026-04-13 07:47:50', '2026-04-13 07:47:50'),
(37, '6126126120', 'G555', 'Yogita Residency', 'Kullur Colony', 'Near Govrt. Hospital', 'Mumbai', 'Maharashtra', '410003', '2026-04-13 09:26:00', '2026-04-13 09:26:00'),
(38, '9021902100', 'G6664', 'Krishna Residency', 'Mathura Colony', 'Near Gokul Dham Society', 'Mumbai', 'Maharahstra', '412314', '2026-04-13 12:02:29', '2026-04-13 12:02:29'),
(39, '9797979700', '111', 'Sai Residency', 'College Road', 'Near City Center Mall', 'Nashik', 'Maharashtra', '422005', '2026-04-17 19:00:44', '2026-04-17 19:00:44'),
(40, '9876543210', '111', 'Sainath Residency', 'Madhapur', 'Near Metro Station', 'Hyderabad', 'Telangana', '500081', '2026-04-18 08:40:01', '2026-04-18 17:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `content` longtext NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `description`, `content`, `city`, `area`, `category`, `slug`, `created_at`) VALUES
(1, 'How to Find a Reliable Plumber', 'Tips to choose trusted plumbing professionals', '\n\nAlways check ratings, verification, pricing, and warranty before booking.\n\n', 'Bangalore', 'HSR Layout', 'Plumbing', 'bangalore-hsr-plumber-guide', '2025-12-24 02:10:00'),
(2, 'Best Cleaning Services in Dombivli | Turkeeit Home Services', 'Top-rated 1BHK to 4BHK home deep cleaning, sofa & mattress cleaning experts in Dombivli East & West', '\\\"\nTurkeeit Home Services provides trusted and professional home deep cleaning in Dombivli. We specialize in 1BHK to 4BHK residential cleaning, sofa and mattress deep cleaning, kitchen platform cleaning, bathroom tile scrubbing, stain removal, ceiling and wall dust removal, slab and floor deep cleaning, and full home sanitization using safe and eco-friendly products.\n\nDombivli East · Dombivli West · Lodha Palava · MIDC · Manpada · Nilje · Shilphata Road · Kalyan-Dombivli belt\n\n📞 Call: 9867315361 | 🌐 Website: turkeeit.info\n\nOur cleaning process covers floor mopping, wall dusting, ceiling cobweb removal, slab scrubbing, kitchen degreasing, bathroom descaling, sofa shampooing, mattress vacuuming, stain removal, drain cleaning, switch board sanitization, and cupboard outer cleaning for a complete home refresh.\n\nWe are one of the highest-rated home cleaning providers in the Mumbai suburbs with real transformation results, fast service, and residential-focused cleaning solutions.\n\nIf you want a professional, trusted, affordable, and result-driven home cleaning service in Dombivli, Turkeeit Home Services is the best choice. We clean homes like they\'re our own!... \\\"', 'mumbai', 'Dombivli', 'Cleaning', 'best-cleaning-services-dombivli', '2025-12-24 02:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `service_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `service_id`, `name`, `price`, `image_url`, `quantity`, `created_at`, `modified_at`) VALUES
(5, '9595889595', 1, '2BHK Deep Cleaning', 4200, 'uploads/1bhk-deep-cleaning.jpeg', 1, '2026-03-19 13:13:20', '2026-03-19 13:13:20'),
(6, '7878789898', 2, '2BHK Deep Cleaning', 4200, 'uploads/1bhk-deep-cleaning.jpeg', 2, '2026-03-23 11:10:11', '2026-03-25 17:57:42'),
(20, '8528528520', 1, '1BHK Deep Cleaning', 3200, '/uploads/1bhk-deep-cleaning.jpeg', 1, '2026-03-25 20:24:32', '2026-03-25 20:24:32'),
(32, '9999899998', 30, 'Pigeon Net Installation', 20, '/uploads/pigeon-net-installation.jpeg', 2, '2026-03-26 15:08:05', '2026-03-26 15:20:27'),
(34, '9999899998', 1, '1BHK Deep Cleaning', 3200, '/uploads/1bhk-deep-cleaning.jpeg', 1, '2026-03-27 18:30:47', '2026-03-27 18:30:47'),
(35, '9999899998', 3, 'Fan Repair', 150, '/uploads/fan-repair.jpeg', 1, '2026-03-27 19:48:17', '2026-03-27 19:48:17'),
(36, '6546541111', 1, '1BHK Deep Cleaning', 3200, '/uploads/1bhk-deep-cleaning.jpeg', 1, '2026-03-27 20:19:43', '2026-03-27 21:13:41'),
(37, '6546541111', 30, 'Pigeon Net Installation', 20, '/uploads/pigeon-net-installation.jpeg', 2, '2026-03-27 20:19:46', '2026-03-27 20:20:27'),
(38, '6546541111', 13, 'Tap (Nal) Repair/Replacement', 200, '/uploads/nul-tap-repair-basin-bathroom.jpeg', 1, '2026-03-27 20:23:37', '2026-03-27 20:23:37'),
(40, '9000010000', 25, 'Fan Installation', 100, '/uploads/fan-installation.jpeg', 1, '2026-03-27 22:03:47', '2026-03-27 22:03:47'),
(43, '9000010000', 5, '3BHK Deep Cleaning', 5200, '/uploads/1bhk-deep-cleaning.jpeg', 1, '2026-03-28 05:45:56', '2026-03-28 05:45:56'),
(45, '9000010000', 15, 'Normal Bath Shower Repair/Installation', 200, '/uploads/normal-bathroom-shower-repair2.jpeg', 1, '2026-03-28 06:23:09', '2026-03-28 06:23:09'),
(46, '9000010000', 22, 'Switch & Socket Repair/Replacement', 100, '/uploads/socket-repair.jpeg', 1, '2026-03-28 06:24:52', '2026-03-28 06:24:52'),
(47, '9000010000', 31, 'Mosquito Net Installation', 20, '/uploads/mosquito-net-installation.jpeg', 1, '2026-03-28 06:32:32', '2026-03-28 06:32:32'),
(49, '9000010000', 12, 'Kitchen Cabinates (5 to 10)', 699, '/uploads/maxresdefault.jpg', 1, '2026-03-28 08:03:03', '2026-03-28 08:03:03'),
(56, '8888884444', 13, 'Tap (Nal) Repair/Replacement', 200, '/uploads/nul-tap-repair-basin-bathroom.jpeg', 2, '2026-03-28 08:29:01', '2026-03-28 08:29:04'),
(57, '8888884444', 15, 'Normal Bath Shower Repair/Installation', 200, '/uploads/normal-bathroom-shower-repair2.jpeg', 3, '2026-03-28 08:31:13', '2026-03-28 08:31:21'),
(58, '8888884444', 10, 'Bathroom Deep Cleaning', 499, '/uploads/bathroom-clean-with-machin.jpeg', 1, '2026-03-28 10:21:19', '2026-03-28 10:21:19'),
(62, '8888884444', 3, 'Fan Repair', 150, '/uploads/fan-repair.jpeg', 1, '2026-03-28 12:34:13', '2026-03-28 12:34:13'),
(63, '8888884444', 20, 'Toilet Flush Repair/Installation', 200, '/uploads/toilet-flush-jetsprey-repair-installation.jpeg', 1, '2026-03-28 14:22:45', '2026-03-28 14:22:45'),
(66, '8888884444', 14, 'Shower Mix Tap Installation/Repair', 400, '/uploads/mix-tap-shower-repair.jpeg', 1, '2026-03-28 15:40:49', '2026-03-28 15:40:49'),
(67, '8888884444', 29, 'MCB Fault Repair', 200, '/uploads/mcb-fault-repairing.jpeg', 1, '2026-03-28 15:52:34', '2026-03-28 15:52:34'),
(68, '8888884444', 1, '1BHK Deep Cleaning', 3200, '/uploads/1bhk-deep-cleaning.jpeg', 1, '2026-03-28 16:52:13', '2026-03-28 16:52:13'),
(69, '8888884444', 18, 'Washbasin Blockage Removal', 200, '/uploads/basin-leakage-repair-heavy-work.jpeg', 1, '2026-03-28 17:19:40', '2026-03-28 17:19:40'),
(70, '8888884444', 31, 'Mosquito Net Installation', 20, '/uploads/mosquito-net-installation.jpeg', 1, '2026-03-28 18:07:33', '2026-03-28 18:07:33'),
(71, '8888884444', 21, 'Toilet Jet Spray, Tap, Pressure Gun Repair\r\n', 150, '/uploads/toilet-flush-jetsprey-repair-installation.jpeg', 1, '2026-03-29 08:35:49', '2026-03-29 08:35:49'),
(80, '6555555555', 17, 'Washbasin Leakage Repair', 200, '/uploads/basin-leakage-repair-heavy-work.jpeg', 1, '2026-03-29 13:38:27', '2026-03-29 13:38:27'),
(99, '9025252120', 22, 'Switch & Socket Repair/Replacement', 100, '/uploads/socket-repair.jpeg', 1, '2026-04-05 18:23:11', '2026-04-05 18:23:11'),
(105, '9639639630', 29, 'MCB Fault Repair', 200, '/uploads/mcb-fault-repairing.jpeg', 1, '2026-04-12 09:39:45', '2026-04-12 09:39:45'),
(115, '6126126120', 26, 'Tube light Installation', 100, '/uploads/tubelight-installation.jpeg', 2, '2026-04-13 10:07:52', '2026-04-13 10:07:56'),
(117, '9021902100', 25, 'Fan Installation', 100, '/uploads/fan-installation.jpeg', 1, '2026-04-13 12:02:36', '2026-04-13 12:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `modified_at`) VALUES
(1, 'Cleaning', '2026-03-15 07:36:44', '2026-03-26 12:34:00'),
(2, 'Plumbing', '2026-03-15 07:37:28', '2026-03-26 09:23:18'),
(3, 'Electrical', '2026-03-15 07:39:18', '2026-03-26 13:14:42'),
(4, 'AC Service', '2026-03-15 07:43:26', '2026-03-26 09:13:14'),
(5, 'Waterpurifier', '2026-03-15 07:43:49', '2026-03-20 14:49:09'),
(6, 'Carpenter', '2026-03-15 07:43:59', '2026-03-20 14:49:09'),
(7, 'Net Installation ', '2026-03-20 14:48:01', '2026-03-21 16:10:43'),
(8, 'Commercial Cleaning', '2026-04-17 16:42:22', '2026-04-17 16:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_price` int(11) NOT NULL,
  `address` text NOT NULL,
  `payment_id` varchar(256) DEFAULT NULL,
  `razorpay_order_id` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `service_date` date DEFAULT NULL,
  `service_time` time DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `status`, `total_price`, `address`, `payment_id`, `razorpay_order_id`, `created_at`, `modified_at`, `service_date`, `service_time`, `payment_method`, `payment_status`, `razorpay_payment_id`, `razorpay_signature`) VALUES
(29, '7838cc97-e492-49cd-bc7e-7c16026b5d51', '8888884444', 'pending', 599, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', NULL, NULL, '2026-03-28 10:36:33', '2026-03-28 10:36:33', '2026-03-28', '05:00:00', NULL, NULL, NULL, NULL),
(30, 'b8d335b5-c236-43fc-ae9f-8afcc0e2888f', '8888884444', 'pending', 599, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', NULL, NULL, '2026-03-28 10:38:12', '2026-03-28 10:38:12', '2026-03-28', '05:00:00', NULL, NULL, NULL, NULL),
(31, '35cb6413-4f57-4290-968f-1de830a2de0a', '8888884444', 'confirmed', 599, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'cod_eecc12dd', 'order_SWcNHRVAYT2NoW', '2026-03-28 10:47:30', '2026-03-28 10:47:30', NULL, NULL, NULL, 'pending', NULL, NULL),
(32, 'e62b128e-f56c-4932-a791-ad6e4b245341', '8888884444', 'pending', 3300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', NULL, 'order_SWcPUnfO4EsTFm', '2026-03-28 10:49:36', '2026-03-28 10:49:36', NULL, NULL, NULL, NULL, NULL, NULL),
(33, '8a6e1161-20d7-444c-b8b1-c46cbdef0cb0', '8888884444', 'pending', 3300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', NULL, 'order_SWcVJrDIqrTle6', '2026-03-28 10:55:07', '2026-03-28 10:55:07', NULL, NULL, NULL, NULL, NULL, NULL),
(34, '923881f1-d9da-4f59-9c0e-45b230f4a861', '8888884444', 'pending', 3300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', NULL, 'order_SWcVqBodfPkRyq', '2026-03-28 10:55:36', '2026-03-28 10:55:36', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'cd6cb23a-8332-4803-868e-159ee507e69b', '8888884444', 'confirmed', 3300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'pay_SWcXZhRUCr8Od8', 'order_SWcX8gL5j8lpfY', '2026-03-28 10:56:50', '2026-03-28 10:57:30', NULL, NULL, NULL, 'paid', NULL, NULL),
(36, 'd7b7d75e-b8c5-4f4d-89b7-910c7c1b9eed', '8888884444', 'confirmed', 3300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'cod_d49b4ae9', 'order_SWcZnZ8yRnb01H', '2026-03-28 10:59:21', '2026-03-28 10:59:21', NULL, NULL, NULL, 'pending', NULL, NULL),
(37, '9b58bf0e-c307-484a-a113-ec50da413520', '8888884444', 'confirmed', 3450, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'cod_e68c6bac', 'order_SWg1DyMt3HbalC', '2026-03-28 14:21:24', '2026-03-28 14:21:24', NULL, NULL, NULL, 'pending', NULL, NULL),
(38, 'ca8cfc8f-023d-45bf-86b6-f5dec0aebf6a', '8888884444', 'confirmed', 300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'pay_SWg3M7oHjkyzXM', 'order_SWg2y1C2RrKZ7M', '2026-03-28 14:23:03', '2026-03-28 14:23:40', NULL, NULL, NULL, 'paid', NULL, NULL),
(39, '9505fbaf-da25-4d12-9ad0-1effbf8bf87b', '9000010000', 'confirmed', 120, 'F507, Radha Residency, Vijay Nagar, Pune', 'cod_f628fe6e', NULL, '2026-03-28 15:03:20', '2026-03-28 15:05:59', '2026-04-01', '09:00:00', 'COD', 'pending', NULL, NULL),
(40, '33b6ad10-3681-4817-abf4-dfcddb69ca9e', '9000010000', 'confirmed', 599, 'F507, Radha Residency, Vijay Nagar, Pune', 'pay_xxx', 'order_xxx', '2026-03-28 15:10:56', '2026-03-28 15:13:55', '2026-04-01', '09:00:00', 'ONLINE', 'paid', 'pay_xxx', 'signature_xxx'),
(41, '4c52b325-16d9-40c7-8dce-98e560638c85', '8888884444', 'confirmed', 500, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'cod_45442de9', NULL, '2026-03-28 15:47:04', '2026-03-28 15:51:49', '2026-04-04', '11:00:00', 'COD', 'pending', NULL, NULL),
(42, '5c0483e6-6210-49c7-9177-7c7f68cc6671', '8888884444', 'pending', 300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', NULL, NULL, '2026-03-28 15:52:52', '2026-03-28 15:52:52', '2026-04-02', '11:00:00', NULL, 'pending', NULL, NULL),
(43, 'e1afc072-310b-4591-9cf5-066c098fda5d', '8888884444', 'confirmed', 300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'cod_36182f16', NULL, '2026-03-28 16:42:01', '2026-03-28 16:42:39', '2026-03-30', '03:00:00', 'COD', 'pending', NULL, NULL),
(44, '37ec54b3-7b9e-4a1f-8fee-2349812524db', '9000010000', 'confirmed', 3300, 'Flat 101, Radha Residency, Nashik, Maharashtra', 'pay_test123', 'order_SWixQ7GwR5iRh7', '2026-03-28 17:13:52', '2026-03-28 17:18:13', '2026-04-29', '11:00:00', 'ONLINE', 'paid', 'pay_test123', 'test_signature_123'),
(45, 'ca89f3aa-50bb-4435-b377-90ca590f9b6d', '8888884444', 'confirmed', 3300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'cod_2ae57bbd', 'order_SWj2RKT7OTipWk', '2026-03-28 17:18:37', '2026-03-28 17:19:18', '2026-04-01', '05:00:00', 'COD', 'pending', NULL, NULL),
(46, '0a4633ef-dc4a-4bc8-9568-e1799ee24cf1', '8888884444', 'pending', 300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', NULL, 'order_SWj3rh4zHhbNrz', '2026-03-28 17:19:58', '2026-03-28 17:19:58', '2026-04-07', '01:00:00', NULL, 'pending', NULL, NULL),
(47, 'ab730cac-3b77-4774-a911-caecf4d558ef', '8888884444', 'confirmed', 300, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'pay_SWjpaI3OEmgQjx', 'order_SWjoZcImNiuCCF', '2026-03-28 18:04:11', '2026-03-28 18:05:24', '2026-03-31', '01:00:00', 'ONLINE', 'paid', 'pay_SWjpaI3OEmgQjx', '1b7b18056db30f5181c9e8a512e51250185b737dd7feac2e5d959808e18f5679'),
(48, '49fb6ebc-caf4-488c-a816-dd3b990a4def', '8888884444', 'confirmed', 120, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', 'pay_SWk9MOOLqZQ79a', 'order_SWk0lbEnzsHd66', '2026-03-28 18:15:44', '2026-03-28 18:24:07', '2026-04-01', '03:00:00', 'ONLINE', 'paid', 'pay_SWk9MOOLqZQ79a', 'c2c344fe5ce686d3effa423687837e0e26cbdff03c02c59ba676bc3dd14389f1'),
(49, '7d07703d-d506-4e70-a524-9533559b3f8b', '8888884444', 'pending', 250, 'F507, Radha Residency, Vijay Nagar, Near Green Park, Pune, Maharastra, 411111', NULL, 'order_SWyfdGZGbnWjbm', '2026-03-29 08:36:07', '2026-03-29 08:36:07', '2026-03-29', '05:00:00', NULL, 'pending', NULL, NULL),
(50, '4043cf87-8017-4d80-8880-27d5e1a5d732', '8568585885', 'confirmed', 500, 'H5410, ShivShakti Residency, Indira Nagar, Near Ahilya School, Banglore, Karnatka, 413000', 'cod_105b32ca', 'order_SX1OUuBKPayd7t', '2026-03-29 11:15:59', '2026-03-29 11:53:47', '2026-03-29', '05:00:00', 'COD', 'pending', NULL, NULL),
(51, 'caac3bb9-3f20-4b72-9d0d-cbc656a7d5e5', '8568585885', 'confirmed', 350, 'H5410, ShivShakti Residency, Indira Nagar, Near Ahilya School, Banglore, Karnatka, 413000', 'pay_SX23vnnWd90bqC', 'order_SX23Gagl44S3yc', '2026-03-29 11:54:35', '2026-03-29 11:55:28', '2026-03-30', '09:00:00', 'ONLINE', 'paid', 'pay_SX23vnnWd90bqC', '0becbd7d94096ead4a4d6f1e6ab7b00b120e517f3e44fc3b80575baa59ae52a2'),
(52, '0e9787b9-d743-4f27-bbcf-3b7c31f3483a', '8568585885', 'confirmed', 300, 'H5410, ShivShakti Residency, Indira Nagar, Near Ahilya School, Banglore, Karnatka, 413000', 'cod_a65def43', 'order_SX2EJsRuruqA3p', '2026-03-29 12:05:03', '2026-03-29 12:05:11', '2026-03-30', '03:00:00', 'COD', 'pending', NULL, NULL),
(53, 'a748caaa-f882-40d7-98dc-1875a940a66a', '8568585885', 'confirmed', 300, 'H5410, ShivShakti Residency, Indira Nagar, Near Ahilya School, Banglore, Karnatka, 413000', 'pay_SX2GYzv3Ug90gd', 'order_SX2GEBJOIMdhGL', '2026-03-29 12:06:51', '2026-03-29 12:07:26', '2026-03-30', '01:00:00', 'ONLINE', 'paid', 'pay_SX2GYzv3Ug90gd', '3ecb1a07d9038d90fbd3b1b2b5e1f14393de436a90e04c7d057440c51d39fe2b'),
(54, '412b9d73-0b14-4e96-8e7e-d676ba27d6e6', '8568585885', 'confirmed', 3300, 'H5410, ShivShakti Residency, Indira Nagar, Near Ahilya School, Banglore, Karnatka, 413000', 'cod_049dc786', 'order_SX2TtkXAapXwKI', '2026-03-29 12:19:48', '2026-03-29 12:20:59', '2026-03-30', '05:00:00', 'COD', 'pending', NULL, NULL),
(55, '1be422af-1ac8-4caf-86c2-56a91b4b6070', '8568585885', 'confirmed', 200, 'H5410, ShivShakti Residency, Indira Nagar, Near Ahilya School, Banglore, Karnatka, 413000', 'pay_SX2XJ2GCn9egJg', 'order_SX2WXKeE8Ees0m', '2026-03-29 12:22:18', '2026-03-29 12:23:16', '2026-03-31', '11:00:00', 'ONLINE', 'paid', 'pay_SX2XJ2GCn9egJg', '1cea20034decf254513e4267c2bf678357a74885766958f2bd76f927a7c31c9f'),
(56, 'b7cf59f6-234b-425a-ad8f-bb663342eaa2', '7000000001', 'pending', 300, 'G0122, Ravi Estates, Reddy Colony, Near Hasarat Ganj, Pune, Maharashtra, 410001', NULL, 'order_SZ0CyxM4lm7FVs', '2026-04-03 11:24:24', '2026-04-03 11:24:24', '2026-04-03', '05:00:00', NULL, 'pending', NULL, NULL),
(57, '462a69dd-58cc-4e9d-bce7-3adebaecd6f7', '9000000001', 'pending', 6800, 'G501, Roy Estates\nReddy Colony, Near Airport\nMumbai, Maharashtra\n411004', NULL, 'order_SZ2G0dn12rPBQY', '2026-04-03 13:24:39', '2026-04-03 13:24:39', '0000-00-00', '09:00:00', NULL, 'pending', NULL, NULL),
(58, '3e1816a8-2011-4008-8cac-b8493717344a', '9000000001', 'pending', 6800, 'G501, Roy Estates\nReddy Colony, Near Airport\nMumbai, Maharashtra\n411004', NULL, 'order_SZ2TIOmMbsgYeh', '2026-04-03 13:37:14', '2026-04-03 13:37:14', '2026-04-04', '09:00:00', NULL, 'pending', NULL, NULL),
(59, 'a96f789a-5420-4924-9672-7221f7467aa0', '9000000001', 'confirmed', 6800, 'G501, Roy Estates\nReddy Colony, Near Airport\nMumbai, Maharashtra\n411004', 'cod_da53c4a8', 'order_SZ5QFevOoUvuuT', '2026-04-03 16:30:26', '2026-04-03 16:30:53', '2026-04-06', '11:00:00', 'COD', 'pending', NULL, NULL),
(60, '4ee7d200-f6c3-49c8-b3b8-69a278511b15', '9000000001', 'pending', 600, 'G501, Roy Estates\nReddy Colony, Near Airport\nMumbai, Maharashtra\n411004', NULL, 'order_SZ5S6LQwC10th0', '2026-04-03 16:32:11', '2026-04-03 16:32:11', '2026-04-07', '09:00:00', NULL, 'pending', NULL, NULL),
(61, '59574263-37d7-48ed-bb29-92cc1b5c2fd2', '9000000001', 'pending', 600, 'G501, Roy Estates\nReddy Colony, Near Airport\nMumbai, Maharashtra\n411004', NULL, 'order_SZ78wwRT6wYJYj', '2026-04-03 18:11:26', '2026-04-03 18:11:26', '2026-04-09', '09:00:00', NULL, 'pending', NULL, NULL),
(62, '058eece5-424e-430e-a145-38b42c2e8e84', '9000000001', 'confirmed', 600, 'G501, Roy Estates\nReddy Colony, Near Airport\nMumbai, Maharashtra\n411004', 'pay_SZ7Im04dOJQ4Do', 'order_SZ7ILqxhoNrEbr', '2026-04-03 18:20:21', '2026-04-03 18:21:00', '2026-04-04', '09:00:00', 'ONLINE', 'paid', 'pay_SZ7Im04dOJQ4Do', '566e8f18bb13fc776c308b371cd0d9188e9969b18752da6d16a369b6043961d1'),
(63, 'c9ab6fa7-50a0-4039-9dee-07f2c0600d75', '9021954403', 'confirmed', 400, 'G505, Kailas Properties\nNalanda Colony, Near Water park\nMumbai, Maharashtra\n410045', 'pay_SZ7YdewYpeDwTA', 'order_SZ7Y8U2JF95n7T', '2026-04-03 18:35:17', '2026-04-03 18:36:01', '2026-04-04', '09:00:00', 'ONLINE', 'paid', 'pay_SZ7YdewYpeDwTA', 'e8e31fdd084ac7c97e7d241c98696641f5afdf6d23dc7072510101fef4b4f209'),
(64, '930c402b-243d-4ce5-906f-8add62a7d157', '9000000002', 'confirmed', 799, 'G124, Shriya Estate\nReddy colony, Near Airport\nMumbai, Maharashtra\n410089', 'cod_11b9133d', 'order_SZKyr7YDKzY96n', '2026-04-04 07:43:35', '2026-04-04 07:43:50', '2026-04-05', '09:00:00', 'COD', 'pending', NULL, NULL),
(65, 'f9799278-1e05-4234-b6aa-07e44aff8807', '9025252120', 'confirmed', 3400, 'G456, radha estate\nshivaji colony, near bus stan\nmumbai, maharashtra\n413256', 'pay_SZLz6py2DwnSEu', 'order_SZLyX78C35ztoY', '2026-04-04 08:41:58', '2026-04-04 08:42:46', '2026-04-05', '11:00:00', 'ONLINE', 'paid', 'pay_SZLz6py2DwnSEu', 'c3145251653aba33501cc0ed39cd1aeecc81b334d3e712c3197934d15a64db88'),
(66, '36acf77e-f8ed-4c11-9ad3-d17f92a350d8', '9025252120', 'confirmed', 300, 'F890, radha estate\nshivaji colony, near bus stan\nmumbai, maharashtra\n413256', 'cod_7bd9153e', 'order_SZRyDwg7NsyB0d', '2026-04-04 14:33:51', '2026-04-04 14:33:55', '2026-04-05', '09:00:00', 'COD', 'pending', NULL, NULL),
(67, 'a9a3f9ce-dab2-45fa-93b8-ca1e11b8a552', '9025252120', 'confirmed', 699, 'F890, radha estate\nshivaji colony, near bus stan\nmumbai, maharashtra\n413256', 'pay_SZhxMASQDa16PD', 'order_SZhwkBGDR6Tgpj', '2026-04-05 06:11:33', '2026-04-05 06:12:23', '2026-04-05', '01:00:00', 'ONLINE', 'paid', 'pay_SZhxMASQDa16PD', '9fc1586fe0f03220d58207030b7bea062a5979fd88bc639b3510c41329ddb703'),
(68, '49269246-2097-416e-8de1-f05b6cf55323', '9025252120', 'confirmed', 400, 'F890, radha estate\nshivaji colony, near bus stan\nmumbai, maharashtra\n413256', 'cod_bfc7840e', 'order_SZtBpFfrVRV6nt', '2026-04-05 17:11:27', '2026-04-05 17:12:15', '2026-04-06', '09:00:00', 'COD', 'pending', NULL, NULL),
(69, 'b1f490b9-04d0-458b-ab42-da94de82bb7d', '9025252120', 'confirmed', 800, 'F890, radha estate\nshivaji colony, near bus stan\nmumbai, maharashtra\n413256', 'pay_SZtGRjUnKmIV4I', 'order_SZtFYBfhhczXGA', '2026-04-05 17:14:59', '2026-04-05 17:16:05', '2026-04-06', '11:00:00', 'ONLINE', 'paid', 'pay_SZtGRjUnKmIV4I', 'd6e0dedbcf1ce63b065561fe54a809b1a85dc361871a03032bc1206c14d1026e'),
(70, 'cbdb2eb2-b176-4847-9e3d-a489944fc634', '7575752525', 'confirmed', 800, 'GC412, ABC\nXYZ, NEAR PQR\nMUMBAI, MAHARASHTRA\n412356', 'pay_SbHkWG5lHwE7Zj', 'order_SbHjhXO9jGQQho', '2026-04-09 05:51:10', '2026-04-09 05:52:16', '2026-04-10', '11:00:00', 'ONLINE', 'paid', 'pay_SbHkWG5lHwE7Zj', '901dae622fd43444234f27728cde306678ef30b6ded79ff378f37300c6df4387'),
(71, '396238f6-ca44-4e62-8589-05ea569aae57', '7575752525', 'confirmed', 220, 'GC412, ABC\nXYZ, NEAR PQR\nMUMBAI, MAHARASHTRA\n412356', 'cod_ad9d9fbf', 'order_SbHm0YGIWM049d', '2026-04-09 05:53:21', '2026-04-09 05:53:27', '2026-04-09', '13:00:00', 'COD', 'pending', NULL, NULL),
(72, 'c537243f-a6dc-4cac-b452-318926bf0ca7', '7000000001', 'confirmed', 500, 'G0122, Ravi Estates, Reddy Colony, Near Hasarat Ganj, Pune, Maharashtra, 410001', 'pay_SbJrwCzkg97qPK', 'order_SbJrHOQu9Yo0xs', '2026-04-09 07:55:44', '2026-04-09 07:56:42', '2026-04-09', '03:00:00', 'ONLINE', 'paid', 'pay_SbJrwCzkg97qPK', 'b6d0c90bf509d4813093aa4682386a6fa62fc0714e03c0da63d0fd314bd5d2d2'),
(73, '93ba51c3-d814-417a-a108-d8e2b29c875a', '9639639630', 'pending', 500, 'M789, Aastha Properties\nravi nagar, near metro\nbanglore, karnatka\n410001', NULL, 'order_ScWmPpRcDZhOVp', '2026-04-12 09:13:08', '2026-04-12 09:13:08', '2026-04-12', '17:00:00', NULL, 'pending', NULL, NULL),
(74, 'bca01c2f-a9b0-46e6-aede-a7041fa31a4f', '9639639630', 'confirmed', 500, 'M789, Aastha Properties\nravi nagar, near metro\nbanglore, karnatka\n410001', 'pay_ScWpcVk6ub6gFX', 'order_ScWoPJng0Or7qF', '2026-04-12 09:15:01', '2026-04-12 09:16:26', '2026-04-12', '15:00:00', 'ONLINE', 'paid', 'pay_ScWpcVk6ub6gFX', '2a993b6a001c0691ea0d160ecc601ae1a7c39c44febe5f56cbd9cceb8d939704'),
(75, '1d205fbc-4419-4a2f-b159-df34ce866a39', '9639639630', 'confirmed', 350, 'M789, Aastha Properties\nravi nagar, near metro\nbanglore, karnatka\n410001', 'pay_ScX5qXsxGYSPxt', 'order_ScWz3y1WonYSbq', '2026-04-12 09:25:07', '2026-04-12 09:31:51', '2026-04-12', '17:00:00', 'ONLINE', 'paid', 'pay_ScX5qXsxGYSPxt', 'ab06e9b55171d7ef1185ed8e607e7e4c661713050badc352e4bb76a2a465aa18'),
(76, '074f04fa-f306-4192-8471-c8547ae793b4', '8523852300', 'confirmed', 1598, 'f349, Aaradhya Properties\nChand Minar, Near Hajrat ganj\nBanglore, Karnatka\n410011', 'pay_SctesypQ0gWkPQ', 'order_ScteRg4qT03frL', '2026-04-13 07:35:34', '2026-04-13 07:36:19', '2026-04-13', '17:00:00', 'ONLINE', 'paid', 'pay_SctesypQ0gWkPQ', '8a29b6ff5cd8e250bec0061559554ed9edfe7792f1dfbed34a61549241e4da2b'),
(77, 'cd1649cc-451f-4058-9c3e-e80ecd5883c5', '8787878787', 'confirmed', 700, 'G342, Akanksha Estates, Vrinda Colony, Near Eaden Garden, Mumbai, Maharashtra, 412516', 'pay_SctsFYKETEZQnr', 'order_SctrtOrx796LtL', '2026-04-13 07:48:18', '2026-04-13 07:48:53', '2026-04-13', '17:00:00', 'ONLINE', 'paid', 'pay_SctsFYKETEZQnr', 'e45dccffd6f0fc588540ec67c1c736d057afd2693e8e813660af1ca4911dcfa7'),
(78, 'eee3e65f-5ca4-4837-ab67-2816f2d13602', '8523852300', 'confirmed', 600, 'f349, Aaradhya Properties\nChand Minar, Near Hajrat ganj\nBanglore, Karnatka\n410011', 'pay_Scu8Dy769p8uX8', 'order_Scu7gAQIoWBXGz', '2026-04-13 08:03:15', '2026-04-13 08:04:01', '2026-04-13', '15:00:00', 'ONLINE', 'paid', 'pay_Scu8Dy769p8uX8', 'ff632f40f8c1f44eb14448411a01106bb2b9fff5d38270d25a65f35a403ac96a'),
(79, '9d34541d-ad0b-42ef-8d3c-4fe7b4c1b9e6', '8523852300', 'pending', 350, 'f349, Aaradhya Properties\nChand Minar, Near Hajrat ganj\nBanglore, Karnatka\n410011', NULL, 'order_ScuwStOapz9brJ', '2026-04-13 08:51:20', '2026-04-13 08:51:20', '2026-04-13', '17:00:00', NULL, 'pending', NULL, NULL),
(80, 'f260ec73-5634-4ee3-bffc-39bb1b6a8551', '8523852300', 'pending', 350, 'f349, Aaradhya Properties\nChand Minar, Near Hajrat ganj\nBanglore, Karnatka\n410011', NULL, 'order_ScuxkYdRIYTB8k', '2026-04-13 08:52:33', '2026-04-13 08:52:33', '2026-04-14', '09:00:00', NULL, 'pending', NULL, NULL),
(81, '930ea3f9-4a52-4860-9664-c6a06eac2c10', '8523852300', 'pending', 500, 'f349, Aaradhya Properties\nChand Minar, Near Hajrat ganj\nBanglore, Karnatka\n410011', NULL, 'order_ScvLZOK8Tj7MRV', '2026-04-13 09:15:06', '2026-04-13 09:15:06', '2026-04-13', '17:00:00', NULL, 'pending', NULL, NULL),
(82, '6cbb5258-feee-4f00-a957-aaec06ebf42d', '8523852300', 'confirmed', 500, 'f349, Aaradhya Properties\nChand Minar, Near Hajrat ganj\nBanglore, Karnatka\n410011', 'pay_ScvNMnxyk4IdBN', 'order_ScvMQmhjO899J3', '2026-04-13 09:15:55', '2026-04-13 09:17:04', '2026-04-15', '11:00:00', 'ONLINE', 'paid', 'pay_ScvNMnxyk4IdBN', '81229dc6e4bfd9169dd9ec3d54fc18ed2d6ed74d4609d62000cd7228a18501df'),
(83, '7496c301-a362-436a-b31c-50f7820b624a', '6126126120', 'confirmed', 2192, 'G555, Yogita Residency\nKullur Colony, Near Govrt. Hospital\nMumbai, Maharashtra\n410003', 'pay_ScvXxeVk1uuDHY', 'order_ScvXbIEjGhn04t', '2026-04-13 09:26:29', '2026-04-13 09:27:05', '2026-04-13', '17:00:00', 'ONLINE', 'paid', 'pay_ScvXxeVk1uuDHY', 'f90c7e9a9dc3627cbc355fa2c7026d56634792a9273b28fbc04951e682debbeb'),
(84, 'ed6ef4db-e966-4458-b8bf-10c3ab863d47', '6126126120', 'confirmed', 800, 'G555, Yogita Residency\nKullur Colony, Near Govrt. Hospital\nMumbai, Maharashtra\n410003', 'cod_922c76b2', 'order_Scvacou9kqUWe3', '2026-04-13 09:29:21', '2026-04-13 09:29:26', '2026-04-14', '09:00:00', 'COD', 'pending', NULL, NULL),
(85, 'c3309c10-e3ab-459a-95ee-e7e373214286', '6126126120', 'confirmed', 500, 'G555, Yogita Residency\nKullur Colony, Near Govrt. Hospital\nMumbai, Maharashtra\n410003', 'cod_2b27cd5b', 'order_ScvbJLEUpiymKp', '2026-04-13 09:30:00', '2026-04-13 09:30:20', '2026-04-16', '09:00:00', 'COD', 'pending', NULL, NULL),
(86, 'a1bcdd45-d2e5-4c1a-8e07-6c74abd4bead', '6126126120', 'pending', 300, 'G555, Yogita Residency\nKullur Colony, Near Govrt. Hospital\nMumbai, Maharashtra\n410003', NULL, 'order_Scvx1Sj2bV9gGT', '2026-04-13 09:50:33', '2026-04-13 09:50:33', '2026-04-17', '17:00:00', NULL, 'pending', NULL, NULL),
(87, '29075589-8fae-44f7-aead-547e7c08f2ef', '6126126120', 'confirmed', 300, 'G555, Yogita Residency\nKullur Colony, Near Govrt. Hospital\nMumbai, Maharashtra\n410003', 'cod_626b5317', 'order_Scvz847wJZLUg9', '2026-04-13 09:52:33', '2026-04-13 09:52:36', '2026-04-18', '11:00:00', 'COD', 'pending', NULL, NULL),
(88, '652ae2b0-6dcf-47a0-8dbe-a00a2809d0ac', '6126126120', 'pending', 400, 'G555, Yogita Residency\nKullur Colony, Near Govrt. Hospital\nMumbai, Maharashtra\n410003', NULL, 'order_ScwFgNofrEYSPD', '2026-04-13 10:08:13', '2026-04-13 10:08:13', '2026-04-14', '11:00:00', NULL, 'pending', NULL, NULL),
(89, 'd36d19c7-ad3d-4dcd-8e07-0eb267340c6d', '6126126120', 'pending', 400, 'G555, Yogita Residency\nKullur Colony, Near Govrt. Hospital\nMumbai, Maharashtra\n410003', NULL, 'order_ScwK82huEbgXBu', '2026-04-13 10:12:26', '2026-04-13 10:12:26', '2026-04-15', '09:00:00', NULL, 'pending', NULL, NULL),
(90, 'c17bca5e-3f4a-497e-9ef2-14d057003289', '8523852300', 'confirmed', 3400, 'f349, Aaradhya Properties\nChand Minar, Near Hajrat ganj\nBanglore, Karnatka\n410011', 'cod_72e90a42', 'order_ScwiMurGSDOQku', '2026-04-13 10:34:08', '2026-04-13 10:36:01', '2026-04-14', '11:00:00', 'COD', 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `service_id`, `quantity`, `price`, `total_price`, `created_at`, `modified_at`) VALUES
(1, '9b533d65-3edc-4bd6-b825-199c31c5aad2', 1, 1, 3200, 3200, '2026-03-17 08:14:36', '2026-03-17 08:14:36'),
(2, '9b533d65-3edc-4bd6-b825-199c31c5aad2', 3, 1, 150, 150, '2026-03-17 08:14:36', '2026-03-17 08:14:36'),
(3, 'fa127117-e019-40cc-956c-149cad9037cb', 1, 2, 3200, 6400, '2026-03-17 11:47:17', '2026-03-17 11:47:17'),
(4, 'fa127117-e019-40cc-956c-149cad9037cb', 3, 2, 150, 300, '2026-03-17 11:47:17', '2026-03-17 11:47:17'),
(5, '7d13a1c2-2045-4b7d-928b-5d96820eeb9d', 4, 1, 599, 599, '2026-03-17 16:59:12', '2026-03-17 16:59:12'),
(6, '7d13a1c2-2045-4b7d-928b-5d96820eeb9d', 3, 2, 150, 300, '2026-03-17 16:59:12', '2026-03-17 16:59:12'),
(7, '2efe49d3-dba6-42f0-b43b-9985d382724e', 4, 1, 599, 599, '2026-03-17 17:00:18', '2026-03-17 17:00:18'),
(8, '5f59b11c-3e06-469f-b716-8a6a65c11178', 2, 1, 4200, 4200, '2026-03-20 13:28:10', '2026-03-20 13:28:10'),
(9, '2b772ff0-b0b2-4d8f-ac85-2d9a43444659', 3, 1, 150, 150, '2026-03-20 13:39:14', '2026-03-20 13:39:14'),
(10, '6d32c840-48d8-4d86-a505-c3abb7c9c631', 4, 1, 599, 599, '2026-03-20 13:40:35', '2026-03-20 13:40:35'),
(11, 'bddd023e-3e6e-408c-b61d-e9f987d3c670', 4, 1, 599, 599, '2026-03-20 13:43:32', '2026-03-20 13:43:32'),
(12, 'a41d7e9b-46b3-4fef-bea0-ed11d0dd1ab3', 1, 1, 3200, 3200, '2026-03-25 15:39:36', '2026-03-25 15:39:36'),
(13, '397f7739-8205-4fac-8d2d-25295d8b45ed', 1, 1, 3200, 3200, '2026-03-26 15:31:48', '2026-03-26 15:31:48'),
(14, 'cac286cd-3355-404c-aee7-211dbac78eee', 1, 1, 3200, 3200, '2026-03-27 21:06:00', '2026-03-27 21:06:00'),
(15, 'c99edd99-d763-4d00-af9a-6af6645efe30', 1, 1, 3200, 3200, '2026-03-27 21:14:11', '2026-03-27 21:14:11'),
(16, 'd702101b-386b-45fc-aeb0-07071b81f621', 25, 1, 100, 100, '2026-03-27 22:05:34', '2026-03-27 22:05:34'),
(17, 'a90e8ca1-1c14-40f3-9d9e-620867933196', 13, 1, 200, 200, '2026-03-27 22:20:53', '2026-03-27 22:20:53'),
(18, 'e901a061-0e6b-47d8-9213-067ceedd6b73', 5, 1, 5200, 5200, '2026-03-28 05:54:44', '2026-03-28 05:54:44'),
(19, '71d7c97d-9acb-47ab-a160-8e9d18695b26', 4, 1, 6200, 6200, '2026-03-28 05:58:03', '2026-03-28 05:58:03'),
(20, '3feb5ce7-86bc-4811-a0b1-5393e430d602', 15, 1, 200, 200, '2026-03-28 06:23:40', '2026-03-28 06:23:40'),
(21, '7f7c5e33-08ed-4fca-89ce-30a2d82b5225', 22, 1, 100, 100, '2026-03-28 06:25:13', '2026-03-28 06:25:13'),
(22, '9210ef48-4b5d-464c-917b-34779f69280c', 31, 1, 20, 20, '2026-03-28 06:33:45', '2026-03-28 06:33:45'),
(23, 'cf05790d-1fa8-4c6a-bbc7-814d902ac53f', 22, 1, 100, 100, '2026-03-28 07:09:52', '2026-03-28 07:09:52'),
(24, 'cf05790d-1fa8-4c6a-bbc7-814d902ac53f', 31, 1, 20, 20, '2026-03-28 07:09:52', '2026-03-28 07:09:52'),
(25, '7ead3639-5817-4a2e-ac44-3dbdce822ba8', 22, 1, 100, 100, '2026-03-28 07:16:49', '2026-03-28 07:16:49'),
(26, '7ead3639-5817-4a2e-ac44-3dbdce822ba8', 31, 1, 20, 20, '2026-03-28 07:16:49', '2026-03-28 07:16:49'),
(27, 'f5563373-269b-4d8b-9c83-553e17870870', 11, 1, 499, 499, '2026-03-28 08:02:21', '2026-03-28 08:02:21'),
(28, '0f8cf4cd-739e-42e7-b7a0-225bcb6c365e', 12, 1, 699, 699, '2026-03-28 08:04:06', '2026-03-28 08:04:06'),
(29, '356cd5b6-f5d9-4ef8-b99b-1a0cb5b91fef', 1, 2, 3200, 6400, '2026-03-28 08:27:09', '2026-03-28 08:27:09'),
(30, 'e4a3ba63-21fe-47cb-9482-7a1ca20a6b7e', 13, 2, 200, 400, '2026-03-28 08:29:56', '2026-03-28 08:29:56'),
(31, 'c6896ed7-fe5a-4a9b-bff8-1ee71ff008d2', 15, 3, 200, 600, '2026-03-28 08:32:36', '2026-03-28 08:32:36'),
(32, '4c11e604-866b-4230-ad77-42e6f80e9f90', 1, 1, 3200, 3200, '2026-03-28 10:13:39', '2026-03-28 10:13:39'),
(33, 'b975fa2c-55ed-49ca-8d0d-b624c378b98c', 10, 1, 499, 499, '2026-03-28 10:31:19', '2026-03-28 10:31:19'),
(34, '7838cc97-e492-49cd-bc7e-7c16026b5d51', 10, 1, 499, 499, '2026-03-28 10:36:33', '2026-03-28 10:36:33'),
(35, 'b8d335b5-c236-43fc-ae9f-8afcc0e2888f', 10, 1, 499, 499, '2026-03-28 10:38:12', '2026-03-28 10:38:12'),
(36, '35cb6413-4f57-4290-968f-1de830a2de0a', 10, 1, 499, 499, '2026-03-28 10:47:30', '2026-03-28 10:47:30'),
(37, 'e62b128e-f56c-4932-a791-ad6e4b245341', 1, 1, 3200, 3200, '2026-03-28 10:49:36', '2026-03-28 10:49:36'),
(38, '8a6e1161-20d7-444c-b8b1-c46cbdef0cb0', 1, 1, 3200, 3200, '2026-03-28 10:55:07', '2026-03-28 10:55:07'),
(39, '923881f1-d9da-4f59-9c0e-45b230f4a861', 1, 1, 3200, 3200, '2026-03-28 10:55:36', '2026-03-28 10:55:36'),
(40, 'cd6cb23a-8332-4803-868e-159ee507e69b', 1, 1, 3200, 3200, '2026-03-28 10:56:50', '2026-03-28 10:56:50'),
(41, 'd7b7d75e-b8c5-4f4d-89b7-910c7c1b9eed', 1, 1, 3200, 3200, '2026-03-28 10:59:21', '2026-03-28 10:59:21'),
(42, '9b58bf0e-c307-484a-a113-ec50da413520', 1, 1, 3200, 3200, '2026-03-28 14:21:24', '2026-03-28 14:21:24'),
(43, '9b58bf0e-c307-484a-a113-ec50da413520', 3, 1, 150, 150, '2026-03-28 14:21:24', '2026-03-28 14:21:24'),
(44, 'ca8cfc8f-023d-45bf-86b6-f5dec0aebf6a', 20, 1, 200, 200, '2026-03-28 14:23:03', '2026-03-28 14:23:03'),
(45, '9505fbaf-da25-4d12-9ad0-1effbf8bf87b', 1, 1, 20, 20, '2026-03-28 15:03:20', '2026-03-28 15:03:20'),
(46, '33b6ad10-3681-4817-abf4-dfcddb69ca9e', 11, 1, 499, 499, '2026-03-28 15:10:56', '2026-03-28 15:10:56'),
(47, '4c52b325-16d9-40c7-8dce-98e560638c85', 14, 1, 400, 400, '2026-03-28 15:47:04', '2026-03-28 15:47:04'),
(48, '5c0483e6-6210-49c7-9177-7c7f68cc6671', 29, 1, 200, 200, '2026-03-28 15:52:52', '2026-03-28 15:52:52'),
(49, 'e1afc072-310b-4591-9cf5-066c098fda5d', 29, 1, 200, 200, '2026-03-28 16:42:01', '2026-03-28 16:42:01'),
(50, '37ec54b3-7b9e-4a1f-8fee-2349812524db', 1, 1, 3200, 3200, '2026-03-28 17:13:52', '2026-03-28 17:13:52'),
(51, 'ca89f3aa-50bb-4435-b377-90ca590f9b6d', 1, 1, 3200, 3200, '2026-03-28 17:18:37', '2026-03-28 17:18:37'),
(52, '0a4633ef-dc4a-4bc8-9568-e1799ee24cf1', 18, 1, 200, 200, '2026-03-28 17:19:58', '2026-03-28 17:19:58'),
(53, 'ab730cac-3b77-4774-a911-caecf4d558ef', 18, 1, 200, 200, '2026-03-28 18:04:11', '2026-03-28 18:04:11'),
(54, '49fb6ebc-caf4-488c-a816-dd3b990a4def', 31, 1, 20, 20, '2026-03-28 18:15:44', '2026-03-28 18:15:44'),
(55, '7d07703d-d506-4e70-a524-9533559b3f8b', 21, 1, 150, 150, '2026-03-29 08:36:07', '2026-03-29 08:36:07'),
(56, '4043cf87-8017-4d80-8880-27d5e1a5d732', 20, 2, 200, 400, '2026-03-29 11:15:59', '2026-03-29 11:15:59'),
(57, 'caac3bb9-3f20-4b72-9d0d-cbc656a7d5e5', 24, 1, 250, 250, '2026-03-29 11:54:35', '2026-03-29 11:54:35'),
(58, '0e9787b9-d743-4f27-bbcf-3b7c31f3483a', 13, 1, 200, 200, '2026-03-29 12:05:03', '2026-03-29 12:05:03'),
(59, 'a748caaa-f882-40d7-98dc-1875a940a66a', 13, 1, 200, 200, '2026-03-29 12:06:51', '2026-03-29 12:06:51'),
(60, '412b9d73-0b14-4e96-8e7e-d676ba27d6e6', 1, 1, 3200, 3200, '2026-03-29 12:19:48', '2026-03-29 12:19:48'),
(61, '1be422af-1ac8-4caf-86c2-56a91b4b6070', 22, 1, 100, 100, '2026-03-29 12:22:18', '2026-03-29 12:22:18'),
(62, 'b7cf59f6-234b-425a-ad8f-bb663342eaa2', 13, 1, 200, 200, '2026-04-03 11:24:24', '2026-04-03 11:24:24'),
(63, '462a69dd-58cc-4e9d-bce7-3adebaecd6f7', 1, 2, 3200, 6400, '2026-04-03 13:24:39', '2026-04-03 13:24:39'),
(64, '462a69dd-58cc-4e9d-bce7-3adebaecd6f7', 13, 1, 200, 200, '2026-04-03 13:24:39', '2026-04-03 13:24:39'),
(65, '3e1816a8-2011-4008-8cac-b8493717344a', 1, 2, 3200, 6400, '2026-04-03 13:37:14', '2026-04-03 13:37:14'),
(66, '3e1816a8-2011-4008-8cac-b8493717344a', 13, 1, 200, 200, '2026-04-03 13:37:14', '2026-04-03 13:37:14'),
(67, 'a96f789a-5420-4924-9672-7221f7467aa0', 1, 2, 3200, 6400, '2026-04-03 16:30:26', '2026-04-03 16:30:26'),
(68, 'a96f789a-5420-4924-9672-7221f7467aa0', 13, 1, 200, 200, '2026-04-03 16:30:26', '2026-04-03 16:30:26'),
(69, '4ee7d200-f6c3-49c8-b3b8-69a278511b15', 16, 1, 400, 400, '2026-04-03 16:32:11', '2026-04-03 16:32:11'),
(70, '59574263-37d7-48ed-bb29-92cc1b5c2fd2', 16, 1, 400, 400, '2026-04-03 18:11:26', '2026-04-03 18:11:26'),
(71, '058eece5-424e-430e-a145-38b42c2e8e84', 16, 1, 400, 400, '2026-04-03 18:20:21', '2026-04-03 18:20:21'),
(72, 'c9ab6fa7-50a0-4039-9dee-07f2c0600d75', 29, 1, 200, 200, '2026-04-03 18:35:17', '2026-04-03 18:35:17'),
(73, '930c402b-243d-4ce5-906f-8add62a7d157', 4, 1, 599, 599, '2026-04-04 07:43:35', '2026-04-04 07:43:35'),
(74, 'f9799278-1e05-4234-b6aa-07e44aff8807', 1, 1, 3200, 3200, '2026-04-04 08:41:58', '2026-04-04 08:41:58'),
(75, '36acf77e-f8ed-4c11-9ad3-d17f92a350d8', 25, 1, 100, 100, '2026-04-04 14:33:51', '2026-04-04 14:33:51'),
(76, 'a9a3f9ce-dab2-45fa-93b8-ca1e11b8a552', 10, 1, 499, 499, '2026-04-05 06:11:33', '2026-04-05 06:11:33'),
(77, '49269246-2097-416e-8de1-f05b6cf55323', 17, 1, 200, 200, '2026-04-05 17:11:27', '2026-04-05 17:11:27'),
(78, 'b1f490b9-04d0-458b-ab42-da94de82bb7d', 9, 2, 300, 600, '2026-04-05 17:14:59', '2026-04-05 17:14:59'),
(79, 'cbdb2eb2-b176-4847-9e3d-a489944fc634', 9, 2, 300, 600, '2026-04-09 05:51:10', '2026-04-09 05:51:10'),
(80, '396238f6-ca44-4e62-8589-05ea569aae57', 31, 1, 20, 20, '2026-04-09 05:53:21', '2026-04-09 05:53:21'),
(81, 'c537243f-a6dc-4cac-b452-318926bf0ca7', 13, 2, 200, 400, '2026-04-09 07:55:44', '2026-04-09 07:55:44'),
(82, '93ba51c3-d814-417a-a108-d8e2b29c875a', 3, 2, 150, 300, '2026-04-12 09:13:08', '2026-04-12 09:13:08'),
(83, 'bca01c2f-a9b0-46e6-aede-a7041fa31a4f', 3, 2, 150, 300, '2026-04-12 09:15:02', '2026-04-12 09:15:02'),
(84, '1d205fbc-4419-4a2f-b159-df34ce866a39', 21, 1, 150, 150, '2026-04-12 09:25:07', '2026-04-12 09:25:07'),
(85, '074f04fa-f306-4192-8471-c8547ae793b4', 12, 2, 699, 1398, '2026-04-13 07:35:34', '2026-04-13 07:35:34'),
(86, 'cd1649cc-451f-4058-9c3e-e80ecd5883c5', 13, 3, 200, 600, '2026-04-13 07:48:18', '2026-04-13 07:48:18'),
(87, 'eee3e65f-5ca4-4837-ab67-2816f2d13602', 29, 2, 200, 400, '2026-04-13 08:03:15', '2026-04-13 08:03:15'),
(88, '9d34541d-ad0b-42ef-8d3c-4fe7b4c1b9e6', 3, 1, 150, 150, '2026-04-13 08:51:20', '2026-04-13 08:51:20'),
(89, 'f260ec73-5634-4ee3-bffc-39bb1b6a8551', 3, 1, 150, 150, '2026-04-13 08:52:33', '2026-04-13 08:52:33'),
(90, '930ea3f9-4a52-4860-9664-c6a06eac2c10', 3, 2, 150, 300, '2026-04-13 09:15:06', '2026-04-13 09:15:06'),
(91, '6cbb5258-feee-4f00-a957-aaec06ebf42d', 3, 2, 150, 300, '2026-04-13 09:15:55', '2026-04-13 09:15:55'),
(92, '7496c301-a362-436a-b31c-50f7820b624a', 7, 2, 996, 1992, '2026-04-13 09:26:29', '2026-04-13 09:26:29'),
(93, 'ed6ef4db-e966-4458-b8bf-10c3ab863d47', 27, 1, 600, 600, '2026-04-13 09:29:21', '2026-04-13 09:29:21'),
(94, 'c3309c10-e3ab-459a-95ee-e7e373214286', 9, 1, 300, 300, '2026-04-13 09:30:00', '2026-04-13 09:30:00'),
(95, 'a1bcdd45-d2e5-4c1a-8e07-6c74abd4bead', 31, 5, 20, 100, '2026-04-13 09:50:33', '2026-04-13 09:50:33'),
(96, '29075589-8fae-44f7-aead-547e7c08f2ef', 31, 5, 20, 100, '2026-04-13 09:52:33', '2026-04-13 09:52:33'),
(97, '652ae2b0-6dcf-47a0-8dbe-a00a2809d0ac', 26, 2, 100, 200, '2026-04-13 10:08:13', '2026-04-13 10:08:13'),
(98, 'd36d19c7-ad3d-4dcd-8e07-0eb267340c6d', 26, 2, 100, 200, '2026-04-13 10:12:26', '2026-04-13 10:12:26'),
(101, 'c17bca5e-3f4a-497e-9ef2-14d057003289', 1, 1, 3200, 3200, '2026-04-13 10:35:23', '2026-04-13 10:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `service_category_id` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `mobile_number`, `gender`, `service_category_id`, `experience`, `created_at`, `modified_at`) VALUES
(2, 'Ravikant Kumar', '9876543210', 'male', 1, 3, '2026-04-18 08:40:01', '2026-04-18 17:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `partner_orders`
--

CREATE TABLE `partner_orders` (
  `id` varchar(50) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `partner_id` varchar(50) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `service_id` varchar(50) NOT NULL,
  `service_name` varchar(150) NOT NULL,
  `service_category` varchar(100) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `order_status` varchar(50) DEFAULT 'assigned',
  `partner_accept_time` datetime DEFAULT NULL,
  `service_start_time` datetime DEFAULT NULL,
  `service_end_time` datetime DEFAULT NULL,
  `customer_otp` varchar(10) DEFAULT NULL,
  `otp_verified` tinyint(1) DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `partner_earning` int(11) NOT NULL,
  `admin_commission` int(11) NOT NULL,
  `payment_mode` varchar(20) DEFAULT 'online',
  `payment_status` varchar(20) DEFAULT 'pending',
  `service_address` text NOT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `canceled_by` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_orders`
--

INSERT INTO `partner_orders` (`id`, `order_id`, `partner_id`, `user_id`, `service_id`, `service_name`, `service_category`, `booking_date`, `booking_time`, `order_status`, `partner_accept_time`, `service_start_time`, `service_end_time`, `customer_otp`, `otp_verified`, `total_amount`, `partner_earning`, `admin_commission`, `payment_mode`, `payment_status`, `service_address`, `latitude`, `longitude`, `cancellation_reason`, `canceled_by`, `created_at`, `updated_at`) VALUES
('PO_1776533869057', '6cbb5258-feee-4f00-a957-aaec06ebf42d', '1', '8523852300', '3', 'Fan Repair', 'Fan Services', '2026-04-15', '11:00:00', 'assigned', NULL, NULL, NULL, NULL, 0, 0, 500, 450, '50', 'ONLINE', 'paid', NULL, NULL, NULL, NULL, '2026-04-18 17:37:49', '2026-04-18 17:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `partner_payouts`
--

CREATE TABLE `partner_payouts` (
  `id` int(11) NOT NULL,
  `partner_order_id` varchar(50) NOT NULL,
  `total_order_amount` int(11) NOT NULL,
  `platform_fee` int(11) NOT NULL,
  `taxes` int(11) NOT NULL,
  `partner_earning` int(11) NOT NULL,
  `payment_status` varchar(50) NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `notes` text NOT NULL,
  `performed_by` varchar(150) NOT NULL,
  `duration_min` int(11) NOT NULL,
  `duration_max` int(11) NOT NULL,
  `tools_used` text NOT NULL,
  `service_type` enum('main','additional') NOT NULL DEFAULT 'main',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `image_url`, `subcategory_id`, `notes`, `performed_by`, `duration_min`, `duration_max`, `tools_used`, `service_type`, `created_at`, `modified_at`) VALUES
(1, '1BHK Deep Cleaning', 3200, '/uploads/1bhk-deep-cleaning.jpeg', 1, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 30, 45, 'Standard Tools', 'main', '2026-03-15 08:23:34', '2026-03-22 16:28:55'),
(2, '2 BHK Deep Cleaning', 4200, '/uploads/1bhk-deep-cleaning.jpeg', 1, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 45, 120, 'Standard Tools', 'main', '2026-03-15 08:47:56', '2026-03-22 16:33:26'),
(3, 'Fan Repair', 150, '/uploads/fan-repair.jpeg', 11, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'additional', '2026-03-15 09:36:35', '2026-03-22 16:33:26'),
(4, 'Sofa Deep Cleaning', 599, '/uploads/sofa-cleaning.jpeg', 2, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 30, 45, 'Standard Tools', 'main', '2026-03-17 16:50:01', '2026-03-22 16:33:26'),
(5, '3BHK Deep Cleaning', 5200, '/uploads/1bhk-deep-cleaning.jpeg', 1, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 45, 160, 'Standard Tools', 'main', '2026-03-20 14:55:01', '2026-03-22 16:33:26'),
(6, '4BHK Deep Cleaning', 6200, '/uploads/1bhk-deep-cleaning.jpeg', 1, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 45, 160, 'Standard Tools', 'main', '2026-03-20 15:03:49', '2026-03-22 16:37:18'),
(7, 'Sofa Deep Cleaning\r\n(3 to 5 seater)', 996, '/uploads/sofa-cleaning.jpeg', 2, 'Please provide required electrical equipments and support to our executive.', 'Machine', 45, 60, 'Standard Tools', 'main', '2026-03-21 14:20:10', '2026-03-23 07:43:38'),
(8, '3 Seater Sofa Cleaning', 599, '/uploads/sofa-cleaning.jpeg', 2, 'Please provide required electrical equiments and supporto to our executive', 'Machine', 30, 50, 'Standard Tools', 'main', '2026-03-21 14:22:29', '2026-03-22 16:33:26'),
(9, 'Geyser Fitting', 300, '/uploads/geyser-coil-repair.jpeg', 8, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 14:26:09', '2026-03-22 16:33:26'),
(10, 'Bathroom Deep Cleaning', 499, '/uploads/bathroom-clean-with-machin.jpeg', 3, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 30, 45, 'Standard Tools', 'main', '2026-03-21 14:30:25', '2026-03-22 16:33:26'),
(11, 'Kitchen Trolly Cleaning(3 to 5)', 499, '/uploads/maxresdefault.jpg', 4, 'Please provide required electrical equiments and supporto to our executive', 'Manual staff', 30, 50, 'Standard Tools', 'main', '2026-03-21 14:51:01', '2026-03-22 16:33:26'),
(12, 'Kitchen Cabinates (5 to 10)', 699, '/uploads/maxresdefault.jpg', 4, 'Please provide required electrical equipment and support to our executive', 'Manual Staff', 60, 90, 'Standard Tools', 'main', '2026-03-21 14:52:41', '2026-03-22 16:33:26'),
(13, 'Tap (Nal) Repair/Replacement', 200, '/uploads/nul-tap-repair-basin-bathroom.jpeg', 5, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 14:56:34', '2026-03-22 16:33:26'),
(14, 'Shower Mix Tap Installation/Repair', 400, '/uploads/mix-tap-shower-repair.jpeg', 5, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:00:21', '2026-03-22 16:33:26'),
(15, 'Normal Bath Shower Repair/Installation', 200, '/uploads/normal-bathroom-shower-repair2.jpeg', 5, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:02:09', '2026-03-22 16:33:26'),
(16, 'Bath Shower Heavy Work Repair', 400, '/uploads/normal-bathroom-shower-repair2.jpeg', 5, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:03:17', '2026-03-22 16:33:26'),
(17, 'Washbasin Leakage Repair', 200, '/uploads/basin-leakage-repair-heavy-work.jpeg', 7, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:11:29', '2026-03-22 16:35:58'),
(18, 'Washbasin Blockage Removal', 200, '/uploads/basin-leakage-repair-heavy-work.jpeg', 7, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:13:40', '2026-03-22 16:35:58'),
(19, 'Washing Machine Tap/Pipe Fitting', 150, '/uploads/washing-machine-pipe-fitting.jpeg', 15, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:22:17', '2026-03-22 16:35:58'),
(20, 'Toilet Flush Repair/Installation', 200, '/uploads/toilet-flush-jetsprey-repair-installation.jpeg', 6, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:25:18', '2026-03-22 16:35:58'),
(21, 'Toilet Jet Spray, Tap, Pressure Gun Repair\r\n', 150, '/uploads/toilet-flush-jetsprey-repair-installation.jpeg', 6, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:27:31', '2026-03-22 16:35:58'),
(22, 'Switch & Socket Repair/Replacement', 100, '/uploads/socket-repair.jpeg', 10, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:30:45', '2026-03-22 16:35:58'),
(23, 'Switchboard & SocketBoard Repair', 150, '/uploads/switchboard-repair.jpeg', 10, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:33:08', '2026-03-22 16:35:58'),
(24, 'New Switch Board Point and Fitting', 250, '/uploads/switch-board-point-installation.jpeg', 10, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:35:16', '2026-03-22 16:35:58'),
(25, 'Fan Installation', 100, '/uploads/fan-installation.jpeg', 11, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:41:23', '2026-03-22 16:38:25'),
(26, 'Tube light Installation', 100, '/uploads/tubelight-installation.jpeg', 12, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:45:06', '2026-03-22 16:35:58'),
(27, 'Fan Winding and Bearing Change', 600, '/uploads/fan-coil-replacement-repair.jpeg', 11, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:46:42', '2026-03-22 16:35:58'),
(28, 'Geyser Coil & New Coil Replacement', 1200, '/uploads/geyser-coil-repair.jpeg', 14, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:48:30', '2026-03-22 16:35:58'),
(29, 'MCB Fault Repair', 200, '/uploads/mcb-fault-repairing.jpeg', 13, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:57:21', '2026-03-22 16:35:58'),
(30, 'Pigeon Net Installation', 20, '/uploads/pigeon-net-installation.jpeg', 16, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 16:13:30', '2026-03-22 16:35:58'),
(31, 'Mosquito Net Installation', 20, '/uploads/mosquito-net-installation.jpeg', 16, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 16:14:56', '2026-03-22 16:35:58'),
(33, 'AC Not Cooling', 699, '/uploads/ac-installation.jpeg', 17, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-04-17 11:06:08', '2026-04-17 11:06:08'),
(34, 'Gas Leakage / Low Cooling', 1199, '/uploads/ac-installation.jpeg', 17, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-04-17 11:17:24', '2026-04-17 11:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `service_addon`
--

CREATE TABLE `service_addon` (
  `id` int(11) NOT NULL,
  `main_service_id` int(11) NOT NULL,
  `addon_service_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_addon`
--

INSERT INTO `service_addon` (`id`, `main_service_id`, `addon_service_id`, `created_at`) VALUES
(1, 1, 3, '2026-03-15 09:37:02'),
(2, 1, 30, '2026-03-23 09:26:16'),
(3, 1, 13, '2026-03-23 09:28:06'),
(11, 33, 34, '2026-04-17 13:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `service_excludes`
--

CREATE TABLE `service_excludes` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_excludes`
--

INSERT INTO `service_excludes` (`id`, `service_id`, `icon`, `description`, `created_at`) VALUES
(1, 1, 'null', 'Kitchen: Cabinet interiors, appliance interiors, utensil cleaning', '2026-03-15 08:43:07'),
(2, 1, 'null', 'Hall / Living Room: Curtain washing, sofa/carpet shampooing, furniture moving', '2026-03-15 08:43:07'),
(3, 1, 'null', 'Bedroom: Mattress shampooing, wardrobe interiors, curtain washing', '2026-03-15 08:43:07'),
(4, 1, 'null', 'Bathroom: Plumbing work, blocked drain fixing, geyser cleaning', '2026-03-15 08:43:07'),
(5, 1, 'null', 'Balcony: Debris removal, paint removal, exterior glass cleaning', '2026-03-15 08:43:07'),
(6, 2, 'null', 'Wall wet mopping not included', '2026-03-15 08:59:32'),
(7, 2, 'null', 'Any damage will not be repaired or fixed', '2026-03-15 08:59:32'),
(8, 2, 'null', 'Appliance internal cleaning', '2026-03-15 08:59:32'),
(9, 2, 'null', 'Cabinet inside cleaning not included', '2026-03-15 08:59:32'),
(10, 2, 'null', 'Chimney or exhaust dismantling not included', '2026-03-15 08:59:32'),
(11, 4, 'null', 'Leather Treatment or Conditioning', '2026-03-17 16:55:37'),
(12, 4, 'null', 'Tear or Damage Repair', '2026-03-17 16:56:00'),
(13, 4, 'null', 'Stubborn/Old Stains that Need Chemical Treatment', '2026-03-17 16:56:19'),
(14, 4, 'null', 'Frame or Under-Sofa Cleaning', '2026-03-17 16:56:39'),
(15, 10, 'null', 'Removal of hard water scaling on ceilings, walls, and inaccessible areas.', '2026-03-21 14:34:49'),
(16, 10, 'null', 'Plumbing work, broken fitting repairs, or replacements.', '2026-03-21 14:35:13'),
(17, 10, 'null', 'Cleaning of overhead tanks, underground tanks, or pipelines.', '2026-03-21 14:35:46'),
(18, 10, 'null', 'Pest control, waterproofing, and odor treatment services.', '2026-03-21 14:36:07'),
(19, 5, 'null', 'Wall wet mopping not included', '2026-03-21 14:41:17'),
(20, 5, 'null', 'Any damage will not be repaired or fixed', '2026-03-21 14:41:42'),
(21, 5, 'null', 'Cabinet inside cleaning not included', '2026-03-21 14:41:59'),
(22, 5, 'null', 'Chimney or exhaust dismantling not included', '2026-03-21 14:42:15'),
(23, 6, 'null', 'Wall wet mopping not included', '2026-03-21 14:46:22'),
(24, 6, 'null', 'Any damage will not be repaired or fixed', '2026-03-21 14:46:36'),
(25, 6, 'null', 'Chimney or exhaust dismantling not included', '2026-03-21 14:46:52'),
(26, 6, 'null', 'Chimney or exhaust dismantling not included', '2026-03-21 14:47:08');

-- --------------------------------------------------------

--
-- Table structure for table `service_includes`
--

CREATE TABLE `service_includes` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_includes`
--

INSERT INTO `service_includes` (`id`, `service_id`, `icon`, `description`, `created_at`) VALUES
(1, 1, 'null', 'Kitchen: Floor, walls, ceiling, slab, sink, cabinet exterior, tiles cleaning', '2026-03-15 08:35:44'),
(2, 1, 'null', 'Hall / Living Room: Floor, walls, ceiling, doors, windows, fan, switchboards cleaning', '2026-03-15 08:35:44'),
(3, 1, 'null', 'Bedroom: Floor, walls, ceiling, doors, windows, fan, switchboards cleaning', '2026-03-15 08:35:44'),
(4, 1, 'null', 'Bathroom: Floor, wall tiles, ceiling, WC, sink, mirror, fittings cleaning', '2026-03-15 08:35:44'),
(5, 1, 'null', 'Balcony: Floor, railing, walls, drain area cleaning', '2026-03-15 08:35:44'),
(6, 2, 'null', 'House Cleaning (Kitchen · Hall · 2 Bedrooms · 2 Bathrooms · Balcony)', '2026-03-15 08:53:55'),
(7, 2, 'null', 'Kitchen (Platform · Sink · Stove · Tiles · Floor · Fan · Exhaust · Switch Boards · Cabinets Outer)', '2026-03-15 08:53:55'),
(8, 2, 'null', 'Hall (Floor · Walls · Ceiling · Fan · Main Door · Windows/Slider · Sofa Dry · Tables · Chairs)', '2026-03-15 08:53:55'),
(9, 2, 'null', 'Bedroom 1 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)', '2026-03-15 08:53:55'),
(10, 2, 'null', 'Bedroom 2 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)', '2026-03-15 08:53:55'),
(11, 2, 'null', 'Bathroom 1 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)', '2026-03-15 08:53:55'),
(12, 2, 'null', 'Bathroom 2 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)', '2026-03-15 08:53:55'),
(13, 2, 'null', 'Balcony (Grills · Railings · Floor Sweep/Mop)', '2026-03-15 08:53:55'),
(14, 4, 'null', 'Vacuuming Sofa Surface to Remove Dust & Debris poster', '2026-03-17 16:52:50'),
(15, 4, 'null', 'Dry Dirt & Stain Spot Cleaning', '2026-03-17 16:53:26'),
(16, 4, 'null', 'Shampooing & Deep Cleaning Fabric Upholstery', '2026-03-17 16:53:44'),
(17, 4, 'null', 'Cushion & Pillow Fluffing & Cleaning', '2026-03-17 16:54:08'),
(18, 4, 'null', 'Armrest, Backrest & Outer Surface Wipe', '2026-03-17 16:54:33'),
(19, 4, 'null', 'Drying & Airing to Remove Moisture', '2026-03-17 16:54:52'),
(20, 10, 'null', 'Floor scrubbing & deep wet mopping', '2026-03-21 14:31:27'),
(21, 10, 'null', 'Wall tiles scrubbing & cleaning', '2026-03-21 14:31:54'),
(22, 10, 'null', 'WC seat deep cleaning', '2026-03-21 14:32:11'),
(23, 10, 'null', 'Sink & tap washing', '2026-03-21 14:32:27'),
(24, 10, 'null', 'Mirror & glass cleaning', '2026-03-21 14:32:44'),
(25, 10, 'null', 'Exhaust fan outer dust wipe', '2026-03-21 14:33:06'),
(26, 5, 'null', 'House Cleaning (Kitchen · Hall · 3 Bedrooms · 2 Bathrooms · Balcony)', '2026-03-21 14:37:20'),
(27, 5, 'null', 'Kitchen (Platform · Sink · Stove · Tiles · Floor · Fan · Exhaust · Switch Boards · Cabinets Outer)', '2026-03-21 14:37:38'),
(28, 5, 'null', 'Hall (Floor · Walls · Ceiling · Fan · Main Door · Windows/Slider · Sofa Dry · Tables · Chairs)', '2026-03-21 14:39:04'),
(29, 5, 'null', 'Bedroom 1 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe', '2026-03-21 14:39:22'),
(30, 5, 'null', 'Bedroom 2 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)', '2026-03-21 14:39:37'),
(31, 5, 'null', 'Bedroom 3 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)', '2026-03-21 14:39:52'),
(32, 5, 'null', 'Bathroom 1 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)', '2026-03-21 14:40:09'),
(33, 5, 'null', 'Bathroom 2 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)', '2026-03-21 14:40:25'),
(34, 5, 'null', 'Balcony (Grills · Railings · Floor Sweep/Mop)', '2026-03-21 14:40:50'),
(35, 6, 'null', 'House Cleaning (Kitchen · Hall · 4 Bedrooms · 3 Bathrooms · Balcony)', '2026-03-21 14:42:52'),
(36, 6, 'null', 'Kitchen (Platform · Sink · Stove · Tiles · Floor · Fan · Exhaust · Switch Boards · Cabinets Outer)', '2026-03-21 14:43:17'),
(37, 6, 'null', 'Hall (Floor · Walls · Ceiling · Fan · Main Door · Windows/Slider · Sofa Dry · Tables · Chairs)', '2026-03-21 14:43:35'),
(38, 6, 'null', 'Bedroom 1 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)', '2026-03-21 14:43:51'),
(39, 6, 'null', 'Bedroom 2 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)', '2026-03-21 14:44:06'),
(40, 6, 'null', 'Bedroom 3 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)', '2026-03-21 14:44:21'),
(41, 6, 'null', 'Bedroom 4 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)', '2026-03-21 14:44:39'),
(42, 6, 'null', 'Bathroom 1 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)', '2026-03-21 14:44:54'),
(43, 6, 'null', 'Bathroom 2 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)', '2026-03-21 14:45:12'),
(44, 6, 'null', 'Bathroom 3 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)', '2026-03-21 14:45:26'),
(45, 6, 'null', 'Balcony (Grills · Railings · Floor Sweep/Mop)', '2026-03-21 14:45:39');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `name`, `category_id`, `created_at`, `modified_at`) VALUES
(1, 'Home Deep Cleaning', 1, '2026-03-15 07:59:07', '2026-03-15 07:59:07'),
(2, 'Sofa Cleaning', 1, '2026-03-15 08:01:15', '2026-03-15 08:01:15'),
(3, 'Bathroom Cleaning', 1, '2026-03-15 08:02:13', '2026-03-15 08:02:13'),
(4, 'Kitchen Cleaning', 1, '2026-03-15 08:02:35', '2026-03-15 08:02:35'),
(5, 'Tap and Shower Services', 2, '2026-03-15 08:04:03', '2026-03-15 08:06:27'),
(6, 'Toilet and Flush Services', 2, '2026-03-15 08:04:47', '2026-03-15 08:06:41'),
(7, 'Washbasin Services', 2, '2026-03-15 08:06:11', '2026-03-15 08:06:11'),
(8, 'Geyser Services', 2, '2026-03-15 08:07:04', '2026-03-15 08:07:04'),
(9, 'Pipe and Appliance Connection', 2, '2026-03-15 08:07:26', '2026-03-15 08:07:26'),
(10, 'Switch and Socket Services', 3, '2026-03-15 08:08:34', '2026-03-15 08:08:34'),
(11, 'Fan Services', 3, '2026-03-15 08:09:17', '2026-03-15 08:09:17'),
(12, 'Lighting Services', 3, '2026-03-15 08:09:33', '2026-03-15 08:09:33'),
(13, 'MCB Services', 3, '2026-03-15 08:09:49', '2026-03-21 15:55:01'),
(14, 'Geyser Electrical Repair', 3, '2026-03-15 08:10:11', '2026-03-15 08:10:11'),
(15, 'Washing Machine Service', 2, '2026-03-21 15:16:19', '2026-03-21 15:16:19'),
(16, 'Net Installation Services', 7, '2026-03-21 16:11:19', '2026-03-21 16:11:19'),
(17, 'AC Repair & Troubleshooting', 4, '2026-04-17 10:32:03', '2026-04-17 10:32:03'),
(18, 'Office Cleaning', 8, '2026-04-17 18:28:23', '2026-04-17 18:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `name`, `gender`, `created_at`, `modified_at`) VALUES
(2, '9595454565', 'Rupali', 'Female', '2026-03-13 18:02:24', '2026-04-17 18:52:38'),
(5, '9595889595', 'Shriya Jadhav', 'Female', '2026-03-19 13:07:24', '2026-03-19 13:16:10'),
(6, '9090202020', '', '', '2026-03-20 05:47:50', '2026-03-20 05:47:50'),
(7, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:10:51', '2026-03-20 12:33:17'),
(19, '6565653333', 'Richa Patel', 'Female', '2026-03-20 12:38:33', '2026-03-20 12:39:19'),
(20, '9448889820', '', '', '2026-03-20 12:51:25', '2026-03-20 12:51:25'),
(21, '7878789898', 'Siya Varma', 'Female', '2026-03-20 13:04:39', '2026-03-25 15:51:45'),
(22, '7845784511', 'Rupali D. Biradar', 'Female', '2026-03-20 15:05:34', '2026-03-20 16:28:53'),
(23, '7841252544', '', '', '2026-03-23 05:04:16', '2026-03-23 05:04:16'),
(24, '7545754555', '', '', '2026-03-23 05:33:35', '2026-03-23 05:33:35'),
(25, '9888982010', '', '', '2026-03-23 06:44:35', '2026-03-23 06:44:35'),
(26, '8484845252', 'Rishi ', 'Male', '2026-03-23 08:12:40', '2026-03-23 12:14:04'),
(27, '7878747410', 'Neha Patil', 'Female', '2026-03-24 15:07:28', '2026-03-24 15:08:24'),
(28, '6365636522', '', '', '2026-03-24 15:38:52', '2026-03-24 15:38:52'),
(29, '8584858422', '', '', '2026-03-24 15:41:19', '2026-03-24 15:41:19'),
(32, '9898989898', '', '', '2026-03-24 16:52:39', '2026-03-24 16:52:39'),
(33, '7418527485', 'Riddhi ', 'Female', '2026-03-25 11:19:17', '2026-03-25 11:48:51'),
(34, '8585855454', '', '', '2026-03-25 12:06:28', '2026-03-25 12:06:28'),
(38, '8528528520', 'Radha Garewal', 'Female', '2026-03-25 16:11:09', '2026-03-26 08:44:27'),
(40, '7275727541', 'Sidhhi Kulkarni', 'Female', '2026-03-26 08:47:16', '2026-03-26 08:48:36'),
(41, '9999899998', 'Riya Sharma', 'Female', '2026-03-26 14:00:35', '2026-03-26 15:29:27'),
(42, '9845414750', '', '', '2026-03-27 11:38:12', '2026-03-27 11:38:12'),
(44, '9874459650', '', '', '2026-03-27 12:12:02', '2026-03-27 12:12:02'),
(45, '8584878900', '', '', '2026-03-27 12:51:52', '2026-03-27 12:51:52'),
(46, '6546541111', 'Divyanka Patil', 'Female', '2026-03-27 19:53:44', '2026-03-27 21:44:47'),
(47, '9000010000', 'Anu Aarya', 'Female', '2026-03-27 22:02:48', '2026-04-03 06:54:26'),
(49, '8487878787', 'Ram ', 'Male', '2026-03-28 08:16:37', '2026-03-28 08:17:56'),
(50, '8888884444', 'Ram D. Patil', 'Male', '2026-03-28 08:21:09', '2026-03-29 08:45:13'),
(51, '8568585885', 'Rutu Panchal', 'Female', '2026-03-29 10:16:33', '2026-03-29 10:18:46'),
(52, '9999999990', '', '', '2026-03-29 12:24:51', '2026-03-29 12:24:51'),
(53, '7777777888', 'Riya Sharma', 'Female', '2026-03-29 13:26:02', '2026-03-29 13:28:35'),
(54, '6555555555', 'Jignesh Yadav', 'Male', '2026-03-29 13:36:28', '2026-03-29 13:38:13'),
(55, '5858545250', '', '', '2026-03-31 17:48:57', '2026-03-31 17:48:57'),
(57, '6546321000', '', '', '2026-03-31 18:05:27', '2026-03-31 18:05:27'),
(58, '7070454570', '', '', '2026-03-31 18:13:51', '2026-03-31 18:13:51'),
(59, '9021984411', '', '', '2026-04-01 07:54:40', '2026-04-01 07:54:40'),
(60, '8000000001', '', '', '2026-04-01 08:28:20', '2026-04-01 08:28:20'),
(62, '8000000002', '', '', '2026-04-01 08:49:06', '2026-04-01 08:49:06'),
(65, '8000000003', '', '', '2026-04-01 09:51:38', '2026-04-01 09:51:38'),
(68, '8000000004', '', '', '2026-04-01 11:48:57', '2026-04-01 11:48:57'),
(70, '8000000005', '', '', '2026-04-01 17:32:43', '2026-04-01 17:32:43'),
(72, '8000000006', '', '', '2026-04-01 17:48:18', '2026-04-01 17:48:18'),
(73, '8000000008', '', '', '2026-04-01 18:31:41', '2026-04-01 18:31:41'),
(74, '8000000009', '', '', '2026-04-01 18:49:07', '2026-04-01 18:49:07'),
(75, '8000000010', '', '', '2026-04-02 13:33:49', '2026-04-02 13:33:49'),
(78, '9000000001', 'Sayali D. Kothare', 'Female', '2026-04-02 14:04:58', '2026-04-03 18:10:27'),
(91, '7000000001', 'Aarya Patil', 'Female', '2026-04-03 06:34:22', '2026-04-03 06:36:00'),
(101, '9021954403', 'Riddhi Shivay', 'Female', '2026-04-03 18:31:58', '2026-04-03 18:33:18'),
(102, '9000000002', 'Anu Aarya', 'Female', '2026-04-04 07:39:34', '2026-04-05 08:17:38'),
(103, '8181818181', '', '', '2026-04-04 08:07:15', '2026-04-04 08:07:15'),
(104, '9025252120', 'Radha Biradar', 'Female', '2026-04-04 08:25:14', '2026-04-04 09:31:26'),
(107, '7575752525', 'Ramesh Biradar', 'Male', '2026-04-09 04:59:58', '2026-04-09 05:48:42'),
(109, '8018018010', '', '', '2026-04-09 18:16:06', '2026-04-09 18:16:06'),
(110, '9639639630', 'nia', 'Female', '2026-04-12 08:15:16', '2026-04-12 09:12:45'),
(111, '8523852300', 'Vijay Sharma', 'Male', '2026-04-13 07:31:46', '2026-04-13 07:35:09'),
(112, '8787878787', 'Sneha Bhure', 'Female', '2026-04-13 07:46:25', '2026-04-13 07:47:50'),
(113, '6126126120', 'Yogita Patil', 'Female', '2026-04-13 09:19:14', '2026-04-13 09:26:00'),
(114, '9021902100', 'Meera Deshpande', 'Female', '2026-04-13 12:00:39', '2026-04-13 12:02:29'),
(115, '7841999100', '', '', '2026-04-17 11:15:23', '2026-04-17 11:15:23'),
(116, '9797979700', 'Rupesh', 'Male', '2026-04-17 19:00:44', '2026-04-17 19:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_otps`
--

CREATE TABLE `user_otps` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `expiration_time` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_otps`
--

INSERT INTO `user_otps` (`id`, `user_id`, `otp_code`, `is_used`, `expiration_time`, `created_at`, `modified_at`) VALUES
(2, '9595454565', '183589', 1, 1773425121178, '2026-03-13 18:00:21', '2026-03-13 18:02:24'),
(3, '9996668881', '726926', 1, 1773571209801, '2026-03-15 10:35:09', '2026-03-15 10:35:53'),
(4, '9996668881', '670307', 0, 1773909977495, '2026-03-19 08:41:17', '2026-03-19 08:41:17'),
(5, '9996668881', '167547', 0, 1773910106488, '2026-03-19 08:43:26', '2026-03-19 08:43:26'),
(6, '9996668881', '813889', 1, 1773911151999, '2026-03-19 09:00:52', '2026-03-19 09:01:32'),
(7, '9595889595', '174018', 1, 1773925879779, '2026-03-19 13:06:19', '2026-03-19 13:07:24'),
(8, '9090202020', '780066', 1, 1773985955594, '2026-03-20 05:47:35', '2026-03-20 05:47:50'),
(9, '8888899999', '909586', 0, 1773990007119, '2026-03-20 06:55:07', '2026-03-20 06:55:07'),
(10, '4546686896', '687361', 0, 1773990050014, '2026-03-20 06:55:50', '2026-03-20 06:55:50'),
(11, '4546686896', '618460', 0, 1773990052096, '2026-03-20 06:55:52', '2026-03-20 06:55:52'),
(12, '9598959895', '600569', 0, 1773990066505, '2026-03-20 06:56:06', '2026-03-20 06:56:06'),
(13, '9598959895', '320360', 0, 1773990070856, '2026-03-20 06:56:10', '2026-03-20 06:56:10'),
(14, '9820982095', '648847', 0, 1773990091521, '2026-03-20 06:56:31', '2026-03-20 06:56:31'),
(15, '9198959895', '353692', 0, 1773991887807, '2026-03-20 07:26:27', '2026-03-20 07:26:27'),
(16, '7845127845', '592251', 0, 1773992654126, '2026-03-20 07:39:14', '2026-03-20 07:39:14'),
(17, '9898989852', '963232', 0, 1773992716011, '2026-03-20 07:40:16', '2026-03-20 07:40:16'),
(18, '8282646400', '222484', 1, 1773994512226, '2026-03-20 08:10:12', '2026-03-20 08:10:51'),
(19, '6565653333', '912842', 1, 1774010565952, '2026-03-20 12:37:45', '2026-03-20 12:38:33'),
(20, '9448889820', '881253', 1, 1774011339366, '2026-03-20 12:50:39', '2026-03-20 12:51:25'),
(21, '7878789898', '593118', 0, 1774011914537, '2026-03-20 13:00:14', '2026-03-20 13:00:14'),
(22, '7878789898', '311057', 1, 1774012150899, '2026-03-20 13:04:10', '2026-03-20 13:04:39'),
(23, '7845784511', '495876', 1, 1774019415425, '2026-03-20 15:05:15', '2026-03-20 15:05:34'),
(24, '7841252544', '925386', 1, 1774242546448, '2026-03-23 05:04:06', '2026-03-23 05:04:16'),
(25, '7545754555', '980992', 1, 1774244303697, '2026-03-23 05:33:23', '2026-03-23 05:33:34'),
(26, '9888982010', '490763', 1, 1774248564912, '2026-03-23 06:44:24', '2026-03-23 06:44:35'),
(27, '8484845252', '580995', 1, 1774253844891, '2026-03-23 08:12:24', '2026-03-23 08:12:40'),
(28, '7878747410', '911626', 1, 1774365121051, '2026-03-24 15:07:01', '2026-03-24 15:07:28'),
(29, '6365636522', '451302', 1, 1774367017403, '2026-03-24 15:38:37', '2026-03-24 15:38:52'),
(30, '8584858422', '116458', 1, 1774367169453, '2026-03-24 15:41:09', '2026-03-24 15:41:19'),
(31, '6365636522', '499993', 1, 1774367263449, '2026-03-24 15:42:43', '2026-03-24 15:42:56'),
(32, '8584858422', '923164', 1, 1774367383550, '2026-03-24 15:44:43', '2026-03-24 15:45:12'),
(33, '9898989898', '531286', 1, 1774371441167, '2026-03-24 16:52:21', '2026-03-24 16:52:39'),
(34, '7418527485', '255257', 1, 1774437841709, '2026-03-25 11:19:01', '2026-03-25 11:19:17'),
(35, '8585855454', '658216', 1, 1774440676468, '2026-03-25 12:06:16', '2026-03-25 12:06:28'),
(36, '7878789898', '621031', 1, 1774442135419, '2026-03-25 12:30:35', '2026-03-25 12:30:48'),
(37, '7878789898', '331178', 1, 1774453139381, '2026-03-25 15:33:59', '2026-03-25 15:34:21'),
(38, '7878789898', '703456', 1, 1774454272710, '2026-03-25 15:52:52', '2026-03-25 15:53:05'),
(39, '8528528520', '890314', 1, 1774455357611, '2026-03-25 16:10:57', '2026-03-25 16:11:09'),
(40, '8528528520', '207068', 1, 1774455478011, '2026-03-25 16:12:58', '2026-03-25 16:13:08'),
(41, '7275727541', '840728', 1, 1774515124641, '2026-03-26 08:47:04', '2026-03-26 08:47:16'),
(42, '9999899998', '411738', 1, 1774533925155, '2026-03-26 14:00:25', '2026-03-26 14:00:35'),
(43, '9845414750', '143636', 1, 1774611769645, '2026-03-27 11:37:49', '2026-03-27 11:38:12'),
(44, '6565653333', '719838', 1, 1774613726617, '2026-03-27 12:10:26', '2026-03-27 12:10:52'),
(45, '9874459650', '556320', 1, 1774613797962, '2026-03-27 12:11:37', '2026-03-27 12:12:02'),
(46, '8584878900', '777150', 1, 1774616191136, '2026-03-27 12:51:31', '2026-03-27 12:51:52'),
(47, '6546541111', '998106', 1, 1774641513164, '2026-03-27 19:53:33', '2026-03-27 19:53:44'),
(48, '9000010000', '372971', 1, 1774649240046, '2026-03-27 22:02:20', '2026-03-27 22:02:48'),
(49, '9000010000', '237966', 1, 1774676842073, '2026-03-28 05:42:22', '2026-03-28 05:42:42'),
(50, '8487878787', '402497', 1, 1774686086843, '2026-03-28 08:16:26', '2026-03-28 08:16:37'),
(51, '8888884444', '783112', 1, 1774686355967, '2026-03-28 08:20:55', '2026-03-28 08:21:09'),
(52, '8568585885', '344230', 1, 1774779680422, '2026-03-29 10:16:20', '2026-03-29 10:16:33'),
(53, '9999999990', '870821', 1, 1774787377019, '2026-03-29 12:24:37', '2026-03-29 12:24:51'),
(54, '7777777888', '140681', 1, 1774791035969, '2026-03-29 13:25:35', '2026-03-29 13:26:02'),
(55, '6555555555', '553829', 1, 1774791670018, '2026-03-29 13:36:10', '2026-03-29 13:36:28'),
(56, '8181818181', '503618', 0, 1774978058788, '2026-03-31 17:22:38', '2026-03-31 17:22:38'),
(57, '5858545250', '502808', 1, 1774979610789, '2026-03-31 17:48:30', '2026-03-31 17:48:57'),
(58, '6546321000', '529344', 1, 1774980604658, '2026-03-31 18:05:04', '2026-03-31 18:05:27'),
(59, '7070454570', '563932', 1, 1774981111017, '2026-03-31 18:13:31', '2026-03-31 18:13:51'),
(60, '9021984411', '783025', 0, 1775028160057, '2026-04-01 07:17:40', '2026-04-01 07:17:40'),
(61, '9021984411', '584365', 0, 1775028175797, '2026-04-01 07:17:55', '2026-04-01 07:17:55'),
(62, '9021984411', '959753', 1, 1775030357512, '2026-04-01 07:54:17', '2026-04-01 07:54:40'),
(63, '8000000001', '436092', 1, 1775032377974, '2026-04-01 08:27:57', '2026-04-01 08:28:20'),
(64, '8000000002', '179022', 1, 1775033632307, '2026-04-01 08:48:52', '2026-04-01 08:49:06'),
(65, '8000000002', '964104', 1, 1775034685323, '2026-04-01 09:06:25', '2026-04-01 09:06:41'),
(66, '8000000003', '922410', 1, 1775037365520, '2026-04-01 09:51:05', '2026-04-01 09:51:38'),
(67, '8000000004', '374989', 1, 1775044419417, '2026-04-01 11:48:39', '2026-04-01 11:48:57'),
(68, '8000000004', '733198', 1, 1775064644594, '2026-04-01 17:25:44', '2026-04-01 17:25:56'),
(69, '8000000005', '394697', 1, 1775065050219, '2026-04-01 17:32:30', '2026-04-01 17:32:43'),
(70, '8000000005', '514239', 1, 1775065687939, '2026-04-01 17:43:07', '2026-04-01 17:43:19'),
(71, '8000000006', '421662', 1, 1775065948853, '2026-04-01 17:47:28', '2026-04-01 17:48:18'),
(72, '8000000008', '178393', 1, 1775068584453, '2026-04-01 18:31:24', '2026-04-01 18:31:41'),
(73, '8000000009', '763942', 1, 1775069625568, '2026-04-01 18:48:45', '2026-04-01 18:49:07'),
(74, '8000000010', '838587', 1, 1775137114216, '2026-04-02 13:33:34', '2026-04-02 13:33:49'),
(75, '8000000009', '551541', 1, 1775137685338, '2026-04-02 13:43:05', '2026-04-02 13:44:27'),
(76, '8000000001', '374405', 1, 1775138394689, '2026-04-02 13:54:54', '2026-04-02 13:55:11'),
(77, '9000000001', '137109', 1, 1775138984127, '2026-04-02 14:04:44', '2026-04-02 14:04:58'),
(78, '9000000001', '841954', 1, 1775139457216, '2026-04-02 14:12:37', '2026-04-02 14:12:56'),
(79, '9000000001', '492569', 1, 1775140283217, '2026-04-02 14:26:23', '2026-04-02 14:26:36'),
(80, '9000000001', '857250', 1, 1775140813961, '2026-04-02 14:35:13', '2026-04-02 14:35:25'),
(81, '9000000001', '479038', 1, 1775190401413, '2026-04-03 04:21:41', '2026-04-03 04:21:54'),
(82, '9000000001', '873411', 1, 1775190869459, '2026-04-03 04:29:29', '2026-04-03 04:29:42'),
(83, '9000000001', '246993', 1, 1775191496440, '2026-04-03 04:39:56', '2026-04-03 04:40:08'),
(84, '9000000001', '710627', 1, 1775192413524, '2026-04-03 04:55:13', '2026-04-03 04:55:38'),
(85, '9000000001', '388138', 1, 1775195646278, '2026-04-03 05:49:06', '2026-04-03 05:49:17'),
(86, '9000000001', '636145', 1, 1775196125003, '2026-04-03 05:57:05', '2026-04-03 05:57:20'),
(87, '9000000001', '382998', 1, 1775196158328, '2026-04-03 05:57:38', '2026-04-03 05:57:48'),
(88, '9000000001', '820725', 1, 1775196777683, '2026-04-03 06:07:57', '2026-04-03 06:08:08'),
(89, '9000000001', '950699', 1, 1775197056064, '2026-04-03 06:12:36', '2026-04-03 06:12:48'),
(90, '7000000001', '365408', 1, 1775198351522, '2026-04-03 06:34:11', '2026-04-03 06:34:22'),
(91, '9000000001', '630318', 1, 1775201418421, '2026-04-03 07:25:18', '2026-04-03 07:25:33'),
(92, '9000000001', '608973', 1, 1775202765885, '2026-04-03 07:47:45', '2026-04-03 07:47:59'),
(93, '9000000001', '707026', 1, 1775202900619, '2026-04-03 07:50:00', '2026-04-03 07:50:12'),
(94, '9000000001', '449392', 1, 1775207754152, '2026-04-03 09:10:54', '2026-04-03 09:11:06'),
(95, '9000000001', '378456', 1, 1775226692825, '2026-04-03 14:26:32', '2026-04-03 14:26:56'),
(96, '9000000001', '270085', 1, 1775229234391, '2026-04-03 15:08:54', '2026-04-03 15:09:20'),
(97, '9000000001', '490915', 1, 1775237859917, '2026-04-03 17:32:39', '2026-04-03 17:33:28'),
(98, '9000000001', '538708', 1, 1775240096629, '2026-04-03 18:09:56', '2026-04-03 18:10:12'),
(99, '9000000001', '138504', 1, 1775240684832, '2026-04-03 18:19:44', '2026-04-03 18:19:58'),
(100, '9021954403', '388082', 1, 1775241406289, '2026-04-03 18:31:46', '2026-04-03 18:31:58'),
(101, '9000000002', '322478', 1, 1775288663149, '2026-04-04 07:39:23', '2026-04-04 07:39:34'),
(102, '8181818181', '130245', 1, 1775290314216, '2026-04-04 08:06:54', '2026-04-04 08:07:15'),
(103, '9025252120', '621329', 1, 1775291400941, '2026-04-04 08:25:00', '2026-04-04 08:25:14'),
(104, '9000000002', '702717', 1, 1775377272170, '2026-04-05 08:16:12', '2026-04-05 08:16:32'),
(105, '9025252120', '673378', 1, 1775413798074, '2026-04-05 18:24:58', '2026-04-05 18:25:24'),
(106, '7575752525', '389986', 1, 1775711086756, '2026-04-09 04:59:46', '2026-04-09 04:59:58'),
(107, '7575752525', '672875', 1, 1775715060345, '2026-04-09 06:06:00', '2026-04-09 06:06:23'),
(108, '8018018010', '885629', 1, 1775758818426, '2026-04-09 18:15:18', '2026-04-09 18:16:06'),
(109, '9639639630', '235609', 1, 1775982004071, '2026-04-12 08:15:04', '2026-04-12 08:15:16'),
(110, '8523852300', '165532', 1, 1776065795693, '2026-04-13 07:31:35', '2026-04-13 07:31:46'),
(111, '8523852300', '957035', 1, 1776066132675, '2026-04-13 07:37:12', '2026-04-13 07:37:23'),
(112, '8787878787', '404337', 1, 1776066675620, '2026-04-13 07:46:15', '2026-04-13 07:46:25'),
(113, '8523852300', '769793', 0, 1776072217063, '2026-04-13 09:18:37', '2026-04-13 09:18:37'),
(114, '6126126120', '849270', 1, 1776072243032, '2026-04-13 09:19:03', '2026-04-13 09:19:14'),
(115, '8523852300', '821497', 1, 1776076670282, '2026-04-13 10:32:50', '2026-04-13 10:33:09'),
(116, '9021902100', '205802', 1, 1776081925448, '2026-04-13 12:00:25', '2026-04-13 12:00:39'),
(117, '7841999100', '439367', 1, 1776424805894, '2026-04-17 11:15:05', '2026-04-17 11:15:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_order_id` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_mobile` (`mobile_number`),
  ADD KEY `service_category_id` (`service_category_id`);

--
-- Indexes for table `partner_orders`
--
ALTER TABLE `partner_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_payouts`
--
ALTER TABLE `partner_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_partner_payouts_partner_order` (`partner_order_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `service_addon`
--
ALTER TABLE `service_addon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_service_id` (`main_service_id`),
  ADD KEY `addon_service_id` (`addon_service_id`);

--
-- Indexes for table `service_excludes`
--
ALTER TABLE `service_excludes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `service_includes`
--
ALTER TABLE `service_includes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_id` (`user_id`);

--
-- Indexes for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `partner_payouts`
--
ALTER TABLE `partner_payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `service_addon`
--
ALTER TABLE `service_addon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `service_excludes`
--
ALTER TABLE `service_excludes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `service_includes`
--
ALTER TABLE `service_includes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `partners`
--
ALTER TABLE `partners`
  ADD CONSTRAINT `partners_ibfk_1` FOREIGN KEY (`service_category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `partner_payouts`
--
ALTER TABLE `partner_payouts`
  ADD CONSTRAINT `fk_partner_payouts_partner_order` FOREIGN KEY (`partner_order_id`) REFERENCES `partner_orders` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`);

--
-- Constraints for table `service_addon`
--
ALTER TABLE `service_addon`
  ADD CONSTRAINT `service_addon_ibfk_1` FOREIGN KEY (`main_service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `service_addon_ibfk_2` FOREIGN KEY (`addon_service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `service_excludes`
--
ALTER TABLE `service_excludes`
  ADD CONSTRAINT `service_excludes_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `service_includes`
--
ALTER TABLE `service_includes`
  ADD CONSTRAINT `service_includes_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
