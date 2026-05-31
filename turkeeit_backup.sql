-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: turkeeit
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `flat_no` varchar(256) NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `area_name` varchar(256) NOT NULL,
  `landmark` varchar(256) NOT NULL,
  `city` varchar(256) NOT NULL,
  `state` varchar(256) NOT NULL,
  `pincode` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (13,'9922992299','F506','victoria','area_name','casa rio','dombivali','maharastra','421204','2025-03-30 14:48:56','2025-03-30 14:48:56'),(14,'9820868352','undefined','undefined','undefined','undefined','undefined','undefined','undefined','2025-07-19 11:28:32','2025-07-19 11:28:32'),(15,'9820868352','undefined','undefined','undefined','undefined','undefined','undefined','undefined','2025-07-19 11:28:32','2025-07-19 11:28:32'),(16,'9820868352','undefined','undefined','undefined','undefined','undefined','undefined','undefined','2025-07-19 11:28:32','2025-07-19 11:28:32'),(17,'7000000001','g-556c','Avantika Estates','surya colony','Near Airport','Pune','Maharashtra','412610','2026-04-06 21:20:32','2026-04-06 21:20:32'),(18,'9448889820','F110','Ajay Estates','Juhu','Near Metro','Mumbai','Maharashtra','413516','2026-04-07 13:17:48','2026-04-07 13:17:48'),(19,'9595959540','G901','Antilia','Billionaires\' Row','Altamount Road, Cumballa Hills','Mumbai','Maharashtra','400026','2026-04-10 17:08:27','2026-04-10 17:08:27'),(20,'9859859850','G9011','ABC','XYZ','PQR','Mumbai','Maharashtra','410061','2026-04-10 19:42:00','2026-04-10 19:43:05'),(21,'7841000000','G456','ZXY','PQR','ABC','Mumbai','Maharashtra','416001','2026-04-10 20:12:57','2026-04-10 20:12:57'),(22,'9879879879','888','ABCC','XYZZ','KRKR','Mumbai','Maharashtra','413516','2026-04-11 06:58:33','2026-04-11 06:58:33'),(23,'9856321400','F8976','XYZXYZ','ABCABC','PQRPQR','Mumbai','Maharashtra','411134','2026-04-11 07:47:43','2026-04-11 07:47:43'),(24,'7894561230','ABC','xyz','xyz','fgx','mumbai','maharashtra','451245','2026-04-11 10:45:57','2026-04-11 10:45:57'),(25,'9933232233','Casa rio palava city mumbai','Rhine','casa rio','palava','thane','Maharashtra','421206','2026-04-11 11:14:58','2026-04-11 11:16:12'),(26,'9922332233','ram','ood','ff','ff','ccc','vvv','421201','2026-04-13 06:11:56','2026-04-13 06:11:56'),(27,'6565656464','G567','Himalaya Hills','Kailas Mountain','Near Mansarovar Lake','Banglore','Maharashtra','410001','2026-04-13 06:21:44','2026-04-13 06:21:44'),(28,'9090212190','F-234','Singhaniya Empires','Gioij Aist','Near Hi-Tech City','Mumbai','Maharashtra','413001','2026-04-13 12:45:26','2026-04-13 12:45:26'),(29,'9874987400','H110','ABC','XYZ','CVCV','Mumbai','Maharashtra','410001','2026-04-13 17:25:45','2026-04-13 17:25:45'),(30,'8695957485','d-282','ABCD','PQRS','HIJK','Mumbai','Maharashtra','410101','2026-04-14 07:38:42','2026-04-14 07:38:42'),(31,'8080528528','PQRST','LMNOP','ABCD','PPPQQQ','Mumbai','Maharashtra','413151','2026-04-14 09:56:16','2026-04-14 09:56:16'),(32,'9855550000','H456','AVBNFMG','NDHFKJRL','JDHFKROE','Mumbai','Maharashtra','412516','2026-04-14 11:49:46','2026-04-14 11:49:46'),(33,'9989989989','G108','BK Estates','Dadar','Near Metro Station','Mumbai','Maharashtra','413516','2026-04-15 16:33:01','2026-04-15 16:36:23'),(34,'7856342190','G123','Aarya Residency','Lonavala','Near HB Mall','Mumbai','Maharashtra','413500','2026-04-15 16:43:54','2026-04-15 16:43:54'),(35,'9531313131','A101 Apartment building name','area name','area landmark','landmark','mumbai','Maharashtra','421204','2026-04-25 08:38:22','2026-04-25 08:38:22'),(36,'9630963000','H900','Biradar Residancy','Shahu Colony','Near Kalpna theatre','Mumbai','Maharashtra','412514','2026-05-04 07:26:48','2026-05-04 07:26:48'),(38,'7123712302','H566','Raya Residancy','Kothrud','Near Metro Station','Mumbai','Maharashtra','410012','2026-05-04 10:24:07','2026-05-04 10:24:07'),(39,'7897897890','H453','Asha Residency','Hinjewadi','near metro','mumbai','Maharashtra','481273','2026-05-04 16:46:03','2026-05-04 16:46:03'),(40,'9888587489','G405','Siya Apartment','Mangalnath','Near kripa temple','mumbai','maharashtra','142510','2026-05-16 17:19:26','2026-05-16 17:19:26'),(41,'7878985858','G901','ABC','Near XYZ','PQR','mumbai','maharashtra','413516','2026-05-16 18:37:55','2026-05-16 18:37:55'),(42,'9021954403','G405','Gurukripa Residency','Pimpari Chinchwad','Near Metro','Pune','Maharashtra','417501','2026-05-18 16:23:09','2026-05-18 16:23:09'),(43,'9867315361','Rom1','Hvd','Jc','Fjjf','Fjf','Dmsbd','421202','2026-05-23 20:14:27','2026-05-23 20:14:27');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `content` longtext NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'How to Find a Reliable Plumber','Tips to choose trusted plumbing professionals','<h2>How to Find a Reliable Plumber</h2><p>Always check ratings, verification, pricing, and warranty before booking.</p>','Bangalore','HSR Layout','Plumbing','bangalore-hsr-plumber-guide','2025-12-24 07:40:00'),(2,'Best Cleaning Services in Dombivli | Turkeeit Home Services','Top-rated 1BHK to 4BHK home deep cleaning, sofa & mattress cleaning experts in Dombivli East & West','\"<h2>Best Cleaning Services in Dombivli</h2><p>Turkeeit Home Services provides trusted and professional home deep cleaning in Dombivli. We specialize in 1BHK to 4BHK residential cleaning, sofa and mattress deep cleaning, kitchen platform cleaning, bathroom tile scrubbing, stain removal, ceiling and wall dust removal, slab and floor deep cleaning, and full home sanitization using safe and eco-friendly products.</p><h3>Why Turkeeit is the Best Cleaning Service in Dombivli</h3><ul><li>✔ Trained & verified cleaning professionals</li><li>✔ Affordable pricing with no hidden charges</li><li>✔ Before/After cleaning assurance</li><li>✔ Eco-friendly and safe cleaning products</li><li>✔ Quick booking trusted by local residents</li></ul><h3>Popular Services We Offer</h3><ul><li>1BHK · 2BHK · 3BHK · 4BHK Deep Cleaning</li><li>Sofa Dry & Deep Cleaning</li><li>Mattress Sanitization & Stain Removal</li><li>Kitchen Platform & Cabinets Deep Clean</li><li>Bathroom Tiles & Fittings Deep Clean</li><li>Slab, Floor, Wall & Ceiling Dust Removal</li></ul><h3>Areas We Serve</h3><p>Dombivli East · Dombivli West · Lodha Palava · MIDC · Manpada · Nilje · Shilphata Road · Kalyan-Dombivli belt</p><h3>Book Now</h3><p>📞 Call: 9867315361 | 🌐 Website: turkeeit.info</p><h3>Home Cleaning Checklist You Should Know</h3><p>Our cleaning process covers floor mopping, wall dusting, ceiling cobweb removal, slab scrubbing, kitchen degreasing, bathroom descaling, sofa shampooing, mattress vacuuming, stain removal, drain cleaning, switch board sanitization, and cupboard outer cleaning for a complete home refresh.</p><h3>SEO Benefits of Booking Turkeeit</h3><p>We are one of the highest-rated home cleaning providers in the Mumbai suburbs with real transformation results, fast service, and residential-focused cleaning solutions.</p><h3>Final Verdict</h3><p>If you want a professional, trusted, affordable, and result-driven home cleaning service in Dombivli, Turkeeit Home Services is the best choice. We clean homes like they’re our own!</p>\"','mumbai','Dombivli','Cleaning','best-cleaning-services-dombivli','2025-12-24 07:40:00');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `service_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (171,'9448889820',4,'Sofa Deep Cleaning',599,'/uploads/sofa-cleaning.jpeg',1,'2026-04-07 16:49:48','2026-04-07 16:49:48'),(172,'9000900090',13,'Tap (Nal) Repair/Replacement',200,'/uploads/nul-tap-repair-basin-bathroom.jpeg',1,'2026-04-08 04:41:18','2026-04-08 04:41:18'),(173,'9000900090',29,'MCB Fault Repair',200,'/uploads/mcb-fault-repairing.jpeg',1,'2026-04-08 06:23:08','2026-04-08 06:23:08'),(180,'9859859850',25,'Fan Installation',100,'/uploads/fan-installation.jpeg',2,'2026-04-10 19:48:06','2026-04-10 19:48:12'),(181,'7841000000',28,'Geyser Coil & New Coil Replacement',1200,'/uploads/geyser-coil-repair.jpeg',1,'2026-04-10 20:13:18','2026-04-10 20:13:18'),(200,'9090212190',10,'Bathroom Deep Cleaning',499,'/uploads/bathroom-clean-with-machin.jpeg',1,'2026-04-13 17:18:37','2026-04-13 17:20:25'),(208,'8695957485',7,'Sofa Deep Cleaning\r\n(3 to 5 seater)',996,'/uploads/sofa-cleaning.jpeg',1,'2026-04-14 09:34:49','2026-04-14 09:34:49'),(213,'8080528528',6,'4BHK Deep Cleaning',6200,'/uploads/1bhk-deep-cleaning.jpeg',1,'2026-04-14 10:19:51','2026-04-14 10:19:51'),(214,'8080528528',12,'Kitchen Cabinates (5 to 10)',699,'/uploads/maxresdefault.jpg',1,'2026-04-14 11:12:11','2026-04-14 11:12:11'),(220,'9989989989',6,'4BHK Deep Cleaning',6200,'/uploads/1bhk-deep-cleaning.jpeg',1,'2026-04-15 16:36:03','2026-04-15 16:36:03'),(240,'9630963000',2,'2 BHK Deep Cleaning',4200,'/uploads/1bhk-deep-cleaning.jpeg',1,'2026-05-22 07:12:12','2026-05-22 07:12:12'),(241,'9867315361',1,'1BHK Deep Cleaning',3200,'/uploads/1bhk-deep-cleaning.jpeg',1,'2026-05-23 20:14:43','2026-05-23 20:14:43');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Cleaning','2026-04-06 18:23:21','2026-04-06 18:23:21'),(2,'Plumbing','2026-04-06 18:23:21','2026-04-06 18:23:21'),(3,'Electrical','2026-04-06 18:23:21','2026-04-06 18:23:21'),(4,'AC Service','2026-04-06 18:23:21','2026-04-06 18:23:21'),(5,'Waterpurifier','2026-04-06 18:23:21','2026-04-06 18:23:21'),(6,'Carpenter','2026-04-06 18:23:21','2026-04-06 18:23:21'),(7,'Net Installation','2026-04-06 18:23:21','2026-04-06 18:23:21');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) NOT NULL,
  `service_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `total_price` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (137,'94b34c34-4455-4fa1-afdc-b62d11b746cc',10,1,499,499,'2026-04-07 16:44:01','2026-04-07 16:44:01'),(139,'06739bf6-3c41-4da9-b269-2996d4134ca0',10,1,499,499,'2026-04-07 16:47:25','2026-04-07 16:47:25'),(140,'d59c44da-42eb-4c2b-9f2f-c8e8b5cc7926',11,1,499,499,'2026-04-07 16:48:14','2026-04-07 16:48:14'),(141,'c39f913a-542d-4175-adb6-6d130f85115a',4,1,599,599,'2026-04-07 16:50:12','2026-04-07 16:50:12'),(145,'9a5077b8-025a-4dd3-b3ae-e46ad50f8e08',7,1,996,996,'2026-04-10 19:28:01','2026-04-10 19:28:01'),(146,'a4680088-38b1-44c5-b5a3-3e9732b5a5af',4,1,599,599,'2026-04-10 19:43:33','2026-04-10 19:43:33'),(149,'253b3510-62c6-49d2-a067-735c06645594',10,2,499,998,'2026-04-11 07:07:31','2026-04-11 07:07:31'),(150,'397d27a6-6fc1-4473-8b36-33d9ed9e6c78',7,1,996,996,'2026-04-11 07:17:05','2026-04-11 07:17:05'),(151,'042efe83-2e9e-4be8-b7b6-93b4e5840fef',6,1,6200,6200,'2026-04-11 08:02:15','2026-04-11 08:02:15'),(153,'518362c2-d1a4-415f-99e4-5c5558075e15',8,2,599,1198,'2026-04-11 10:47:53','2026-04-11 10:47:53'),(154,'bb6e1e7e-a2ea-4a26-a0e3-aa65687015cf',2,1,4200,4200,'2026-04-11 11:16:40','2026-04-11 11:16:40'),(155,'4dcfda81-6b6a-4123-99e1-06656cda47e6',4,1,599,599,'2026-04-11 11:17:54','2026-04-11 11:17:54'),(156,'8cdbc4ce-35b3-4c21-9fd9-462940c6aa2c',4,1,599,599,'2026-04-11 11:18:12','2026-04-11 11:18:12'),(157,'96857729-5546-4e81-8c50-854fa93308aa',4,1,599,599,'2026-04-11 11:19:21','2026-04-11 11:19:21'),(158,'002cb747-2207-410b-9f3d-a7212e0d2f94',2,1,4200,4200,'2026-04-11 11:28:52','2026-04-11 11:28:52'),(159,'cbbf39fa-39bc-4bb2-a27b-bf3a316f5e0c',1,1,3200,3200,'2026-04-13 06:12:28','2026-04-13 06:12:28'),(160,'b7917321-21f4-4e5c-95ad-c9114bd23ed4',8,2,599,1198,'2026-04-13 06:22:33','2026-04-13 06:22:33'),(161,'4112e03e-9773-4657-9587-8819e6e10c58',6,1,6200,6200,'2026-04-13 12:48:05','2026-04-13 12:48:05'),(162,'67a2c78a-fabd-4aca-aa11-e8c13a1b3c50',6,1,6200,6200,'2026-04-13 12:49:52','2026-04-13 12:49:52'),(164,'e7043f64-1fd4-404d-995f-e598d118d523',1,1,3200,3200,'2026-04-13 16:13:18','2026-04-13 16:13:18'),(165,'3bab01cd-188e-46b7-9af9-eeadfa7eb049',7,2,996,1992,'2026-04-13 16:23:52','2026-04-13 16:23:52'),(166,'fab830fa-78a8-4a9b-a69d-2e7cc75881a1',7,2,996,1992,'2026-04-13 16:30:20','2026-04-13 16:30:20'),(170,'45160c2d-a0b0-4509-be4b-fd4e704f2a0b',10,1,499,499,'2026-04-13 17:20:44','2026-04-13 17:20:44'),(171,'eda34e27-4ce5-4496-a4f6-1ea444ef9b11',11,2,499,998,'2026-04-13 17:26:19','2026-04-13 17:26:19'),(172,'2ea2e427-2720-4899-a51d-995f55028db2',11,2,499,998,'2026-04-13 17:27:02','2026-04-13 17:27:02'),(174,'f18bc66d-8271-4e88-878b-a3c104ee1b40',6,1,6200,6200,'2026-04-14 07:43:12','2026-04-14 07:43:12'),(178,'674b96ba-c592-4fef-b4d0-91dcd64c2e8d',5,2,5200,10400,'2026-04-14 09:05:27','2026-04-14 09:05:27'),(179,'30b0526c-0942-40a5-823b-e732f721812e',5,1,5200,5200,'2026-04-14 09:21:11','2026-04-14 09:21:11'),(183,'1045b808-63ca-41fd-bccd-143e06af0cce',7,1,996,996,'2026-04-14 09:44:17','2026-04-14 09:44:17'),(186,'738415e8-bcb0-471b-bd03-605fbed6aafe',6,1,6200,6200,'2026-04-14 10:08:48','2026-04-14 10:08:48'),(190,'ec5ce7e4-c259-497f-a04a-a1eb8a667e3c',6,1,6200,6200,'2026-04-14 10:20:06','2026-04-14 10:20:06'),(191,'d3ab6ccf-9f7e-451f-97bf-9bdc1cbb28bc',7,1,996,996,'2026-04-14 11:10:33','2026-04-14 11:10:33'),(192,'a48c8f08-8625-48b1-9941-79a9263c3997',12,1,699,699,'2026-04-14 11:12:28','2026-04-14 11:12:28'),(194,'9f3d276b-5234-4ec4-869b-457a28a79c2f',2,1,4200,4200,'2026-04-14 12:33:53','2026-04-14 12:33:53'),(195,'fc5aaefd-6f35-431d-98f1-7330a03793a4',6,1,6200,6200,'2026-04-15 16:37:01','2026-04-15 16:37:01'),(197,'d807a667-812d-455f-9898-63ca5d5279cd',1,1,3200,3200,'2026-04-25 08:39:11','2026-04-25 08:39:11'),(199,'4b59e9d1-b9af-4082-942e-f17ae3c4def3',4,1,599,599,'2026-04-25 10:32:57','2026-04-25 10:32:57'),(202,'a31605d1-9d8d-448a-a7e5-2e03bb3efc2a',1,1,3200,3200,'2026-04-25 12:37:08','2026-04-25 12:37:08'),(208,'a0b5bb11-093d-422b-98bc-512668110099',11,1,499,499,'2026-05-04 09:08:26','2026-05-04 09:08:26'),(209,'ddab033d-49b0-4ea8-a917-ca0ba1770f4b',2,1,4200,4200,'2026-05-04 15:52:07','2026-05-04 15:52:07'),(211,'70897600-ce6e-4585-b8d3-67d255b2cb98',4,1,599,599,'2026-05-16 17:20:31','2026-05-16 17:20:31'),(212,'3e29eef0-e1b8-4e0c-bedd-1937db3e8bd9',1,1,3200,3200,'2026-05-18 16:23:21','2026-05-18 16:23:21');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_price` int NOT NULL,
  `address` text NOT NULL,
  `payment_id` varchar(256) DEFAULT NULL,
  `razorpay_order_id` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `service_date` date DEFAULT NULL,
  `service_time` time DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (119,'e929010f-b988-4024-b372-dc8e3864951f','9922992292','PAID',3699,'mumbai','pay_SDBRbiNYbFjcbO','order_SDBRTft9ewh3Mp','2026-02-07 08:05:43','2026-02-07 08:05:43',NULL,NULL,NULL,NULL,NULL,NULL),(120,'ada7f6ad-2564-4ac3-aa02-2ba509bf2f08','9922993499','PAID',3200,'Mumbai','pay_SDCk9pLYjzNpkz','order_SDCjyWpAypKOEu','2026-02-07 09:21:56','2026-02-07 09:21:56',NULL,NULL,NULL,NULL,NULL,NULL),(121,'bfcacd48-a896-43d1-9b65-4f10784ee325','9922992299','PAID',3699,'Mumbai','pay_SDCs2CEpvVF7vW','order_SDCrvPwbZOvpdz','2026-02-07 09:29:27','2026-02-07 09:29:27',NULL,NULL,NULL,NULL,NULL,NULL),(122,'c320a7b3-0039-4d70-8547-f7b7b07325ad','9021954403','pending',3200,'udgir, dist Latur',NULL,'order_SPbukxNRmHyPYn','2026-03-10 17:47:30','2026-03-10 17:47:30',NULL,NULL,NULL,NULL,NULL,NULL),(123,'bd145a45-ae62-4d64-8076-10a29961a2a4','9021954403','pending',599,'udgir, dist Latur',NULL,'order_SRz4bcpD85pnFC','2026-03-16 17:44:46','2026-03-16 17:44:46',NULL,NULL,NULL,NULL,NULL,NULL),(124,'45da745d-bcb1-4e0d-bd99-028497d83592','9021954403','pending',599,'udgir, dist Latur',NULL,'order_SRz5vaxRkVjDqu','2026-03-16 17:46:01','2026-03-16 17:46:01',NULL,NULL,NULL,NULL,NULL,NULL),(125,'4db23484-cab6-4c3b-9d61-17d959c1ab79','9021954403','pending',499,'udgir, dist Latur',NULL,'order_SSI2jwroXAMtVx','2026-03-17 12:18:11','2026-03-17 12:18:11',NULL,NULL,NULL,NULL,NULL,NULL),(126,'a81a169a-0faa-4a04-afa5-c7633fb2af5d','7575747410','pending',20,'211, Krishna residency, Shivaji park, near metro station, pune , Maharashtra 411325',NULL,'order_SVUyiyTB1dXP8A','2026-03-25 14:54:24','2026-03-25 14:54:24',NULL,NULL,NULL,NULL,NULL,NULL),(127,'bdcca8e6-d9df-4e06-83b2-3a8bb9dfb9d3','7575747410','pending',20,'211, Krishna residency, Shivaji park, near metro station, pune , Maharashtra 411325',NULL,'order_SVV0vju6QXSpZW','2026-03-25 14:56:30','2026-03-25 14:56:30',NULL,NULL,NULL,NULL,NULL,NULL),(128,'7ecd25eb-4f12-40f1-9b97-634088afb19e','9448889820','pending',400,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516',NULL,'order_SaclCmsofwgGEk','2026-04-07 13:46:09','2026-04-07 13:46:09','2026-04-08','11:00:00',NULL,'pending',NULL,NULL),(129,'d21a4db4-534e-4c2c-bd38-29dce26cfecb','9448889820','confirmed',400,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516','cod_559b2bc9','order_Sacmdh3PX7qOpq','2026-04-07 13:47:31','2026-04-07 13:47:48','2026-04-09','11:00:00','COD','pending',NULL,NULL),(130,'e4e2d6fb-c03e-4f6b-8e49-746e9d33e862','9448889820','pending',600,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516',NULL,'order_SacrPQEOJZOySX','2026-04-07 13:52:02','2026-04-07 13:52:02','2026-04-08','17:00:00',NULL,'pending',NULL,NULL),(131,'3572f585-9c0e-497f-90d6-29d3a94a303f','9448889820','pending',600,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516',NULL,'order_Sad1oWBF1qpeSc','2026-04-07 14:01:53','2026-04-07 14:01:53','2026-04-10','11:00:00',NULL,'pending',NULL,NULL),(132,'8b553753-c66b-408d-8436-7a6deb2457ad','9448889820','pending',600,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516',NULL,'order_SadvAV3FRqYz9Z','2026-04-07 14:54:17','2026-04-07 14:54:17','2026-04-08','11:00:00',NULL,'pending',NULL,NULL),(133,'94b34c34-4455-4fa1-afdc-b62d11b746cc','9448889820','pending',899,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516',NULL,'order_Safn5wgWUJa7sp','2026-04-07 16:44:01','2026-04-07 16:44:01','2026-04-10','17:00:00',NULL,'pending',NULL,NULL),(134,'06739bf6-3c41-4da9-b269-2996d4134ca0','9448889820','confirmed',899,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516','cod_d3e6001d','order_SafqfvPRyGf3MX','2026-04-07 16:47:25','2026-04-07 16:47:29','2026-04-09','09:00:00','COD','pending',NULL,NULL),(135,'d59c44da-42eb-4c2b-9f2f-c8e8b5cc7926','9448889820','pending',699,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516',NULL,'order_SafrXoCbHwud3z','2026-04-07 16:48:14','2026-04-07 16:48:14','2026-04-08','11:00:00',NULL,'pending',NULL,NULL),(136,'c39f913a-542d-4175-adb6-6d130f85115a','9448889820','pending',799,'F110, Ajay Estates\nJuhu, Near Metro\nMumbai, Maharashtra\n413516',NULL,'order_SaftbsRfyr6pUD','2026-04-07 16:50:12','2026-04-07 16:50:12','2026-04-11','15:00:00',NULL,'pending',NULL,NULL),(137,'384be918-f457-43bf-8af8-3473b094dd10','9595959540','confirmed',400,'G901, Antilia\nBillionaires\' Row, Altamount Road, Cumballa Hills\nMumbai, Maharashtra\n400026','cod_159a0169','order_SbtV0q6MYQdA9W','2026-04-10 18:47:37','2026-04-10 18:47:59','2026-04-11','09:00:00','COD','pending',NULL,NULL),(138,'c37fe4db-94f7-409c-994b-dbcbf77781f5','9595959540','pending',400,'G901, Antilia\nBillionaires\' Row, Altamount Road, Cumballa Hills\nMumbai, Maharashtra\n400026',NULL,'order_SbtgersQ4IirYX','2026-04-10 18:58:39','2026-04-10 18:58:39','2026-04-11','11:00:00',NULL,'pending',NULL,NULL),(139,'d4709b7c-d5ad-4fe7-8323-0f371e7a9d10','9595959540','pending',400,'G901, Antilia\nBillionaires\' Row, Altamount Road, Cumballa Hills\nMumbai, Maharashtra\n400026',NULL,'order_SbtnlfTfWxUuJI','2026-04-10 19:05:22','2026-04-10 19:05:22','2026-04-11','11:00:00',NULL,'pending',NULL,NULL),(140,'9a5077b8-025a-4dd3-b3ae-e46ad50f8e08','9595959540','confirmed',1196,'G901, Antilia\nBillionaires\' Row, Altamount Road, Cumballa Hills\nMumbai, Maharashtra\n400026','pay_SbuCEHQbJjXjSH','order_SbuBh2s1cn5bc0','2026-04-10 19:28:01','2026-04-10 19:28:47','2026-04-11','15:00:00','ONLINE','paid','pay_SbuCEHQbJjXjSH','85415446b942ab03f05ee45d43dd788da0e3b3940d8ddac73d1cf5d608e0f5de'),(141,'a4680088-38b1-44c5-b5a3-3e9732b5a5af','9859859850','confirmed',799,'G9011, ABC\nXYZ, PQR\nMumbai, Maharashtra\n410061','pay_SbuSkR21WMlYk7','order_SbuS5zd6HvPtdW','2026-04-10 19:43:33','2026-04-10 19:44:26','2026-04-11','11:00:00','ONLINE','paid','pay_SbuSkR21WMlYk7','ce1582b7f23f86561470099fb937f7b6db79930059fec3875b846f46466ba636'),(142,'8e34ba8c-4102-4db2-850f-f57c40b709aa','9859859850','pending',400,'G9011, ABC\nXYZ, PQR\nMumbai, Maharashtra\n410061',NULL,'order_SbuXBQk76tEebX','2026-04-10 19:48:22','2026-04-10 19:48:22','2026-04-11','09:00:00',NULL,'pending',NULL,NULL),(143,'863bc9f0-0381-4547-bf13-ba3953a8e780','7841000000','pending',1400,'G456, ZXY\nPQR, ABC\nMumbai, Maharashtra\n416001',NULL,'order_Sbuxn8OYwfNNhU','2026-04-10 20:13:33','2026-04-10 20:13:33','2026-04-11','11:00:00',NULL,'pending',NULL,NULL),(144,'253b3510-62c6-49d2-a067-735c06645594','9879879879','confirmed',1198,'888, ABCC\nXYZZ, KRKR\nMumbai, Maharashtra\n413516','cod_2b30bc5a','order_Sc66aWNWeqhonA','2026-04-11 07:07:31','2026-04-11 07:11:21','2026-04-11','17:00:00','COD','pending',NULL,NULL),(145,'397d27a6-6fc1-4473-8b36-33d9ed9e6c78','9879879879','confirmed',1196,'888, ABCC\nXYZZ, KRKR\nMumbai, Maharashtra\n413516','pay_Sc6HmqipJIqFLT','order_Sc6GgxmvBpTNLw','2026-04-11 07:17:05','2026-04-11 07:18:23','2026-04-11','13:00:00','ONLINE','paid','pay_Sc6HmqipJIqFLT','41181ed107a44b7d93176aa874823aa24118ef6779aecf76201a179ca60ffaa9'),(146,'042efe83-2e9e-4be8-b7b6-93b4e5840fef','9856321400','confirmed',6500,'F8976, XYZXYZ, ABCABC, PQRPQR, Mumbai, Maharashtra, 411134','pay_Sc73Dz1RTgYn6W','order_Sc72Os9G0RyNjS','2026-04-11 08:02:15','2026-04-11 08:03:17','2026-04-12','11:00:00','ONLINE','paid','pay_Sc73Dz1RTgYn6W','4adbc5919d02bc624d88cd9e3d22289d8c138bf7a94c530f4ef5289c183b1db6'),(147,'518362c2-d1a4-415f-99e4-5c5558075e15','7894561230','confirmed',1398,'ABC, xyz\nxyz, fgx\nmumbai, maharashtra\n451245','pay_Sc9sUhCQLWS6qF','order_Sc9rN7hGBbvIso','2026-04-11 10:47:53','2026-04-11 10:49:14','2026-04-12','11:00:00','ONLINE','paid','pay_Sc9sUhCQLWS6qF','d6cb829a93057e497611aa34d76ae937918046172b44082ee62885eccb9c7a1b'),(148,'bb6e1e7e-a2ea-4a26-a0e3-aa65687015cf','9933232233','confirmed',4400,'Casa rio palava city mumbai, Rhine\ncasa rio, palava\nthane, Maharashtra\n421206','pay_ScAM2rhAzJ2jyV','order_ScALm7b2cWl94y','2026-04-11 11:16:40','2026-04-11 11:17:16','2026-05-01','11:00:00','ONLINE','paid','pay_ScAM2rhAzJ2jyV','dfba9bed9b22ece68df4ab622b46105bf2e0109d934bb8d683320f7d8a882d4a'),(149,'4dcfda81-6b6a-4123-99e1-06656cda47e6','9933232233','pending',799,'Casa rio palava city mumbai, Rhine\ncasa rio, palava\nthane, Maharashtra\n421206',NULL,'order_ScAN4gKRbeiKwa','2026-04-11 11:17:54','2026-04-11 11:17:54','2026-04-11','17:00:00',NULL,'pending',NULL,NULL),(150,'8cdbc4ce-35b3-4c21-9fd9-462940c6aa2c','9933232233','pending',799,'Casa rio palava city mumbai, Rhine\ncasa rio, palava\nthane, Maharashtra\n421206',NULL,'order_ScANOQDDBbXMEq','2026-04-11 11:18:12','2026-04-11 11:18:12','2026-04-11','17:00:00',NULL,'pending',NULL,NULL),(151,'96857729-5546-4e81-8c50-854fa93308aa','9933232233','confirmed',799,'Casa rio palava city mumbai, Rhine\ncasa rio, palava\nthane, Maharashtra\n421206','cod_b212ae25','order_ScAObxUXCNxIQ2','2026-04-11 11:19:21','2026-04-11 11:19:24','2026-04-11','17:00:00','COD','pending',NULL,NULL),(152,'002cb747-2207-410b-9f3d-a7212e0d2f94','7000000001','confirmed',4300,'g-556c, Avantika Estates, surya colony, Near Airport, Pune, Maharashtra, 412610','pay_ScAYw1OqEHdZmF','order_ScAYfk8i46QyFC','2026-04-11 11:28:52','2026-04-11 11:29:23','2026-04-12','09:00:00','ONLINE','paid','pay_ScAYw1OqEHdZmF','82547f7e9078debdcb471d2511af572c3ecd586f30a94b89d9a46eb4b9cc7ddc'),(153,'cbbf39fa-39bc-4bb2-a27b-bf3a316f5e0c','9922332233','confirmed',3400,'ram, ood\nff, ff\nccc, vvv\n421201','pay_ScsF6Cx94zimCH','order_ScsEgTawrBosf7','2026-04-13 06:12:28','2026-04-13 06:13:17','2026-04-14','11:00:00','ONLINE','paid','pay_ScsF6Cx94zimCH','40de78f085b14547a341436aa7170b14849d6b0132cb97a04ad1ee70d3c2b3a4'),(154,'b7917321-21f4-4e5c-95ad-c9114bd23ed4','6565656464','confirmed',1398,'G567, Himalaya Hills\nKailas Mountain, Near Mansarovar Lake\nBanglore, Maharashtra\n410001','pay_ScsPx0bInTB03Z','order_ScsPKxWjzk2wb1','2026-04-13 06:22:33','2026-04-13 06:23:24','2026-04-13','17:00:00','ONLINE','paid','pay_ScsPx0bInTB03Z','3c25cb5275dfcdd7a218baabdd7004790bff2a4e35ee6c21ee767fc5f3dbad4c'),(155,'4112e03e-9773-4657-9587-8819e6e10c58','9090212190','pending',6400,'F-234, Singhaniya Empires\nGioij Aist, Near Hi-Tech City\nMumbai, Maharashtra\n413001',NULL,'order_Scyya0eOYsWsu3','2026-04-13 12:48:05','2026-04-13 12:48:05','2026-04-14','09:00:00',NULL,'pending',NULL,NULL),(156,'67a2c78a-fabd-4aca-aa11-e8c13a1b3c50','9090212190','pending',6400,'F-234, Singhaniya Empires\nGioij Aist, Near Hi-Tech City\nMumbai, Maharashtra\n413001',NULL,'order_Scz0SfTQ5FMoso','2026-04-13 12:49:52','2026-04-13 12:49:52','2026-04-14','11:00:00',NULL,'pending',NULL,NULL),(157,'e7043f64-1fd4-404d-995f-e598d118d523','9090212190','confirmed',3400,'F-234, Singhaniya Empires\nGioij Aist, Near Hi-Tech City\nMumbai, Maharashtra\n413001','pay_Sd2UtCPUxPNzHD','order_Sd2TMHD2kRjWqR','2026-04-13 16:12:38','2026-04-13 16:15:01','2026-04-15','13:00:00','ONLINE','paid','pay_Sd2UtCPUxPNzHD','54b2ae2a3e11266ae30fc47ee5dc206fe97597e3b62b1b953c5c69c4954f439a'),(158,'3bab01cd-188e-46b7-9af9-eeadfa7eb049','9090212190','pending',2192,'F-234, Singhaniya Empires\nGioij Aist, Near Hi-Tech City\nMumbai, Maharashtra\n413001',NULL,'order_Sd2eWR3SQe8Ghe','2026-04-13 16:23:52','2026-04-13 16:23:52','2026-04-17','15:00:00',NULL,'pending',NULL,NULL),(159,'fab830fa-78a8-4a9b-a69d-2e7cc75881a1','9090212190','confirmed',2192,'F-234, Singhaniya Empires\nGioij Aist, Near Hi-Tech City\nMumbai, Maharashtra\n413001','pay_Sd2nAZVMXFTmuW','order_Sd2lLiptAraAaE','2026-04-13 16:30:20','2026-04-13 16:32:18','2026-04-15','09:00:00','ONLINE','paid','pay_Sd2nAZVMXFTmuW','b07fba09286850a17f7b665e2e5866f008c98a7748b5d005d3e102a0334457aa'),(160,'e4be038b-a46d-4abe-a0e1-c972fd95a9b9','9090212190','pending',260,'F-234, Singhaniya Empires\nGioij Aist, Near Hi-Tech City\nMumbai, Maharashtra\n413001',NULL,'order_Sd3B4JXFVpNX2p','2026-04-13 16:54:41','2026-04-13 16:54:41','2026-04-15','09:00:00',NULL,'pending',NULL,NULL),(161,'6f1ea103-22f1-4a5b-960f-86c4bbc7aa4b','9090212190','confirmed',260,'F-234, Singhaniya Empires\nGioij Aist, Near Hi-Tech City\nMumbai, Maharashtra\n413001','cod_f0e38f8d','order_Sd3DQJdfsoXawX','2026-04-13 16:56:54','2026-04-13 16:57:12','2026-04-14','17:00:00','COD','pending',NULL,NULL),(162,'45160c2d-a0b0-4509-be4b-fd4e704f2a0b','9090212190','pending',699,'F-234, Singhaniya Empires\nGioij Aist, Near Hi-Tech City\nMumbai, Maharashtra\n413001',NULL,'order_Sd3calZfBbXHQt','2026-04-13 17:19:07','2026-04-13 17:20:44','2026-04-14','11:00:00',NULL,'pending',NULL,NULL),(163,'eda34e27-4ce5-4496-a4f6-1ea444ef9b11','9874987400','pending',1098,'H110, ABC, XYZ, CVCV, Mumbai, Maharashtra, 410001',NULL,'order_Sd3iUnME0jd5y1','2026-04-13 17:26:19','2026-04-13 17:26:19','2026-04-16','11:00:00',NULL,'pending',NULL,NULL),(164,'2ea2e427-2720-4899-a51d-995f55028db2','9874987400','pending',1098,'H110, ABC, XYZ, CVCV, Mumbai, Maharashtra, 410001',NULL,'order_Sd3jFy1UAElG0l','2026-04-13 17:27:02','2026-04-13 17:27:02','2026-04-15','09:00:00',NULL,'pending',NULL,NULL),(165,'f18bc66d-8271-4e88-878b-a3c104ee1b40','8695957485','confirmed',6300,'d-282, ABCD, PQRS, HIJK, Mumbai, Maharashtra, 410101','pay_SdIKgsjLhAUpBj','order_SdIJe9mmnPWnyD','2026-04-14 07:42:06','2026-04-14 07:44:26','2026-04-16','11:00:00','ONLINE','paid','pay_SdIKgsjLhAUpBj','72d0a0d1e788097c3585c9ac02ce3ef9d349f050b8ea71c7f72b400795b45fb6'),(166,'674b96ba-c592-4fef-b4d0-91dcd64c2e8d','8695957485','confirmed',10500,'d-282, ABCD, PQRS, HIJK, Mumbai, Maharashtra, 410101','cod_df9a2cf2','order_SdJiXDA1XJuqxN','2026-04-14 07:59:43','2026-04-14 09:05:49','2026-04-14','17:00:00','COD','pending',NULL,NULL),(167,'30b0526c-0942-40a5-823b-e732f721812e','8695957485','confirmed',5300,'d-282, ABCD, PQRS, HIJK, Mumbai, Maharashtra, 410101','pay_SdK0NoFykJVG6p','order_SdJz9tkDL7ng9W','2026-04-14 09:21:11','2026-04-14 09:22:36','2026-04-14','17:00:00','ONLINE','paid','pay_SdK0NoFykJVG6p','cb6c6ec17e7b8081a5b8e7bb2083593212a423e586b2d199ef4ab9dc987bc571'),(168,'ee6bf2e7-08be-40a3-88ae-697425e2ef29','8695957485','confirmed',300,'d-282, ABCD, PQRS, HIJK, Mumbai, Maharashtra, 410101','cod_f8978d5a','order_SdKDKfQTPRVCUN','2026-04-14 09:23:53','2026-04-14 09:34:41','2026-04-15','11:00:00','COD','pending',NULL,NULL),(169,'1045b808-63ca-41fd-bccd-143e06af0cce','8695957485','pending',1096,'d-282, ABCD, PQRS, HIJK, Mumbai, Maharashtra, 410101',NULL,'order_SdKNY7XFpZTj9l','2026-04-14 09:35:00','2026-04-14 09:44:17','2026-04-14','17:00:00',NULL,'pending',NULL,NULL),(170,'edad41a3-8cc1-47f9-8216-162772b7658d','8080528528','confirmed',400,'PQRST, LMNOP, ABCD, PPPQQQ, Mumbai, Maharashtra, 413151','pay_SdKfDOdvFgSI5T','order_SdKeg5qjqP1ekx','2026-04-14 09:59:17','2026-04-14 10:01:16','2026-04-16','11:00:00','ONLINE','paid','pay_SdKfDOdvFgSI5T','61b11a4b2873954fea8568771fbf7e4a349580f22ad9fa4d47786807de7786b8'),(171,'738415e8-bcb0-471b-bd03-605fbed6aafe','8080528528','confirmed',6300,'PQRST, LMNOP, ABCD, PPPQQQ, Mumbai, Maharashtra, 413151','pay_SdKp9RJS65e5Gn','order_SdKnROze4epTPA','2026-04-14 10:08:48','2026-04-14 10:10:40','2026-04-14','17:00:00','ONLINE','paid','pay_SdKp9RJS65e5Gn','1936f468b80dc19f54b2e927aee8a37c8fbc08f1beed41326b8332e6a68e89d9'),(172,'ed936cbe-5994-4169-b3b9-26f8ae434578','8080528528','pending',600,'PQRST, LMNOP, ABCD, PPPQQQ, Mumbai, Maharashtra, 413151',NULL,'order_SdKubDO1nYUrgn','2026-04-14 10:12:17','2026-04-14 10:15:34','2026-04-14','17:00:00',NULL,'pending',NULL,NULL),(173,'ec5ce7e4-c259-497f-a04a-a1eb8a667e3c','8080528528','pending',6300,'PQRST, LMNOP, ABCD, PPPQQQ, Mumbai, Maharashtra, 413151',NULL,'order_SdKzO4WsAiIcZP','2026-04-14 10:20:06','2026-04-14 10:20:06','2026-04-21','13:00:00',NULL,'pending',NULL,NULL),(174,'d3ab6ccf-9f7e-451f-97bf-9bdc1cbb28bc','8695957485','pending',1096,'d-282, ABCD, PQRS, HIJK, Mumbai, Maharashtra, 410101',NULL,'order_SdLqfxcHPiukaG','2026-04-14 11:10:33','2026-04-14 11:10:33','2026-04-15','09:00:00',NULL,'pending',NULL,NULL),(175,'a48c8f08-8625-48b1-9941-79a9263c3997','8080528528','pending',799,'PQRST, LMNOP, ABCD, PPPQQQ, Mumbai, Maharashtra, 413151',NULL,'order_SdLshcoudQSHDa','2026-04-14 11:12:28','2026-04-14 11:12:28','2026-04-15','11:00:00',NULL,'pending',NULL,NULL),(176,'b4fd7fae-8500-4a23-86bb-a9d7bd72c7f9','9855550000','confirmed',1300,'H456, AVBNFMG, NDHFKJRL, JDHFKROE, Mumbai, Maharashtra, 412516','pay_SdNBOPb9QCcYtd','order_SdNAEn0jVO7kCJ','2026-04-14 12:27:46','2026-04-14 12:29:10','2026-04-15','11:00:00','ONLINE','paid','pay_SdNBOPb9QCcYtd','8993a8a10e0e3235e54330facc4fee288083ada594834582b0b984e39d26c551'),(177,'9f3d276b-5234-4ec4-869b-457a28a79c2f','9855550000','confirmed',4300,'H456, AVBNFMG, NDHFKJRL, JDHFKROE, Mumbai, Maharashtra, 412516','pay_SdNGywfo8wn10I','order_SdNGhvGdSuS5sa','2026-04-14 12:33:53','2026-04-14 12:34:24','2026-04-16','11:00:00','ONLINE','paid','pay_SdNGywfo8wn10I','62ce342448d719fd97238a3195c5a7833b614f8b597a8bb6632b36f843a1566e'),(178,'fc5aaefd-6f35-431d-98f1-7330a03793a4','9989989989','pending',6300,'G108, BK Estates, Dadar, Near Metro Station, Mumbai, Maharashtra, 413516',NULL,'order_SdpwfFp5sVE2Tj','2026-04-15 16:37:01','2026-04-15 16:37:01','2026-04-16','13:00:00',NULL,'pending',NULL,NULL),(179,'84b9eab0-9ca5-4f70-82e8-76e4c06cd949','7856342190','confirmed',400,'G123, Aarya Residency, Lonavala, Near HB Mall, Mumbai, Maharashtra, 413500','pay_Sdq5lANeTRdeaV','order_Sdq4oFORWw03Em','2026-04-15 16:44:44','2026-04-15 16:45:53','2026-04-16','11:00:00','ONLINE','paid','pay_Sdq5lANeTRdeaV','1e3f254f8863ddf9757cf2265d559f485a19cd041b0cc9f6ae9fd0f831542b97'),(180,'d807a667-812d-455f-9898-63ca5d5279cd','9531313131','confirmed',3400,'A101 Apartment building name, area name\narea landmark, landmark\nmumbai, Maharashtra\n421204','cod_709727a8','order_Shf96Pno2jJFKR','2026-04-25 08:39:11','2026-04-25 08:39:16','2026-04-28','11:00:00','COD','pending',NULL,NULL),(181,'4b59e9d1-b9af-4082-942e-f17ae3c4def3','9531313131','pending',799,'A101 Apartment building name, area name\narea landmark, landmark\nmumbai, Maharashtra\n421204',NULL,'order_Shh5I7a17q47Z5','2026-04-25 10:14:18','2026-04-25 10:32:57','2026-04-27','09:00:00',NULL,'pending',NULL,NULL),(182,'e0923a88-7ec2-487a-90cc-acd704fb2372','9531313131','pending',400,'A101 Apartment building name, area name\narea landmark, landmark\nmumbai, Maharashtra\n421204',NULL,'order_Shj2uO269P8Chg','2026-04-25 12:28:05','2026-04-25 12:28:05','2026-04-26','11:00:00',NULL,'pending',NULL,NULL),(183,'a31605d1-9d8d-448a-a7e5-2e03bb3efc2a','9531313131','pending',3400,'A101 Apartment building name, area name\narea landmark, landmark\nmumbai, Maharashtra\n421204',NULL,'order_ShjCSdE3szyU0Y','2026-04-25 12:36:30','2026-04-25 12:37:08','2026-04-29','09:00:00',NULL,'pending',NULL,NULL),(184,'bc4b8962-e4f8-4118-8291-2782f8094221','9531313131','confirmed',400,'A101 Apartment building name, area name\narea landmark, landmark\nmumbai, Maharashtra\n421204','cod_2cbebf99','order_SiQX3FglTJW7bg','2026-04-27 06:11:29','2026-04-27 07:00:31','2026-04-27','17:00:00','COD','pending',NULL,NULL),(185,'cb392ea9-b3f7-48ae-bad7-fc8e1f592f21','9531313131','pending',300,'A101 Apartment building name, area name\narea landmark, landmark\nmumbai, Maharashtra\n421204',NULL,'order_SiQMFo4BWkL3SZ','2026-04-27 06:50:14','2026-04-27 06:50:14','2026-04-27','17:00:00',NULL,'pending',NULL,NULL),(186,'ebc2f96b-b9a5-4ba4-b9c9-34b0809bf150','9630963000','completed',450,'H900, Biradar Residancy, Shahu Colony, Near Kalpna theatre, Mumbai, Maharashtra, 412514','cod_61958830','order_SlCqGXnaph9W1v','2026-05-04 07:33:56','2026-05-04 10:27:58','2026-05-05','09:00:00','COD','paid',NULL,NULL),(187,'a0b5bb11-093d-422b-98bc-512668110099','9630963000','rejected',599,'H900, Biradar Residancy, Shahu Colony, Near Kalpna theatre, Mumbai, Maharashtra, 412514','cod_1b04290d','order_SlES63AwKdT2Mu','2026-05-04 09:08:26','2026-05-04 15:50:10','2026-05-04','17:00:00','COD','pending',NULL,NULL),(188,'ddab033d-49b0-4ea8-a917-ca0ba1770f4b','9630963000','confirmed',4300,'H900, Biradar Residancy, Shahu Colony, Near Kalpna theatre, Mumbai, Maharashtra, 412514','cod_47dd515b','order_SlLKWAmqJjyqJA','2026-05-04 15:52:07','2026-05-04 15:52:09','2026-05-07','11:00:00','COD','pending',NULL,NULL),(189,'171491e7-c31c-4b14-9840-1d7e8bb828d3','7897897890','confirmed',400,'H453, Asha Residency\nHinjewadi, near metro\nmumbai, Maharashtra\n481273','cod_312ae981','order_SlMGEV7frWBYjj','2026-05-04 16:46:45','2026-05-04 16:46:58','2026-05-05','11:00:00','COD','pending',NULL,NULL),(190,'70897600-ce6e-4585-b8d3-67d255b2cb98','9888587489','confirmed',799,'G405, Siya Apartment\nMangalnath, Near kripa temple\nmumbai, maharashtra\n142510','cod_8ab383c8','order_Sq7FKvhvJ52KwM','2026-05-16 17:20:31','2026-05-16 17:21:44','2026-05-17','09:00:00','COD','pending',NULL,NULL),(191,'3e29eef0-e1b8-4e0c-bedd-1937db3e8bd9','9021954403','pending',3400,'G405, Gurukripa Residency\nPimpari Chinchwad, Near Metro\nPune, Maharashtra\n417501',NULL,'order_SqtLCHVDSITgNC','2026-05-18 16:23:21','2026-05-18 16:23:21','2026-05-19','09:00:00',NULL,'pending',NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_orders`
--

DROP TABLE IF EXISTS `partner_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  `otp_verified` tinyint(1) DEFAULT '0',
  `total_amount` int NOT NULL,
  `partner_earning` int NOT NULL,
  `admin_commission` int NOT NULL,
  `payment_mode` varchar(20) DEFAULT 'online',
  `payment_status` varchar(20) DEFAULT 'pending',
  `service_address` text NOT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `cancelled_by` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_orders`
--

LOCK TABLES `partner_orders` WRITE;
/*!40000 ALTER TABLE `partner_orders` DISABLE KEYS */;
INSERT INTO `partner_orders` VALUES ('PO_2f456749-eb9a-4b76-9fea-b0f70d86da4b','a0b5bb11-093d-422b-98bc-512668110099','9','9630963000','11','Kitchen Trolly Cleaning(3 to 5)','Kitchen Cleaning','2026-05-04','17:00:00','rejected',NULL,NULL,NULL,NULL,0,599,539,60,'COD','pending','H900, Biradar Residancy, Shahu Colony, Near Kalpna theatre, Mumbai, Maharashtra, 412514',NULL,NULL,'not available','partner','2026-05-04 10:25:03','2026-05-04 15:50:10'),('PO_4d43eae3-a597-4038-b976-c20e7919caca','ebc2f96b-b9a5-4ba4-b9c9-34b0809bf150','9','9630963000','3','Fan Repair','Fan Services','2026-05-05','09:00:00','completed','2026-05-04 10:26:17','2026-05-04 10:27:07','2026-05-04 10:27:58',NULL,0,450,405,45,'COD','paid','H900, Biradar Residancy, Shahu Colony, Near Kalpna theatre, Mumbai, Maharashtra, 412514',NULL,NULL,NULL,NULL,'2026-05-04 10:25:39','2026-05-04 10:27:58');
/*!40000 ALTER TABLE `partner_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_payouts`
--

DROP TABLE IF EXISTS `partner_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_payouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partner_order_id` varchar(50) NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `partner_id` varchar(20) DEFAULT NULL,
  `total_order_amount` int NOT NULL,
  `platform_fee` int NOT NULL,
  `taxes` int NOT NULL,
  `partner_earning` int NOT NULL,
  `payout_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payout_method` varchar(50) DEFAULT NULL,
  `payout_reference_id` varchar(100) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_partner_order_id` (`partner_order_id`),
  KEY `fk_partner_order` (`partner_order_id`),
  KEY `idx_partner_id` (`partner_id`),
  CONSTRAINT `fk_partner_payouts_partner_order` FOREIGN KEY (`partner_order_id`) REFERENCES `partner_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_payouts`
--

LOCK TABLES `partner_payouts` WRITE;
/*!40000 ALTER TABLE `partner_payouts` DISABLE KEYS */;
INSERT INTO `partner_payouts` VALUES (1,'PO_4d43eae3-a597-4038-b976-c20e7919caca','ebc2f96b-b9a5-4ba4-b9c9-34b0809bf150','9',450,45,0,405,'paid','upi','UPI_TEST_SERVER_SUCCESS','2026-05-04 10:29:22','2026-05-04 10:28:42','2026-05-04 10:29:22');
/*!40000 ALTER TABLE `partner_payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `service_category_id` int NOT NULL,
  `experience` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mobile` (`mobile_number`),
  KEY `service_category_id` (`service_category_id`),
  CONSTRAINT `partners_ibfk_1` FOREIGN KEY (`service_category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (6,'Sandeep Ghatigaonkar','8652522445','male',1,10,'2025-08-23 10:27:28','2025-08-23 10:27:28'),(8,'Rajesh Kumar','9834326551','male',1,10,'2026-02-05 12:29:46','2026-02-05 12:29:46'),(9,'Shailesh Karale','7123712302','male',3,2,'2026-05-04 10:04:32','2026-05-04 10:06:37'),(10,'Partner','7878787800','male',1,0,'2026-05-04 16:30:46','2026-05-04 16:30:46'),(11,'Siya Jain','7878985858','female',3,2,'2026-05-16 18:36:37','2026-05-16 18:37:55');
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_addon`
--

DROP TABLE IF EXISTS `service_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_addon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_service_id` int NOT NULL,
  `addon_service_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `main_service_id` (`main_service_id`),
  KEY `addon_service_id` (`addon_service_id`),
  CONSTRAINT `service_addon_ibfk_1` FOREIGN KEY (`main_service_id`) REFERENCES `services` (`id`),
  CONSTRAINT `service_addon_ibfk_2` FOREIGN KEY (`addon_service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_addon`
--

LOCK TABLES `service_addon` WRITE;
/*!40000 ALTER TABLE `service_addon` DISABLE KEYS */;
INSERT INTO `service_addon` VALUES (1,1,3,'2026-03-15 09:37:02'),(2,1,30,'2026-03-23 09:26:16'),(3,1,13,'2026-03-23 09:28:06');
/*!40000 ALTER TABLE `service_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_excludes`
--

DROP TABLE IF EXISTS `service_excludes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_excludes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `service_excludes_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_excludes`
--

LOCK TABLES `service_excludes` WRITE;
/*!40000 ALTER TABLE `service_excludes` DISABLE KEYS */;
INSERT INTO `service_excludes` VALUES (1,1,'null','Kitchen: Cabinet interiors, appliance interiors, utensil cleaning','2026-03-15 08:43:07'),(2,1,'null','Hall / Living Room: Curtain washing, sofa/carpet shampooing, furniture moving','2026-03-15 08:43:07'),(3,1,'null','Bedroom: Mattress shampooing, wardrobe interiors, curtain washing','2026-03-15 08:43:07'),(4,1,'null','Bathroom: Plumbing work, blocked drain fixing, geyser cleaning','2026-03-15 08:43:07'),(5,1,'null','Balcony: Debris removal, paint removal, exterior glass cleaning','2026-03-15 08:43:07'),(6,2,'null','Wall wet mopping not included','2026-03-15 08:59:32'),(7,2,'null','Any damage will not be repaired or fixed','2026-03-15 08:59:32'),(8,2,'null','Appliance internal cleaning','2026-03-15 08:59:32'),(9,2,'null','Cabinet inside cleaning not included','2026-03-15 08:59:32'),(10,2,'null','Chimney or exhaust dismantling not included','2026-03-15 08:59:32'),(11,4,'null','Leather Treatment or Conditioning','2026-03-17 16:55:37'),(12,4,'null','Tear or Damage Repair','2026-03-17 16:56:00'),(13,4,'null','Stubborn/Old Stains that Need Chemical Treatment','2026-03-17 16:56:19'),(14,4,'null','Frame or Under-Sofa Cleaning','2026-03-17 16:56:39'),(15,10,'null','Removal of hard water scaling on ceilings, walls, and inaccessible areas.','2026-03-21 14:34:49'),(16,10,'null','Plumbing work, broken fitting repairs, or replacements.','2026-03-21 14:35:13'),(17,10,'null','Cleaning of overhead tanks, underground tanks, or pipelines.','2026-03-21 14:35:46'),(18,10,'null','Pest control, waterproofing, and odor treatment services.','2026-03-21 14:36:07'),(19,5,'null','Wall wet mopping not included','2026-03-21 14:41:17'),(20,5,'null','Any damage will not be repaired or fixed','2026-03-21 14:41:42'),(21,5,'null','Cabinet inside cleaning not included','2026-03-21 14:41:59'),(22,5,'null','Chimney or exhaust dismantling not included','2026-03-21 14:42:15'),(23,6,'null','Wall wet mopping not included','2026-03-21 14:46:22'),(24,6,'null','Any damage will not be repaired or fixed','2026-03-21 14:46:36'),(25,6,'null','Chimney or exhaust dismantling not included','2026-03-21 14:46:52'),(26,6,'null','Chimney or exhaust dismantling not included','2026-03-21 14:47:08');
/*!40000 ALTER TABLE `service_excludes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_includes`
--

DROP TABLE IF EXISTS `service_includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_includes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `service_includes_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_includes`
--

LOCK TABLES `service_includes` WRITE;
/*!40000 ALTER TABLE `service_includes` DISABLE KEYS */;
INSERT INTO `service_includes` VALUES (1,1,'null','Kitchen: Floor, walls, ceiling, slab, sink, cabinet exterior, tiles cleaning','2026-03-15 08:35:44'),(2,1,'null','Hall / Living Room: Floor, walls, ceiling, doors, windows, fan, switchboards cleaning','2026-03-15 08:35:44'),(3,1,'null','Bedroom: Floor, walls, ceiling, doors, windows, fan, switchboards cleaning','2026-03-15 08:35:44'),(4,1,'null','Bathroom: Floor, wall tiles, ceiling, WC, sink, mirror, fittings cleaning','2026-03-15 08:35:44'),(5,1,'null','Balcony: Floor, railing, walls, drain area cleaning','2026-03-15 08:35:44'),(6,2,'null','House Cleaning (Kitchen · Hall · 2 Bedrooms · 2 Bathrooms · Balcony)','2026-03-15 08:53:55'),(7,2,'null','Kitchen (Platform · Sink · Stove · Tiles · Floor · Fan · Exhaust · Switch Boards · Cabinets Outer)','2026-03-15 08:53:55'),(8,2,'null','Hall (Floor · Walls · Ceiling · Fan · Main Door · Windows/Slider · Sofa Dry · Tables · Chairs)','2026-03-15 08:53:55'),(9,2,'null','Bedroom 1 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)','2026-03-15 08:53:55'),(10,2,'null','Bedroom 2 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)','2026-03-15 08:53:55'),(11,2,'null','Bathroom 1 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)','2026-03-15 08:53:55'),(12,2,'null','Bathroom 2 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)','2026-03-15 08:53:55'),(13,2,'null','Balcony (Grills · Railings · Floor Sweep/Mop)','2026-03-15 08:53:55'),(14,4,'null','Vacuuming Sofa Surface to Remove Dust & Debris poster','2026-03-17 16:52:50'),(15,4,'null','Dry Dirt & Stain Spot Cleaning','2026-03-17 16:53:26'),(16,4,'null','Shampooing & Deep Cleaning Fabric Upholstery','2026-03-17 16:53:44'),(17,4,'null','Cushion & Pillow Fluffing & Cleaning','2026-03-17 16:54:08'),(18,4,'null','Armrest, Backrest & Outer Surface Wipe','2026-03-17 16:54:33'),(19,4,'null','Drying & Airing to Remove Moisture','2026-03-17 16:54:52'),(20,10,'null','Floor scrubbing & deep wet mopping','2026-03-21 14:31:27'),(21,10,'null','Wall tiles scrubbing & cleaning','2026-03-21 14:31:54'),(22,10,'null','WC seat deep cleaning','2026-03-21 14:32:11'),(23,10,'null','Sink & tap washing','2026-03-21 14:32:27'),(24,10,'null','Mirror & glass cleaning','2026-03-21 14:32:44'),(25,10,'null','Exhaust fan outer dust wipe','2026-03-21 14:33:06'),(26,5,'null','House Cleaning (Kitchen · Hall · 3 Bedrooms · 2 Bathrooms · Balcony)','2026-03-21 14:37:20'),(27,5,'null','Kitchen (Platform · Sink · Stove · Tiles · Floor · Fan · Exhaust · Switch Boards · Cabinets Outer)','2026-03-21 14:37:38'),(28,5,'null','Hall (Floor · Walls · Ceiling · Fan · Main Door · Windows/Slider · Sofa Dry · Tables · Chairs)','2026-03-21 14:39:04'),(29,5,'null','Bedroom 1 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe','2026-03-21 14:39:22'),(30,5,'null','Bedroom 2 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)','2026-03-21 14:39:37'),(31,5,'null','Bedroom 3 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)','2026-03-21 14:39:52'),(32,5,'null','Bathroom 1 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)','2026-03-21 14:40:09'),(33,5,'null','Bathroom 2 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)','2026-03-21 14:40:25'),(34,5,'null','Balcony (Grills · Railings · Floor Sweep/Mop)','2026-03-21 14:40:50'),(35,6,'null','House Cleaning (Kitchen · Hall · 4 Bedrooms · 3 Bathrooms · Balcony)','2026-03-21 14:42:52'),(36,6,'null','Kitchen (Platform · Sink · Stove · Tiles · Floor · Fan · Exhaust · Switch Boards · Cabinets Outer)','2026-03-21 14:43:17'),(37,6,'null','Hall (Floor · Walls · Ceiling · Fan · Main Door · Windows/Slider · Sofa Dry · Tables · Chairs)','2026-03-21 14:43:35'),(38,6,'null','Bedroom 1 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)','2026-03-21 14:43:51'),(39,6,'null','Bedroom 2 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)','2026-03-21 14:44:06'),(40,6,'null','Bedroom 3 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)','2026-03-21 14:44:21'),(41,6,'null','Bedroom 4 (Floor Sweep/Mop · Walls Wipe · Ceiling Dust · Bed & Mattress Dry Vacuum · Almira Outer Wipe)','2026-03-21 14:44:39'),(42,6,'null','Bathroom 1 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)','2026-03-21 14:44:54'),(43,6,'null','Bathroom 2 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)','2026-03-21 14:45:12'),(44,6,'null','Bathroom 3 (Floor · Tiles · Walls · Ceiling · Door · Window · Exhaust · Switch Boards · Geyser Outer)','2026-03-21 14:45:26'),(45,6,'null','Balcony (Grills · Railings · Floor Sweep/Mop)','2026-03-21 14:45:39');
/*!40000 ALTER TABLE `service_includes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `price` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `subcategory_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notes` text NOT NULL,
  `performed_by` varchar(150) NOT NULL,
  `duration_min` int NOT NULL,
  `duration_max` int NOT NULL,
  `tools_used` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service_type` enum('main','additional') NOT NULL DEFAULT 'main',
  PRIMARY KEY (`id`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'1BHK Deep Cleaning',3200,'/uploads/1bhk-deep-cleaning.jpeg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-15 08:23:34',''),(2,'2 BHK Deep Cleaning',4200,'/uploads/1bhk-deep-cleaning.jpeg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','45','120',0,0,'2026-03-15 08:47:56',''),(3,'Fan Repair',150,'/uploads/fan-repair.jpeg',11,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-15 09:36:35',''),(4,'Sofa Deep Cleaning',599,'/uploads/sofa-cleaning.jpeg',2,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-17 16:50:01',''),(5,'3BHK Deep Cleaning',5200,'/uploads/1bhk-deep-cleaning.jpeg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','45','160',0,0,'2026-03-20 14:55:01',''),(6,'4BHK Deep Cleaning',6200,'/uploads/1bhk-deep-cleaning.jpeg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','45','160',0,0,'2026-03-20 15:03:49',''),(7,'Sofa Deep Cleaning\r\n(3 to 5 seater)',996,'/uploads/sofa-cleaning.jpeg',2,'0000-00-00 00:00:00','0000-00-00 00:00:00','45','60',0,0,'2026-03-21 14:20:10',''),(8,'3 Seater Sofa Cleaning',599,'/uploads/sofa-cleaning.jpeg',2,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','50',0,0,'2026-03-21 14:22:29',''),(9,'Geyser Fitting',300,'/uploads/geyser-coil-repair.jpeg',8,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 14:26:09',''),(10,'Bathroom Deep Cleaning',499,'/uploads/bathroom-clean-with-machin.jpeg',3,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 14:30:25',''),(11,'Kitchen Trolly Cleaning(3 to 5)',499,'/uploads/maxresdefault.jpg',4,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','50',0,0,'2026-03-21 14:51:01',''),(12,'Kitchen Cabinates (5 to 10)',699,'/uploads/maxresdefault.jpg',4,'0000-00-00 00:00:00','0000-00-00 00:00:00','60','90',0,0,'2026-03-21 14:52:41',''),(13,'Tap (Nal) Repair/Replacement',200,'/uploads/nul-tap-repair-basin-bathroom.jpeg',5,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 14:56:34',''),(14,'Shower Mix Tap Installation/Repair',400,'/uploads/mix-tap-shower-repair.jpeg',5,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:00:21',''),(15,'Normal Bath Shower Repair/Installation',200,'/uploads/normal-bathroom-shower-repair2.jpeg',5,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:02:09',''),(16,'Bath Shower Heavy Work Repair',400,'/uploads/normal-bathroom-shower-repair2.jpeg',5,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:03:17',''),(17,'Washbasin Leakage Repair',200,'/uploads/basin-leakage-repair-heavy-work.jpeg',7,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:11:29',''),(18,'Washbasin Blockage Removal',200,'/uploads/basin-leakage-repair-heavy-work.jpeg',7,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:13:40',''),(19,'Washing Machine Tap/Pipe Fitting',150,'/uploads/washing-machine-pipe-fitting.jpeg',15,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:22:17',''),(20,'Toilet Flush Repair/Installation',200,'/uploads/toilet-flush-jetsprey-repair-installation.jpeg',6,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:25:18',''),(21,'Toilet Jet Spray, Tap, Pressure Gun Repair\r\n',150,'/uploads/toilet-flush-jetsprey-repair-installation.jpeg',6,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:27:31',''),(22,'Switch & Socket Repair/Replacement',100,'/uploads/socket-repair.jpeg',10,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:30:45',''),(23,'Switchboard & SocketBoard Repair',150,'/uploads/switchboard-repair.jpeg',10,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:33:08',''),(24,'New Switch Board Point and Fitting',250,'/uploads/switch-board-point-installation.jpeg',10,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:35:16',''),(25,'Fan Installation',100,'/uploads/fan-installation.jpeg',11,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:41:23',''),(26,'Tube light Installation',100,'/uploads/tubelight-installation.jpeg',12,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:45:06',''),(27,'Fan Winding and Bearing Change',600,'/uploads/fan-coil-replacement-repair.jpeg',11,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:46:42',''),(28,'Geyser Coil & New Coil Replacement',1200,'/uploads/geyser-coil-repair.jpeg',14,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:48:30',''),(29,'MCB Fault Repair',200,'/uploads/mcb-fault-repairing.jpeg',13,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 15:57:21',''),(30,'Pigeon Net Installation',20,'/uploads/pigeon-net-installation.jpeg',16,'0000-00-00 00:00:00','0000-00-00 00:00:00','30','45',0,0,'2026-03-21 16:13:30','');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `category_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `fk_subcategory_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Home Deep Cleaning',1,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(2,'Sofa Cleaning',1,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(3,'Bathroom Cleaning',1,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(4,'Kitchen Cleaning',1,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(5,'Tap and Shower Services',2,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(6,'Toilet and Flush Services',2,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(7,'Washbasin Services',2,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(8,'Geyser Services',2,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(9,'Pipe and Appliance Connection',2,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(10,'Switch and Socket Services',3,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(11,'Fan Services',3,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(12,'Lighting Services',3,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(13,'MCB Services',3,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(14,'Geyser Electrical Repair',3,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(15,'Washing Machine Service',2,'2026-04-06 18:28:49','2026-04-06 18:28:49'),(16,'Net Installation Services',7,'2026-04-06 18:28:49','2026-04-06 18:28:49');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_otps`
--

DROP TABLE IF EXISTS `user_otps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_otps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `expiration_time` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_otps`
--

LOCK TABLES `user_otps` WRITE;
/*!40000 ALTER TABLE `user_otps` DISABLE KEYS */;
INSERT INTO `user_otps` VALUES (26,'9867315361','274344',0,1747980967629,'2025-05-23 06:11:07','2025-05-23 06:11:07'),(27,'9867315361','949001',0,1747982294649,'2025-05-23 06:33:14','2025-05-23 06:33:14'),(28,'9867315361','589719',0,1747982600134,'2025-05-23 06:38:21','2025-05-23 06:38:21'),(29,'9867315361','736413',0,1749067888729,'2025-06-04 20:06:29','2025-06-04 20:06:29'),(30,'9867315361','556080',0,1749237100507,'2025-06-06 19:06:41','2025-06-06 19:06:41'),(31,'9922992299','163088',0,1749539642741,'2025-06-10 07:09:03','2025-06-10 07:09:03'),(32,'9867315361','369629',0,1751134682737,'2025-06-28 18:13:03','2025-06-28 18:13:03'),(33,'9820868352','224722',0,1752733307116,'2025-07-17 06:16:48','2025-07-17 06:16:48'),(34,'9820868352','917020',0,1752820884399,'2025-07-18 06:36:24','2025-07-18 06:36:24'),(35,'9867315361','216417',0,1753079871738,'2025-07-21 06:32:51','2025-07-21 06:32:51'),(36,'9933993322','496888',0,1753080230308,'2025-07-21 06:38:50','2025-07-21 06:38:50'),(37,'9362626262','315461',0,1753080379574,'2025-07-21 06:41:19','2025-07-21 06:41:19'),(38,'9922992299','204296',0,1753165879852,'2025-07-22 06:26:19','2025-07-22 06:26:19'),(39,'9922992299','698467',0,1753166048235,'2025-07-22 06:29:08','2025-07-22 06:29:08'),(40,'9922992299','850886',0,1753166192885,'2025-07-22 06:31:32','2025-07-22 06:31:32'),(41,'9922992299','222222',0,1753166330265,'2025-07-22 06:33:50','2025-07-22 06:33:50'),(42,'9922335533','222222',0,1753166494855,'2025-07-22 06:36:34','2025-07-22 06:36:34'),(43,'9922992299','222222',0,1753167008661,'2025-07-22 06:45:08','2025-07-22 06:45:08'),(44,'9922992299','222222',0,1753167550352,'2025-07-22 06:54:10','2025-07-22 06:54:10'),(45,'9933993399','222222',0,1753253599227,'2025-07-23 06:48:19','2025-07-23 06:48:19'),(46,'9933993399','222222',0,1753253710156,'2025-07-23 06:50:10','2025-07-23 06:50:10'),(47,'9933993399','222222',0,1753253778682,'2025-07-23 06:51:18','2025-07-23 06:51:18'),(48,'9922992299','222222',0,1753257050488,'2025-07-23 07:45:50','2025-07-23 07:45:50'),(49,'9933993399','222222',0,1753257565603,'2025-07-23 07:54:25','2025-07-23 07:54:25'),(50,'9899229922','222222',0,1753349181934,'2025-07-24 09:21:21','2025-07-24 09:21:21'),(51,'9933992299','222222',0,1753349817600,'2025-07-24 09:31:57','2025-07-24 09:31:57'),(52,'9922992299','222222',0,1753350384229,'2025-07-24 09:41:24','2025-07-24 09:41:24'),(53,'8591593025','222222',0,1753350686222,'2025-07-24 09:46:26','2025-07-24 09:46:26'),(54,'9933229922','222222',0,1753351171111,'2025-07-24 09:54:31','2025-07-24 09:54:31'),(55,'9922993399','222222',0,1753351596117,'2025-07-24 10:01:36','2025-07-24 10:01:36'),(56,'9922992299','222222',0,1753351982101,'2025-07-24 10:08:02','2025-07-24 10:08:02'),(57,'9922992299','222222',0,1753352180613,'2025-07-24 10:11:20','2025-07-24 10:11:20'),(58,'9922992599','222222',0,1753352349597,'2025-07-24 10:14:09','2025-07-24 10:14:09'),(59,'9922992299','222222',0,1753352640448,'2025-07-24 10:19:00','2025-07-24 10:19:00'),(60,'9922992299','222222',0,1753352898007,'2025-07-24 10:23:18','2025-07-24 10:23:18'),(61,'9922992299','222222',0,1753353057757,'2025-07-24 10:25:57','2025-07-24 10:25:57'),(62,'9922992299','222222',0,1753437803863,'2025-07-25 09:58:23','2025-07-25 09:58:23'),(63,'9922992299','222222',0,1753684380869,'2025-07-28 06:28:00','2025-07-28 06:28:00'),(64,'9922992299','222222',0,1753684477806,'2025-07-28 06:29:37','2025-07-28 06:29:37'),(65,'9922992299','222222',0,1754126633215,'2025-08-02 09:18:53','2025-08-02 09:18:53'),(66,'9922992299','222222',0,1754134635283,'2025-08-02 11:32:15','2025-08-02 11:32:15'),(67,'9922992299','222222',0,1754883888586,'2025-08-11 03:39:48','2025-08-11 03:39:48'),(68,'9370699751','222222',0,1754895562389,'2025-08-11 06:54:22','2025-08-11 06:54:22'),(69,'9922992299','222222',0,1755004295898,'2025-08-12 13:06:35','2025-08-12 13:06:35'),(70,'9922992299','222222',0,1755282521170,'2025-08-15 18:23:41','2025-08-15 18:23:41'),(71,'9922992299','222222',0,1755282523982,'2025-08-15 18:23:43','2025-08-15 18:23:43'),(72,'9922992299','222222',0,1755282805135,'2025-08-15 18:28:25','2025-08-15 18:28:25'),(73,'9820868352','222222',0,1755332868718,'2025-08-16 08:22:48','2025-08-16 08:22:48'),(74,'9922992299','222222',0,1755334278889,'2025-08-16 08:46:18','2025-08-16 08:46:18'),(75,'9867315361','722947',0,1755943100895,'2025-08-23 09:53:21','2025-08-23 09:53:21'),(76,'9922992299','940696',0,1756438514780,'2025-08-29 03:30:15','2025-08-29 03:30:15'),(77,'6260671585','717501',0,1756974578432,'2025-09-04 08:24:38','2025-09-04 08:24:38'),(78,'6260671585','914817',0,1757502143665,'2025-09-10 10:57:24','2025-09-10 10:57:24'),(79,'9922992299','272519',0,1759282074836,'2025-10-01 01:22:55','2025-10-01 01:22:55'),(80,'9922992299','578863',0,1759686316917,'2025-10-05 17:40:18','2025-10-05 17:40:18'),(81,'9922992299','555138',0,1759686339633,'2025-10-05 17:40:40','2025-10-05 17:40:40'),(82,'9922992299','730875',0,1759686346131,'2025-10-05 17:40:46','2025-10-05 17:40:46'),(83,'9922992299','621700',0,1759686391314,'2025-10-05 17:41:31','2025-10-05 17:41:31'),(84,'9922992299','356690',0,1759686392520,'2025-10-05 17:41:32','2025-10-05 17:41:32'),(85,'9922992299','939701',0,1759686409970,'2025-10-05 17:41:50','2025-10-05 17:41:50'),(86,'9922992299','375178',0,1759686421427,'2025-10-05 17:42:01','2025-10-05 17:42:01'),(87,'9922992299','308272',0,1759686451681,'2025-10-05 17:42:32','2025-10-05 17:42:32'),(88,'9922992299','399506',0,1759686479772,'2025-10-05 17:43:00','2025-10-05 17:43:00'),(89,'9922992299','921576',0,1759686507386,'2025-10-05 17:43:27','2025-10-05 17:43:27'),(90,'9922992299','971393',0,1759686533822,'2025-10-05 17:43:54','2025-10-05 17:43:54'),(91,'9922992299','526236',0,1759686560704,'2025-10-05 17:44:21','2025-10-05 17:44:21'),(92,'9922992299','665881',0,1759686589026,'2025-10-05 17:44:49','2025-10-05 17:44:49'),(93,'9922992299','527416',0,1759686615478,'2025-10-05 17:45:15','2025-10-05 17:45:15'),(94,'9922992299','975334',0,1761532405092,'2025-10-27 02:28:25','2025-10-27 02:28:25'),(95,'9922992299','416440',0,1762135582688,'2025-11-03 02:01:23','2025-11-03 02:01:23'),(96,'9922992299','795684',0,1762157521579,'2025-11-03 08:07:02','2025-11-03 08:07:02'),(97,'9922992299','465226',0,1763359190684,'2025-11-17 05:54:51','2025-11-17 05:54:51'),(98,'9922992299','549686',0,1766053173582,'2025-12-18 10:14:33','2025-12-18 10:14:33'),(99,'9867315361','757159',0,1766053186286,'2025-12-18 10:14:46','2025-12-18 10:14:46'),(100,'9867315361','391267',0,1766320198385,'2025-12-21 12:24:58','2025-12-21 12:24:58'),(101,'9922992299','520814',0,1766321112339,'2025-12-21 12:40:12','2025-12-21 12:40:12'),(102,'9922992299','312101',0,1766321135216,'2025-12-21 12:40:35','2025-12-21 12:40:35'),(103,'9922992299','597861',0,1766321195413,'2025-12-21 12:41:35','2025-12-21 12:41:35'),(104,'9867315361','667826',0,1766321332797,'2025-12-21 12:43:52','2025-12-21 12:43:52'),(105,'9922992299','565071',0,1766331077171,'2025-12-21 15:26:17','2025-12-21 15:26:17'),(106,'9922992299','784721',0,1766331584434,'2025-12-21 15:34:44','2025-12-21 15:34:44'),(107,'9922992299','879732',0,1766331734098,'2025-12-21 15:37:14','2025-12-21 15:37:14'),(108,'9867315362','738170',0,1766332724389,'2025-12-21 15:53:44','2025-12-21 15:53:44'),(109,'9922992299','437463',0,1766333579428,'2025-12-21 16:07:59','2025-12-21 16:07:59'),(110,'9922992299','958249',0,1766333680683,'2025-12-21 16:09:40','2025-12-21 16:09:40'),(111,'9922992299','400973',0,1766333796811,'2025-12-21 16:11:36','2025-12-21 16:11:36'),(112,'9922992299','446003',0,1766333945980,'2025-12-21 16:14:05','2025-12-21 16:14:05'),(113,'9922992299','638583',0,1766334291293,'2025-12-21 16:19:51','2025-12-21 16:19:51'),(114,'9922992299','749348',0,1766334525308,'2025-12-21 16:23:45','2025-12-21 16:23:45'),(115,'9922992299','846845',0,1766341216120,'2025-12-21 18:15:16','2025-12-21 18:15:16'),(116,'9922992299','646654',0,1766344488431,'2025-12-21 19:09:48','2025-12-21 19:09:48'),(117,'9922992299','532406',0,1766348295058,'2025-12-21 20:13:15','2025-12-21 20:13:15'),(118,'9922992299','819846',0,1766519402197,'2025-12-23 19:45:02','2025-12-23 19:45:02'),(119,'9822982292','370024',0,1766560288606,'2025-12-24 07:06:28','2025-12-24 07:06:28'),(120,'9867315361','957570',0,1766686961815,'2025-12-25 18:17:41','2025-12-25 18:17:41'),(121,'9922992299','327082',0,1767985907754,'2026-01-09 19:06:47','2026-01-09 19:06:47'),(122,'9867315361','967248',0,1768071320057,'2026-01-10 18:50:20','2026-01-10 18:50:20'),(123,'9867315361','788642',0,1768071388429,'2026-01-10 18:51:28','2026-01-10 18:51:28'),(124,'9922992299','682249',0,1768071756046,'2026-01-10 18:57:36','2026-01-10 18:57:36'),(125,'9867315361','271076',0,1768074033565,'2026-01-10 19:35:33','2026-01-10 19:35:33'),(126,'9867315361','480117',0,1768074548095,'2026-01-10 19:44:08','2026-01-10 19:44:08'),(127,'9867315361','869466',0,1768076302289,'2026-01-10 20:13:22','2026-01-10 20:13:22'),(128,'9867315361','572126',0,1768076367139,'2026-01-10 20:14:27','2026-01-10 20:14:27'),(129,'9922992299','973317',0,1768121075902,'2026-01-11 08:39:35','2026-01-11 08:39:35'),(130,'9922992299','529358',0,1768121139689,'2026-01-11 08:40:39','2026-01-11 08:40:39'),(131,'9922992299','380097',0,1768121156642,'2026-01-11 08:40:56','2026-01-11 08:40:56'),(132,'9922992299','917792',0,1768121159523,'2026-01-11 08:40:59','2026-01-11 08:40:59'),(133,'9922992299','997615',0,1768121242231,'2026-01-11 08:42:22','2026-01-11 08:42:22'),(134,'9922992299','254899',0,1768128550168,'2026-01-11 10:44:10','2026-01-11 10:44:10'),(135,'9867315361','508489',0,1768463947357,'2026-01-15 07:54:04','2026-01-15 07:54:04'),(136,'8652522445','139520',0,1768464294579,'2026-01-15 07:59:52','2026-01-15 07:59:52'),(137,'8652522445','403073',0,1768475660638,'2026-01-15 11:09:17','2026-01-15 11:09:17'),(138,'8652522445','781180',0,1768475665826,'2026-01-15 11:09:22','2026-01-15 11:09:22'),(139,'8652522445','971926',0,1768475724272,'2026-01-15 11:10:21','2026-01-15 11:10:21'),(140,'9922992299','816022',0,1769396470276,'2026-01-26 02:56:10','2026-01-26 02:56:10'),(141,'9922992299','681972',0,1769396557866,'2026-01-26 02:57:37','2026-01-26 02:57:37'),(142,'9920992299','928415',0,1770320709389,'2026-02-05 19:40:09','2026-02-05 19:40:09'),(143,'9920929802','400139',0,1770360646805,'2026-02-06 06:45:45','2026-02-06 06:45:45'),(144,'9922992299','504163',0,1770408687664,'2026-02-06 20:06:26','2026-02-06 20:06:26'),(145,'9922992299','448888',0,1770447106867,'2026-02-07 06:46:45','2026-02-07 06:46:45'),(146,'9922992291','325883',0,1770447899151,'2026-02-07 06:59:57','2026-02-07 06:59:57'),(147,'9922992292','389950',0,1770448371650,'2026-02-07 07:07:50','2026-02-07 07:07:50'),(148,'9922992299','530030',0,1770454186158,'2026-02-07 08:44:44','2026-02-07 08:44:44'),(149,'9922992299','245581',0,1770454777803,'2026-02-07 08:54:36','2026-02-07 08:54:36'),(150,'9922992299','263064',0,1770454872675,'2026-02-07 08:56:11','2026-02-07 08:56:11'),(151,'9922992299','647131',0,1770454927061,'2026-02-07 08:57:05','2026-02-07 08:57:05'),(152,'9922992299','403506',0,1770454984305,'2026-02-07 08:58:02','2026-02-07 08:58:02'),(153,'9922992299','614372',0,1770455849069,'2026-02-07 09:12:29','2026-02-07 09:12:29'),(154,'9922993499','949615',0,1770456395454,'2026-02-07 09:21:33','2026-02-07 09:21:33'),(155,'9021954403','426230',0,1771433869623,'2026-02-18 16:52:49','2026-02-18 16:52:49'),(156,'9021954403','365041',0,1771433921376,'2026-02-18 16:53:41','2026-02-18 16:53:41'),(157,'9021954403','732983',0,1771510858553,'2026-02-19 14:15:58','2026-02-19 14:15:58'),(158,'9021954403','958537',0,1772010110248,'2026-02-25 08:56:50','2026-02-25 08:56:50'),(159,'9024954403','407938',0,1772018808915,'2026-02-25 11:21:48','2026-02-25 11:21:48'),(160,'9021954403','885800',0,1772097100373,'2026-02-26 09:06:40','2026-02-26 09:06:40'),(161,'9021954403','797840',0,1772097130091,'2026-02-26 09:07:10','2026-02-26 09:07:10'),(162,'9021954403','791073',0,1772429874198,'2026-03-02 05:32:54','2026-03-02 05:32:54'),(163,'9021954403','595923',0,1773039797398,'2026-03-09 06:58:17','2026-03-09 06:58:17'),(164,'9021954403','322598',0,1773047782665,'2026-03-09 09:11:22','2026-03-09 09:11:22'),(165,'9021954403','506329',0,1773048109760,'2026-03-09 09:16:49','2026-03-09 09:16:49'),(166,'9021954403','180450',0,1773049471883,'2026-03-09 09:39:31','2026-03-09 09:39:31'),(167,'9021954403','645702',0,1773050326207,'2026-03-09 09:53:46','2026-03-09 09:53:46'),(168,'9021954403','578309',0,1773051769583,'2026-03-09 10:17:49','2026-03-09 10:17:49'),(169,'9021954403','421609',0,1773052300993,'2026-03-09 10:26:40','2026-03-09 10:26:40'),(170,'9021954403','665328',0,1773053186539,'2026-03-09 10:41:26','2026-03-09 10:41:26'),(171,'9024954403','427644',0,1773053516481,'2026-03-09 10:46:56','2026-03-09 10:46:56'),(172,'9021954403','121513',0,1773053842818,'2026-03-09 10:52:22','2026-03-09 10:52:22'),(173,'9021954403','229253',0,1773054388022,'2026-03-09 11:01:28','2026-03-09 11:01:28'),(174,'9021954403','418818',0,1773055160951,'2026-03-09 11:14:20','2026-03-09 11:14:20'),(175,'9024954403','968020',0,1773056281359,'2026-03-09 11:33:01','2026-03-09 11:33:01'),(176,'9021954403','865052',0,1773056964302,'2026-03-09 11:44:24','2026-03-09 11:44:24'),(177,'9021954403','636948',0,1773057007274,'2026-03-09 11:45:07','2026-03-09 11:45:07'),(178,'9021954403','991537',0,1773057012503,'2026-03-09 11:45:12','2026-03-09 11:45:12'),(179,'9021954403','349546',0,1773057046999,'2026-03-09 11:45:47','2026-03-09 11:45:47'),(180,'9021954403','443923',0,1773077859200,'2026-03-09 17:32:39','2026-03-09 17:32:39'),(181,'9021954403','947962',0,1773081764914,'2026-03-09 18:37:44','2026-03-09 18:37:44'),(182,'9021954403','247071',0,1773081915882,'2026-03-09 18:40:15','2026-03-09 18:40:15'),(183,'45125','972144',0,1773083127543,'2026-03-09 19:00:27','2026-03-09 19:00:27'),(184,'90219544033','299955',0,1773083146638,'2026-03-09 19:00:46','2026-03-09 19:00:46'),(185,'90219544033','963618',0,1773145038918,'2026-03-10 12:12:18','2026-03-10 12:12:18'),(186,'9021954403','215712',0,1773145207962,'2026-03-10 12:15:07','2026-03-10 12:15:07'),(187,'9021954403','241601',0,1773147066089,'2026-03-10 12:46:06','2026-03-10 12:46:06'),(188,'9021954403','682005',0,1773152360659,'2026-03-10 14:14:20','2026-03-10 14:14:20'),(189,'9021954403','709913',0,1773158183712,'2026-03-10 15:51:23','2026-03-10 15:51:23'),(190,'9021954403','299598',0,1773159472156,'2026-03-10 16:12:52','2026-03-10 16:12:52'),(191,'9898986565','958445',0,1774438171489,'2026-03-25 11:24:31','2026-03-25 11:24:31'),(192,'6565636565','545188',0,1774438223046,'2026-03-25 11:25:23','2026-03-25 11:25:23'),(193,'9021954403','533882',0,1774438456223,'2026-03-25 11:29:16','2026-03-25 11:29:16'),(194,'7841784120','509812',0,1774450435932,'2026-03-25 14:48:55','2026-03-25 14:48:55'),(195,'7575747410','378608',0,1774450563799,'2026-03-25 14:51:03','2026-03-25 14:51:03'),(196,'9922992299','935659',0,1775266692588,'2026-04-04 01:33:12','2026-04-04 01:33:12'),(197,'7878789898','415632',0,1775461998187,'2026-04-06 07:48:18','2026-04-06 07:48:18'),(198,'7000000001','347266',1,1775510454855,'2026-04-06 21:15:54','2026-04-06 21:17:46'),(199,'9448889820','822653',1,1775568074065,'2026-04-07 13:16:14','2026-04-07 13:16:27'),(200,'9448889820','457198',1,1775623339662,'2026-04-08 04:37:19','2026-04-08 04:37:48'),(201,'9448889820','758267',1,1775623393936,'2026-04-08 04:38:13','2026-04-08 04:38:31'),(202,'9000900090','640760',1,1775623543694,'2026-04-08 04:40:43','2026-04-08 04:40:58'),(203,'8484848484','179074',0,1775720870203,'2026-04-09 07:42:50','2026-04-09 07:42:50'),(204,'9595959540','106912',0,1775840815854,'2026-04-10 17:01:55','2026-04-10 17:01:55'),(205,'9595959540','742642',1,1775840985847,'2026-04-10 17:04:45','2026-04-10 17:05:01'),(206,'9859859850','776798',1,1775850142784,'2026-04-10 19:37:22','2026-04-10 19:40:52'),(207,'9859859850','271703',1,1775851454865,'2026-04-10 19:59:14','2026-04-10 19:59:30'),(208,'7841000000','715933',0,1775852072162,'2026-04-10 20:09:32','2026-04-10 20:09:32'),(209,'7841000000','438292',1,1775852195394,'2026-04-10 20:11:35','2026-04-10 20:11:49'),(210,'9879879879','913393',0,1775890840809,'2026-04-11 06:55:40','2026-04-11 06:55:40'),(211,'9879879879','329184',1,1775890910596,'2026-04-11 06:56:50','2026-04-11 06:57:14'),(212,'9856321400','785722',1,1775893861079,'2026-04-11 07:46:01','2026-04-11 07:46:22'),(213,'7894561230','677300',1,1775904506248,'2026-04-11 10:43:26','2026-04-11 10:43:45'),(214,'7458521020','224564',1,1775906002909,'2026-04-11 11:08:22','2026-04-11 11:09:28'),(215,'9933223366','241765',1,1775906016105,'2026-04-11 11:08:36','2026-04-11 11:08:51'),(216,'9933223366','873097',1,1775906040618,'2026-04-11 11:09:00','2026-04-11 11:09:16'),(217,'9933232233','744864',1,1775906283311,'2026-04-11 11:13:03','2026-04-11 11:13:12'),(218,'9922332233','522424',1,1776060841816,'2026-04-13 06:09:01','2026-04-13 06:10:54'),(219,'6565656464','768554',1,1776061285769,'2026-04-13 06:16:25','2026-04-13 06:16:35'),(220,'9090212190','271614',1,1776084371221,'2026-04-13 12:41:11','2026-04-13 12:41:28'),(221,'9090212190','666758',1,1776098064831,'2026-04-13 16:29:24','2026-04-13 16:29:37'),(222,'9090212190','840431',1,1776099658259,'2026-04-13 16:55:58','2026-04-13 16:56:10'),(223,'9090212190','139307',1,1776101092378,'2026-04-13 17:19:52','2026-04-13 17:20:07'),(224,'9090212190','817701',1,1776101183045,'2026-04-13 17:21:23','2026-04-13 17:21:41'),(225,'9874987400','349112',1,1776101367336,'2026-04-13 17:24:27','2026-04-13 17:24:38'),(226,'9874987400','356807',1,1776103068607,'2026-04-13 17:52:48','2026-04-13 17:53:00'),(227,'8822882255','471740',0,1776152338582,'2026-04-14 07:33:58','2026-04-14 07:33:58'),(228,'8748748740','689905',0,1776152490178,'2026-04-14 07:36:30','2026-04-14 07:36:30'),(229,'8748748740','250802',0,1776152494329,'2026-04-14 07:36:34','2026-04-14 07:36:34'),(230,'8695957485','547422',1,1776152528540,'2026-04-14 07:37:08','2026-04-14 07:37:21'),(231,'8695957485','603068',1,1776153926945,'2026-04-14 08:00:26','2026-04-14 08:00:38'),(232,'8695957485','328944',1,1776156441287,'2026-04-14 08:42:21','2026-04-14 08:42:36'),(233,'8695957485','948273',1,1776156854864,'2026-04-14 08:49:14','2026-04-14 08:49:26'),(234,'8695957485','236432',1,1776157622757,'2026-04-14 09:02:02','2026-04-14 09:02:17'),(235,'8695957485','519422',1,1776157781967,'2026-04-14 09:04:41','2026-04-14 09:04:52'),(236,'8080528528','490166',1,1776160793231,'2026-04-14 09:54:53','2026-04-14 09:55:12'),(237,'8080528528','983986',1,1776161807337,'2026-04-14 10:11:47','2026-04-14 10:12:00'),(238,'8080528528','555206',1,1776162153676,'2026-04-14 10:17:33','2026-04-14 10:17:45'),(239,'8695957485','323785',1,1776163346782,'2026-04-14 10:37:26','2026-04-14 10:37:37'),(240,'8080528528','144341',1,1776165409961,'2026-04-14 11:11:49','2026-04-14 11:11:59'),(241,'7444174441','955408',1,1776165831442,'2026-04-14 11:18:51','2026-04-14 11:19:03'),(242,'9855550000','145144',1,1776166491633,'2026-04-14 11:29:51','2026-04-14 11:30:08'),(243,'9855550000','326216',1,1776170252695,'2026-04-14 12:32:32','2026-04-14 12:32:42'),(244,'9988998822','778086',0,1776270553736,'2026-04-15 16:24:13','2026-04-15 16:24:13'),(245,'9989989989','211321',1,1776270959671,'2026-04-15 16:30:59','2026-04-15 16:31:08'),(246,'7856342190','932493',1,1776271617552,'2026-04-15 16:41:57','2026-04-15 16:42:10'),(247,'9531313131','948075',1,1777106369479,'2026-04-25 08:34:29','2026-04-25 08:37:06'),(248,'9823865568','281608',1,1777112092350,'2026-04-25 10:09:52','2026-04-25 10:11:32'),(249,'9595889595','485786',1,1777112226496,'2026-04-25 10:12:06','2026-04-25 10:12:16'),(250,'9999899998','655914',0,1777112276056,'2026-04-25 10:12:56','2026-04-25 10:12:56'),(251,'9531313131','544955',1,1777112314864,'2026-04-25 10:13:34','2026-04-25 10:13:45'),(252,'9531313131','720065',1,1777113890077,'2026-04-25 10:39:50','2026-04-25 10:40:21'),(253,'9531313131','687074',1,1777120342253,'2026-04-25 12:27:22','2026-04-25 12:27:36'),(254,'9531313131','491730',1,1777120864230,'2026-04-25 12:36:04','2026-04-25 12:36:15'),(255,'9531313131','919415',1,1777270497764,'2026-04-27 06:09:57','2026-04-27 06:10:41'),(256,'9531313131','260131',1,1777272836490,'2026-04-27 06:48:56','2026-04-27 06:49:11'),(257,'9531313131','910153',0,1777489032116,'2026-04-29 18:52:12','2026-04-29 18:52:12'),(258,'9820209820','433553',0,1777879671140,'2026-05-04 07:22:51','2026-05-04 07:22:51'),(259,'9820209820','948591',0,1777879722506,'2026-05-04 07:23:42','2026-05-04 07:23:42'),(260,'9820209820','610284',0,1777879741817,'2026-05-04 07:24:01','2026-05-04 07:24:01'),(261,'9630963000','643103',1,1777879797770,'2026-05-04 07:24:57','2026-05-04 07:25:13'),(262,'7841784144','501029',0,1777882318088,'2026-05-04 08:06:58','2026-05-04 08:06:58'),(263,'7123712300','916941',0,1777886813756,'2026-05-04 09:21:53','2026-05-04 09:21:53'),(264,'7123712301','313489',1,1777886923625,'2026-05-04 09:23:43','2026-05-04 09:23:57'),(265,'7123712302','613828',1,1777887441039,'2026-05-04 09:32:21','2026-05-04 09:32:35'),(266,'7123712302','418816',1,1777887948496,'2026-05-04 09:40:48','2026-05-04 09:41:04'),(267,'7123712302','333957',1,1777888075718,'2026-05-04 09:42:55','2026-05-04 09:43:06'),(268,'7123712302','832451',1,1777889066124,'2026-05-04 09:59:26','2026-05-04 09:59:37'),(269,'7123712302','356112',1,1777889360900,'2026-05-04 10:04:20','2026-05-04 10:04:32'),(270,'7878787800','178142',1,1777912524994,'2026-05-04 16:30:24','2026-05-04 16:30:46'),(271,'7897897890','926258',0,1777913204643,'2026-05-04 16:41:44','2026-05-04 16:41:44'),(272,'7897897890','838400',0,1777913291670,'2026-05-04 16:43:11','2026-05-04 16:43:11'),(273,'7897897890','232097',1,1777913396409,'2026-05-04 16:44:56','2026-05-04 16:45:07'),(274,'9888587489','288921',1,1778952032774,'2026-05-16 17:15:32','2026-05-16 17:15:49'),(275,'7878985858','665599',1,1778956869096,'2026-05-16 18:36:09','2026-05-16 18:36:37'),(276,'9922992299','897363',0,1778957709722,'2026-05-16 18:50:09','2026-05-16 18:50:09'),(277,'9922992299','258136',0,1778957736010,'2026-05-16 18:50:36','2026-05-16 18:50:36'),(278,'9922992299','796721',0,1778957768516,'2026-05-16 18:51:08','2026-05-16 18:51:08'),(279,'9922992299','254924',0,1778957835151,'2026-05-16 18:52:15','2026-05-16 18:52:15'),(280,'9922992299','775214',0,1778957877010,'2026-05-16 18:52:57','2026-05-16 18:52:57'),(281,'9922992299','949076',0,1778997649671,'2026-05-17 05:55:49','2026-05-17 05:55:49'),(282,'6563228899','738110',0,1779121541159,'2026-05-18 16:20:41','2026-05-18 16:20:41'),(283,'9021954403','718675',1,1779121564800,'2026-05-18 16:21:04','2026-05-18 16:21:20'),(284,'7841959595','668385',1,1779550429795,'2026-05-23 15:28:49','2026-05-23 15:28:59'),(285,'9867315361','492856',1,1779567458202,'2026-05-23 20:12:38','2026-05-23 20:13:45');
/*!40000 ALTER TABLE `user_otps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (92,'9922992299','Meera','Female','2026-02-06 20:06:40','2026-02-06 20:06:40'),(94,'9922992291','meena','Female','2026-02-07 07:00:07','2026-02-07 07:00:07'),(95,'9922992292','neeta','Male','2026-02-07 07:07:57','2026-02-07 07:07:57'),(99,'9922993499','tufan','Male','2026-02-07 09:21:40','2026-02-07 09:21:40'),(100,'9021954403','rups','Female','2026-02-25 09:00:39','2026-02-25 09:00:39'),(109,'7841784120','','','2026-03-25 14:49:06','2026-03-25 14:49:06'),(110,'7575747410','','','2026-03-25 14:51:25','2026-03-25 14:51:25'),(111,'9820868352','','','2026-04-06 18:46:57','2026-04-06 18:46:57'),(112,'7000000001','Hari','Male','2026-04-06 21:17:46','2026-04-11 07:38:03'),(113,'9448889820','Ajay Tiwari','Female','2026-04-07 13:16:27','2026-04-07 13:17:48'),(116,'9000900090','','','2026-04-08 04:40:58','2026-04-08 04:40:58'),(117,'9595959540','Akash Ambani','Male','2026-04-10 17:05:01','2026-04-10 17:08:27'),(118,'9859859850','Ramya Sandhu','Female','2026-04-10 19:40:52','2026-04-10 19:41:59'),(120,'7841000000','Rups','Female','2026-04-10 20:11:49','2026-04-10 20:12:57'),(121,'9879879879','Ramya Shrivastav','Female','2026-04-11 06:57:14','2026-04-11 06:58:32'),(122,'9856321400','Rohan Panchal','Male','2026-04-11 07:46:22','2026-04-11 07:47:43'),(123,'7894561230','Raju','Male','2026-04-11 10:43:45','2026-04-11 10:45:56'),(124,'9933223366','','','2026-04-11 11:08:51','2026-04-11 11:08:51'),(126,'7458521020','','','2026-04-11 11:09:28','2026-04-11 11:09:28'),(128,'9933232233','Praveen','Male','2026-04-11 11:13:12','2026-04-11 11:14:58'),(129,'9922332233','hjdd','Male','2026-04-13 06:10:54','2026-04-13 06:11:56'),(130,'6565656464','Mahadev','Male','2026-04-13 06:16:35','2026-04-13 07:32:23'),(131,'9090212190','Monika Singh','Female','2026-04-13 12:41:28','2026-04-13 12:45:26'),(132,'9874987400','Shakti Nagare','Female','2026-04-13 17:24:38','2026-04-13 17:25:45'),(133,'8695957485','Inaya Sharma','Female','2026-04-14 07:37:21','2026-04-14 07:38:42'),(134,'8080528528','Rahul vaidya','Male','2026-04-14 09:55:12','2026-04-14 09:56:16'),(135,'7444174441','','','2026-04-14 11:19:03','2026-04-14 11:19:03'),(136,'9855550000','Naina Sharma','Female','2026-04-14 11:30:08','2026-04-14 11:49:46'),(137,'9989989989','Aaryaman Deshpande','Male','2026-04-15 16:31:08','2026-04-15 16:33:01'),(138,'7856342190','Test one','Male','2026-04-15 16:42:10','2026-04-15 16:43:53'),(139,'9531313131','praveen','Male','2026-04-25 08:37:06','2026-04-25 08:38:22'),(140,'9823865568','','','2026-04-25 10:11:32','2026-04-25 10:11:32'),(141,'9595889595','','','2026-04-25 10:12:16','2026-04-25 10:12:16'),(142,'9630963000','Sujit Biradar','Male','2026-05-04 07:25:13','2026-05-04 07:26:48'),(143,'7897897890','Aasha parekh','Female','2026-05-04 16:45:07','2026-05-04 16:46:02'),(144,'9888587489','Radharani','Female','2026-05-16 17:15:49','2026-05-16 17:19:26'),(145,'7841959595','','','2026-05-23 15:28:59','2026-05-23 15:28:59'),(146,'9867315361','Navin','Male','2026-05-23 20:13:45','2026-05-23 20:14:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24  6:34:01
