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
-- Table structure for table `act_log_msg`
--

DROP TABLE IF EXISTS `act_log_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_log_msg` (
  `act_msg_id` int NOT NULL AUTO_INCREMENT COMMENT '日誌留言編號',
  `article_id` int NOT NULL COMMENT '日誌編號',
  `member_id` int NOT NULL COMMENT '留言會員編號',
  `msg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言時間',
  `msg_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '留言內容',
  `msg_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '留言狀態(0:下架 1:上架)',
  PRIMARY KEY (`act_msg_id`),
  KEY `FK_act_log_msg_aritcle_id_idx` (`article_id`),
  KEY `FK_act_log_msg_member_id_idx` (`member_id`),
  CONSTRAINT `FK_act_log_msg_aritcle_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `FK_act_log_msg_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_log_msg`
--

LOCK TABLES `act_log_msg` WRITE;
/*!40000 ALTER TABLE `act_log_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_log_msg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21  0:30:23
