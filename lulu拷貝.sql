CREATE DATABASE  IF NOT EXISTS `ShanShan` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ShanShan`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: ShanShan
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `act_log_msg_board`
--

DROP TABLE IF EXISTS `act_log_msg_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_log_msg_board` (
  `act_msg_id` int NOT NULL AUTO_INCREMENT COMMENT '日誌留言編號',
  `article_id` int NOT NULL COMMENT '日誌編號',
  `member_id` int NOT NULL COMMENT '留言會員編號',
  `msg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言時間',
  `msg_content` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '留言內容',
  `msg_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '留言狀態(0:下架 1:上架)',
  PRIMARY KEY (`act_msg_id`),
  KEY `FK_act_log_msg_board_aritcle_id_idx` (`article_id`),
  KEY `FK_act_log_msg_board_member_id_idx` (`member_id`),
  CONSTRAINT `FK_act_log_msg_board_aritcle_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `FK_act_log_msg_board_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_log_msg_board`
--

LOCK TABLES `act_log_msg_board` WRITE;
/*!40000 ALTER TABLE `act_log_msg_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_log_msg_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_info` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_account` varchar(30) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  `admin_account_status` int NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_info`
--

LOCK TABLES `admin_info` WRITE;
/*!40000 ALTER TABLE `admin_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章編號',
  `member_id` int NOT NULL COMMENT '會員編號',
  `mountain_id` int NOT NULL COMMENT '山編號',
  `article_title` varchar(10) NOT NULL COMMENT '文章名稱',
  `article_content` varchar(100) NOT NULL COMMENT '文章內容',
  `article_date_created` date NOT NULL DEFAULT (curdate()) COMMENT '文章發表日期',
  `event_date` date NOT NULL COMMENT '登山日期',
  `recommendation` int NOT NULL COMMENT '推薦',
  `article_points_recieved` int NOT NULL COMMENT '文章打賞數',
  `article_status` tinyint NOT NULL COMMENT '文件狀態',
  `aritcle_viewer` varchar(45) DEFAULT NULL COMMENT '文章觀看數',
  PRIMARY KEY (`article_id`),
  KEY `FK_article_member_id_idx` (`member_id`),
  KEY `FK_article_mountain_id_idx` (`mountain_id`),
  CONSTRAINT `FK_article_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK_article_mountain_id` FOREIGN KEY (`mountain_id`) REFERENCES `mountain` (`mountain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_picture`
--

DROP TABLE IF EXISTS `article_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_picture` (
  `article_picture_id` int NOT NULL AUTO_INCREMENT COMMENT '文章照片編號',
  `article_id` int NOT NULL COMMENT '文章編號',
  `article_picture` blob NOT NULL COMMENT '文章照片',
  PRIMARY KEY (`article_picture_id`),
  KEY `FK_article_picture_aricle_id_idx` (`article_id`),
  CONSTRAINT `FK_article_picture_aricle_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_picture`
--

LOCK TABLES `article_picture` WRITE;
/*!40000 ALTER TABLE `article_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_picture` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_report`
--

LOCK TABLES `article_report` WRITE;
/*!40000 ALTER TABLE `article_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL COMMENT '店家編號',
  `company_name` varchar(20) NOT NULL COMMENT '店家名稱',
  `company_email` varchar(30) NOT NULL COMMENT '店家信箱',
  `company_password` varchar(10) NOT NULL COMMENT '店家密碼',
  `company_phone` varchar(10) NOT NULL COMMENT '店家電話',
  `company_cell` varchar(10) NOT NULL COMMENT '店家手機',
  `company_register_date` date NOT NULL DEFAULT (curdate()) COMMENT '店家註冊日',
  `company_cetificate` blob NOT NULL COMMENT '店家營登照',
  `company_banner` blob NOT NULL COMMENT '店家首圖',
  `comany_intro` varchar(300) NOT NULL COMMENT '店家簡介',
  `company_owner` varchar(5) NOT NULL COMMENT '店家負責人',
  `company_address` varchar(25) NOT NULL COMMENT '店家地址',
  `company_status` tinyint(1) NOT NULL COMMENT '店家狀態(0:未審核1:上架2:下架)',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='店家';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `mountain_id` int NOT NULL,
  `event_name` varchar(25) NOT NULL,
  `event_days` int NOT NULL,
  `difficulty` int DEFAULT NULL,
  `event_deadline` date NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_post_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stay_type` int NOT NULL,
  `min_num_of_people` int NOT NULL,
  `max_num_of_people` int NOT NULL,
  `assembling_place` text NOT NULL,
  `event_content` text NOT NULL,
  `event_cover` blob,
  `event_status` int NOT NULL,
  `event_points` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `FK_event_member_id_idx` (`member_id`),
  KEY `FK_event_mountain_id_idx` (`mountain_id`),
  CONSTRAINT `FK_event_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK_event_mountain_id` FOREIGN KEY (`mountain_id`) REFERENCES `mountain` (`mountain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_msg_board`
--

DROP TABLE IF EXISTS `event_msg_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_msg_board` (
  `event_msg_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `event_id` varchar(45) NOT NULL,
  `msg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_content` text NOT NULL,
  `msg_status` int NOT NULL,
  PRIMARY KEY (`event_msg_id`),
  KEY `FK_event_msg_board_member_id_idx` (`member_id`),
  CONSTRAINT `FK_event_msg_board_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_msg_board`
--

LOCK TABLES `event_msg_board` WRITE;
/*!40000 ALTER TABLE `event_msg_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_msg_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_report`
--

DROP TABLE IF EXISTS `event_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_report` (
  `event_report_id` int NOT NULL COMMENT '揪團檢舉編號',
  `member_id` int NOT NULL COMMENT '檢舉人會員編號',
  `event_id` int NOT NULL COMMENT '揪團編號',
  `report_reason` int NOT NULL COMMENT '檢舉原因',
  `report_date` datetime NOT NULL COMMENT '檢舉日期',
  `case_done` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '結案時間',
  `case_status` int NOT NULL COMMENT '案件狀態',
  PRIMARY KEY (`event_report_id`),
  KEY `FK_event_report_member_id_idx` (`member_id`),
  KEY `FK_event_report_event_id_idx` (`event_id`),
  CONSTRAINT `FK_event_report_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `FK_event_report_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='揪團檢舉';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_report`
--

LOCK TABLES `event_report` WRITE;
/*!40000 ALTER TABLE `event_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT COMMENT '會員編號',
  `member_name` varchar(20) NOT NULL COMMENT '會員姓名',
  `member_email` varchar(20) NOT NULL COMMENT '會員帳號',
  `member_password` varchar(20) NOT NULL COMMENT '會員密碼',
  `member_username` varchar(20) NOT NULL COMMENT '會員暱稱',
  `member_phone_num` varchar(10) NOT NULL COMMENT '會員電話',
  `member_register_date` date NOT NULL DEFAULT (curdate()) COMMENT '會員註冊日',
  `member_profile_pic` blob NOT NULL COMMENT '會員照片',
  `member_intro` varchar(100) NOT NULL COMMENT '會員介紹',
  `member_status` tinyint NOT NULL DEFAULT '1' COMMENT '會員狀態',
  `member_sum_points` int DEFAULT NULL COMMENT '總點數',
  `member_subscriptoin` tinyint DEFAULT NULL COMMENT '訂閱狀態',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mountain`
--

DROP TABLE IF EXISTS `mountain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mountain` (
  `mountain_id` int NOT NULL AUTO_INCREMENT COMMENT '山編號',
  `mountain_district` int NOT NULL COMMENT '區域編號',
  `mountain_name` varchar(50) NOT NULL COMMENT '山名',
  PRIMARY KEY (`mountain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mountain`
--

LOCK TABLES `mountain` WRITE;
/*!40000 ALTER TABLE `mountain` DISABLE KEYS */;
/*!40000 ALTER TABLE `mountain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_report`
--

DROP TABLE IF EXISTS `msg_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msg_report` (
  `msg_report_id` int NOT NULL COMMENT '留言檢舉編號',
  `member_id` int NOT NULL COMMENT '檢舉人編號',
  `event_msg_id` int DEFAULT NULL COMMENT '揪團留言編號',
  `act_msg_id` int DEFAULT NULL COMMENT '活動日誌留言編號',
  `report_reason` int NOT NULL COMMENT '檢舉原因',
  `report_date` datetime NOT NULL COMMENT '檢舉日期',
  `case_done` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '結案時間',
  `case_status` int NOT NULL COMMENT '案件狀態',
  PRIMARY KEY (`msg_report_id`),
  KEY `FK_msg_report_member_id_idx` (`member_id`),
  KEY `FK_msg_report_event_msg_id_idx` (`event_msg_id`),
  KEY `FK_msg_report_act_msg_id_idx` (`act_msg_id`),
  CONSTRAINT `FK_msg_report_act_msg_id` FOREIGN KEY (`act_msg_id`) REFERENCES `act_log_msg_board` (`act_msg_id`),
  CONSTRAINT `FK_msg_report_event_msg_id` FOREIGN KEY (`event_msg_id`) REFERENCES `event_msg_board` (`event_msg_id`),
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

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '訂單編號',
  `member_id` int NOT NULL COMMENT '會員編號',
  `order_created_date` date NOT NULL DEFAULT (curdate()) COMMENT '訂單創立日',
  `order_member_address` varchar(50) NOT NULL COMMENT '訂單配送地址',
  `order_member_name` varchar(20) NOT NULL COMMENT '訂單收貨人',
  `order_member_phone` varchar(20) NOT NULL COMMENT '訂單收貨人電話',
  `order_status` tinyint(1) NOT NULL COMMENT '訂單狀態(0:取消1:配送中2:已配送3:已結單4:退貨)',
  `point_used` int DEFAULT NULL COMMENT '使用點數(最多總金額5％)',
  `order_sum_before` int NOT NULL COMMENT '折扣前總金額',
  `order_sum_after` int NOT NULL COMMENT '折扣後總金額',
  `order_shipped_date` date DEFAULT (curdate()) COMMENT '訂單配送日',
  `ship_number` varchar(25) DEFAULT NULL COMMENT '貨運單號',
  PRIMARY KEY (`order_id`),
  KEY `FK_single_order_member_id_idx` (`member_id`),
  CONSTRAINT `FK_single_order_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`order_des_id`),
  KEY `FK_order_description_product_des_id_idx` (`product_des_id`),
  KEY `FK_order_description_order_id` (`order_id`),
  CONSTRAINT `FK_order_description_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_order_description_product_des_id` FOREIGN KEY (`product_des_id`) REFERENCES `product_description` (`product_des_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_description`
--

LOCK TABLES `order_description` WRITE;
/*!40000 ALTER TABLE `order_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant` (
  `part_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `member_id` int NOT NULL,
  `experence` tinyint(1) NOT NULL,
  `phone_number` varchar(25) NOT NULL,
  `participation` tinyint(1) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`part_id`),
  KEY `FK_participant_event_id_idx` (`event_id`),
  KEY `FK_participant_member_id_idx` (`member_id`),
  CONSTRAINT `FK_participant_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `FK_participant_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points_used_act`
--

DROP TABLE IF EXISTS `points_used_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_used_act` (
  `points_used_act_id` int NOT NULL AUTO_INCREMENT COMMENT '活動日誌打賞編號',
  `member_id` int NOT NULL COMMENT '打賞者會員編號',
  `article_id` int NOT NULL COMMENT '活動日誌編號',
  `points_used` int NOT NULL COMMENT '使用點數',
  `points_used_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '使用點數時間',
  PRIMARY KEY (`points_used_act_id`),
  KEY `FK_member_member_id_idx` (`member_id`),
  KEY `FK_article_article_id_idx` (`article_id`),
  CONSTRAINT `FK_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `FK_member_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points_used_act`
--

LOCK TABLES `points_used_act` WRITE;
/*!40000 ALTER TABLE `points_used_act` DISABLE KEYS */;
/*!40000 ALTER TABLE `points_used_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL COMMENT '商品編號',
  `company_id` int NOT NULL COMMENT '店家ID',
  `product_type` int NOT NULL COMMENT '商品類別(1:衣著 2:鞋子3:背包相關4:耗材5:照明6:工具刀斧7:炊具8:家具9:帳篷天幕營柱10:寢具地墊)',
  `status` int DEFAULT '0' COMMENT '上架狀態(0:下架1:上架)',
  `product_price` int DEFAULT NULL COMMENT '商品單價',
  `product_intro` varchar(200) NOT NULL COMMENT '商品敘述',
  PRIMARY KEY (`product_id`),
  KEY `FK_product_company_id_idx` (`company_id`),
  CONSTRAINT `FK_product_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`product_des_id`),
  KEY `FK_product_description_product_id_idx` (`product_id`),
  CONSTRAINT `FK_product_description_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_img`
--

DROP TABLE IF EXISTS `product_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_img` (
  `product_img_id` int NOT NULL AUTO_INCREMENT COMMENT '照片編號',
  `product_des_id` int NOT NULL COMMENT '商品明細編號',
  `product_img` blob COMMENT '照片',
  PRIMARY KEY (`product_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_img`
--

LOCK TABLES `product_img` WRITE;
/*!40000 ALTER TABLE `product_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_info`
--

DROP TABLE IF EXISTS `staff_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_info` (
  `staff_id` int NOT NULL COMMENT '員工編號',
  `company_id` int NOT NULL COMMENT '店家編號',
  `staff_email` varchar(20) NOT NULL COMMENT '員工帳號',
  `staff_password` varchar(30) NOT NULL COMMENT '員工密碼',
  `staff_name` varchar(10) NOT NULL COMMENT '員工名稱',
  `staff_status` int NOT NULL COMMENT '員工狀態',
  PRIMARY KEY (`staff_id`),
  KEY `FK_staff_info_company_id_idx` (`company_id`),
  CONSTRAINT `FK_staff_info_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='員工資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_info`
--

LOCK TABLES `staff_info` WRITE;
/*!40000 ALTER TABLE `staff_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_article`
--

DROP TABLE IF EXISTS `wishlist_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_article` (
  `wishlist_article_id` int NOT NULL AUTO_INCREMENT COMMENT '收藏活動日誌編號',
  `article_id` int NOT NULL COMMENT '文章編號',
  `member_id` int NOT NULL COMMENT '會員編號',
  `favorite_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收藏狀態(0:收藏 1:取消收藏)',
  PRIMARY KEY (`wishlist_article_id`),
  KEY `FK_wishlist_article_member_id_idx` (`member_id`),
  KEY `FK_wishlist_article_aritcle_id_idx` (`article_id`),
  CONSTRAINT `FK_wishlist_article_aritcle_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `FK_wishlist_article_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_article`
--

LOCK TABLES `wishlist_article` WRITE;
/*!40000 ALTER TABLE `wishlist_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_event`
--

DROP TABLE IF EXISTS `wishlist_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_event` (
  `wishlist_event_id` int NOT NULL AUTO_INCREMENT COMMENT '收藏揪團編號',
  `member_id` int NOT NULL COMMENT '會員編號',
  `event_id` int NOT NULL COMMENT '揪團編號',
  `favorite_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收藏狀態(0:收藏 1:取消收藏)',
  PRIMARY KEY (`wishlist_event_id`),
  KEY `FK_wishlist_event_member_id_idx` (`member_id`),
  KEY `FK_wishlist_event_event_id_idx` (`event_id`),
  CONSTRAINT `FK_wishlist_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `FK_wishlist_event_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_event`
--

LOCK TABLES `wishlist_event` WRITE;
/*!40000 ALTER TABLE `wishlist_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_product`
--

DROP TABLE IF EXISTS `wishlist_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_product` (
  `wishlist_product_id` int NOT NULL AUTO_INCREMENT COMMENT '收藏產品編號',
  `member_id` int NOT NULL COMMENT '會員編號',
  `product_id` int NOT NULL COMMENT '產品編號',
  `favorite_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收藏狀態 (0:收藏 1:取消收藏)',
  PRIMARY KEY (`wishlist_product_id`),
  KEY `FK_wishlist_product_idx` (`member_id`),
  KEY `FK_wishlist_product_product_id_idx` (`product_id`),
  CONSTRAINT `FK_wishlist_product_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK_wishlist_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_product`
--

LOCK TABLES `wishlist_product` WRITE;
/*!40000 ALTER TABLE `wishlist_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-28 17:24:55
