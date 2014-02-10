drop database if exists weibangong_db;
CREATE DATABASE weibangong_db
  CHARACTER SET utf8
  COLLATE utf8_general_ci;
USE weibangong_db;

drop table if exists t_user;
drop table if exists t_department;
drop table if exists t_wechat_group;

create table t_user
(
  id             INT(10)       UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email          VARCHAR(30)            NOT NULL,
  password       VARCHAR(30)            NOT NULL,
  chinese_name   VARCHAR(30)            NOT NULL,
  english_name   VARCHAR(30),
  position_title VARCHAR(30),
  wechat_num     VARCHAR(30),
  qq_num         VARCHAR(30),
  phone_num      VARCHAR(30),
  created_time   TIMESTAMP DEFAULT current_timestamp
)
  ENGINE =INNODB
  DEFAULT CHARSET =utf8;

create table t_department
(
  id           INT(10)      UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name         VARCHAR(30)           NOT NULL,
  created_time TIMESTAMP DEFAULT current_timestamp
)
  ENGINE =INNODB
  DEFAULT CHARSET =utf8;

# create table t_user_department
# (
#   user_id         int(10)             default           null,
#   department_id   int(10)             default           null,
#   key             FK_user_id          (user_id),
#   key             FK_department_id    (department_id),
#   constraint      FK_user_id          foreign key       (user_id)         references    t_user        (id),
#   constraint      FK_department_id    foreign key       (department_id)   references    t_department  (id)
# )engine=INNODB default charset=utf8;

CREATE TABLE t_wechat_group
(
  id           INT(10)       UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  chinese_name VARCHAR(30)            NOT NULL,
  english_name VARCHAR(30)
)
  ENGINE =INNODB
  DEFAULT CHARSET =utf8;