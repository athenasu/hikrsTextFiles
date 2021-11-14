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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT COMMENT '商品編號',
  `company_id` int NOT NULL COMMENT '店家ID',
  `product_name` varchar(45) NOT NULL,
  `product_type` int NOT NULL COMMENT '商品類別(1:衣著 2:鞋子3:背包相關4:耗材5:照明6:工具刀斧7:炊具8:家具9:帳篷天幕營柱10:寢具地墊)',
  `status` int DEFAULT '0' COMMENT '上架狀態(0:下架1:上架)',
  `product_price` int DEFAULT NULL COMMENT '商品單價',
  `product_intro` varchar(500) NOT NULL COMMENT '商品敘述',
  PRIMARY KEY (`product_id`),
  KEY `FK_product_company_id_idx` (`company_id`),
  CONSTRAINT `FK_product_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'QUECHUA指北針',2,0,599,'油液式指北針配有360°旋轉式針盒、2種比例尺、一個放大鏡以及脖子掛帶，能在從事戶外活動時提供指引。'),(2,1,'QUECHUA指南針',2,0,349,'放大鏡能提供目測時額外的準確度！以度數或透過測量尺度以千分之一量測。'),(3,1,'全龍骨式不鏽鋼直刀',2,0,3960,'品牌:MORAKNIV Garberg。含求生配件。總長度 229 mm ，刀刃：厚度 3.2 mm ，長度 109 mm'),(4,1,'Kansbol不鏽鋼直刀',2,0,2250,'品牌:MORAKNIV。全功能的直刀，設計用於所有類型的環境。總長度 226 mm ，刀刃：厚度 2.5 mm ，長度 109 mm'),(5,1,'防水易刮可換打火棒',2,0,1170,'品牌:EXOTAC。約 9.3 x 1.1 x 1.1 cm/6016 航太鋁合金、鐵鈰齊、440 不鏽鋼'),(6,1,'防震防潑水LED頭燈',2,0,299,'品牌:FORCLAZ ONNIGHT。80流明,25m照度'),(7,1,'防震防潑水電池式頭燈',2,0,199,'品牌:FORCLAZ ONNIGHT。30流明,15m照度'),(8,1,'手搖式充電手電筒',2,0,399,'品牌FORCLAZ/型號Dynamo300/35流明 40m照度'),(9,1,'成人登山睡袋(木乃伊款)',4,0,1800,'品牌FORCLAZ/型號TREK500/溫度範圍0~5度C可提供最大的舒適度'),(10,1,'成人登山睡袋(木乃伊款)',4,0,999,'品牌FORCLAZ/型號TREK500/溫度範圍15~20度C可提供最大的舒適度'),(11,1,'成人登山睡袋(木乃伊款)',4,0,1499,'品牌FORCLAZ/型號TREK500/溫度範圍5~10度C可提供最大的舒適度'),(12,1,'登山羽絨睡袋',4,0,3000,'品牌FORCLAZ/型號TREK900/10度C用(羽絨，800 cuins) 製睡袋。從事徒步旅行或健行運動時，在10度C以上或等於0度C的氣溫下舒適地睡眠。'),(13,1,'成人羽絨登山睡袋',4,0,4999,'品牌FORCLAZ/型號TREK900/0度C用(羽絨，800 cuins) 製睡袋。木乃伊形狀，非常舒適。符合人體工學的連帽。雙拉鍊頭設計。防潑水。'),(14,1,'輕便款登山露營帳',4,0,1249,'品牌QUECHUA/2人用/獨立式穹頂結構設計，130X210cm寢室（可容納2個65 cm的睡袋)。最大使用高度：105cm '),(15,1,'專業登山露營帳',4,0,2500,'品牌FORCLAZ/2人用/每人睡覺寬度為60cm寢室高度105cm。1扇帳門。1個門廊。2個口袋。可防風60 km/h（7級陣風經過風洞的旋轉平台認證。'),(16,1,'摩登機能禦寒衝鋒衣',1,0,1650,'品牌ONEBOY/女款身高155-160合適/商品材質:亮面塗層面料/內裏材質:不倒絨刷毛/商品功能:保暖、防潑水、防風、防紫外線、透氣、耐磨。'),(17,1,'NorvanLT防水外套',1,0,15000,'品牌ARCTERYX 始祖鳥/女款身高155-160合適/輕量款Norvan LT連帽衣雖然重量很輕，卻能有效防風雨，是專適合跑步的外套。採用了GORE-TEX面料配合GORE C-KNIT™裡襯技術，摩擦時安靜無聲，且具有卓越的透氣效果。'),(18,1,'兩件式防水保暖外套',1,0,15000,'品牌Mammut 長毛象/女款身高155-160合適/Convey 3合1外層GORE-TEX防水夾克+內層羽絨外套'),(19,1,'OFOLATEW防水外套',1,0,15980,'品牌AIGLE/女款身高155-160合適/GORE-TEX兩層布料，採環保回收材質，防水透氣+全防水貼條。100%不含全氟碳化物之潑水劑(PFC FREE)，友善環境健康'),(20,1,'STORMLINE外套',1,0,3980,'品牌BlackDiamond/女款身高155-160合適/BD.dry™專為登山者和登山冒險者而設計，防水、透氣、防風，旨在保護您不受天氣影響。防水係數10,000mm，透氣性10,000g / m2 / 24hr。'),(21,1,'Windshell風衣',1,0,2980,'品牌Rab/女款身高155-160合適/輕便的連帽外套，可提供即時的防風保護。可輕易壓縮收納，重量僅140g。'),(22,1,'登山連帽外套',1,0,1290,'品牌GU/女款身高155-160合適/具有防風、耐久防潑水(雨水接觸後在表面結成水珠)、耐水壓(水不易滲透)及透濕(不易悶濕)等多樣機能。'),(23,1,'輕量耐磨登山緊身褲',1,0,1980,'品牌TAKODA/女款身高155-160合適/用途：一般戶外、攀登、登山健行、徒步旅行/材質：尼龍、彈性纖維/重量：238g'),(24,1,'軟殼刷毛登山長褲',1,0,1980,'品牌TAKODA/女款身高155-160合適/防風防潑水用途：一般戶外、攀登、登山健行、徒步旅行、滑雪、露營/材質：聚酯纖維、彈性纖維/重量：442g'),(25,1,'排汗速乾底層上衣',1,0,1280,'品牌TAKODA/女款身高155-160合適/綠色環保使用100%寶特瓶回收紗用途：一般戶外運動、登山健行、攀岩、單車旅行/材質：100%環保聚酯纖維/重量：111g'),(26,1,'內刷毛套頭保暖衣',1,0,1100,'品牌TAKODA/女款身高155-160合適/高彈性面料，可大幅度延展動作。用途：登山健行、一般戶外活動/材質：聚酯纖維/重量：241g'),(27,1,'防風保暖機能背心',1,0,3610,'品牌TAKODA/女款身高155-160合適/DWR防潑面料,外層有最佳的防風、防潑水和透氣性。用途：用途：一般戶外運動、登山健行、攀登/材質：鈦紗、聚酯纖維、彈性纖維、聚氨酯/重量：300g'),(28,1,'Osprey健行背包',1,0,2520,'品牌Osprey型號:Daylite 13/容量：13 L/背包尺寸：43L × 26W × 20D cm/重量：493g'),(29,1,'Osprey拉鍊袋零錢包',1,0,450,'品牌Osprey型號：ArcaneZip.Sㄥ/尺寸：8.5 × 13 × 1 cm/重量：23g'),(30,1,'Haulpack雙肩背包',1,0,5850,'品牌Fjallraven 型號：23340/容量：23L/高度：39 x 31 x 19cm/重量：890公克'),(31,1,'Abisko登山背包',1,0,4950,'品牌Fjallraven 型號：Hike 35/高度：61 x 28 x 26cm/最短背長：45公分/最長背長：49公分/重量：1400公克'),(32,1,'SACOCHE斜背包',1,0,1250,'品牌Gregory 型號：SACOCHE 109457-C309/材質：尼龍/聚酯纖維/容量：2L/尺寸：27 × 2.5 × 20 cm/重量：160 g'),(33,1,'Rook自助旅行背包',1,0,6210,'品牌Osprey 型號：Rook50/容量：50L/尺寸：74 ✕  41.5 ✕  35 cm/重量：1590g'),(34,1,'標準版中筒防水登山鞋',1,0,8010,'品牌LOWA 型號：Renegade GTX/女款/鞋面材質：Nubuk leather GORE-TEX/中底材質：Monowrap® 高密度PU/鞋底材質：Vibram® Evo/重量：445 公克（UK8 單只）'),(35,1,'防水登山鞋',1,0,5080,'品牌SALOMON 型號：X ULTRA 4 GTX/女款/如野跑鞋般靈巧，同時也擁有登山鞋的抓地、防水、穩定各項保護，全新的中底穩定設計，提供更好的穩定保護，並同時保有靈敏度。'),(36,1,'中筒登山健行鞋',1,0,4980,'品牌Caravan 型號：C1_02S/亞洲人腳型設計的鞋體，為了讓腳趾有活動的餘裕，採用3E的寬楦設計。採用GTX Performance Comfort Footwear防水薄膜，適合登山健行戶外活動。'),(37,1,'機能戶外全輕量減震中長襪',1,0,800,'品牌Smartwool/Hike Light Cushion/全新進化 4 Degree Fit System 四向包覆系統，提供更佳的舒適度與延展性。採用Indestructawool耐磨技術，避震區塊耐用度進化再升級。材質：54% Merino Wool、12% Nylon、31% Recycled Nylon、3% Elastane。'),(38,1,'機能戶外中級減震中長襪',1,0,800,'品牌Smartwool/Hike Full Cushion/材質：60% Merino Wool、12% Nylon、25% Recycled Nylon、3% Elastane'),(39,1,'Everyday羊毛襪',1,0,680,'品牌Smartwool/Everyday/材質：57% Merino Wool、40% Nylon、3% Elastane'),(40,1,'防水防滑中筒登山鞋',1,0,2000,'品牌QUECHUA 型號:MH100/女款/附4mm鞋釘的防滑橡膠外底。防水透氣膜內襯：讓各種天候下的雙腳都能保持3個小時的乾爽。'),(41,2,'抗UV聚酯纖維拉鍊連帽外套',1,0,599,'品牌MUJI/男款170-175適合著用/材質：聚酯纖維100% '),(42,2,'透氣登山外套',1,0,1249,'品牌QUECHUA/型號MH100/男款170-175適合著用/主要布料 : 100.0% 聚酯纖維 主要內襯 : 100.0% 聚酯纖維 次要內襯 : 100.0% 聚酯纖維 塗層 : 100.0% 聚氨酯纖維（PU）'),(43,2,'速乾縱橫彈性聚酯纖維錐形褲',1,0,1390,'品牌MUJI/男款170-175適合著用/材質：聚酯纖維100.0% 聚酯纖維/使用能快速排除雨水或汗水等水氣的素材，腰部可利用繫帶調整尺寸。'),(44,2,'輕量澳洲羽絨可攜式立領背心',1,0,990,'品牌MUJI/男款170-175適合著用/材質：表布：尼龍100%。裏布：尼龍100%。填充物：羽絨90%、羽毛10%。滾邊：尼龍93%、彈性纖維7%/選用膨脹係數達750FP，並指定飼養和採取方式的澳洲羽絨。'),(45,2,'輕量澳洲羽絨可攜式無領外套',1,0,1399,'品牌MUJI/男款170-175適合著用/材質：表布：尼龍100%。裏布：尼龍100%。填充物：羽絨90%、羽毛10%/選用膨脹係數達750FP，並指定飼養和採取方式的澳洲羽絨。'),(46,2,'100流明LED頭燈',2,0,399,'品牌KALENJI/型號OnNight 210/安裝四號電池3顆，強力照明模式為100流明，節能照明模式為45流明'),(47,2,'隨身LED手電筒',2,0,270,'品牌NEBO/POPLite/重量36g尺寸收合 64mm / 伸長 93mm / 直徑 19mm，亮度100lm'),(48,2,'LED中型營燈',2,0,599,'品牌100mountain/LT-380/重量約261g，尺寸74mm x 158mm，亮度380lm，使用6顆3號AA鹼性電池'),(49,2,'LED桌燈',2,0,4050,'品牌CLAYMORE/Lamp Selene/重量約660g，尺寸165 x 165 x 250 mm，亮度30-660lm，Li-ion 3.6V 鋰電池 / 容量 6,700mAh (24.12Wh)'),(50,2,'專業充電式照明燈',2,0,1620,'品牌LEDLENSER/ML4/重量約71g，尺寸34 x 97 mm，亮度最高300lm，白光'),(51,2,'古典煤油燈',2,0,1350,'品牌Feuerhand/ML4/重量約520g，尺寸15.5 x 25.5 cm，容量340ml燃燒時間約20，燃料：煤油、燈油'),(52,2,'防潑水頭燈(3種模式)',2,0,399,'品牌FORCLAZ BIVOUAC/500/重量約45g，尺寸51 x 28 x 26 mm(不含頭帶)，100流明，25照度'),(53,2,'防水可換打火棒',2,0,1035,'品牌EXOTAC/FIREROD/重量約27g，材質6016 航太鋁合金、Ferrocerium rod'),(54,2,'10用瑞士刀',2,0,1600,'品牌Victorinox/重量約109g，高度17mm，工具:1.大刀2.針、鑽孔錐3.木鋸4.開罐器5. 3mm 螺絲批6.開瓶器7. 7.5 mm 螺絲批8.電線剝皮鉗9.剪刀10.鑰匙圈'),(55,2,'多用途掛鉤',2,0,780,'品牌HEROCLIP/重量約56g，尺寸:7.6 x 9.5 cm/材質:鋁合金、橡膠/承重約27KG'),(56,2,'直握把卡榫式調節登山杖',2,0,299,'品牌FORCLAZ/Arpenaz100/重量約200g/材質:箭桿100.0% 鋁、手把:100.0% 聚丙烯纖維/折疊後55cm展開後長度120cm'),(57,2,'卡榫式調節登山杖',2,0,499,'品牌FORCLAZ/Hike 300/重量約240g/材質:6061-T6鋁合金/3段式可伸縮/T型握把。摺疊後長度：58 cm'),(58,2,'三季隧道式帳篷',4,0,5750,'品牌FORCLAZ/TREK500/4人用/總重量：4.8 kg 輕巧壓縮袋：20 L 尺寸：39x23x22cm，每人寬度：58cm 臥室高度：120cm'),(59,2,'超遮陽登山帳篷',4,0,3499,'品牌FORCLAZ/超遮陽系列/2人用/總重量＝3.1 kg。11 L的壓縮收納袋。 規格為39 x 17 x 17 cm，每人睡覺寬度為60 cm。 寢室高度 108 cm。'),(60,2,'登山輕量天幕帳',4,0,1700,'品牌FORCLAZ/TREK900/根據選擇的配置方式，最多可容納3人。/總重量為500 g。 壓縮袋：1.5 L。規格：15 cm x 10 cm。'),(61,2,'不鏽鋼露營野炊鍋具',3,0,599,'品牌QUECHUA/2人用/尺寸：19.5 x 10.5 cm/1個平底鍋、1個鍋蓋、2個餐碗（0.5 L）、2組3入的餐具組。'),(62,2,'不鏽鋼登山野炊鍋具',3,0,849,'品牌FORCLAZ/TREK500/2人用/尺寸：13.5 x 14 cm/11個平底深鍋、1個鍋蓋／過濾蓋、2個餐碗、2個湯匙／摺疊叉'),(63,2,'第二代輕量高山爐蜘蛛爐',3,0,499,'爐體僅重280克，附強力電子點火2900w火力強大'),(64,2,'登山炊煮茶壺套鍋',3,0,980,'3人用/內含大鍋 x 1、水壺 x 1、平底鍋 x 1、湯勺(PP材質) x 1、飯勺(木頭材質) x 1、碗(PP材質) x 2、海綿刷 x 1/重量：712g');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-14 22:24:37
