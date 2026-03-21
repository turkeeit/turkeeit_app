-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 21, 2026 at 05:31 PM
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
(5, '9595454565', '1211', 'krishna Residency', 'Kothrud', 'Near Metro', 'Pune', 'Maharashtra', '411038', '2026-03-13 18:07:59', '2026-03-13 18:45:26'),
(6, '9448889820', '88888', 'Sai Residency', 'Dombivli East', 'Near Railway Station', 'Mumbai', 'Maharashtra', '421201', '2026-03-15 11:41:00', '2026-03-15 11:41:32'),
(8, '9996668881', '2001', 'Shivanand Residency', 'Hinjewadi', 'Near Metro', 'Pune', 'Maharashtra', '411038', '2026-03-17 07:45:46', '2026-03-17 07:58:52'),
(9, '9595889595', '1111', 'Nayra Residency', 'Kothrud', 'Near Metro', 'Pune', 'Maharashtra', '411038', '2026-03-19 13:17:09', '2026-03-19 13:17:09'),
(10, '8282646400', '5656', 'Om Residency', 'Dombivli East', 'Near Railway Station', 'Mumbai', 'Maharashtra', '421201', '2026-03-20 12:33:59', '2026-03-20 12:33:59'),
(11, '6565653333', '6010', 'Arjun Residancy', 'Dombivli East', 'Near Metro', 'Mumbai', 'Maharashtra', '421201', '2026-03-20 12:41:00', '2026-03-20 12:41:00'),
(12, '7878789898', '6111', 'Arjun Residancy', 'Dombivli East', 'Near Metro', 'Mumbai', 'Maharashtra', '421201', '2026-03-20 13:23:23', '2026-03-20 13:23:23');

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
(5, '9595889595', 1, '2BHK Deep Cleaning', 4200, 'uploads/1bhk-deep-cleaning.jpeg', 1, '2026-03-19 13:13:20', '2026-03-19 13:13:20');

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
(1, 'Cleaner', '2026-03-15 07:36:44', '2026-03-20 14:49:09'),
(2, 'Plumber', '2026-03-15 07:37:28', '2026-03-20 14:49:09'),
(3, 'Electrician', '2026-03-15 07:39:18', '2026-03-20 14:49:09'),
(4, 'Acrepair', '2026-03-15 07:43:26', '2026-03-20 14:49:09'),
(5, 'Waterpurifier', '2026-03-15 07:43:49', '2026-03-20 14:49:09'),
(6, 'Carpenter', '2026-03-15 07:43:59', '2026-03-20 14:49:09'),
(7, 'Net Installation ', '2026-03-20 14:48:01', '2026-03-21 16:10:43');

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
  `service_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `status`, `total_price`, `address`, `payment_id`, `razorpay_order_id`, `created_at`, `modified_at`, `service_date`, `service_time`) VALUES
(1, '9b533d65-3edc-4bd6-b825-199c31c5aad2', '9996668881', 'confirmed', 3350, 'Shivanand Residency, Hinjewadi, Pune', 'cod_168b0399', 'order_SSDtRIqWHTuroa', '2026-03-17 08:14:36', '2026-03-17 13:28:10', NULL, NULL),
(2, 'fa127117-e019-40cc-956c-149cad9037cb', '9996668881', '', 6700, 'Shivanand Residency, Hinjewadi, Pune', 'cod_33b1c629', NULL, '2026-03-17 11:47:17', '2026-03-17 13:23:08', '2026-03-20', '19:40:00'),
(3, '7d13a1c2-2045-4b7d-928b-5d96820eeb9d', '9996668881', 'confirmed', 599, 'Shivanand Residency, Hinjewadi, Pune', 'test_payment_002', 'order_SSMqkoyjqEsPdg', '2026-03-17 16:59:12', '2026-03-17 17:50:17', '2026-03-20', '19:40:00'),
(4, '2efe49d3-dba6-42f0-b43b-9985d382724e', '9996668881', 'confirmed', 599, 'Shivanand Residency, Hinjewadi, Pune', 'test_payment_002', 'order_SSMqkoyjqEsPdg', '2026-03-17 17:00:18', '2026-03-17 17:50:58', '2026-03-20', '19:40:00'),
(5, '5f59b11c-3e06-469f-b716-8a6a65c11178', '7878789898', 'pending', 4200, '6111, Arjun Residency, Dombivli East , Mumbai', NULL, 'order_STUq2OEUZGNBHg', '2026-03-20 13:28:10', '2026-03-20 13:28:10', NULL, NULL),
(6, '2b772ff0-b0b2-4d8f-ac85-2d9a43444659', '7878789898', 'pending', 4200, '6111, Arjun Residency, Dombivli East , Mumbai', NULL, 'order_STV1jKcA7cJCi4', '2026-03-20 13:39:14', '2026-03-20 13:39:14', NULL, NULL),
(7, '6d32c840-48d8-4d86-a505-c3abb7c9c631', '7878789898', 'pending', 4200, '6111, Arjun Residency, Dombivli East , Mumbai', NULL, 'order_STV39oiJUIBCFF', '2026-03-20 13:40:35', '2026-03-20 13:40:35', NULL, NULL),
(8, 'bddd023e-3e6e-408c-b61d-e9f987d3c670', '7878789898', 'confirmed', 4200, '6111, Arjun Residency, Dombivli East , Mumbai', 'test_payment_002', 'order_SSMqkoyjqEsPdg', '2026-03-20 13:43:32', '2026-03-20 13:50:32', NULL, NULL);

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
(11, 'bddd023e-3e6e-408c-b61d-e9f987d3c670', 4, 1, 599, 599, '2026-03-20 13:43:32', '2026-03-20 13:43:32');

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
(1, '1BHK Deep Cleaning', 3200, 'uploads/1bhk-deep-cleaning.jpeg', 1, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 30, 45, 'Standard Tools', 'main', '2026-03-15 08:23:34', '2026-03-15 08:23:34'),
(2, '2 BHK Deep Cleaning', 4200, 'uploads/1bhk-deep-cleaning.jpeg', 1, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 45, 120, 'Standard Tools', 'main', '2026-03-15 08:47:56', '2026-03-15 08:47:56'),
(3, 'Fan Repair', 150, 'uploads/fan-repair.jpeg', 11, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'additional', '2026-03-15 09:36:35', '2026-03-15 12:11:52'),
(4, 'Sofa Deep Cleaning', 599, 'uploads/sofa-cleaning.jpeg', 2, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 30, 45, 'Standard Tools', 'main', '2026-03-17 16:50:01', '2026-03-17 16:57:37'),
(5, '3BHK Deep Cleaning', 5200, 'uploads/1bhk-deep-cleaning.jpeg', 1, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 45, 160, 'Standard Tools', 'main', '2026-03-20 14:55:01', '2026-03-20 15:04:18'),
(6, '4BHK Deep Cleaning', 6200, 'uploads/1bhk-deep-cleaning', 1, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 45, 160, 'Standard Tools', 'main', '2026-03-20 15:03:49', '2026-03-20 15:03:49'),
(7, 'Sofa Deep Cleaning (3 to 5 seater)', 996, 'uploads/sofa-cleaning.jpeg', 2, 'Please provide required electrical equipments and support to our executive.', 'Machine', 45, 60, 'Standard Tools', 'main', '2026-03-21 14:20:10', '2026-03-21 14:20:10'),
(8, '3 Seater Sofa Cleaning', 599, 'uploads/sofa-cleaning.jpeg', 2, 'Please provide required electrical equiments and supporto to our executive', 'Machine', 30, 50, 'Standard Tools', 'main', '2026-03-21 14:22:29', '2026-03-21 14:22:29'),
(9, 'Geyser Fitting', 300, 'uploads/geyser-coil-repair.jpeg', 8, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 14:26:09', '2026-03-21 14:26:09'),
(10, 'Bathroom Deep Cleaning', 499, 'uploads/bathroom-clean-with-machin.jpeg', 3, 'Please ensure water availability and unclogged sink before the service.', 'Machine', 30, 45, 'Standard Tools', 'main', '2026-03-21 14:30:25', '2026-03-21 14:30:25'),
(11, 'Kitchen Trolly Cleaning(3 to 5)', 499, 'uploads/maxresdefault.jpg', 4, 'Please provide required electrical equiments and supporto to our executive', 'Manual staff', 30, 50, 'Standard Tools', 'main', '2026-03-21 14:51:01', '2026-03-21 15:07:19'),
(12, 'Kitchen Cabinates (5 to 10)', 699, 'uploads/maxresdefault.jpg', 4, 'Please provide required electrical equipment and support to our executive', 'Manual Staff', 60, 90, 'Standard Tools', 'main', '2026-03-21 14:52:41', '2026-03-21 15:07:19'),
(13, 'Tap (Nal) Repair/Replacement', 200, 'uploads/nul-tap-repair-basin-bathroom.jpeg', 5, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 14:56:34', '2026-03-21 15:07:19'),
(14, 'Shower Mix Tap Installation/Repair', 400, 'uploads/mix-tap-shower-repair.jpeg', 5, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:00:21', '2026-03-21 15:07:19'),
(15, 'Normal Bath Shower Repair/Installation', 200, 'uploads/normal-bathroom-shower-repair2.jpeg', 5, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:02:09', '2026-03-21 15:07:19'),
(16, 'Bath Shower Heavy Work Repair', 400, 'uploads/normal-bathroom-shower-repair2.jpeg', 5, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:03:17', '2026-03-21 15:07:19'),
(17, 'Washbasin Leakage Repair', 200, 'uploads/basin-blockage-removal.jpeg', 7, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:11:29', '2026-03-21 15:11:29'),
(18, 'Washbasin Blockage Removal', 200, 'uploads/basin-leakage-repair-heavy-work.jpeg', 7, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:13:40', '2026-03-21 15:13:40'),
(19, 'Washing Machine Tap/Pipe Fitting', 150, 'uploads/washing-machine-pipe-fitting.jpeg', 15, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:22:17', '2026-03-21 15:22:17'),
(20, 'Toilet Flush Repair/Installation', 200, 'uploads/toilet-flush-jetsprey-repair-installation.jpeg', 6, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:25:18', '2026-03-21 15:25:18'),
(21, 'Toilet Jet Spray, Tap, Pressure Gun Repair\r\n', 150, 'uploads/toilet-flush-jetsprey-repair-installation.jpeg', 6, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:27:31', '2026-03-21 15:27:31'),
(22, 'Switch & Socket Repair/Replacement', 100, 'uploads/socket-repair.jpeg', 10, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:30:45', '2026-03-21 15:30:45'),
(23, 'Switchboard & SocketBoard Repair', 150, 'uploads/switchboard-repair.jpeg', 10, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:33:08', '2026-03-21 15:33:08'),
(24, 'New Switch Board Point and Fitting', 250, 'uploads/switch-board-point-installation.jpeg', 10, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:35:16', '2026-03-21 15:35:16'),
(25, 'Fan Installation', 100, 'fan-installation.jpeg', 11, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:41:23', '2026-03-21 15:41:23'),
(26, 'Tube light Installation', 100, 'uploads/tubelight-installation.jpeg', 12, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:45:06', '2026-03-21 15:45:06'),
(27, 'Fan Winding and Bearing Change', 600, 'uploads/fan-coil-replacement-repair.jpeg', 11, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:46:42', '2026-03-21 15:46:42'),
(28, 'Geyser Coil & New Coil Replacement', 1200, 'uploads/geyser-coil-repair.jpeg', 14, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:48:30', '2026-03-21 15:48:30'),
(29, 'MCB Fault Repair', 200, 'uploads/mcb-fault-repairing.jpeg', 13, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 15:57:21', '2026-03-21 15:57:21'),
(30, 'Pigeon Net Installation', 20, 'uploads/pigeon-net-installation.jpeg', 16, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 16:13:30', '2026-03-21 16:13:30'),
(31, 'Mosquito Net Installation', 20, 'uploads/mosquito-net-installation.jpeg', 16, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'main', '2026-03-21 16:14:56', '2026-03-21 16:14:56');

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
(1, 1, 3, '2026-03-15 09:37:02');

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
(16, 'Net Installation Services', 7, '2026-03-21 16:11:19', '2026-03-21 16:11:19');

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
(2, '9595454565', 'Ramu Patil', 'Male', '2026-03-13 18:02:24', '2026-03-15 10:38:23'),
(3, '9996668881', 'RAM murari', 'Male', '2026-03-15 10:35:53', '2026-03-19 09:17:50'),
(4, '9996668881', 'RAM murari', 'Male', '2026-03-19 09:08:56', '2026-03-19 09:17:50'),
(5, '9595889595', 'Shriya Jadhav', 'Female', '2026-03-19 13:07:24', '2026-03-19 13:16:10'),
(6, '9090202020', '', '', '2026-03-20 05:47:50', '2026-03-20 05:47:50'),
(7, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:10:51', '2026-03-20 12:33:17'),
(8, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:28:53', '2026-03-20 12:33:17'),
(9, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:28:56', '2026-03-20 12:33:17'),
(10, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:34:13', '2026-03-20 12:33:17'),
(11, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:34:50', '2026-03-20 12:33:17'),
(12, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:36:18', '2026-03-20 12:33:17'),
(13, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:39:06', '2026-03-20 12:33:17'),
(14, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 08:39:38', '2026-03-20 12:33:17'),
(15, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 12:02:15', '2026-03-20 12:33:17'),
(16, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 12:20:28', '2026-03-20 12:33:17'),
(17, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 12:23:31', '2026-03-20 12:33:17'),
(18, '8282646400', 'Anjali Patil', 'Female', '2026-03-20 12:23:44', '2026-03-20 12:33:17'),
(19, '6565653333', 'Richa Patel', 'Female', '2026-03-20 12:38:33', '2026-03-20 12:39:19'),
(20, '9448889820', '', '', '2026-03-20 12:51:25', '2026-03-20 12:51:25'),
(21, '7878789898', 'Anu Aarya', 'Female', '2026-03-20 13:04:39', '2026-03-20 13:22:59'),
(22, '7845784511', 'Rupali D. Biradar', 'Female', '2026-03-20 15:05:34', '2026-03-20 16:28:53');

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
(23, '7845784511', '495876', 1, 1774019415425, '2026-03-20 15:05:15', '2026-03-20 15:05:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `service_addon`
--
ALTER TABLE `service_addon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_excludes`
--
ALTER TABLE `service_excludes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `service_includes`
--
ALTER TABLE `service_includes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

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
