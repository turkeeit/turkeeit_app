-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Mar 16, 2026 at 09:42 AM
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
(6, '9448889820', '88888', 'Sai Residency', 'Dombivli East', 'Near Railway Station', 'Mumbai', 'Maharashtra', '421201', '2026-03-15 11:41:00', '2026-03-15 11:41:32');

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
(1, 'cleaner', '2026-03-15 07:36:44', '2026-03-15 07:36:44'),
(2, 'plumber', '2026-03-15 07:37:28', '2026-03-15 07:37:28'),
(3, 'electrician', '2026-03-15 07:39:18', '2026-03-15 09:04:49'),
(4, 'acrepair', '2026-03-15 07:43:26', '2026-03-15 07:43:26'),
(5, 'waterpurifier', '2026-03-15 07:43:49', '2026-03-15 07:43:49'),
(6, 'carpenter', '2026-03-15 07:43:59', '2026-03-15 07:43:59');

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
(3, 'Fan Repair', 150, 'uploads/fan-repair.jpeg', 11, 'Customer must provide supportive material (chair, etc)', 'Manual Staff', 30, 45, 'Standard Tools', 'additional', '2026-03-15 09:36:35', '2026-03-15 12:11:52');

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
(10, 2, 'null', 'Chimney or exhaust dismantling not included', '2026-03-15 08:59:32');

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
(13, 2, 'null', 'Balcony (Grills · Railings · Floor Sweep/Mop)', '2026-03-15 08:53:55');

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
(13, 'Electrical Protection', 3, '2026-03-15 08:09:49', '2026-03-15 08:09:49'),
(14, 'Geyser Electrical Repair', 3, '2026-03-15 08:10:11', '2026-03-15 08:10:11');

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
(3, '9996668881', 'Krisha murari', 'Male', '2026-03-15 10:35:53', '2026-03-15 11:30:01');

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
(3, '9996668881', '726926', 1, 1773571209801, '2026-03-15 10:35:09', '2026-03-15 10:35:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_addon`
--
ALTER TABLE `service_addon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_excludes`
--
ALTER TABLE `service_excludes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `service_includes`
--
ALTER TABLE `service_includes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
