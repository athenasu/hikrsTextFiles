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
-- Table structure for table `msg_report`
--

DROP TABLE IF EXISTS `msg_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msg_report` (
  `msg_report_id` int NOT NULL AUTO_INCREMENT COMMENT '留言檢舉編號',
  `member_id` int NOT NULL COMMENT '檢舉人編號',
  `event_msg_id` int DEFAULT NULL COMMENT '揪團留言編號',
  `act_msg_id` int DEFAULT NULL COMMENT '活動日誌留言編號',
  `report_reason` int NOT NULL COMMENT '檢舉原因(0:色情騷擾 1:不實資訊 2:垃圾訊息 3:仇恨言論)',
  `report_date` datetime NOT NULL COMMENT '檢舉日期',
  `case_done` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '結案時間',
  `case_status` int NOT NULL COMMENT '案件狀態(0:待處理 1:未處理 2:已完成)',
  PRIMARY KEY (`msg_report_id`),
  KEY `FK_msg_report_member_id_idx` (`member_id`),
  KEY `FK_msg_report_event_msg_id_idx` (`event_msg_id`),
  KEY `FK_msg_report_act_msg_id_idx` (`act_msg_id`),
  CONSTRAINT `FK_msg_report_act_msg_id` FOREIGN KEY (`act_msg_id`) REFERENCES `act_log_msg` (`act_msg_id`),
  CONSTRAINT `FK_msg_report_event_msg_id` FOREIGN KEY (`event_msg_id`) REFERENCES `event_msg` (`event_msg_id`),
  CONSTRAINT `FK_msg_report_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='留言檢舉';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_report`
--

LOCK TABLES `msg_report` WRITE;
/*!40000 ALTER TABLE `msg_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-14 22:24:39
