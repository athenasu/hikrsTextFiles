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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int NOT NULL AUTO_INCREMENT COMMENT '揪團文章編號',
  `member_id` int NOT NULL COMMENT '揪團者編號',
  `mountain_id` int NOT NULL COMMENT '山名',
  `event_name` varchar(25) NOT NULL COMMENT '揪團文章標題',
  `event_days` int NOT NULL COMMENT '活動天數',
  `difficulty` int DEFAULT NULL COMMENT '難度',
  `event_deadline` date NOT NULL COMMENT '結團日期',
  `event_start_date` datetime NOT NULL COMMENT '出發日期',
  `event_post_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '發文日期',
  `stay_type` int NOT NULL COMMENT '住宿種類',
  `min_num_of_people` int NOT NULL COMMENT '最低人數',
  `max_num_of_people` int NOT NULL COMMENT '最高人數',
  `assembling_place` text NOT NULL COMMENT '集合地點',
  `event_content` text NOT NULL COMMENT '揪團文章內容',
  `event_status` int NOT NULL COMMENT '揪團狀態(0:下架 1:上架 2:招募中 3:滿團 4:流團 5:成團)',
  `event_points` int DEFAULT NULL COMMENT '固定點數(會員:成團後才給點數)',
  `event_cur_part` int DEFAULT NULL COMMENT '目前參團人數',
  PRIMARY KEY (`event_id`),
  KEY `FK_event_member_id_idx` (`member_id`),
  KEY `FK_event_mountain_id_idx` (`mountain_id`),
  CONSTRAINT `FK_event_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK_event_mountain_id` FOREIGN KEY (`mountain_id`) REFERENCES `mountain` (`mountain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='揪團文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21  0:30:17
