drop table if exists t_module;

create table t_module
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,
  project_id    int(10)    not null,
  create_time    timestamp    not null    default     current_timestamp,

  primary key(id),
  foreign key(project_id)    references    t_project(id)
) engine = innodb    default    charset = utf8;