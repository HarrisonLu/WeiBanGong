DROP DATABASE IF EXISTS weibangong_db;
CREATE DATABASE weibangong_db
  CHARACTER SET utf8
  COLLATE utf8_general_ci;
USE weibangong_db;

DROP TABLE IF EXISTS t_user;
DROP TABLE IF EXISTS t_department;
DROP TABLE IF EXISTS t_wechat_group;

CREATE TABLE t_user
(
  id             INT(10)     NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email          VARCHAR(30) NOT NULL   UNIQUE,
  password       VARCHAR(30) NOT NULL,
  chinese_name   VARCHAR(30) NOT NULL,
  english_name   VARCHAR(30),
  position_title VARCHAR(30),
  wechat_num     VARCHAR(30),
  qq_num         VARCHAR(30),
  phone_num      VARCHAR(30),
  created_time   TIMESTAMP DEFAULT current_timestamp
)
  ENGINE =INNODB
  DEFAULT CHARSET =utf8;

CREATE TABLE t_department
(
  id           INT(10)     NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name         VARCHAR(30) NOT NULL   UNIQUE,
  created_time TIMESTAMP DEFAULT current_timestamp
)
  ENGINE =INNODB
  DEFAULT CHARSET =utf8;

CREATE TABLE t_user_department
(
  user_id       INT(10) DEFAULT null,
  department_id INT(10) DEFAULT null,
  KEY fk_user_id          (user_id),
  KEY fk_department_id    (department_id),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES t_user (id),
  CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES t_department (id)
)
  ENGINE =INNODB
  DEFAULT CHARSET =utf8;

CREATE TABLE t_wechat_group
(
  id           INT(10)       UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  chinese_name VARCHAR(30)            NOT NULL,
  english_name VARCHAR(30)
)
  ENGINE =INNODB
  DEFAULT CHARSET =utf8;