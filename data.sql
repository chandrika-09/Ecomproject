-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ecomdb1
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `admindata`
--

DROP TABLE IF EXISTS `admindata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admindata` (
  `adminid` binary(16) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_useremail` varchar(50) NOT NULL,
  `admin_address` tinytext NOT NULL,
  `admin_phoneno` varchar(10) DEFAULT NULL,
  `admin_image` varchar(20) DEFAULT NULL,
  `admin_agree` enum('on','off') DEFAULT NULL,
  `otp` char(6) DEFAULT NULL,
  `otp_expiry_time` datetime DEFAULT NULL,
  `account_status` enum('active','inactive','suspended') DEFAULT NULL,
  `admin_userpassword` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `admin_useremail` (`admin_useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admindata`
--

LOCK TABLES `admindata` WRITE;
/*!40000 ALTER TABLE `admindata` DISABLE KEYS */;
INSERT INTO `admindata` VALUES (_binary '˝\≈\’˝\»f\Ò®üg∆¨5\Ë','chandrika','chandrikagangineni@gmail.com','ABC Colony',NULL,NULL,'on',NULL,NULL,'active',_binary '$2b$12$ohW/b0l9cqlKeipoEof6SOspZyF2OBUZmxS.MtwhABJZNnIcQIpx6');
/*!40000 ALTER TABLE `admindata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartid` binary(16) NOT NULL,
  `itemid` binary(16) NOT NULL,
  `userid` binary(16) NOT NULL,
  `cart_quantity` int unsigned DEFAULT NULL,
  PRIMARY KEY (`cartid`),
  UNIQUE KEY `itemid` (`itemid`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userdata` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemid` binary(16) NOT NULL,
  `item_name` longtext NOT NULL,
  `item_desc` longtext,
  `item_about` longtext,
  `item_price` decimal(20,4) NOT NULL,
  `item_stock` int unsigned DEFAULT '1',
  `item_category` enum('home_appliences','Grocery','Fashion','Electronics','Sports','Toys') DEFAULT NULL,
  `item_imagename` varchar(20) DEFAULT NULL,
  `adminid` binary(16) DEFAULT NULL,
  `item_createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemid`),
  KEY `adminid` (`adminid`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`adminid`) REFERENCES `admindata` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (_binary ',\Ú\—¡\Ò∂Vó\’e|=º','Tata Tea Gold','Tata Tea Gold | Assam teas with Gently Rolled Aromatic Long Leaves | Rich & Aromatic Chai | Black Tea | 1 kg\r\n','Amalgamated Plantations Pvt. Ltd., Nonoi Tea Estate.',480.0000,7,'Grocery','N7fZ8h.jpg',_binary '˝\≈\’˝\»f\Ò®üg∆¨5\Ë','2026-10-27 10:14:12'),(_binary ')ÖÇz\—\ƒ\Ò∂Vó\’e|=º','Storio Reversible Octopus Plushie Soft Cute Mood Plush Toy for Kids','Storio Toy Octopus Plushie Reversible Soft Toys for Kids | Plush Soft Toys for Baby Boys and Girls| Best Gift | Octopus Soft Toy for Kids | Kanjak Gift for Girls -Blue Pink','Mini Sized Reversible Octopus Plush - Are you looking for the mini sized plush soft toys for your kids ? Our Reversible Octopus Plush Soft Toy comes with a perfect size for baby kids (Age- from 6 months and up ).',300.0000,0,'Toys','Q7rN0h.webp',_binary '˝\≈\’˝\»f\Ò®üg∆¨5\Ë','2026-10-27 10:36:26'),(_binary 'mv1\„\—\¬\Ò∂Vó\’e|=º','Nivia Storm Football','Storm 5 Hard Ground Training Football','Playing a sport like football helps the players strengthen team spirit and the same time keeps them fit. This Nivia Storm Football - 5 allows you to play a few matches with friends or colleagues when you have free time. ',700.0000,0,'Sports','Q6uJ7e.webp',_binary '˝\≈\’˝\»f\Ò®üg∆¨5\Ë','2026-10-27 10:24:01'),(_binary 'n\Ó0S\—\«\Ò∂Vó\’e|=º','Nutripro 500 Watts Juicer Mixer Grinder','Effortlessly prepare smoothies, fresh juices, and nutritious blends within seconds, perfect for busy mornings or quick refreshments. ',' Versatile design allows you to dry grind spices, make chutneys, sauces, and creamy dips with smooth consistency. Built with a high-performance 500W pure copper motor, delivering powerful grinding and long-lasting durability for everyday use. Includes a lightweight, easy-to-carry sipper jar, making it simple to blend, take, and enjoy your drinks on the go.\r\n',1500.0000,0,'home_appliences','F8iK5p.webp',_binary '˝\≈\’˝\»f\Ò®üg∆¨5\Ë','2026-10-27 10:59:51'),(_binary '∂é˛I\—¡\Ò∂Vó\’e|=º','Amazon Fire TV Stick','Amazon Fire TV Stick HD 1,500+ Apps Smart Voice Search with Alexa+','The Amazon Fire TV Stick HD is designed for fast HD streaming with a streamlined navigation that allows you to jump straight to your favorite movies, shows, and live TV. \r\n',3000.0000,1,'Electronics','E4jI2h.webp',_binary '˝\≈\’˝\»f\Ò®üg∆¨5\Ë','2026-10-27 10:18:54'),(_binary 'ª\ﬂ\Ù\œc\Ò±®Jö\'\ˆ[\‰','ADISA','ADISA Women Girls Clutch Bag Purse Handbag Wedding Bridal','Outer Material: PVC / Synthetic\r\nClosure: Magnetic, Carrying: Top Handle\r\nCompartments: 2, Pockets: 1\r\nDimensions: LxWxH - 11 x 2 x 6 inches\r\nUsage: Wedding, Party, Formal, Casual',500.0000,1,'Fashion','T2tN7w.jpg',_binary '˝\≈\’˝\»f\Ò®üg∆¨5\Ë','2026-10-24 10:01:08');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_detailsid` int unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int unsigned DEFAULT NULL,
  `itemid` binary(16) DEFAULT NULL,
  `item_name` longtext,
  `item_price` decimal(10,2) DEFAULT NULL,
  `item_quantity` int unsigned DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `item_category` enum('home_appliences','Grocery','Fashion','Electronics','Sports','Toys') DEFAULT NULL,
  `item_imagename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_detailsid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,_binary ',\Ú\—¡\Ò∂Vó\’e|=º','Tata Tea Gold',480.00,1,480.00,'Grocery','N7fZ8h.jpg'),(2,2,_binary ',\Ú\—¡\Ò∂Vó\’e|=º','Tata Tea Gold',480.00,2,960.00,'Grocery','N7fZ8h.jpg'),(3,3,_binary ')ÖÇz\—\ƒ\Ò∂Vó\’e|=º','Storio Reversible Octopus Plushie Soft Cute Mood Plush Toy for Kids',300.00,1,300.00,'Toys','Q7rN0h.webp'),(4,4,_binary 'mv1\„\—\¬\Ò∂Vó\’e|=º','Nivia Storm Football',700.00,1,700.00,'Sports','Q6uJ7e.webp'),(5,4,_binary 'n\Ó0S\—\«\Ò∂Vó\’e|=º','Nutripro 500 Watts Juicer Mixer Grinder',1500.00,1,1500.00,'home_appliences','F8iK5p.webp');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int unsigned NOT NULL AUTO_INCREMENT,
  `razorpay_ordid` varchar(255) DEFAULT NULL,
  `razorpay_payment` varchar(255) DEFAULT NULL,
  `userid` binary(16) DEFAULT NULL,
  `total_amount` decimal(20,4) DEFAULT NULL,
  `delivery` int unsigned DEFAULT '40',
  `tax` decimal(10,2) DEFAULT NULL,
  `grand_total` decimal(20,4) DEFAULT NULL,
  `status` varchar(6) DEFAULT 'paid',
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userdata` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'order_Tu0KNAFxga2JB0','pay_Tu0KjIfqy68O5g',_binary '\›MK\ﬁ\–ˇ\Ò±dO\Ô¿\ˆè\Á',480.0000,40,24.00,544.0000,'paid'),(2,'order_TuO0RYUMmtvcxk','pay_TuO1dbAAOSddjK',_binary '\›MK\ﬁ\–ˇ\Ò±dO\Ô¿\ˆè\Á',960.0000,40,48.00,1048.0000,'paid'),(3,'order_TvBnfJCRWSCMYc','pay_TvBozxHLRTODcO',_binary '\›MK\ﬁ\–ˇ\Ò±dO\Ô¿\ˆè\Á',300.0000,40,15.00,355.0000,'paid'),(4,'order_TvH5HGCPfELKMT','pay_TvH63hA7obtYwl',_binary '\›MK\ﬁ\–ˇ\Ò±dO\Ô¿\ˆè\Á',2200.0000,40,110.00,2350.0000,'paid');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdata` (
  `userid` binary(16) NOT NULL,
  `username` varchar(255) NOT NULL,
  `useremail` varchar(255) NOT NULL,
  `useraddress` varchar(255) NOT NULL,
  `userpassword` varbinary(255) NOT NULL,
  `userphone` varchar(10) DEFAULT NULL,
  `usergender` enum('male','female','others') DEFAULT NULL,
  `otp` char(6) DEFAULT NULL,
  `otp_expiry_time` datetime DEFAULT NULL,
  `account_status` enum('active','inactive','suspended') DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `useremail` (`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` VALUES (_binary '\›MK\ﬁ\–ˇ\Ò±dO\Ô¿\ˆè\Á','chandrika','chandrikagangineni@gmail.com','ABC Colony',_binary '$2b$12$gVNP0I49VF7MxBd8Z5e8yuQ482M00qYjcu1SKlUNFQMBx1crUasoG','1234567891','female',NULL,NULL,'active');
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-04  9:59:24
