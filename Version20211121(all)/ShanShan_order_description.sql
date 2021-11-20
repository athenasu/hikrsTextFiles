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
-- Table structure for table `order_description`
--

DROP TABLE IF EXISTS `order_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_description` (
  `order_des_id` int NOT NULL AUTO_INCREMENT COMMENT '訂單明細編號',
  `product_des_id` int NOT NULL COMMENT '商品明細編號',
  `order_id` int NOT NULL COMMENT '訂單編號',
  `product_quantity` int NOT NULL COMMENT '商品數量',
  `product_price` int NOT NULL,
  PRIMARY KEY (`order_des_id`),
  KEY `FK_order_description_product_des_id_idx` (`product_des_id`),
  KEY `FK_order_description_order_id` (`order_id`),
  CONSTRAINT `FK_order_description_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_order_description_product_des_id` FOREIGN KEY (`product_des_id`) REFERENCES `product_description` (`product_des_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_description`
--

LOCK TABLES `order_description` WRITE;
/*!40000 ALTER TABLE `order_description` DISABLE KEYS */;
INSERT INTO `order_description` VALUES (1,1,1,1,599),(2,21,1,2,3980),(3,42,2,1,6210),(4,46,2,1,5080),(5,74,3,2,1035),(6,65,3,1,1399),(7,34,4,3,1100),(8,81,4,1,1700),(9,74,5,1,1035),(10,74,5,3,1035),(11,23,6,1,3980),(12,71,6,1,1620),(13,53,7,1,680),(14,54,7,1,680),(15,43,8,1,6210),(16,63,8,1,990),(17,34,9,1,1100),(18,1,9,1,599),(19,2,10,1,349),(20,3,10,1,3960),(21,4,11,1,2250),(22,32,11,1,1280),(23,46,12,1,5080),(24,34,12,1,1100),(25,23,13,1,3980),(26,15,13,1,2500),(27,25,14,1,2980),(28,23,14,2,3980),(29,46,15,1,5080),(30,34,15,1,1100),(31,75,16,3,1600),(32,64,16,2,1399),(33,76,17,1,780),(34,74,17,2,1035),(35,34,18,1,1100),(36,56,18,1,599),(37,66,19,2,399),(38,63,19,2,990),(39,42,20,1,6210),(40,43,20,1,6210),(41,43,21,1,6210),(42,23,21,2,3980),(43,12,22,1,3000),(44,45,22,1,8010),(45,23,23,1,3980),(46,2,23,1,349),(47,3,24,1,3960),(48,7,24,2,199),(49,6,25,1,299),(50,45,25,2,8010),(51,43,26,1,6210),(52,34,26,2,1100),(53,37,27,2,2520),(54,38,27,1,450),(55,39,28,1,5850),(56,40,28,1,4950),(57,20,29,2,15000),(58,12,29,1,3000),(59,39,30,1,5850),(60,28,30,1,1980),(61,19,31,1,15000),(62,16,31,1,1650),(63,32,32,1,1280),(64,43,32,2,6210),(65,41,33,1,1250),(66,32,33,1,1280),(67,61,34,2,1390),(68,41,34,1,1250),(69,9,35,2,1800),(70,51,35,1,800),(71,8,36,3,399),(72,74,36,1,1035),(73,35,37,3,1100),(74,5,37,1,1170),(75,63,38,2,990),(76,23,38,1,3980),(77,45,39,1,8010),(78,12,39,2,3000),(79,56,40,2,599),(80,2,40,1,349);
/*!40000 ALTER TABLE `order_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21  0:30:16
