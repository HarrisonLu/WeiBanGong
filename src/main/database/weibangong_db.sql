drop database if exists weibangong_db;
create database weibangong_db character set utf8 collate utf8_general_ci;
use weibangong_db;

drop table if exists t_user_group;
drop table if exists t_user_department;
drop table if exists t_user_collectedcontacts;
drop table if exists t_user;
drop table if exists t_department;
drop table if exists t_group;

create table t_user
(
  id    int(10)    not null,
  password    varchar(30)    not null,
  chinese_name    varchar(30)    not null,
	chinese_name_pinyin     varchar(30)    not null,
  english_name    varchar(30)    not null,
  email    varchar(30),
  status    varchar(30),
	position    varchar(30),
  position_level    varchar(30),
  wechat_num    	varchar(30)    not null,
  qq_num    varchar(20),
  telephone_num    varchar(20),
  mobile_phone_num    varchar(20),
	created_time    timestamp    default    current_timestamp,

	primary key(id)
) engine = innodb    default    charset = utf8;

create table t_department
(
  id    int(10)    not null,
  name    varchar(30)    not null    unique,
  created_time    timestamp    default    current_timestamp,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_group
(
  id    int(10)    not null,
  name    varchar(30)    not null,
  department_id    int(10)    not null,
  created_time    timestamp    default    current_timestamp,

  primary key(id),
  foreign key(department_id)    references    t_department(id)
) engine = innodb    default    charset = utf8;

create table t_user_department
(
  user_id    int(10)    not null,
  department_id   int(10)    not null,
  foreign key(user_id)    references    t_user(id),
  foreign key(department_id)    references    t_department(id)
) engine = innodb    default    charset = utf8;

create table t_user_group
(
  user_id    int(10)    not null,
  group_id   int(10)    not null,
  foreign key(user_id)    references    t_user(id),
  foreign key(group_id)    references    t_group(id)
) engine = innodb    default    charset = utf8;

create table t_user_collectedcontacts
(
  user_id    int(10)    not null,
  collectedcontacts_id    int(10)    not null,
  foreign key(user_id)    references    t_user(id),
  foreign key(collectedcontacts_id)    references    t_user(id)
) engine = innodb    default    charset = utf8;