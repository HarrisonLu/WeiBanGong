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

 Date: 04/27/2014 21:11:00 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_comment_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_customer`;
CREATE TABLE `t_comment_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `details` varchar(600) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `t_comment_ibfk_1` (`user_id`),
  KEY `t_comment_ibfk_2` (`customer_id`),
  CONSTRAINT `t_comment_customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_comment_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_project`;
CREATE TABLE `t_comment_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `details` varchar(600) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `t_comment_project_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_comment_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_task`;
CREATE TABLE `t_comment_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `details` varchar(600) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `t_comment_task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `chinese_name` varchar(30) NOT NULL,
  `chinese_name_pinyin` varchar(30) NOT NULL,
  `english_name` varchar(30) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `telephone_num` varchar(20) DEFAULT NULL,
  `mobile_phone_num` varchar(30) DEFAULT NULL,
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
  CONSTRAINT `t_customer_ibfk_1` FOREIGN KEY (`created_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_customer_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_4` FOREIGN KEY (`discuss_stage_id`) REFERENCES `t_discuss_stage` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_5` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creater_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_module_ibfk_1` (`project_id`) USING BTREE,
  KEY `t_module_ibfk_2` (`creater_id`) USING BTREE,
  CONSTRAINT `t_module_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_module_ibfk_2` FOREIGN KEY (`creater_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_module_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_module_customer`;
CREATE TABLE `t_module_customer` (
  `module_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  KEY `module_id` (`module_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `t_module_customer_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`),
  CONSTRAINT `t_module_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_module_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_module_manager`;
CREATE TABLE `t_module_manager` (
  `module_id` int(10) NOT NULL,
  `manager_id` int(10) NOT NULL,
  KEY `module_id` (`module_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `t_module_manager_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`),
  CONSTRAINT `t_module_manager_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_module_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_module_member`;
CREATE TABLE `t_module_member` (
  `module_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  KEY `module_id` (`module_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `t_module_member_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`),
  CONSTRAINT `t_module_member_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_priority`
-- ----------------------------
DROP TABLE IF EXISTS `t_priority`;
CREATE TABLE `t_priority` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stage_id` int(10) NOT NULL,
  `info` varchar(600) DEFAULT NULL,
  `creater_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_project_ibfk_1` (`stage_id`) USING BTREE,
  KEY `t_project_ibfk_2` (`creater_id`) USING BTREE,
  CONSTRAINT `t_project_ibfk_1` FOREIGN KEY (`stage_id`) REFERENCES `t_stage_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_project_ibfk_2` FOREIGN KEY (`creater_id`) REFERENCES `t_user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_project_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_customer`;
CREATE TABLE `t_project_customer` (
  `project_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  KEY `project_id` (`project_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `t_project_customer_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`),
  CONSTRAINT `t_project_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_project_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_manager`;
CREATE TABLE `t_project_manager` (
  `project_id` int(10) NOT NULL,
  `manager_id` int(10) NOT NULL,
  KEY `project_id` (`project_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `t_project_manager_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`),
  CONSTRAINT `t_project_manager_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_project_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_member`;
CREATE TABLE `t_project_member` (
  `project_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  KEY `project_id` (`project_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `t_project_member_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`),
  CONSTRAINT `t_project_member_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_stage_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_stage_project`;
CREATE TABLE `t_stage_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_sub_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_sub_task`;
CREATE TABLE `t_sub_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `task_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_underway` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `t_sub_task_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `module_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deadline` timestamp NULL DEFAULT NULL,
  `creater_id` int(10) NOT NULL,
  `priority_id` int(10) NOT NULL,
  `stage_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_task_ibfk_1` (`module_id`) USING BTREE,
  KEY `t_task_ibfk_2` (`creater_id`) USING BTREE,
  KEY `t_task_ibfk_3` (`priority_id`) USING BTREE,
  KEY `t_task_ibfk_4` (`stage_id`) USING BTREE,
  CONSTRAINT `t_task_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_task_ibfk_2` FOREIGN KEY (`creater_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_task_ibfk_3` FOREIGN KEY (`priority_id`) REFERENCES `t_priority` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_task_ibfk_4` FOREIGN KEY (`stage_id`) REFERENCES `t_stage_project` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_task_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_customer`;
CREATE TABLE `t_task_customer` (
  `task_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `t_task_customer_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`),
  CONSTRAINT `t_task_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_task_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_manager`;
CREATE TABLE `t_task_manager` (
  `task_id` int(10) NOT NULL,
  `manager_id` int(10) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `t_task_manager_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`),
  CONSTRAINT `t_task_manager_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_task_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_member`;
CREATE TABLE `t_task_member` (
  `task_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `t_task_member_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`),
  CONSTRAINT `t_task_member_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

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
