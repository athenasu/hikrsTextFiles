CREATE DATABASE  IF NOT EXISTS `ShanShan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ShanShan`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: ShanShan
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_description` (
  `product_des_id` int NOT NULL AUTO_INCREMENT COMMENT '商品明細編號',
  `product_id` int NOT NULL COMMENT '商品編號',
  `product_size` int NOT NULL COMMENT '商品尺寸(0:F 1:S 2:M 3:L 4:XL)',
  `product_color` varchar(15) NOT NULL COMMENT '商品顏色',
  `product_stock` int NOT NULL COMMENT '商品庫存量',
  `status` int DEFAULT '0' COMMENT '上架狀態(0:下架1:上架)',
  `product_price` int NOT NULL COMMENT '商品單價',
  PRIMARY KEY (`product_des_id`),
  KEY `FK_product_description_product_id_idx` (`product_id`),
  CONSTRAINT `FK_product_description_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (1,1,0,'透明橘',15,0,599),(2,2,0,'灰',10,0,349),(3,3,0,'黑/銀',10,0,3960),(4,4,0,'黑/橘',10,0,2250),(5,5,0,'銀',10,0,1170),(6,6,0,'黑',10,0,299),(7,7,0,'黑',10,0,199),(8,8,0,'黑',10,0,399),(9,9,0,'橘',10,0,1800),(10,10,0,'粉紫',10,0,999),(11,11,0,'土黃',10,0,1499),(12,12,0,'灰/藍綠',10,0,3000),(13,13,0,'紅/灰',10,0,4999),(14,14,0,'灰',10,0,1249),(15,15,0,'紅橘',10,0,2500),(16,16,1,'沙色',10,0,1650),(17,16,2,'沙色',10,0,1650),(18,17,1,'杏色',10,0,15000),(19,17,2,'杏色',10,0,15000),(20,18,2,'黃色',10,0,15000),(21,19,2,'米白',10,0,15980),(22,20,1,'淺藍',10,0,3980),(23,20,2,'淺藍',10,0,3980),(24,21,1,'灰藍',10,0,2980),(25,21,2,'灰藍',10,0,2980),(26,22,1,'橘紅',10,0,1290),(27,22,2,'橘紅',10,0,1290),(28,23,1,'墨綠',10,0,1980),(29,23,2,'墨綠',10,0,1980),(30,24,1,'沙色',10,0,1980),(31,24,2,'沙色',10,0,1980),(32,25,1,'黃綠',10,0,1280),(33,25,2,'黃綠',10,0,1280),(34,26,1,'黑',10,0,1100),(35,26,2,'黑',10,0,1100),(36,27,2,'藍',10,0,3610),(37,28,0,'黑',10,0,2520),(38,29,0,'黑',10,0,450),(39,30,0,'墨綠',10,0,5850),(40,31,0,'墨綠',10,0,4950),(41,32,0,'黑藍',10,0,1250),(42,33,0,'深綠',10,0,6210),(43,33,0,'深藍',10,0,6210),(44,34,1,'沙色',10,0,8010),(45,34,2,'沙色',10,0,8010),(46,35,2,'灰黑',10,0,5080),(47,36,1,'米灰',10,0,4980),(48,36,2,'米灰',10,0,4980),(49,37,1,'圖騰花色',10,0,800),(50,37,2,'圖騰花色',10,0,800),(51,38,1,'圖騰花色',10,0,800),(52,38,2,'圖騰花色',10,0,800),(53,39,1,'圖騰花色',10,0,680),(54,39,2,'圖騰花色',10,0,680),(55,40,2,'灰紅',10,0,2000),(56,41,3,'灰白',10,0,599),(57,41,4,'灰白',10,0,599),(58,42,3,'黑',10,0,1249),(59,42,4,'黑',10,0,1249),(60,43,3,'深灰',10,0,1390),(61,43,4,'深灰',10,0,1390),(62,44,3,'黑',10,0,990),(63,44,4,'黑',10,0,990),(64,45,3,'灰',10,0,1399),(65,45,4,'灰',10,0,1399),(66,46,0,'深藍',10,0,399),(67,47,0,'黑',10,0,270),(68,48,0,'白',10,0,599),(69,49,0,'白',10,0,4050),(70,49,0,'灰',10,0,4050),(71,50,0,'黑白',10,0,1620),(72,51,0,'藍綠',10,0,1350),(73,52,0,'白橘',10,0,399),(74,53,0,'黑橘',10,0,1035),(75,54,0,'銀',10,0,1600),(76,55,0,'金屬綠',10,0,780),(77,56,0,'金屬藍',10,0,299),(78,57,0,'藍/綠',10,0,499),(79,58,0,'橘灰',10,0,5750),(80,59,0,'灰白',10,0,3499),(81,60,0,'白紅',10,0,1700),(82,61,0,'藍綠/金屬不銹鋼',10,0,599),(83,62,0,'淺藍/金屬不銹鋼',10,0,849),(84,63,0,'銀色',10,0,499),(85,64,0,'灰',10,0,980);
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-17 16:12:46
