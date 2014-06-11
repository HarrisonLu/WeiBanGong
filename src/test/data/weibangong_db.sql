/*
 Navicat MySQL Data Transfer

 Source Server         : lion
 Source Server Version : 50617
 Source Host           : localhost
 Source Database       : weibangong_db

 Target Server Version : 50617
 File Encoding         : utf-8

 Date: 06/12/2014 00:53:59 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_num` varchar(30) DEFAULT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_admin_ibfk_1` (`company_id`) USING BTREE,
  CONSTRAINT `t_admin_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_admin`
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES ('1', 'asdf_1234', 'GLY@yunnex.com', '13999999999', '1');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_comment_ibfk_1` (`user_id`),
  KEY `t_comment_ibfk_2` (`customer_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_comment_customer_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_comment_customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_comment_customer`
-- ----------------------------
BEGIN;
INSERT INTO `t_comment_customer` VALUES ('1', '卢煌 说 卢煌是客户一的创建用户', '1', '1', '2014-04-15 14:42:06', '1'), ('2', '奋进 说 卢煌是客户二的创建用户', '2', '2', '2014-03-09 19:44:38', '1'), ('3', '烧猪 说 客户一是卢煌的大鱼', '3', '1', '2014-03-09 19:47:47', '1');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `project_id` (`project_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_comment_project_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_comment_project_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_comment_project`
-- ----------------------------
BEGIN;
INSERT INTO `t_comment_project` VALUES ('1', '卢煌的616项目不行', '2', '1', '2014-04-21 13:20:43', '1'), ('2', '奋进的618项目牛逼啊', '1', '2', '2014-04-21 13:21:02', '1'), ('3', '卢煌：616项目牛逼', '1', '1', '2014-04-22 12:44:48', '1'), ('4', '奋进：618项目不错', '2', '2', '2014-04-22 12:45:12', '1'), ('6', 'just for test.', '3', '1', '2014-04-23 10:52:44', '1');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_comment_task_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_comment_task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_comment_task`
-- ----------------------------
BEGIN;
INSERT INTO `t_comment_task` VALUES ('1', '卢煌 评论了 任务一', '1', '1', '2014-04-21 09:32:18', '1'), ('2', '奋进 评论了 任务二', '2', '2', '2014-04-21 09:34:03', '1'), ('3', '卢煌 评论了 任务三', '1', '3', '2014-04-21 09:37:34', '1'), ('4', '卢煌 再次评论了 任务一', '1', '1', '2014-04-21 13:21:33', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `user_account_postfix` varchar(30) DEFAULT NULL,
  `is_set_user_account_postfix` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_company`
-- ----------------------------
BEGIN;
INSERT INTO `t_company` VALUES ('1', '云移有限公司', 'yunnex.com', '0');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_customer_ibfk_4` (`discuss_stage_id`),
  KEY `t_customer_ibfk_2` (`project_id`),
  KEY `t_customer_ibfk_3` (`task_id`),
  KEY `t_customer_ibfk_5` (`module_id`) USING BTREE,
  KEY `t_customer_ibfk_1` (`created_user_id`) USING BTREE,
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_customer_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_customer_ibfk_1` FOREIGN KEY (`created_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_customer_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_4` FOREIGN KEY (`discuss_stage_id`) REFERENCES `t_discuss_stage` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_5` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_customer`
-- ----------------------------
BEGIN;
INSERT INTO `t_customer` VALUES ('1', '客户一', 'kehuyi', 'one', '男', '111', '131', 'wc1', '11', '11@qq.com', '1公司地址', '1街1号', '大鱼', '2014-01-01', '唱歌', '1', '1', '1', null, '1', '1'), ('2', '客户二', 'kehuer', 'two', '女', '222', '132', 'wc2', '22', '22@qq.com', '2公司地址', '2街2号', '大大鱼', '2014-02-02', '跳舞', '1', '1', '2', '2', '2', '1'), ('3', '客户三', 'kehusan', 'three', '男', '333', '133', 'wc3', '33', '33@qq.com', '3公司地址', '33街33号', '小鱼', null, null, '1', '1', '3', '3', '3', '1'), ('4', '客户四', 'kehusi', 'four', '女', '444', '134', 'wc4', '44', '44@qq.com', '4公司地址', '4街4号', '特大鱼', null, null, '1', '1', '4', '4', '4', '1'), ('5', '客户五', 'kehuwu', 'five', '男', '555', '135', 'wc5', '55', '55@qq.com', '5公司地址', '5街5号', '小鱼', '2014-04-16', null, '2', '2', '5', null, '1', '1'), ('6', '客户六', 'kehuliu', 'six', '女', '666', '136', 'wc6', '66', '66@qq.com', '6公司地址', '6街6号', '小小鱼', null, null, '2', '2', '6', '6', '2', '1'), ('7', '客户七', 'kehuqi', 'seven', '男', '777', '137', 'wc7', '77', '77@qq.com', '7公司地址', '7街7号', '小小小鱼', null, null, '2', '2', '7', '7', '3', '1'), ('8', '客户八', 'kehuba', 'eight', '女', '888', '138', 'wc8', '88', '88@qq.com', '8公司地址', '8街8号', '特小鱼', null, null, '2', '2', '8', '8', '4', '1'), ('9', '客户九', 'kehujiu', 'nine', '男', null, null, null, null, null, null, null, null, null, null, '2', null, null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_customer_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_user`;
CREATE TABLE `t_customer_user` (
  `customer_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_customer_user_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_customer_user_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`),
  CONSTRAINT `t_customer_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_customer_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_customer_user` VALUES ('3', '2', '1'), ('4', '2', '1'), ('7', '1', '1'), ('8', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_department_ibfk` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_department`
-- ----------------------------
BEGIN;
INSERT INTO `t_department` VALUES ('1', '微办公', '0000-00-00 00:00:00', '1'), ('2', '微招聘', '0000-00-00 00:00:00', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_discuss_stage`
-- ----------------------------
DROP TABLE IF EXISTS `t_discuss_stage`;
CREATE TABLE `t_discuss_stage` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_discuss_stage_ibfk` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_discuss_stage`
-- ----------------------------
BEGIN;
INSERT INTO `t_discuss_stage` VALUES ('1', '未洽谈', '1'), ('2', '洽谈中', '1'), ('3', '合作期', '1'), ('4', '其他', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `department_id` int(10) NOT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_group_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_group_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_group`
-- ----------------------------
BEGIN;
INSERT INTO `t_group` VALUES ('1', '技术部', '1', '2014-03-07 02:16:55', '1');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_module_ibfk_1` (`project_id`) USING BTREE,
  KEY `t_module_ibfk_2` (`creater_id`) USING BTREE,
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_module_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_module_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_module_ibfk_2` FOREIGN KEY (`creater_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_module`
-- ----------------------------
BEGIN;
INSERT INTO `t_module` VALUES ('1', '1号床模块', '1', '2014-03-06 01:38:59', '2014-06-05 15:48:14', '1', '1'), ('2', '2号床模块', '1', '2014-03-06 01:39:54', '2014-06-04 14:30:51', '1', '1'), ('3', '3号床模块', '1', '2014-03-06 01:40:15', '2014-06-04 14:30:55', '1', '1'), ('4', '4号床模块', '1', '2014-03-07 17:23:38', '2014-06-04 14:30:57', '1', '1'), ('5', '1号床模块', '2', '2014-03-07 17:23:49', '2014-06-04 14:30:58', '2', '1'), ('6', '2号床模块', '2', '2014-03-07 17:23:57', '2014-06-04 14:31:00', '2', '1'), ('7', '3号床模块', '2', '2014-03-07 17:24:10', '2014-06-04 14:31:03', '2', '1'), ('8', '4号床模块', '2', '2014-03-07 17:24:20', '2014-06-04 14:31:05', '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_module_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_module_customer`;
CREATE TABLE `t_module_customer` (
  `module_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `module_id` (`module_id`),
  KEY `customer_id` (`customer_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_module_customer_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_module_customer_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`),
  CONSTRAINT `t_module_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_module_customer`
-- ----------------------------
BEGIN;
INSERT INTO `t_module_customer` VALUES ('1', '3', '1'), ('1', '4', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_module_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_module_manager`;
CREATE TABLE `t_module_manager` (
  `module_id` int(10) NOT NULL,
  `manager_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `module_id` (`module_id`),
  KEY `manager_id` (`manager_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_module_manager_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_module_manager_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`),
  CONSTRAINT `t_module_manager_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_module_manager`
-- ----------------------------
BEGIN;
INSERT INTO `t_module_manager` VALUES ('1', '4', '1'), ('2', '4', '1'), ('3', '5', '1'), ('4', '5', '1'), ('5', '6', '1'), ('6', '6', '1'), ('7', '7', '1'), ('8', '7', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_module_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_module_member`;
CREATE TABLE `t_module_member` (
  `module_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `module_id` (`module_id`),
  KEY `member_id` (`member_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_module_member_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_module_member_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`),
  CONSTRAINT `t_module_member_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_module_member`
-- ----------------------------
BEGIN;
INSERT INTO `t_module_member` VALUES ('1', '14', '1'), ('1', '15', '1');
COMMIT;

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
--  Records of `t_priority`
-- ----------------------------
BEGIN;
INSERT INTO `t_priority` VALUES ('1', '高'), ('2', '中'), ('3', '低');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_project_ibfk_1` (`stage_id`) USING BTREE,
  KEY `t_project_ibfk_2` (`creater_id`) USING BTREE,
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_project_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_project_ibfk_1` FOREIGN KEY (`stage_id`) REFERENCES `t_stage_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_project_ibfk_2` FOREIGN KEY (`creater_id`) REFERENCES `t_user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_project`
-- ----------------------------
BEGIN;
INSERT INTO `t_project` VALUES ('1', '至善园6号616项目', '2014-03-06 01:38:28', '2014-06-05 15:48:14', '1', '该项目由卢煌创建', '1', '1'), ('2', '至善园6号618项目', '2014-03-27 01:39:31', '2014-06-04 14:46:14', '1', '该项目由卢煌创建', '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_project_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_customer`;
CREATE TABLE `t_project_customer` (
  `project_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `project_id` (`project_id`),
  KEY `customer_id` (`customer_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_project_customer_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_project_customer_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`),
  CONSTRAINT `t_project_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_project_customer`
-- ----------------------------
BEGIN;
INSERT INTO `t_project_customer` VALUES ('1', '1', '1'), ('1', '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_project_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_manager`;
CREATE TABLE `t_project_manager` (
  `project_id` int(10) NOT NULL,
  `manager_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `project_id` (`project_id`),
  KEY `manager_id` (`manager_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_project_manager_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_project_manager_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`),
  CONSTRAINT `t_project_manager_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_project_manager`
-- ----------------------------
BEGIN;
INSERT INTO `t_project_manager` VALUES ('1', '3', '1'), ('2', '3', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_project_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_member`;
CREATE TABLE `t_project_member` (
  `project_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `project_id` (`project_id`),
  KEY `member_id` (`member_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_project_member_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_project_member_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`),
  CONSTRAINT `t_project_member_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_project_member`
-- ----------------------------
BEGIN;
INSERT INTO `t_project_member` VALUES ('1', '12', '1'), ('2', '13', '1');
COMMIT;

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
--  Records of `t_stage_project`
-- ----------------------------
BEGIN;
INSERT INTO `t_stage_project` VALUES ('1', '未开始'), ('2', '进行中'), ('3', '已完成'), ('4', '已关闭');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_sub_task_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_sub_task_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_sub_task`
-- ----------------------------
BEGIN;
INSERT INTO `t_sub_task` VALUES ('1', '叠被子任务 拆分任务一', '1', '2014-04-21 13:19:11', '1', '1'), ('2', '叠被子任务 拆分任务二', '2', '2014-04-21 13:19:39', '0', '1');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_task_ibfk_1` (`module_id`) USING BTREE,
  KEY `t_task_ibfk_2` (`creater_id`) USING BTREE,
  KEY `t_task_ibfk_3` (`priority_id`) USING BTREE,
  KEY `t_task_ibfk_4` (`stage_id`) USING BTREE,
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_task_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_task_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `t_module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_task_ibfk_2` FOREIGN KEY (`creater_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_task_ibfk_3` FOREIGN KEY (`priority_id`) REFERENCES `t_priority` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_task_ibfk_4` FOREIGN KEY (`stage_id`) REFERENCES `t_stage_project` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_task`
-- ----------------------------
BEGIN;
INSERT INTO `t_task` VALUES ('1', '1号床 叠被子任务', '1', '2014-03-06 01:38:59', '2014-06-05 15:48:15', null, '1', '1', '1', '1'), ('2', '2号床 装蚊帐任务', '2', '2014-03-06 01:39:54', '2014-06-04 14:52:59', null, '1', '2', '2', '1'), ('3', '3号床 睡觉任务', '3', '2014-03-06 01:40:15', '2014-06-04 14:53:01', null, '1', '3', '3', '1'), ('4', '4号床 看电影任务', '4', '2014-03-07 17:23:38', '2014-06-04 14:53:02', null, '1', '3', '4', '1'), ('5', '1号床 倒垃圾任务', '5', '2014-03-07 17:23:49', '2014-06-04 14:53:04', null, '2', '1', '1', '1'), ('6', '2号床 洗厕所任务', '6', '2014-03-07 17:23:57', '2014-06-04 14:53:06', null, '2', '2', '2', '1'), ('7', '3号床 写作业任务', '7', '2014-03-07 17:24:10', '2014-06-04 14:53:09', null, '2', '3', '3', '1'), ('8', '4号床 起床任务', '8', '2014-03-07 17:24:20', '2014-06-04 14:53:11', null, '2', '3', '4', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_task_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_customer`;
CREATE TABLE `t_task_customer` (
  `task_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `customer_id` (`customer_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_task_customer_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_task_customer_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`),
  CONSTRAINT `t_task_customer_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_task_customer`
-- ----------------------------
BEGIN;
INSERT INTO `t_task_customer` VALUES ('2', '6', '1'), ('1', '5', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_task_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_manager`;
CREATE TABLE `t_task_manager` (
  `task_id` int(10) NOT NULL,
  `manager_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `manager_id` (`manager_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_task_manager_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_task_manager_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`),
  CONSTRAINT `t_task_manager_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_task_manager`
-- ----------------------------
BEGIN;
INSERT INTO `t_task_manager` VALUES ('1', '8', '1'), ('2', '8', '1'), ('3', '9', '1'), ('4', '9', '1'), ('6', '10', '1'), ('5', '10', '1'), ('7', '11', '1'), ('8', '11', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_task_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_member`;
CREATE TABLE `t_task_member` (
  `task_id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `task_id` (`task_id`),
  KEY `member_id` (`member_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_task_member_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_task_member_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`),
  CONSTRAINT `t_task_member_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_task_member`
-- ----------------------------
BEGIN;
INSERT INTO `t_task_member` VALUES ('1', '16', '1'), ('1', '17', '1');
COMMIT;

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
  `company_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_user_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', 'mima1', '卢煌', 'luhuang', 'hassion', 'luhuang@qq.com', '技术组组长', '前端工程师', '高级前端工程师', 'luhuanglh', '623360317', '88886666', '13430325317', '0000-00-00 00:00:00', '1'), ('2', 'mima2', '施奋进', 'shifenjin', 'lion', 'shifenjin@qq.com', '技术组副组长', '后台工程师', '高级后台工程师', 'fenjin7009', '170843737', '', '13430347009', '0000-00-00 00:00:00', '1'), ('3', 'mima3', '烧猪', 'shaozhu', 'hotpig', 'shaozhu@qq.com', '技术组服务专员', '酱油', '高级酱油', 'Liangsv', '526262444', '', '15112189421', '0000-00-00 00:00:00', '1'), ('4', 'mima4', '李四', 'lisi', 'four', 'lisi@qq.com', '产品组组长', '产品经理', '高级产品经理', 'fourli', '44444444', '020-44', '13444444444', null, '1'), ('5', 'mima5', '王五', 'wangwu', 'five', 'wangwu@qq.com', '产品组副组长', '产品经理', '产品经理', 'fivewang', '55555555', '020-55', '13555555555', null, '1'), ('6', 'mima6', '赵六', 'zhaoliu', 'six', 'zhaoliu@qq.com', '设计组组长', '平台设计师', '高级平台设计师', 'sixzhao', '66666666', '020-66', '13666666666', null, '1'), ('7', 'mima7', '钱七', 'qianqi', 'seven', 'qianqi@qq.com', '设计组副组长', '界面设计师', '高级界面设计师', 'sevenqian', '77777777', '020-77', '13777777777', null, '1'), ('8', 'mima8', '孙八', 'sunba', 'eight', 'sunba@qq.com', '运营组组长', '运营工程师', '高级运营工程师', 'eightsun', '88888888', '020-88', '13888888888', null, '1'), ('9', 'mima9', '杨九', 'yangjiu', 'nine', 'yangjiu@qq.com', '运营组副组长', '运营工程师', '运营工程师', 'nineyang', '99999999', '020-99', '13999999999', null, '1'), ('10', 'mima10', '吴十', 'wushi', 'ten', 'wushi@qq.com', '微办公部长', '酱油', '高级酱油', 'tenwu', '10101010', '020-10', '13010101010', null, '1'), ('11', 'mima11', '萧十一郎', 'xiaoshiyilang', 'eleven', 'xiaoshiyilang@qq.com', null, null, null, 'elevenxiao', null, null, null, '2014-04-21 10:38:58', '1'), ('12', 'mima12', '成员十二', 'chengyuanshier', 'twelve', null, null, null, null, 'twelve', null, null, null, '2014-04-21 10:55:21', '1'), ('13', 'mima13', '十三姨', 'shisanyi', 'thirteen', null, null, null, null, 'thirteen', null, null, null, '2014-04-21 10:56:22', '1'), ('14', 'mima14', '成员十四', 'chengyuanshisi', 'fourteen', null, null, null, null, 'fourteenWechat', null, null, null, '2014-04-21 11:31:03', '1'), ('15', 'mima15', '成员十五', 'chengyuanshiwu', 'fifteen', null, null, null, null, 'fifteenWechat', null, null, null, '2014-04-21 11:31:41', '1'), ('16', 'mima16', '成员十六', 'chengyuanshiliu', 'sixteen', null, null, null, null, 'sixteenWechat', null, null, null, '2014-04-21 13:14:04', '1'), ('17', 'mima17', '成员十七', 'chengyuanshiqi', 'seventeen', null, null, null, null, 'seventeenWechat', null, null, null, '2014-04-21 13:15:07', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_user_collectedcontacts`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_collectedcontacts`;
CREATE TABLE `t_user_collectedcontacts` (
  `user_id` int(10) NOT NULL,
  `collectedcontacts_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `collectedcontacts_id` (`collectedcontacts_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_user_collectedcontacts_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
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
  `company_id` int(10) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `department_id` (`department_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_user_department_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
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
  `company_id` int(10) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `t_user_group_ibfk_0` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`),
  CONSTRAINT `t_user_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_user_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `t_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
