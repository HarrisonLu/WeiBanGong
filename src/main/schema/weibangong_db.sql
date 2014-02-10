drop database if exists weibangong_db;
create database weibangong_db character set utf8 collate utf8_general_ci;
use weibangong_db;

drop table if exists t_user;
drop table if exists t_department;
drop table if exists t_wechat_group;

create table t_user
(
  id               int(10)       not null   auto_increment   primary key,
  email            varchar(30)   not null   unique,
  password         varchar(30)   not null,
  chinese_name     varchar(30)   not null,
  english_name     varchar(30),
  position_title   varchar(30),
  wechat_num       varchar(30),
  qq_num           varchar(30),
  phone_num        varchar(30),
  created_time     timestamp     default     current_timestamp
)engine=INNODB default charset=utf8;

create table t_department
(
  id               int(10)      not null   auto_increment   primary key,
  name             varchar(30)  not null   unique,
  created_time     timestamp    default    current_timestamp
)engine=INNODB default charset=utf8;

create table t_user_department
(
  user_id         int(10)             default           null,
  department_id   int(10)             default           null,
  key             fk_user_id          (user_id),
  key             fk_department_id    (department_id),
  constraint      fk_user_id          foreign key       (user_id)         references    t_user        (id),
  constraint      fk_department_id    foreign key       (department_id)   references    t_department  (id)
)engine=INNODB default charset=utf8;

create table t_wechat_group
(
  id              int(10)       unsigned    not null   auto_increment   primary key,
  chinese_name    varchar(30)   not null,
  english_name    varchar(30)
)engine=INNODB default charset=utf8;