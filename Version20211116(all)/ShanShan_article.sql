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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章編號',
  `member_id` int NOT NULL COMMENT '會員編號',
  `mountain_id` int DEFAULT NULL COMMENT '山編號',
  `article_title` varchar(45) NOT NULL COMMENT '文章名稱',
  `article_content` varchar(300) NOT NULL COMMENT '文章內容',
  `article_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章發表日期',
  `event_date` date NOT NULL COMMENT '登山日期',
  `recommendation` int NOT NULL COMMENT '推薦',
  `article_points_recieved` int NOT NULL DEFAULT '0' COMMENT '文章打賞數',
  `article_status` tinyint NOT NULL DEFAULT '1' COMMENT '文章狀態',
  `aritcle_viewer` int DEFAULT '0' COMMENT '文章觀看數',
  `other_mtn` varchar(45) DEFAULT NULL COMMENT '其他山名',
  PRIMARY KEY (`article_id`),
  KEY `FK_article_member_id_idx` (`member_id`),
  KEY `FK_article_mountain_id_idx` (`mountain_id`),
  CONSTRAINT `FK_article_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK_article_mountain_id` FOREIGN KEY (`mountain_id`) REFERENCES `mountain` (`mountain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2008 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (2001,1,1,'[大霸群峰] 霸氣爬山趣','感謝團長申豪開團，與隊友的陪伴，我們由大鹿林道東線步道進入，經馬達拉溪登山口、九九山莊宿營可達加利山（百岳86）、伊澤山（百岳53）、大霸尖山（百岳28）及小霸尖山（百岳36），也感謝老天爺賞賜好天氣，讓我們順利完成四座百岳。','2021-11-15 16:01:14','2021-07-11',5,0,1,558,NULL),(2002,6,1,'大霸群峰三天兩夜。此生必訪的世紀奇峰-大霸尖山','大霸群峰（包含大霸尖山、小霸尖山、伊澤山與加利山）。其中知名的大霸尖山，素有「世紀奇峰」之美稱，也是「台灣三尖」其中一座。大霸尖山與旁邊的小霸尖山遠看像一個耳朵，也被台灣泰雅族與賽夏族原住民視為聖山，原住民認為族人們需要打開自己的耳朵去聆聽身邊以及山林的聲音來做事，有深層的意義存在。','2021-11-15 16:26:02','2021-05-01',4,0,1,598,NULL),(2003,11,1,'大霸尖山意外之行','會去走大壩群峰，純粹就是一個意料之外的事情（不然就去走武陵四秀了，會死更慘），而且剛好跟到一群高手的團，我的節奏完全就是拖累團隊的節奏，但也慶幸有一群高手相伴，有他們的鼓勵，也讓我走到最後沒有放棄。','2021-11-15 16:26:02','2021-08-25',4,0,1,343,NULL),(2004,8,4,'【小百岳】台北‧陽明山-七星山主峰及七星山東峰','小油坑路線假日人潮多，安全性很高，路幾乎都是直線，所以沒有迷路的困擾，整條路都是石階，陽明山山上氣候變化大，前一秒可能是好天氣後一秒可能就起霧了，到了主峰也可能霧茫茫一片，看不到遠景，還有很多人沒運動習慣的雖到主峰1.6KM ，很多在半路就被抖上的階梯逼到腿軟了，請大家還是要注意，再怎麼說來回也要2~3小時的時間，如果能帶登山杖會比較好，可以分散一些膝蓋負擔，總之裝備和基本補給要備妥再登山喔!','2021-11-15 17:23:39','2020-07-01',4,0,1,130,NULL),(2005,4,6,'「台灣第二高峰」絕美雪山主東行程','台灣第二高峰「雪山」，我卻拖了很久才終於來雪山主峰＋東峰這條經典路線，但實際走過，也是我近年來爬山覺得景色非常美的一趟行程，圈谷的壯闊、黑森林光影流動，還有山谷草原的柔美靜謐，翻新過後的七卡山莊更是好到很想長住下來','2021-11-15 17:23:39','2021-04-16',5,0,1,785,NULL),(2006,7,6,'雪山東峰，肉腳新手單攻沒成','雪山東峰單程約五公里，都說是新手可以挑戰單攻的路線，我們九點半從登山口一路之字形陡上，約八九百公尺後為斜坡加階梯，路徑約2公里處到達七卡山莊，對於肉腳新手的我們是蠻累的，遵照之前的設定下午一點鐘之前未到哭坡，為避免勉強上攻，之後要摸黑下山，於是決定照計畫下山，這次經驗是新手還是乖乖抽山屋，山上過一夜，這樣時間比較充裕','2021-11-15 17:30:36','2021-03-02',3,0,1,179,NULL),(2007,2,6,'雪山東峰一日行','山的美怎麼拍的好看，在陽光下更是如此。雖然走之字路上坡喘的要命，雖然要通過走到快要哭的『哭坡』，但一切都值得。到了東峰，坐在高山草原上，遠望著369山莊、高聳的雪山山脈，這壯闊的景色再好的攝影器材也無法容納，唯有親自走一趟，用雙眼才能體會','2021-11-15 17:32:24','2021-06-05',4,0,1,222,NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-16 21:18:31
