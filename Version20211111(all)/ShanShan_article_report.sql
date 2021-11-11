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
-- Table structure for table `article_report`
--

DROP TABLE IF EXISTS `article_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_report` (
  `article_report_id` int NOT NULL AUTO_INCREMENT COMMENT '文章檢舉編號',
  `member_id` int NOT NULL COMMENT '檢舉會員編號',
  `article_id` int NOT NULL,
  `article_report_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章檢舉處理狀態 (0:未處理 1:已刪除 2:未通過)',
  `article_report_reason` tinyint(1) NOT NULL COMMENT '文章檢舉原因 (0: 色情騷擾 1: 不實資訊 2: 垃圾訊息 3: 仇恨言論)',
  `article_report_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章檢舉日期',
  `case_done` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '結案時間',
  PRIMARY KEY (`article_report_id`),
  KEY `FK_aritcle_report_member_id_idx` (`member_id`),
  KEY `FK_aricle_report_article_id_idx` (`article_id`),
  CONSTRAINT `FK_aricle_report_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `FK_aritcle_report_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_report`
--

LOCK TABLES `article_report` WRITE;
/*!40000 ALTER TABLE `article_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 22:26:14
