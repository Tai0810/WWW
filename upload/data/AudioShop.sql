CREATE DATABASE  IF NOT EXISTS `audio_shop`;
USE `audio_shop`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: greeny_shop
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_image` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES 
(1,NULL,'Tai nghe'),
(2,NULL,'Loa'),
(3,NULL,'Micro');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
`discount` int NOT NULL,
  `entered_date` datetime DEFAULT NULL,
  `price` double NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
`favorite` bit(1) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES 
(1, 'Loa Vi Tính 2.1 Fenda F670X sở hữu kiểu dáng mạnh mẽ, gam màu sang trọng, âm thanh sống động, hiệu ứng đèn LED RGB đẹp mắt, kết nối không dây nhanh chóng mang đến cho bạn những trải nghiệm tuyệt vời.',0,'2022-02-17 00:00:00', 1390000, 'loa-vi-tinh-2-1-fenda-f670x-1-1.jpg', 'Loa Vi Tính 2.1 Fenda F670X', 500, NULL, 2,_binary '\0'),
(2, 'Cặp micro không dây Zenbos MZ-212 là bộ sản phẩm gồm có 2 micro được thiết kế bắt mắt với gam màu đỏ và màu xanh dương nổi bật. Micro cho khả năng kết nối ổn định và dễ sử dụng với pin AA.',0, '2023-04-25 00:00:00', 2490000, 'zenbos-mz-201-1.jpeg', 'Cặp micro không dây Zenbos MZ-212 ', 300, NULL, 3,_binary '\0'),
(3, 'Micro không dây JBL VM200 thiết kế hiện đại, chất liệu cao cấp, sử dụng bền bỉ, hoạt động với tần số từ 640 MHz - 690 MHz với khoảng cách sử dụng lên đến 50m, hỗ trợ chống hú cho bạn trải nghiệm hát karaoke thỏa thích.',0, '2022-03-02 00:00:00', 8600000, 'micro-khong-day-jbl-vm200-1-1.jpg', 'Micro không dây JBL VM200', 200, NULL, 3,_binary '\0'),
(4, 'Nghe nhạc cả ngày dài mà không lo hết pin với mẫu tai nghe Bluetooth Chụp Tai Baseus Bass 35 Max với dung lượng pin lớn có thể sử dụng liên tục trong 50 tiếng, mang đến sự tập trung cùng những khoảnh khắc thư giãn bền bỉ.',0, '2024-02-17 00:00:00', 585000, 'tai-nghe-bluetooth-chup-tai-baseus-bass-35-max-xam-1.jpg', 'Tai nghe Bluetooth Chụp Tai Baseus Bass', 600, NULL, 1,_binary '\0'),
(5, 'Tai nghe Chụp Tai Gaming HP HyperX Cloud III kế thừa và phát huy xuất sắc những điểm mạnh đã làm nên tên tuổi của người tiền nhiệm Cloud II - huyền thoại tai nghe gaming được giới game thủ yêu thích. Nổi bật là sự cải tiến về độ thoải mái, chất lượng âm thanh và độ bền bỉ, hứa hẹn mang đến cho bạn trải nghiệm gaming đỉnh cao.',0, '2023-05-27 00:00:00', 2240000, 'tai-nghe-chup-tai-hp-hyperx-cloud-iii-den-do-1.jpg', 'Tai nghe Chụp Tai Gaming HP HyperX', 200, NULL, 1,_binary '\0'),
(6, 'Marshall Major V là tai nghe chụp tai không dây thế hệ mới nhất từ Marshall, mang đến trải nghiệm âm thanh đỉnh cao cùng thiết kế cổ điển đặc trưng của thương hiệu dành cho các tín đồ âm nhạc.',0, '2022-02-17 00:00:00', 4290000, 'tai-nghe-bluetooth-chup-taai-marshall-major-v-den-1.jpg', 'Tai nghe Bluetooth chụp tai Marshall', 150, NULL, 1,_binary '\0'),
(7, 'Loa Bluetooth JBL Partybox Encore 2Mic sở hữu hệ thống đèn LED nổi bật cùng thiết kế vuông vắn đẹp mắt, công nghệ âm thanh sống động và mạnh mẽ, tốc độ kết nối ổn định, tiện lợi sử dụng trong những bữa tiệc cá nhân và các buổi tụ họp bạn bè hàng ngày.',0, '2023-12-12 00:00:00', 9900000, 'loa-bluetooth-jbl-partybox-encore-2mic-5.jpg', 'Loa Bluetooth JBL Partybox Encore 2Mic', 1000, NULL, 2,_binary '\0'),
(8, 'Loa Bluetooth Monster Sparkle với hệ thống đèn LED nổi bật cùng thiết kế thuôn dài đẹp mắt, công nghệ âm thanh sống động, tốc độ kết nối nhanh chóng, tiện lợi sử dụng trong những bữa tiệc cá nhân và các buổi tụ họp bạn bè hàng ngày.',0, '2022-11-22 00:00:00', 1900000, 'loa-bluetooth-monster-sparkle-1-1.jpg', 'Loa Bluetooth Monster Sparkle', 100, NULL, 2,_binary '\0'),
(9, 'Cặp micro không dây Paramax WM-1800 có tần số hoạt động 40Hz ~ 18kHz, phạm vi bắt sóng 30m, thiết kế nhỏ gọn, thương hiệu Paramax uy tín chất lượng. ',0, '2022-02-14 00:00:00', 4990000, 'khong-day-paramax-wm-1800-1-1.jpeg', 'Cặp micro không dây Paramax WM-1800', 400, NULL, 3,_binary '\0'),
(10, 'Tai nghe Bluetooth True Wireless realme Buds T300 giúp bạn thưởng thức âm trầm sâu hơn, cùng với âm trung và cao rõ nét, tạo nên một trải nghiệm âm thanh toàn diện.',0, '2023-12-24 00:00:00', 890000, 'tai-nghe-bluetooth-true-wireless-realme-buds-t300-trang-1.jpg', 'Tai nghe Bluetooth True Wireless realme', 250, NULL, 1,_binary '\0');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES 
(1,'ROLE_USER'),
(2,'ROLE_USER'),
(4,'ROLE_ADMIN'),
(5,'ROLE_ADMIN'),
(6,'ROLE_USER'),
(7,'ROLE_USER'),
(8,'ROLE_USER'),
(9,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES 
(1,'user.png','nguyenvanA@gmail.com','Nguyễn Văn A','$2a$10$NNFj7.bICFpxqYTsCswbe.BNGHGicL0LZzXmm.UCLz8sWrM3EL3IC','2022-01-29',_binary ''),
(2,'user.png','nguyenvanb@gmail.com','Nguyễn Văn B','$2a$10$.XOXsgTmumdrVdQc74mqUO180lLS0OefXAyPIdiVw0IshtW5WYDMm','2022-01-29',_binary ''),
(3,'user.png','votrongtai@gmail.com','user','$2a$10$UtRFor3y5PqxHKFEt1HgAOOaX7tlQs1oEhJA/VLFoUVGKo3OBkISS','2022-01-30',_binary ''),
(4,'user.png','admin@gmail.com','Admin Shop','$2a$10$Hd54fYSXGv6Pqve.WjeLO.DyNv2gGIq/S2Drilp12ClD6gYzhh4jO','2022-02-15',_binary ''),
(5,'user.png','tai@gmail.com','user1','$2a$10$GtfloNhLVXQaKdXvmueUfu14h6ijuwFHMLb1icK4rsuzpWa6jOh72','2022-02-17',_binary ''),
(6,'user.png','test@gmail.com','user2','$2a$10$PUWkbGnEa1OdKmxiQfvw/u3oh3I09nGG6zVHmGLxgigSJC2tCz4Ta','2022-02-17',_binary ''),
(7,'user.png','demo@gmail.com','user3','$2a$10$ePg/cUabs6dShg4hC4Buv.QaVFx6VqqBUSlmQBntalEOAaWCfY2Hi','2022-02-17',_binary ''),
(8,'user.png','audioshop.adm@gmail.com','demo tên','$2a$10$zBgbGqKnEPFiMOceXhqwIem4e/JFMYF2rjRElIcuaBAnO.toFIOCm','2022-02-17',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,2),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-17 22:38:48
