/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : weibangong_db

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-03-10 02:21:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_comment
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
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '卢煌 说 卢煌是客户一的创建用户', '1', '1', '2014-03-09 19:42:06');
INSERT INTO `t_comment` VALUES ('2', '奋进 说 卢煌是客户二的创建用户', '2', '2', '2014-03-09 19:44:38');
INSERT INTO `t_comment` VALUES ('3', '烧猪 说 客户一是卢煌的大鱼', '3', '1', '2014-03-09 19:47:47');

-- ----------------------------
-- Table structure for t_customer
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
  `created_user_id` int(10) NOT NULL,
  `project_id` int(10) DEFAULT NULL,
  `task_id` int(10) DEFAULT NULL,
  `discuss_stage_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_user_id` (`created_user_id`),
  KEY `t_customer_ibfk_4` (`discuss_stage_id`),
  KEY `t_customer_ibfk_2` (`project_id`),
  KEY `t_customer_ibfk_3` (`task_id`),
  CONSTRAINT `t_customer_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_1` FOREIGN KEY (`created_user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_customer_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_4` FOREIGN KEY (`discuss_stage_id`) REFERENCES `t_discuss_stage` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1', '客户一', 'kehuyi', 'one', '男', '131', 'wc1', '11', '11@qq.com', '1公司地址', '1街1号', '大鱼', '1', '1', null, '1');
INSERT INTO `t_customer` VALUES ('2', '客户二', 'kehuer', 'two', '女', '132', 'wc2', '22', '22@qq.com', '2公司地址', '2街2号', '大大鱼', '1', null, '1', '2');
INSERT INTO `t_customer` VALUES ('3', '客户三', 'kehusan', 'three', '男', '133', 'wc3', '33', '33@qq.com', '3公司地址', '33街33号', '小鱼', '1', null, '2', '3');
INSERT INTO `t_customer` VALUES ('4', '客户四', 'kehusi', 'four', '女', '134', 'wc4', '44', '44@qq.com', '4公司地址', '4街4号', '特大鱼', '1', null, '3', '4');
INSERT INTO `t_customer` VALUES ('5', '客户五', 'kehuwu', 'five', '男', '135', 'wc5', '55', '55@qq.com', '5公司地址', '5街5号', '小鱼', '2', '1', null, '1');
INSERT INTO `t_customer` VALUES ('6', '客户六', 'kehuliu', 'six', '女', '136', 'wc6', '66', '66@qq.com', '6公司地址', '6街6号', '小小鱼', '2', null, '5', '2');
INSERT INTO `t_customer` VALUES ('7', '客户七', 'kehuqi', 'seven', '男', '137', 'wc7', '77', '77@qq.com', '7公司地址', '7街7号', '小小小鱼', '2', null, '6', '3');
INSERT INTO `t_customer` VALUES ('8', '客户八', 'kehuba', 'eight', '女', '138', 'wc8', '88', '88@qq.com', '8公司地址', '8街8号', '特小鱼', '2', null, '7', '4');

-- ----------------------------
-- Table structure for t_customer_user
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
-- Records of t_customer_user
-- ----------------------------
INSERT INTO `t_customer_user` VALUES ('3', '2');
INSERT INTO `t_customer_user` VALUES ('4', '2');
INSERT INTO `t_customer_user` VALUES ('7', '1');
INSERT INTO `t_customer_user` VALUES ('8', '1');

-- ----------------------------
-- Table structure for t_department
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
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('1', '微办公', '0000-00-00 00:00:00');
INSERT INTO `t_department` VALUES ('2', '微招聘', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_discuss_stage
-- ----------------------------
DROP TABLE IF EXISTS `t_discuss_stage`;
CREATE TABLE `t_discuss_stage` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_discuss_stage
-- ----------------------------
INSERT INTO `t_discuss_stage` VALUES ('1', '未洽谈');
INSERT INTO `t_discuss_stage` VALUES ('2', '洽谈中');
INSERT INTO `t_discuss_stage` VALUES ('3', '合作期');
INSERT INTO `t_discuss_stage` VALUES ('4', '其他');

-- ----------------------------
-- Table structure for t_group
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
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES ('1', '技术部', '1', '2014-03-07 02:16:55');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1', '至善园6号616项目', '2014-03-06 01:38:28');
INSERT INTO `t_project` VALUES ('2', '至善园6号618项目', '2014-03-06 01:39:31');

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `project_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `t_task_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('1', '1号床任务', '1', '2014-03-06 01:38:59');
INSERT INTO `t_task` VALUES ('2', '2号床任务', '1', '2014-03-06 01:39:54');
INSERT INTO `t_task` VALUES ('3', '3号床任务', '1', '2014-03-06 01:40:15');
INSERT INTO `t_task` VALUES ('4', '4号床任务', '1', '2014-03-07 17:23:38');
INSERT INTO `t_task` VALUES ('5', '1号床任务', '2', '2014-03-07 17:23:49');
INSERT INTO `t_task` VALUES ('6', '2号床任务', '2', '2014-03-07 17:23:57');
INSERT INTO `t_task` VALUES ('7', '3号床任务', '2', '2014-03-07 17:24:10');
INSERT INTO `t_task` VALUES ('8', '4号床任务', '2', '2014-03-07 17:24:20');

-- ----------------------------
-- Table structure for t_user
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
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'mima1', '卢煌', 'luhuang', 'hassion', 'luhuang@qq.com', '技术组组长', '前端工程师', '高级前端工程师', 'luhuanglh', '623360317', '88886666', '13430325317', '0000-00-00 00:00:00');
INSERT INTO `t_user` VALUES ('2', 'mima2', '施奋进', 'shifenjin', 'lion', 'shifenjin@qq.com', '技术组副组长', '后台工程师', '高级后台工程师', 'fenjin7009', '170843737', '', '13430347009', '0000-00-00 00:00:00');
INSERT INTO `t_user` VALUES ('3', 'mima3', '烧猪', 'shaozhu', 'hotpig', 'shaozhu@qq.com', '技术组服务专员', '酱油', '高级酱油', 'Liangsv', '526262444', '', '15112189421', '0000-00-00 00:00:00');
INSERT INTO `t_user` VALUES ('4', 'mima4', '李四', 'lisi', 'four', 'lisi@qq.com', '产品组组长', '产品经理', '高级产品经理', 'fourli', '44444444', '020-44', '13444444444', null);
INSERT INTO `t_user` VALUES ('5', 'mima5', '王五', 'wangwu', 'five', 'wangwu@qq.com', '产品组副组长', '产品经理', '产品经理', 'fivewang', '55555555', '020-55', '13555555555', null);
INSERT INTO `t_user` VALUES ('6', 'mima6', '赵六', 'zhaoliu', 'six', 'zhaoliu@qq.com', '设计组组长', '平台设计师', '高级平台设计师', 'sixzhao', '66666666', '020-66', '13666666666', null);
INSERT INTO `t_user` VALUES ('7', 'mima7', '钱七', 'qianqi', 'seven', 'qianqi@qq.com', '设计组副组长', '界面设计师', '高级界面设计师', 'sevenqian', '77777777', '020-77', '13777777777', null);
INSERT INTO `t_user` VALUES ('8', 'mima8', '孙八', 'sunba', 'eight', 'sunba@qq.com', '运营组组长', '运营工程师', '高级运营工程师', 'eightsun', '88888888', '020-88', '13888888888', null);
INSERT INTO `t_user` VALUES ('9', 'mima9', '杨九', 'yangjiu', 'nine', 'yangjiu@qq.com', '运营组副组长', '运营工程师', '运营工程师', 'nineyang', '99999999', '020-99', '13999999999', null);
INSERT INTO `t_user` VALUES ('10', 'mima10', '吴十', 'wushi', 'ten', 'wushi@qq.com', '微办公部长', '酱油', '高级酱油', 'tenwu', '10101010', '020-10', '13010101010', null);

-- ----------------------------
-- Table structure for t_user_collectedcontacts
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
-- Records of t_user_collectedcontacts
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_department
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
-- Records of t_user_department
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_group
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

-- ----------------------------
-- Records of t_user_group
-- ----------------------------