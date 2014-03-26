drop database if exists weibangong_db;
create database weibangong_db character set utf8 collate utf8_general_ci;
use weibangong_db;

# 通讯录
drop table if exists t_user_group;
drop table if exists t_user_department;
drop table if exists t_user_collectedcontacts;
drop table if exists t_user;
drop table if exists t_department;
drop table if exists t_group;

create table t_user
(
  id    int(10)    not null    auto_increment,
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
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null    unique,
  created_time    timestamp    default    current_timestamp,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_group
(
  id    int(10)    not null    auto_increment,
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


# 客户管理

drop table if exists t_project;
drop table if exists t_task;
drop table if exists t_discuss_stage;
drop table if exists t_customer;
drop table if exists t_comment;
drop table if exists t_customer_user;

create table t_project
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,
  name_pinyin     varchar(30)    not null,
  create_time    timestamp    not null    default     current_timestamp,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_task
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,
  name_pinyin     varchar(30)    not null,
  project_id    int(10)    not null,
  create_time    timestamp    not null    default     current_timestamp,

  primary key(id),
  foreign key(project_id)    references    t_project(id)
) engine = innodb    default    charset = utf8;

create table t_discuss_stage
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_customer
(
  id    int(10)    not null    auto_increment,
  chinese_name    varchar(30)    not null,
  chinese_name_pinyin     varchar(30)    not null,
  english_name    varchar(30),
  gender    varchar(2)    not null,
  phone_num    varchar(20),
  wechat_num    varchar(30),
  qq_num    varchar(20),
  email    varchar(30),
  office_address    varchar(50),
  house_address    varchar(50),
  customer_value    varchar(300),
  birthday    date,
  hobby    varchar(255),
  created_user_id    int(10)    not null,
  project_id    int(10),
  task_id    int(10),
  discuss_stage_id    int(10),

  primary key(id),
  foreign key(created_user_id)    references    t_user(id),
  foreign key(project_id)    references    t_project(id)    on update cascade,
  foreign key(task_id)    references    t_task(id)    on update cascade,
  foreign key(discuss_stage_id)    references    t_discuss_stage(id)    on update cascade
) engine = innodb    default    charset = utf8;

create table t_comment
(
  id    int(10)    not null    auto_increment,
  details    varchar(600),
  user_id    int(10)    not null,
  customer_id    int(10)    not null,
  create_time    timestamp    not null    default     current_timestamp,

  primary key(id),
  foreign key(user_id)    references   t_user(id),
  foreign key(customer_id)    references    t_customer(id)
) engine = innodb    default    charset = utf8;

create table t_customer_user
(
  customer_id    int(10)    not null,
  user_id    int(10)    not null,

  foreign key(customer_id)    references    t_customer(id),
  foreign key(user_id)    references    t_user(id)
) engine = innodb    default    charset = utf8;