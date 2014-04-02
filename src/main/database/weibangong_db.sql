/*
 Navicat MySQL Data Transfer

 Source Server         : lion
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost
 Source Database       : weibangong_db

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : utf-8

 Date: 04/02/2014 12:51:35 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `details` varchar(600) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `t_comment_ibfk_1` (`user_id`),
  KEY `t_comment_ibfk_2` (`customer_id`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `chinese_name` varchar(30) NOT NULL,
  `chinese_name_pinyin` varchar(30) NOT NULL,
  `english_name` varchar(30) DEFAULT NULL,
  `gender` varchar(2) NOT NULL,
  `phone_num` varchar(20) DEFAULT NULL,
  `wechat_num` varchar(30) DEFAULT NULL,
  `qq_num` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `office_address` varchar(50) DEFAULT NULL,
  `house_address` varchar(50) DEFAULT NULL,
  `customer_value` varchar(300) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `created_user_id` int(10) NOT NULL,
  `project_id` int(10) DEFAULT NULL,
  `module_id` int(10) DEFAULT NULL,
  `task_id` int(10) DEFAULT NULL,
  `discuss_stage_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_user_id` (`created_user_id`),
  KEY `t_customer_ibfk_4` (`discuss_stage_id`),
  KEY `t_customer_ibfk_2` (`project_id`),
  KEY `t_customer_ibfk_3` (`task_id`),
  KEY `t_customer_ibfk_5` (`module_id`) USING BTREE,
  CONSTRAINT `t_customer_ibfk_5` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_1` FOREIGN KEY (`created_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_customer_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_4` FOREIGN KEY (`discuss_stage_id`) REFERENCES `t_discuss_stage` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_customer_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_user`;
CREATE TABLE `t_customer_user` (
  `customer_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_customer_user_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`),
  CONSTRAINT `t_customer_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_discuss_stage`
-- ----------------------------
DROP TABLE IF EXISTS `t_discuss_stage`;
CREATE TABLE `t_discuss_stage` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `department_id` int(10) NOT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `t_group_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_module`
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `project_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `t_module_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `module_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`) USING BTREE,
  CONSTRAINT `t_task_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `password` varchar(30) NOT NULL,
  `chinese_name` varchar(30) NOT NULL,
  `chinese_name_pinyin` varchar(30) NOT NULL,
  `english_name` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `position_level` varchar(30) DEFAULT NULL,
  `wechat_num` varchar(30) NOT NULL,
  `qq_num` varchar(20) DEFAULT NULL,
  `telephone_num` varchar(20) DEFAULT NULL,
  `mobile_phone_num` varchar(20) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user_collectedcontacts`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_collectedcontacts`;
CREATE TABLE `t_user_collectedcontacts` (
  `user_id` int(10) NOT NULL,
  `collectedcontacts_id` int(10) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `collectedcontacts_id` (`collectedcontacts_id`),
  CONSTRAINT `t_user_collectedcontacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_user_collectedcontacts_ibfk_2` FOREIGN KEY (`collectedcontacts_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_department`;
CREATE TABLE `t_user_department` (
  `user_id` int(10) NOT NULL,
  `department_id` int(10) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `t_user_department_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_user_department_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_group`;
CREATE TABLE `t_user_group` (
  `user_id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `t_user_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_user_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `t_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
