{\rtf1\ansi\ansicpg1252\cocoartf2578
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset136 PingFangTC-Regular;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- MySQL Workbench Forward Engineering\
\
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';\
\
-- -----------------------------------------------------\
-- Schema mydb\
-- -----------------------------------------------------\
-- -----------------------------------------------------\
-- Schema ShanShan\
-- -----------------------------------------------------\
\
-- -----------------------------------------------------\
-- Schema ShanShan\
-- -----------------------------------------------------\
CREATE SCHEMA IF NOT EXISTS `ShanShan` DEFAULT CHARACTER SET utf8 ;\
USE `ShanShan` ;\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`member`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`member` (\
  `member_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `member_name` VARCHAR(20) NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'a9\'6d\'a6\'57
\f0 ',\
  `member_email` VARCHAR(20) NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'b1\'62\'b8\'b9
\f0 ',\
  `member_password` VARCHAR(20) NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'b1\'4b\'bd\'58
\f0 ',\
  `member_username` VARCHAR(20) NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'bc\'ca\'ba\'d9
\f0 ',\
  `member_phone_num` VARCHAR(10) NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'b9\'71\'b8\'dc
\f0 ',\
  `member_register_date` DATE NOT NULL DEFAULT (curdate()) COMMENT '
\f1 \'b7\'7c\'ad\'fb\'b5\'f9\'a5\'55\'a4\'e9
\f0 ',\
  `member_profile_pic` BLOB NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'b7\'d3\'a4\'f9
\f0 ',\
  `member_intro` VARCHAR(100) NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'a4\'b6\'b2\'d0
\f0 ',\
  `member_status` TINYINT NOT NULL DEFAULT '1' COMMENT '
\f1 \'b7\'7c\'ad\'fb\'aa\'ac\'ba\'41
\f0 ',\
  `member_sum_points` INT NULL DEFAULT NULL COMMENT '
\f1 \'c1\'60\'c2\'49\'bc\'c6
\f0 ',\
  `member_subscription` TINYINT NULL DEFAULT NULL COMMENT '
\f1 \'ad\'71\'be\'5c\'aa\'ac\'ba\'41
\f0 ',\
  PRIMARY KEY (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb3;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`mountain`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`mountain` (\
  `mountain_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a4\'73\'bd\'73\'b8\'b9
\f0 ',\
  `mountain_district` INT NOT NULL COMMENT '
\f1 \'b0\'cf\'b0\'ec\'bd\'73\'b8\'b9
\f0 ',\
  `mountain_name` VARCHAR(50) NOT NULL COMMENT '
\f1 \'a4\'73\'a6\'57
\f0 ',\
  PRIMARY KEY (`mountain_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb3;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`article`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`article` (\
  `article_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a4\'e5\'b3\'b9\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `mountain_id` INT NOT NULL COMMENT '
\f1 \'a4\'73\'bd\'73\'b8\'b9
\f0 ',\
  `article_title` VARCHAR(10) NOT NULL COMMENT '
\f1 \'a4\'e5\'b3\'b9\'a6\'57\'ba\'d9
\f0 ',\
  `article_content` VARCHAR(100) NOT NULL COMMENT '
\f1 \'a4\'e5\'b3\'b9\'a4\'ba\'ae\'65
\f0 ',\
  `article_date_created` DATE NOT NULL DEFAULT (curdate()) COMMENT '
\f1 \'a4\'e5\'b3\'b9\'b5\'6f\'aa\'ed\'a4\'e9\'b4\'c1
\f0 ',\
  `event_date` DATE NOT NULL COMMENT '
\f1 \'b5\'6e\'a4\'73\'a4\'e9\'b4\'c1
\f0 ',\
  `recommendation` INT NOT NULL COMMENT '
\f1 \'b1\'c0\'c2\'cb
\f0 ',\
  `article_points_recieved` INT NOT NULL COMMENT '
\f1 \'a4\'e5\'b3\'b9\'a5\'b4\'bd\'e0\'bc\'c6
\f0 ',\
  `article_status` TINYINT NOT NULL COMMENT '
\f1 \'a4\'e5\'a5\'f3\'aa\'ac\'ba\'41
\f0 ',\
  `aritcle_viewer` VARCHAR(45) NULL DEFAULT NULL COMMENT '
\f1 \'a4\'e5\'b3\'b9\'c6\'5b\'ac\'dd\'bc\'c6
\f0 ',\
  PRIMARY KEY (`article_id`),\
  INDEX `FK_article_member_id_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_article_mountain_id_idx` (`mountain_id` ASC) VISIBLE,\
  CONSTRAINT `FK_article_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`),\
  CONSTRAINT `FK_article_mountain_id`\
    FOREIGN KEY (`mountain_id`)\
    REFERENCES `ShanShan`.`mountain` (`mountain_id`))\
ENGINE = InnoDB\
AUTO_INCREMENT = 2001\
DEFAULT CHARACTER SET = utf8mb3;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`act_log_msg`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`act_log_msg` (\
  `act_msg_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a4\'e9\'bb\'78\'af\'64\'a8\'a5\'bd\'73\'b8\'b9
\f0 ',\
  `article_id` INT NOT NULL COMMENT '
\f1 \'a4\'e9\'bb\'78\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'af\'64\'a8\'a5\'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `msg_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'af\'64\'a8\'a5\'ae\'c9\'b6\'a1
\f0 ',\
  `msg_content` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL COMMENT '
\f1 \'af\'64\'a8\'a5\'a4\'ba\'ae\'65
\f0 ',\
  `msg_status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '
\f1 \'af\'64\'a8\'a5\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a4\'55\'ac\'5b
\f0  1:
\f1 \'a4\'57\'ac\'5b
\f0 )',\
  PRIMARY KEY (`act_msg_id`),\
  INDEX `FK_act_log_msg_aritcle_id_idx` (`article_id` ASC) VISIBLE,\
  INDEX `FK_act_log_msg_member_id_idx` (`member_id` ASC) VISIBLE,\
  CONSTRAINT `FK_act_log_msg_aritcle_id`\
    FOREIGN KEY (`article_id`)\
    REFERENCES `ShanShan`.`article` (`article_id`),\
  CONSTRAINT `FK_act_log_msg_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8\
COLLATE = utf8_bin;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`admin_info`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`admin_info` (\
  `admin_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'ba\'de\'b2\'7a\'aa\'cc\'bd\'73\'b8\'b9
\f0 ',\
  `admin_account` VARCHAR(30) NOT NULL COMMENT '
\f1 \'ba\'de\'b2\'7a\'aa\'cc\'b1\'62\'b8\'b9
\f0 ',\
  `admin_name` VARCHAR(30) NOT NULL COMMENT '
\f1 \'ba\'de\'b2\'7a\'aa\'cc\'a6\'57\'ba\'d9
\f0 ',\
  `admin_password` VARCHAR(30) NOT NULL COMMENT '
\f1 \'ba\'de\'b2\'7a\'aa\'cc\'b1\'4b\'bd\'58
\f0 ',\
  `admin_account_status` INT NOT NULL COMMENT '
\f1 \'ba\'de\'b2\'7a\'aa\'cc\'b1\'62\'b8\'b9\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'b0\'b1\'a5\'ce
\f0 1:
\f1 \'b1\'d2\'a5\'ce
\f0 )',\
  PRIMARY KEY (`admin_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci\
COMMENT = '
\f1 \'ba\'de\'b2\'7a\'aa\'cc
\f0 ';\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`article_picture`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`article_picture` (\
  `article_picture_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a4\'e5\'b3\'b9\'b7\'d3\'a4\'f9\'bd\'73\'b8\'b9
\f0 ',\
  `article_id` INT NOT NULL COMMENT '
\f1 \'a4\'e5\'b3\'b9\'bd\'73\'b8\'b9
\f0 ',\
  `article_picture` BLOB NOT NULL COMMENT '
\f1 \'a4\'e5\'b3\'b9\'b7\'d3\'a4\'f9
\f0 ',\
  PRIMARY KEY (`article_picture_id`),\
  INDEX `FK_article_picture_aricle_id_idx` (`article_id` ASC) VISIBLE,\
  CONSTRAINT `FK_article_picture_aricle_id`\
    FOREIGN KEY (`article_id`)\
    REFERENCES `ShanShan`.`article` (`article_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb3;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`article_report`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`article_report` (\
  `article_report_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a4\'e5\'b3\'b9\'c0\'cb\'c1\'7c\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'c0\'cb\'c1\'7c\'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `article_id` INT NOT NULL,\
  `article_report_status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '
\f1 \'a4\'e5\'b3\'b9\'c0\'cb\'c1\'7c\'b3\'42\'b2\'7a\'aa\'ac\'ba\'41
\f0  (0:
\f1 \'a5\'bc\'b3\'42\'b2\'7a
\f0  1:
\f1 \'a4\'77\'a7\'52\'b0\'a3
\f0  2:
\f1 \'a5\'bc\'b3\'71\'b9\'4c
\f0 )',\
  `article_report_reason` TINYINT(1) NOT NULL COMMENT '
\f1 \'a4\'e5\'b3\'b9\'c0\'cb\'c1\'7c\'ad\'ec\'a6\'5d
\f0  (0: 
\f1 \'a6\'e2\'b1\'a1\'c4\'cc\'c2\'5a
\f0  1: 
\f1 \'a4\'a3\'b9\'ea\'b8\'ea\'b0\'54
\f0  2: 
\f1 \'a9\'55\'a7\'a3\'b0\'54\'ae\'a7
\f0  3: 
\f1 \'a4\'b3\'ab\'eb\'a8\'a5\'bd\'d7
\f0 )',\
  `article_report_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'a4\'e5\'b3\'b9\'c0\'cb\'c1\'7c\'a4\'e9\'b4\'c1
\f0 ',\
  `case_done` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'b5\'b2\'ae\'d7\'ae\'c9\'b6\'a1
\f0 ',\
  PRIMARY KEY (`article_report_id`),\
  INDEX `FK_aritcle_report_member_id_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_aricle_report_article_id_idx` (`article_id` ASC) VISIBLE,\
  CONSTRAINT `FK_aricle_report_article_id`\
    FOREIGN KEY (`article_id`)\
    REFERENCES `ShanShan`.`article` (`article_id`),\
  CONSTRAINT `FK_aritcle_report_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8\
COLLATE = utf8_bin;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`company`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`company` (\
  `company_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a9\'b1\'ae\'61\'bd\'73\'b8\'b9
\f0 ',\
  `company_name` VARCHAR(20) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'a6\'57\'ba\'d9
\f0 ',\
  `company_email` VARCHAR(30) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'ab\'48\'bd\'63
\f0 ',\
  `company_password` VARCHAR(10) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'b1\'4b\'bd\'58
\f0 ',\
  `company_phone` VARCHAR(10) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'b9\'71\'b8\'dc
\f0 ',\
  `company_cell` VARCHAR(10) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'a4\'e2\'be\'f7
\f0 ',\
  `company_register_date` DATE NOT NULL DEFAULT (curdate()) COMMENT '
\f1 \'a9\'b1\'ae\'61\'b5\'f9\'a5\'55\'a4\'e9
\f0 ',\
  `company_cetificate` BLOB NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'c0\'e7\'b5\'6e\'b7\'d3
\f0 ',\
  `company_banner` BLOB NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'ad\'ba\'b9\'cf
\f0 ',\
  `comany_intro` VARCHAR(300) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'c2\'b2\'a4\'b6
\f0 ',\
  `company_owner` VARCHAR(5) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'ad\'74\'b3\'64\'a4\'48
\f0 ',\
  `company_address` VARCHAR(25) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'a6\'61\'a7\'7d
\f0 ',\
  `company_status` TINYINT(1) NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a5\'bc\'bc\'66\'ae\'d6
\f0 1:
\f1 \'a4\'57\'ac\'5b
\f0 2:
\f1 \'a4\'55\'ac\'5b
\f0 )',\
  PRIMARY KEY (`company_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci\
COMMENT = '
\f1 \'a9\'b1\'ae\'61
\f0 ';\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`event`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`event` (\
  `event_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'b4\'aa\'b9\'ce\'a4\'e5\'b3\'b9\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'aa\'cc\'bd\'73\'b8\'b9
\f0 ',\
  `mountain_id` INT NOT NULL COMMENT '
\f1 \'a4\'73\'a6\'57
\f0 ',\
  `event_name` VARCHAR(25) NOT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'a4\'e5\'b3\'b9\'bc\'d0\'c3\'44
\f0 ',\
  `event_days` INT NOT NULL COMMENT '
\f1 \'ac\'a1\'b0\'ca\'a4\'d1\'bc\'c6
\f0 ',\
  `difficulty` INT NULL DEFAULT NULL COMMENT '
\f1 \'c3\'f8\'ab\'d7
\f0 ',\
  `event_deadline` DATE NOT NULL COMMENT '
\f1 \'b5\'b2\'b9\'ce\'a4\'e9\'b4\'c1
\f0 ',\
  `event_start_date` DATETIME NOT NULL COMMENT '
\f1 \'a5\'58\'b5\'6f\'a4\'e9\'b4\'c1
\f0 ',\
  `event_post_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'b5\'6f\'a4\'e5\'a4\'e9\'b4\'c1
\f0 ',\
  `stay_type` INT NOT NULL COMMENT '
\f1 \'a6\'ed\'b1\'4a\'ba\'d8\'c3\'fe
\f0 ',\
  `min_num_of_people` INT NOT NULL COMMENT '
\f1 \'b3\'cc\'a7\'43\'a4\'48\'bc\'c6
\f0 ',\
  `max_num_of_people` INT NOT NULL COMMENT '
\f1 \'b3\'cc\'b0\'aa\'a4\'48\'bc\'c6
\f0 ',\
  `assembling_place` TEXT NOT NULL COMMENT '
\f1 \'b6\'b0\'a6\'58\'a6\'61\'c2\'49
\f0 ',\
  `event_content` TEXT NOT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'a4\'e5\'b3\'b9\'a4\'ba\'ae\'65
\f0 ',\
  `event_cover` BLOB NULL DEFAULT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'ab\'ca\'ad\'b1
\f0 ',\
  `event_status` INT NOT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a4\'55\'ac\'5b
\f0  1:
\f1 \'a4\'57\'ac\'5b
\f0  2:
\f1 \'a9\'db\'b6\'d2\'a4\'a4
\f0  3:
\f1 \'ba\'a1\'b9\'ce
\f0  4:
\f1 \'ac\'79\'b9\'ce
\f0  5:
\f1 \'a6\'a8\'b9\'ce
\f0 )',\
  `event_points` INT NULL DEFAULT NULL COMMENT '
\f1 \'a9\'54\'a9\'77\'c2\'49\'bc\'c6
\f0 (
\f1 \'b7\'7c\'ad\'fb
\f0 :
\f1 \'a6\'a8\'b9\'ce\'ab\'e1\'a4\'7e\'b5\'b9\'c2\'49\'bc\'c6
\f0 )',\
  PRIMARY KEY (`event_id`),\
  INDEX `FK_event_member_id_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_event_mountain_id_idx` (`mountain_id` ASC) VISIBLE,\
  CONSTRAINT `FK_event_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`),\
  CONSTRAINT `FK_event_mountain_id`\
    FOREIGN KEY (`mountain_id`)\
    REFERENCES `ShanShan`.`mountain` (`mountain_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci\
COMMENT = '
\f1 \'b4\'aa\'b9\'ce\'a4\'e5\'b3\'b9
\f0 ';\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`event_msg`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`event_msg` (\
  `event_msg_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'b4\'aa\'b9\'ce\'af\'64\'a8\'a5\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `event_id` VARCHAR(45) NOT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'bd\'73\'b8\'b9
\f0 ',\
  `msg_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'af\'64\'a8\'a5\'ae\'c9\'b6\'a1
\f0 ',\
  `msg_content` TEXT NOT NULL COMMENT '
\f1 \'af\'64\'a8\'a5\'a4\'ba\'ae\'65
\f0 ',\
  `msg_status` INT NOT NULL COMMENT '
\f1 \'af\'64\'a8\'a5\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a4\'57\'ac\'5b
\f0  1:
\f1 \'a4\'55\'ac\'5b
\f0 )',\
  PRIMARY KEY (`event_msg_id`),\
  INDEX `FK_event_msg_member_id_idx` (`member_id` ASC) VISIBLE)\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci\
COMMENT = '
\f1 \'b4\'aa\'b9\'ce\'af\'64\'a8\'a5\'aa\'a9
\f0 ';\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`event_msg`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`event_msg` (\
  `event_msg_id` INT NOT NULL AUTO_INCREMENT,\
  `member_id` INT NOT NULL,\
  `event_id` VARCHAR(45) NOT NULL,\
  `msg_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,\
  `msg_content` TEXT NOT NULL,\
  `msg_status` INT NOT NULL,\
  PRIMARY KEY (`event_msg_id`),\
  INDEX `FK_event_msg_member_id_idx` (`member_id` ASC) VISIBLE,\
  CONSTRAINT `FK_event_msg_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`event_report`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`event_report` (\
  `event_report_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'b4\'aa\'b9\'ce\'c0\'cb\'c1\'7c\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'c0\'cb\'c1\'7c\'a4\'48\'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `event_id` INT NOT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'bd\'73\'b8\'b9
\f0 ',\
  `report_reason` INT NOT NULL COMMENT '
\f1 \'c0\'cb\'c1\'7c\'ad\'ec\'a6\'5d
\f0 (0:
\f1 \'a6\'e2\'b1\'a1\'c4\'cc\'c2\'5a
\f0  1:
\f1 \'a4\'a3\'b9\'ea\'b8\'ea\'b0\'54
\f0  2:
\f1 \'a9\'55\'a7\'a3\'b0\'54\'ae\'a7
\f0  3:
\f1 \'a4\'b3\'ab\'eb\'a8\'a5\'bd\'d7
\f0 )',\
  `report_date` DATETIME NOT NULL COMMENT '
\f1 \'c0\'cb\'c1\'7c\'a4\'e9\'b4\'c1
\f0 ',\
  `case_done` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'b5\'b2\'ae\'d7\'ae\'c9\'b6\'a1
\f0 ',\
  `case_status` INT NOT NULL COMMENT '
\f1 \'ae\'d7\'a5\'f3\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'ab\'dd\'b3\'42\'b2\'7a
\f0  1:
\f1 \'a5\'bc\'b3\'42\'b2\'7a
\f0  2:
\f1 \'a4\'77\'a7\'b9\'a6\'a8
\f0 )',\
  PRIMARY KEY (`event_report_id`),\
  INDEX `FK_event_report_member_id_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_event_report_event_id_idx` (`event_id` ASC) VISIBLE,\
  CONSTRAINT `FK_event_report_event_id`\
    FOREIGN KEY (`event_id`)\
    REFERENCES `ShanShan`.`event` (`event_id`),\
  CONSTRAINT `FK_event_report_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci\
COMMENT = '
\f1 \'b4\'aa\'b9\'ce\'c0\'cb\'c1\'7c
\f0 ';\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`msg_report`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`msg_report` (\
  `msg_report_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'af\'64\'a8\'a5\'c0\'cb\'c1\'7c\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'c0\'cb\'c1\'7c\'a4\'48\'bd\'73\'b8\'b9
\f0 ',\
  `event_msg_id` INT NULL DEFAULT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'af\'64\'a8\'a5\'bd\'73\'b8\'b9
\f0 ',\
  `act_msg_id` INT NULL DEFAULT NULL COMMENT '
\f1 \'ac\'a1\'b0\'ca\'a4\'e9\'bb\'78\'af\'64\'a8\'a5\'bd\'73\'b8\'b9
\f0 ',\
  `report_reason` INT NOT NULL COMMENT '
\f1 \'c0\'cb\'c1\'7c\'ad\'ec\'a6\'5d
\f0 (0:
\f1 \'a6\'e2\'b1\'a1\'c4\'cc\'c2\'5a
\f0  1:
\f1 \'a4\'a3\'b9\'ea\'b8\'ea\'b0\'54
\f0  2:
\f1 \'a9\'55\'a7\'a3\'b0\'54\'ae\'a7
\f0  3:
\f1 \'a4\'b3\'ab\'eb\'a8\'a5\'bd\'d7
\f0 )',\
  `report_date` DATETIME NOT NULL COMMENT '
\f1 \'c0\'cb\'c1\'7c\'a4\'e9\'b4\'c1
\f0 ',\
  `case_done` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'b5\'b2\'ae\'d7\'ae\'c9\'b6\'a1
\f0 ',\
  `case_status` INT NOT NULL COMMENT '
\f1 \'ae\'d7\'a5\'f3\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'ab\'dd\'b3\'42\'b2\'7a
\f0  1:
\f1 \'a5\'bc\'b3\'42\'b2\'7a
\f0  2:
\f1 \'a4\'77\'a7\'b9\'a6\'a8
\f0 )',\
  PRIMARY KEY (`msg_report_id`),\
  INDEX `FK_msg_report_member_id_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_msg_report_event_msg_id_idx` (`event_msg_id` ASC) VISIBLE,\
  INDEX `FK_msg_report_act_msg_id_idx` (`act_msg_id` ASC) VISIBLE,\
  CONSTRAINT `FK_msg_report_act_msg_id`\
    FOREIGN KEY (`act_msg_id`)\
    REFERENCES `ShanShan`.`act_log_msg` (`act_msg_id`),\
  CONSTRAINT `FK_msg_report_event_msg_id`\
    FOREIGN KEY (`event_msg_id`)\
    REFERENCES `ShanShan`.`event_msg` (`event_msg_id`),\
  CONSTRAINT `FK_msg_report_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci\
COMMENT = '
\f1 \'af\'64\'a8\'a5\'c0\'cb\'c1\'7c
\f0 ';\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`order`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`order` (\
  `order_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'ad\'71\'b3\'e6\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `order_created_date` DATE NOT NULL DEFAULT (curdate()) COMMENT '
\f1 \'ad\'71\'b3\'e6\'b3\'d0\'a5\'df\'a4\'e9
\f0 ',\
  `order_member_address` VARCHAR(50) NOT NULL COMMENT '
\f1 \'ad\'71\'b3\'e6\'b0\'74\'b0\'65\'a6\'61\'a7\'7d
\f0 ',\
  `order_member_name` VARCHAR(20) NOT NULL COMMENT '
\f1 \'ad\'71\'b3\'e6\'a6\'ac\'b3\'66\'a4\'48
\f0 ',\
  `order_member_phone` VARCHAR(20) NOT NULL COMMENT '
\f1 \'ad\'71\'b3\'e6\'a6\'ac\'b3\'66\'a4\'48\'b9\'71\'b8\'dc
\f0 ',\
  `order_status` TINYINT(1) NOT NULL COMMENT '
\f1 \'ad\'71\'b3\'e6\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a8\'fa\'ae\'f8
\f0 1:
\f1 \'b0\'74\'b0\'65\'a4\'a4
\f0 2:
\f1 \'a4\'77\'b0\'74\'b0\'65
\f0 3:
\f1 \'a4\'77\'b5\'b2\'b3\'e6
\f0 4:
\f1 \'b0\'68\'b3\'66
\f0 )',\
  `point_used` INT NULL DEFAULT NULL COMMENT '
\f1 \'a8\'cf\'a5\'ce\'c2\'49\'bc\'c6
\f0 (
\f1 \'b3\'cc\'a6\'68\'c1\'60\'aa\'f7\'c3\'42
\f0 5
\f1 \'a2\'48
\f0 )',\
  `order_sum_before` INT NOT NULL COMMENT '
\f1 \'a7\'e9\'a6\'a9\'ab\'65\'c1\'60\'aa\'f7\'c3\'42
\f0 ',\
  `order_sum_after` INT NOT NULL COMMENT '
\f1 \'a7\'e9\'a6\'a9\'ab\'e1\'c1\'60\'aa\'f7\'c3\'42
\f0 ',\
  `order_shipped_date` DATE NULL DEFAULT (curdate()) COMMENT '
\f1 \'ad\'71\'b3\'e6\'b0\'74\'b0\'65\'a4\'e9
\f0 ',\
  `ship_number` VARCHAR(25) NULL DEFAULT NULL COMMENT '
\f1 \'b3\'66\'b9\'42\'b3\'e6\'b8\'b9
\f0 ',\
  PRIMARY KEY (`order_id`),\
  INDEX `FK_single_order_member_id_idx` (`member_id` ASC) VISIBLE,\
  CONSTRAINT `FK_single_order_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`product`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`product` (\
  `product_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'b0\'d3\'ab\'7e\'bd\'73\'b8\'b9
\f0 ',\
  `company_id` INT NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61
\f0 ID',\
  `product_type` INT NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'c3\'fe\'a7\'4f
\f0 (1:
\f1 \'a6\'e7\'b5\'db
\f0  2:
\f1 \'be\'63\'a4\'6c
\f0 3:
\f1 \'ad\'49\'a5\'5d\'ac\'db\'c3\'f6
\f0 4:
\f1 \'af\'d3\'a7\'f7
\f0 5:
\f1 \'b7\'d3\'a9\'fa
\f0 6:
\f1 \'a4\'75\'a8\'e3\'a4\'4d\'a9\'f2
\f0 7:
\f1 \'aa\'a4\'a8\'e3
\f0 8:
\f1 \'ae\'61\'a8\'e3
\f0 9:
\f1 \'b1\'62\'c1\'4f\'a4\'d1\'b9\'f5\'c0\'e7\'ac\'57
\f0 10:
\f1 \'b9\'ec\'a8\'e3\'a6\'61\'b9\'d4
\f0 )',\
  `status` INT NULL DEFAULT '0' COMMENT '
\f1 \'a4\'57\'ac\'5b\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a4\'55\'ac\'5b
\f0 1:
\f1 \'a4\'57\'ac\'5b
\f0 )',\
  `product_price` INT NULL DEFAULT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'b3\'e6\'bb\'f9
\f0 ',\
  `product_intro` VARCHAR(200) NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'b1\'d4\'ad\'7a
\f0 ',\
  PRIMARY KEY (`product_id`),\
  INDEX `FK_product_company_id_idx` (`company_id` ASC) VISIBLE,\
  CONSTRAINT `FK_product_company_id`\
    FOREIGN KEY (`company_id`)\
    REFERENCES `ShanShan`.`company` (`company_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`product_description`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`product_description` (\
  `product_des_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'b0\'d3\'ab\'7e\'a9\'fa\'b2\'d3\'bd\'73\'b8\'b9
\f0 ',\
  `product_id` INT NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'bd\'73\'b8\'b9
\f0 ',\
  `product_size` INT NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'a4\'d8\'a4\'6f
\f0 (0:F 1:S 2:M 3:L 4:XL)',\
  `product_color` VARCHAR(15) NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'c3\'43\'a6\'e2
\f0 ',\
  `product_stock` INT NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'ae\'77\'a6\'73\'b6\'71
\f0 ',\
  `status` INT NULL DEFAULT '0' COMMENT '
\f1 \'a4\'57\'ac\'5b\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a4\'55\'ac\'5b
\f0 1:
\f1 \'a4\'57\'ac\'5b
\f0 )',\
  PRIMARY KEY (`product_des_id`),\
  INDEX `FK_product_description_product_id_idx` (`product_id` ASC) VISIBLE,\
  CONSTRAINT `FK_product_description_product_id`\
    FOREIGN KEY (`product_id`)\
    REFERENCES `ShanShan`.`product` (`product_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`order_description`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`order_description` (\
  `order_des_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'ad\'71\'b3\'e6\'a9\'fa\'b2\'d3\'bd\'73\'b8\'b9
\f0 ',\
  `product_des_id` INT NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'a9\'fa\'b2\'d3\'bd\'73\'b8\'b9
\f0 ',\
  `order_id` INT NOT NULL COMMENT '
\f1 \'ad\'71\'b3\'e6\'bd\'73\'b8\'b9
\f0 ',\
  `product_quantity` INT NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'bc\'c6\'b6\'71
\f0 ',\
  PRIMARY KEY (`order_des_id`),\
  INDEX `FK_order_description_product_des_id_idx` (`product_des_id` ASC) VISIBLE,\
  INDEX `FK_order_description_order_id` (`order_id` ASC) VISIBLE,\
  CONSTRAINT `FK_order_description_order_id`\
    FOREIGN KEY (`order_id`)\
    REFERENCES `ShanShan`.`order` (`order_id`)\
    ON DELETE RESTRICT\
    ON UPDATE RESTRICT,\
  CONSTRAINT `FK_order_description_product_des_id`\
    FOREIGN KEY (`product_des_id`)\
    REFERENCES `ShanShan`.`product_description` (`product_des_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb3;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`participant`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`participant` (\
  `part_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'b0\'d1\'b9\'ce\'bd\'73\'b8\'b9
\f0 ',\
  `event_id` INT NOT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'a4\'e5\'b3\'b9\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'b0\'d1\'bb\'50\'a4\'48
\f0 ',\
  `experence` TINYINT(1) NOT NULL COMMENT '
\f1 \'ac\'4f\'a7\'5f\'a6\'b3\'b8\'67\'c5\'e7
\f0 ',\
  `phone_number` VARCHAR(25) NOT NULL COMMENT '
\f1 \'b9\'71\'b8\'dc\'b8\'b9\'bd\'58
\f0 ',\
  `participation` TINYINT(1) NOT NULL COMMENT '
\f1 \'b0\'d1\'b9\'ce\'bb\'50\'a7\'5f
\f0 ',\
  `join_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'b0\'d1\'b9\'ce\'ae\'c9\'b6\'a1
\f0 ',\
  PRIMARY KEY (`part_id`),\
  INDEX `FK_participant_event_id_idx` (`event_id` ASC) VISIBLE,\
  INDEX `FK_participant_member_id_idx` (`member_id` ASC) VISIBLE,\
  CONSTRAINT `FK_participant_event_id`\
    FOREIGN KEY (`event_id`)\
    REFERENCES `ShanShan`.`event` (`event_id`),\
  CONSTRAINT `FK_participant_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci\
COMMENT = '
\f1 \'b0\'d1\'b9\'ce\'aa\'cc\'b8\'ea\'b0\'54
\f0 ';\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`points_used_act`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`points_used_act` (\
  `points_used_act_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'ac\'a1\'b0\'ca\'a4\'e9\'bb\'78\'a5\'b4\'bd\'e0\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'a5\'b4\'bd\'e0\'aa\'cc\'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `article_id` INT NOT NULL COMMENT '
\f1 \'ac\'a1\'b0\'ca\'a4\'e9\'bb\'78\'bd\'73\'b8\'b9
\f0 ',\
  `points_used` INT NOT NULL COMMENT '
\f1 \'a8\'cf\'a5\'ce\'c2\'49\'bc\'c6
\f0 ',\
  `points_used_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '
\f1 \'a8\'cf\'a5\'ce\'c2\'49\'bc\'c6\'ae\'c9\'b6\'a1
\f0 ',\
  PRIMARY KEY (`points_used_act_id`),\
  INDEX `FK_member_member_id_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_article_article_id_idx` (`article_id` ASC) VISIBLE,\
  CONSTRAINT `FK_article_article_id`\
    FOREIGN KEY (`article_id`)\
    REFERENCES `ShanShan`.`article` (`article_id`),\
  CONSTRAINT `FK_member_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb3;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`product_img`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`product_img` (\
  `product_img_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'b7\'d3\'a4\'f9\'bd\'73\'b8\'b9
\f0 ',\
  `product_des_id` INT NOT NULL COMMENT '
\f1 \'b0\'d3\'ab\'7e\'a9\'fa\'b2\'d3\'bd\'73\'b8\'b9
\f0 ',\
  `product_img` BLOB NULL DEFAULT NULL COMMENT '
\f1 \'b7\'d3\'a4\'f9
\f0 ',\
  PRIMARY KEY (`product_img_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`staff_info`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`staff_info` (\
  `staff_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'ad\'fb\'a4\'75\'bd\'73\'b8\'b9
\f0 ',\
  `company_id` INT NOT NULL COMMENT '
\f1 \'a9\'b1\'ae\'61\'bd\'73\'b8\'b9
\f0 ',\
  `staff_email` VARCHAR(20) NOT NULL COMMENT '
\f1 \'ad\'fb\'a4\'75\'b1\'62\'b8\'b9
\f0 ',\
  `staff_password` VARCHAR(30) NOT NULL COMMENT '
\f1 \'ad\'fb\'a4\'75\'b1\'4b\'bd\'58
\f0 ',\
  `staff_name` VARCHAR(10) NOT NULL COMMENT '
\f1 \'ad\'fb\'a4\'75\'a6\'57\'ba\'d9
\f0 ',\
  `staff_status` INT NOT NULL COMMENT '
\f1 \'ad\'fb\'a4\'75\'aa\'ac\'ba\'41
\f0 ',\
  PRIMARY KEY (`staff_id`),\
  INDEX `FK_staff_info_company_id_idx` (`company_id` ASC) VISIBLE,\
  CONSTRAINT `FK_staff_info_company_id`\
    FOREIGN KEY (`company_id`)\
    REFERENCES `ShanShan`.`company` (`company_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8mb4\
COLLATE = utf8mb4_0900_ai_ci\
COMMENT = '
\f1 \'ad\'fb\'a4\'75\'b8\'ea\'ae\'c6
\f0 ';\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`wishlist_article`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`wishlist_article` (\
  `wishlist_article_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a6\'ac\'c2\'c3\'ac\'a1\'b0\'ca\'a4\'e9\'bb\'78\'bd\'73\'b8\'b9
\f0 ',\
  `article_id` INT NOT NULL COMMENT '
\f1 \'a4\'e5\'b3\'b9\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `favorite_status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '
\f1 \'a6\'ac\'c2\'c3\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a6\'ac\'c2\'c3
\f0  1:
\f1 \'a8\'fa\'ae\'f8\'a6\'ac\'c2\'c3
\f0 )',\
  PRIMARY KEY (`wishlist_article_id`),\
  INDEX `FK_wishlist_article_member_id_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_wishlist_article_aritcle_id_idx` (`article_id` ASC) VISIBLE,\
  CONSTRAINT `FK_wishlist_article_aritcle_id`\
    FOREIGN KEY (`article_id`)\
    REFERENCES `ShanShan`.`article` (`article_id`),\
  CONSTRAINT `FK_wishlist_article_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8\
COLLATE = utf8_bin;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`wishlist_event`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`wishlist_event` (\
  `wishlist_event_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a6\'ac\'c2\'c3\'b4\'aa\'b9\'ce\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `event_id` INT NOT NULL COMMENT '
\f1 \'b4\'aa\'b9\'ce\'bd\'73\'b8\'b9
\f0 ',\
  `favorite_status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '
\f1 \'a6\'ac\'c2\'c3\'aa\'ac\'ba\'41
\f0 (0:
\f1 \'a6\'ac\'c2\'c3
\f0  1:
\f1 \'a8\'fa\'ae\'f8\'a6\'ac\'c2\'c3
\f0 )',\
  PRIMARY KEY (`wishlist_event_id`),\
  INDEX `FK_wishlist_event_member_id_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_wishlist_event_event_id_idx` (`event_id` ASC) VISIBLE,\
  CONSTRAINT `FK_wishlist_event_event_id`\
    FOREIGN KEY (`event_id`)\
    REFERENCES `ShanShan`.`event` (`event_id`),\
  CONSTRAINT `FK_wishlist_event_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8\
COLLATE = utf8_bin;\
\
\
-- -----------------------------------------------------\
-- Table `ShanShan`.`wishlist_product`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `ShanShan`.`wishlist_product` (\
  `wishlist_product_id` INT NOT NULL AUTO_INCREMENT COMMENT '
\f1 \'a6\'ac\'c2\'c3\'b2\'a3\'ab\'7e\'bd\'73\'b8\'b9
\f0 ',\
  `member_id` INT NOT NULL COMMENT '
\f1 \'b7\'7c\'ad\'fb\'bd\'73\'b8\'b9
\f0 ',\
  `product_id` INT NOT NULL COMMENT '
\f1 \'b2\'a3\'ab\'7e\'bd\'73\'b8\'b9
\f0 ',\
  `favorite_status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '
\f1 \'a6\'ac\'c2\'c3\'aa\'ac\'ba\'41
\f0  (0:
\f1 \'a6\'ac\'c2\'c3
\f0  1:
\f1 \'a8\'fa\'ae\'f8\'a6\'ac\'c2\'c3
\f0 )',\
  PRIMARY KEY (`wishlist_product_id`),\
  INDEX `FK_wishlist_product_idx` (`member_id` ASC) VISIBLE,\
  INDEX `FK_wishlist_product_product_id_idx` (`product_id` ASC) VISIBLE,\
  CONSTRAINT `FK_wishlist_product_member_id`\
    FOREIGN KEY (`member_id`)\
    REFERENCES `ShanShan`.`member` (`member_id`),\
  CONSTRAINT `FK_wishlist_product_product_id`\
    FOREIGN KEY (`product_id`)\
    REFERENCES `ShanShan`.`product` (`product_id`))\
ENGINE = InnoDB\
DEFAULT CHARACTER SET = utf8\
COLLATE = utf8_bin;\
\
\
SET SQL_MODE=@OLD_SQL_MODE;\
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;\
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;\
}