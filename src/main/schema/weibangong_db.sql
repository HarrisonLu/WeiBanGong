drop database if exists weibangong_db;
create database weibangong_db default character set utf8;
use weibangong_db;

drop table if exists t_user;
drop table if exists t_department;
drop table if exists t_wechat_group;

create table t_user
(
    id                 int           not null   auto_increment   primary key,
    chinese_name     varchar(30)   not null,
    english_name     varchar(30),
    position_title   varchar(30),
    wechat_num       varchar(30),
    qq_num            int,
    phone_num         int
);

create table t_department
(
    id      int           not null   auto_increment   primary key,
    name    varchar(30)  not null
);

create table t_wechat_group
(
    id              int    not null   auto_increment   primary key,
    chinese_name    varchar(30)   not null,
    english_name    varchar(30)
);