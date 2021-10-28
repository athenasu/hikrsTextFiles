-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ShanShan
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ShanShan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ShanShan` DEFAULT CHARACTER SET utf8 ;
USE `ShanShan` ;

-- -----------------------------------------------------
-- Table `ShanShan`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`member` (
  `member_id` INT NOT NULL AUTO_INCREMENT COMMENT '會員編號',
  `member_name` VARCHAR(20) NOT NULL COMMENT '會員姓名',
  `member_email` VARCHAR(20) NOT NULL COMMENT '會員帳號',
  `member_password` VARCHAR(20) NOT NULL COMMENT '會員密碼',
  `member_username` VARCHAR(20) NOT NULL COMMENT '會員暱稱',
  `member_phone_num` VARCHAR(10) NOT NULL COMMENT '會員電話',
  `member_register_date` DATE NOT NULL DEFAULT (curdate()) COMMENT '會員註冊日',
  `member_profile_pic` BLOB NOT NULL COMMENT '會員照片',
  `member_intro` VARCHAR(100) NOT NULL COMMENT '會員介紹',
  `member_status` TINYINT NOT NULL DEFAULT '1' COMMENT '會員狀態',
  `member_sum_points` INT NULL DEFAULT NULL COMMENT '總點數',
  `member_subscriptoin` TINYINT NULL DEFAULT NULL COMMENT '訂閱狀態',
  PRIMARY KEY (`member_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ShanShan`.`mountain`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`mountain` (
  `mountain_id` INT NOT NULL AUTO_INCREMENT COMMENT '山編號',
  `mountain_district` INT NOT NULL COMMENT '區域編號',
  `mountain_name` VARCHAR(50) NOT NULL COMMENT '山名',
  PRIMARY KEY (`mountain_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ShanShan`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`article` (
  `article_id` INT NOT NULL AUTO_INCREMENT COMMENT '文章編號',
  `member_id` INT NOT NULL COMMENT '會員編號',
  `mountain_id` INT NOT NULL COMMENT '山編號',
  `article_title` VARCHAR(10) NOT NULL COMMENT '文章名稱',
  `article_content` VARCHAR(100) NOT NULL COMMENT '文章內容',
  `article_date_created` DATE NOT NULL DEFAULT (curdate()) COMMENT '文章發表日期',
  `event_date` DATE NOT NULL COMMENT '登山日期',
  `recommendation` INT NOT NULL COMMENT '推薦',
  `article_points_recieved` INT NOT NULL COMMENT '文章打賞數',
  `article_status` TINYINT NOT NULL COMMENT '文件狀態',
  `aritcle_viewer` VARCHAR(45) NULL DEFAULT NULL COMMENT '文章觀看數',
  PRIMARY KEY (`article_id`),
  INDEX `FK_article_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_article_mountain_id_idx` (`mountain_id` ASC) VISIBLE,
  CONSTRAINT `FK_article_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`),
  CONSTRAINT `FK_article_mountain_id`
    FOREIGN KEY (`mountain_id`)
    REFERENCES `ShanShan`.`mountain` (`mountain_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2001
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ShanShan`.`act_log_msg_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`act_log_msg_board` (
  `act_msg_id` INT NOT NULL AUTO_INCREMENT COMMENT '日誌留言編號',
  `article_id` INT NOT NULL COMMENT '日誌編號',
  `member_id` INT NOT NULL COMMENT '留言會員編號',
  `msg_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言時間',
  `msg_content` VARCHAR(100) NOT NULL COMMENT '留言內容',
  `msg_status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '留言狀態(0:下架 1:上架)',
  PRIMARY KEY (`act_msg_id`),
  INDEX `FK_act_log_msg_board_aritcle_id_idx` (`article_id` ASC) VISIBLE,
  INDEX `FK_act_log_msg_board_member_id_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `FK_act_log_msg_board_aritcle_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `ShanShan`.`article` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_act_log_msg_board_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `ShanShan`.`admin_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`admin_info` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `admin_account` VARCHAR(30) NOT NULL,
  `admin_name` VARCHAR(30) NOT NULL,
  `admin_password` VARCHAR(30) NOT NULL,
  `admin_account_status` INT NOT NULL,
  PRIMARY KEY (`admin_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`article_picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`article_picture` (
  `article_picture_id` INT NOT NULL AUTO_INCREMENT COMMENT '文章照片編號',
  `article_id` INT NOT NULL COMMENT '文章編號',
  `article_picture` BLOB NOT NULL COMMENT '文章照片',
  PRIMARY KEY (`article_picture_id`),
  INDEX `FK_article_picture_aricle_id_idx` (`article_id` ASC) VISIBLE,
  CONSTRAINT `FK_article_picture_aricle_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `ShanShan`.`article` (`article_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ShanShan`.`article_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`article_report` (
  `article_report_id` INT NOT NULL AUTO_INCREMENT COMMENT '文章檢舉編號',
  `member_id` INT NOT NULL COMMENT '檢舉會員編號',
  `article_id` INT NOT NULL,
  `article_report_status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '文章檢舉處理狀態 (0:未處理 1:已刪除 2:未通過)',
  `article_report_reason` TINYINT(1) NOT NULL COMMENT '文章檢舉原因 (0: 色情騷擾 1: 不實資訊 2: 垃圾訊息 3: 仇恨言論)',
  `article_report_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章檢舉日期',
  `case_done` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '結案時間',
  PRIMARY KEY (`article_report_id`),
  INDEX `FK_aritcle_report_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_aricle_report_article_id_idx` (`article_id` ASC) VISIBLE,
  CONSTRAINT `FK_aritcle_report_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_aricle_report_article_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `ShanShan`.`article` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `ShanShan`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`company` (
  `company_id` INT NOT NULL COMMENT '店家編號',
  `company_name` VARCHAR(20) NOT NULL COMMENT '店家名稱',
  `company_email` VARCHAR(30) NOT NULL COMMENT '店家信箱',
  `company_password` VARCHAR(10) NOT NULL COMMENT '店家密碼',
  `company_phone` VARCHAR(10) NOT NULL COMMENT '店家電話',
  `company_cell` VARCHAR(10) NOT NULL COMMENT '店家手機',
  `company_register_date` DATE NOT NULL DEFAULT (curdate()) COMMENT '店家註冊日',
  `company_cetificate` BLOB NOT NULL COMMENT '店家營登照',
  `company_banner` BLOB NOT NULL COMMENT '店家首圖',
  `comany_intro` VARCHAR(300) NOT NULL COMMENT '店家簡介',
  `company_owner` VARCHAR(5) NOT NULL COMMENT '店家負責人',
  `company_address` VARCHAR(25) NOT NULL COMMENT '店家地址',
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '店家';


-- -----------------------------------------------------
-- Table `ShanShan`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`event` (
  `event_id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `mountain_id` INT NOT NULL,
  `event_name` VARCHAR(25) NOT NULL,
  `event_days` INT NOT NULL,
  `difficulty` INT NULL DEFAULT NULL,
  `event_deadline` DATE NOT NULL,
  `event_start_date` DATETIME NOT NULL,
  `event_post_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stay_type` INT NOT NULL,
  `min_num_of_people` INT NOT NULL,
  `max_num_of_people` INT NOT NULL,
  `assembling_place` TEXT NOT NULL,
  `event_content` TEXT NOT NULL,
  `event_cover` BLOB NULL DEFAULT NULL,
  `event_status` INT NOT NULL,
  `event_points` INT NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `FK_event_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_event_mountain_id_idx` (`mountain_id` ASC) VISIBLE,
  CONSTRAINT `FK_event_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_event_mountain_id`
    FOREIGN KEY (`mountain_id`)
    REFERENCES `ShanShan`.`mountain` (`mountain_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`event_msg_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`event_msg_board` (
  `event_msg_id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `event_id` VARCHAR(45) NOT NULL,
  `msg_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_content` TEXT NOT NULL,
  `msg_status` INT NOT NULL,
  PRIMARY KEY (`event_msg_id`),
  INDEX `FK_event_msg_board_member_id_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `FK_event_msg_board_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`event_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`event_report` (
  `event_report_id` INT NOT NULL COMMENT '揪團檢舉編號',
  `member_id` INT NOT NULL COMMENT '檢舉人會員編號',
  `event_id` INT NOT NULL COMMENT '揪團編號',
  `report_reason` INT NOT NULL COMMENT '檢舉原因',
  `report_date` DATETIME NOT NULL COMMENT '檢舉日期',
  `case_done` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '結案時間',
  `case_status` INT NOT NULL COMMENT '案件狀態',
  PRIMARY KEY (`event_report_id`),
  INDEX `FK_event_report_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_event_report_event_id_idx` (`event_id` ASC) VISIBLE,
  CONSTRAINT `FK_event_report_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_event_report_event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `ShanShan`.`event` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '揪團檢舉';


-- -----------------------------------------------------
-- Table `ShanShan`.`msg_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`msg_report` (
  `msg_report_id` INT NOT NULL COMMENT '留言檢舉編號',
  `member_id` INT NOT NULL COMMENT '檢舉人編號',
  `event_msg_id` INT NULL COMMENT '揪團留言編號',
  `act_msg_id` INT NULL COMMENT '活動日誌留言編號',
  `report_reason` INT NOT NULL COMMENT '檢舉原因',
  `report_date` DATETIME NOT NULL COMMENT '檢舉日期',
  `case_done` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '結案時間',
  `case_status` INT NOT NULL COMMENT '案件狀態',
  PRIMARY KEY (`msg_report_id`),
  INDEX `FK_msg_report_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_msg_report_event_msg_id_idx` (`event_msg_id` ASC) VISIBLE,
  INDEX `FK_msg_report_act_msg_id_idx` (`act_msg_id` ASC) VISIBLE,
  CONSTRAINT `FK_msg_report_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_msg_report_event_msg_id`
    FOREIGN KEY (`event_msg_id`)
    REFERENCES `ShanShan`.`event_msg_board` (`event_msg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_msg_report_act_msg_id`
    FOREIGN KEY (`act_msg_id`)
    REFERENCES `ShanShan`.`act_log_msg_board` (`act_msg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '留言檢舉';


-- -----------------------------------------------------
-- Table `ShanShan`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`product` (
  `product_id` INT NOT NULL COMMENT '商品編號',
  `company_id` INT NOT NULL COMMENT '店家ID',
  `product_type` INT NOT NULL COMMENT '商品類別(1:衣著 2:鞋子3:背包相關4:耗材5:照明6:工具刀斧7:炊具8:家具9:帳篷天幕營柱10:寢具地墊)',
  `status` INT NULL DEFAULT '0' COMMENT '上架狀態(0:下架1:上架)',
  `product_price` INT NULL DEFAULT NULL COMMENT '商品單價',
  `product_intro` VARCHAR(200) NOT NULL COMMENT '商品敘述',
  PRIMARY KEY (`product_id`),
  INDEX `FK_product_company_id_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `FK_product_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `ShanShan`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`single_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`single_order` (
  `single_order_id` INT NOT NULL AUTO_INCREMENT COMMENT '訂單編號',
  `member_id` INT NOT NULL COMMENT '會員編號',
  `order_created_date` DATE NOT NULL DEFAULT (curdate()) COMMENT '訂單創立日',
  `order_member_address` VARCHAR(50) NOT NULL COMMENT '訂單配送地址',
  `order_member_name` VARCHAR(20) NOT NULL COMMENT '訂單收貨人',
  `order_member_phone` VARCHAR(20) NOT NULL COMMENT '訂單收貨人電話',
  `order_status` TINYINT(1) NOT NULL COMMENT '訂單狀態(0:取消1:配送中2:已配送3:已結單4:退貨)',
  `point_used` INT NULL DEFAULT NULL COMMENT '使用點數(最多總金額5％)',
  `order_sum_before` INT NOT NULL COMMENT '折扣前總金額',
  `order_sum_after` INT NOT NULL COMMENT '折扣後總金額',
  PRIMARY KEY (`single_order_id`),
  INDEX `FK_single_order_member_id_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `FK_single_order_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`order_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`order_description` (
  `order_id` INT NOT NULL COMMENT '訂單編號',
  `product_id` INT NOT NULL COMMENT '商品編號',
  `product_quantity` INT NOT NULL COMMENT '商品數量',
  `order_shipped_date` DATE NULL DEFAULT (curdate()) COMMENT '訂單配送日',
  `ship_number` VARCHAR(25) NULL DEFAULT NULL COMMENT '貨運單號',
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `FK_order_description_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK_order_description_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `ShanShan`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_description_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `ShanShan`.`single_order` (`single_order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`participant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`participant` (
  `part_id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `experence` TINYINT(1) NOT NULL,
  `phone_number` VARCHAR(25) NOT NULL,
  `participation` TINYINT(1) NOT NULL,
  `join_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`part_id`),
  INDEX `FK_participant_event_id_idx` (`event_id` ASC) VISIBLE,
  INDEX `FK_participant_member_id_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `FK_participant_event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `ShanShan`.`event` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_participant_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`points_used_act`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`points_used_act` (
  `points_used_act_id` INT NOT NULL AUTO_INCREMENT COMMENT '活動日誌打賞編號',
  `member_id` INT NOT NULL COMMENT '打賞者會員編號',
  `article_id` INT NOT NULL COMMENT '活動日誌編號',
  `points_used` INT NOT NULL COMMENT '使用點數',
  `points_used_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '使用點數時間',
  PRIMARY KEY (`points_used_act_id`),
  INDEX `FK_member_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_article_article_id_idx` (`article_id` ASC) VISIBLE,
  CONSTRAINT `FK_article_article_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `ShanShan`.`article` (`article_id`),
  CONSTRAINT `FK_member_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ShanShan`.`points_used_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`points_used_article` (
  `points_used_act_id` INT NOT NULL COMMENT '活動日誌打賞編號',
  `member_id` INT NOT NULL COMMENT '打賞者會員編號',
  `article_id` INT NOT NULL COMMENT '活動日誌編號',
  `points_used` INT NOT NULL COMMENT '使用點數',
  `points_used_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '使用點數時間',
  PRIMARY KEY (`points_used_act_id`),
  INDEX `FK_points_used_article_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_points_used_article_article_id_idx` (`article_id` ASC) VISIBLE,
  CONSTRAINT `FK_points_used_article_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_points_used_article_article_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `ShanShan`.`article` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '打賞日誌';


-- -----------------------------------------------------
-- Table `ShanShan`.`product_img`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`product_img` (
  `product_img_id` INT NOT NULL AUTO_INCREMENT COMMENT '照片編號',
  `product_des_id` INT NOT NULL COMMENT '商品明細編號',
  `product_img` BLOB NULL DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`product_img_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`product_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`product_description` (
  `product_des_id` INT NOT NULL AUTO_INCREMENT COMMENT '商品明細編號',
  `product_id` INT NOT NULL COMMENT '商品編號',
  `product_img_list_id` INT NOT NULL COMMENT '商品照片編號',
  `product_size` INT NOT NULL COMMENT '商品尺寸(0:F 1:S 2:M 3:L 4:XL)',
  `product_color` VARCHAR(15) NOT NULL COMMENT '商品顏色',
  `product_stock` INT NOT NULL COMMENT '商品庫存量',
  PRIMARY KEY (`product_des_id`),
  INDEX `FK_product_description_product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `FK_product_description_product_img_list_id_idx` (`product_img_list_id` ASC) VISIBLE,
  CONSTRAINT `FK_product_description_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `ShanShan`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_product_description_product_img_list_id`
    FOREIGN KEY (`product_img_list_id`)
    REFERENCES `ShanShan`.`product_img` (`product_img_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ShanShan`.`staff_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`staff_info` (
  `staff_id` INT NOT NULL COMMENT '員工編號',
  `company_id` INT NOT NULL COMMENT '店家編號',
  `staff_infocol` VARCHAR(20) NOT NULL COMMENT '員工帳號',
  `staff_email` VARCHAR(20) NOT NULL COMMENT '員工密碼',
  `staff_password` VARCHAR(30) NOT NULL COMMENT '員工名稱',
  `staff_name` VARCHAR(10) NOT NULL COMMENT '員工名稱',
  `staff_status` INT NOT NULL COMMENT '員工狀態',
  `staff_infocol1` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  INDEX `FK_staff_info_company_id_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `FK_staff_info_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `ShanShan`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '員工資料';


-- -----------------------------------------------------
-- Table `ShanShan`.`wishlist_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`wishlist_article` (
  `wishlist_article_id` INT NOT NULL AUTO_INCREMENT COMMENT '收藏活動日誌編號',
  `article_id` INT NOT NULL COMMENT '文章編號',
  `member_id` INT NOT NULL COMMENT '會員編號',
  `favorite_status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '收藏狀態(0:收藏 1:取消收藏)',
  PRIMARY KEY (`wishlist_article_id`),
  INDEX `FK_wishlist_article_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_wishlist_article_aritcle_id_idx` (`article_id` ASC) VISIBLE,
  CONSTRAINT `FK_wishlist_article_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_wishlist_article_aritcle_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `ShanShan`.`article` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `ShanShan`.`wishlist_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`wishlist_event` (
  `wishlist_event_id` INT NOT NULL AUTO_INCREMENT COMMENT '收藏揪團編號',
  `member_id` INT NOT NULL COMMENT '會員編號',
  `event_id` INT NOT NULL COMMENT '揪團編號',
  `favorite_status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '收藏狀態(0:收藏 1:取消收藏)',
  PRIMARY KEY (`wishlist_event_id`),
  INDEX `FK_wishlist_event_member_id_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_wishlist_event_event_id_idx` (`event_id` ASC) VISIBLE,
  CONSTRAINT `FK_wishlist_event_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_wishlist_event_event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `ShanShan`.`event` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `ShanShan`.`wishlist_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ShanShan`.`wishlist_product` (
  `wishlist_product_id` INT NOT NULL AUTO_INCREMENT COMMENT '收藏產品編號',
  `member_id` INT NOT NULL COMMENT '會員編號',
  `product_id` INT NOT NULL COMMENT '產品編號',
  `favorite_status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '收藏狀態 (0:收藏 1:取消收藏)',
  PRIMARY KEY (`wishlist_product_id`),
  INDEX `FK_wishlist_product_idx` (`member_id` ASC) VISIBLE,
  INDEX `FK_wishlist_product_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK_wishlist_product_member_id`
    FOREIGN KEY (`member_id`)
    REFERENCES `ShanShan`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_wishlist_product_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `ShanShan`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
