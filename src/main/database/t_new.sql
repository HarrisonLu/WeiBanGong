drop table if exists t_stage_project;

create table t_stage_project
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

drop table if exists t_priority;

create table t_priority
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

drop table if exists t_comment_project;

create table t_comment_project
(
id    int(10)    not null    auto_increment,
details    varchar(600),
user_id    int(10)    not null,
project_id   int(10)   not null,
create_time    timestamp    not null    default     current_timestamp,

primary key(id),
foreign key(user_id)    references    t_user(id),
foreign key(project_id)    references    t_project(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_comment_task;

create table t_comment_task
(
id    int(10)    not null    auto_increment,
details    varchar(600),
user_id    int(10)    not null,
task_id   int(10)   not null,
create_time    timestamp    not null    default     current_timestamp,

primary key(id),
foreign key(user_id)    references    t_user(id),
foreign key(task_id)    references   t_task(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_sub_task;

create table t_sub_task
(
id    int(10)    not null    auto_increment,
name    varchar(30)    not null,
task_id    int(10)    not null,
create_time    timestamp    not null    default     current_timestamp,

primary key(id),
foreign key(task_id)    references    t_task(id)

) engine = innodb    default    charset = utf8;


drop table if exists t_project_manager;

create table t_project_manager
(
project_id   int(10)   not null,
manager_id   int(10)   not null,

foreign key(project_id)    references    t_project(id),
foreign key(manager_id)   references   t_user(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_module_manager;

create table t_module_manager
(
module_id   int(10)   not null,
manager_id   int(10)   not null,

foreign key(module_id)    references   t_module(id),
foreign key(manager_id)   references   t_user(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_task_manager;

create table t_task_manager
(
task_id   int(10)   not null,
manager_id   int(10)   not null,

foreign key(task_id)    references   t_task(id),
foreign key(manager_id)   references   t_user(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_project_member;

create table t_project_member
(
project_id   int(10)   not null,
member_id   int(10)   not null,

foreign key(project_id)    references    t_project(id),
foreign key(member_id)   references   t_user(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_module_member;

create table t_module_member
(
module_id   int(10)   not null,
member_id   int(10)   not null,

foreign key(module_id)    references   t_module(id),
foreign key(member_id)   references   t_user(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_task_member;

create table t_task_member
(
task_id   int(10)   not null,
member_id   int(10)   not null,

foreign key(task_id)    references   t_task(id),
foreign key(member_id)   references   t_user(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_project_customer;

create table t_project_customer
(
project_id   int(10)   not null,
customer_id   int(10)   not null,

foreign key(project_id)    references    t_project(id),
foreign key(customer_id)   references   t_customer(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_module_customer;

create table t_module_customer
(
module_id   int(10)   not null,
customer_id   int(10)   not null,

foreign key(module_id)    references   t_module(id),
foreign key(customer_id)   references   t_customer(id)
) engine = innodb    default    charset = utf8;


drop table if exists t_task_customer;

create table t_task_customer
(
task_id   int(10)   not null,
customer_id   int(10)   not null,

foreign key(task_id)    references   t_task(id),
foreign key(customer_id)   references   t_customer(id)
) engine = innodb    default    charset = utf8;



