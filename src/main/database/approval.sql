drop table if exists t_approval;
drop table if exists t_approval_type;
drop table if exists t_approval_stage;
drop table if exists t_approval_status;
drop table if exists t_claim_type;
drop table if exists t_funds_type;
drop table if exists t_goods_type;
drop table if exists t_leave_type;
drop table if exists t_claim_item;
drop table if exists t_funds_item;
drop table if exists t_goods_item;
drop table if exists t_carbon_copy;

create table t_approval_type
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_approval_stage
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_approval_status
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_claim_type
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_funds_type
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_goods_type
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_leave_type
(
  id    int(10)    not null    auto_increment,
  name    varchar(30)    not null,

  primary key(id)
) engine = innodb    default    charset = utf8;

create table t_approval
(
  id    int(10)    not null    auto_increment,
  applicant_id    int(10)    not null,
  department_id    int(10)    not null,
  reasons    varchar(300),
  first_approval_user_id    int(10),
  second_approval_user_id    int(10),
  be_carbon_copy_user_id    int(10),
  current_approval_user_id    int(10),
  approval_type_id    int(10),
  approval_stage_id    int(10),
  approval_status_id    int(10),
  leave_type_id    int(10),
  claim_type_id    int(10),
  goods_type_id    int(10),
  funds_type_id    int(10),
  start_time    timestamp,
  end_time    timestamp,
  travel_from    varchar(300),
  travel_to    varchar(300),
  amount    float(30),
  company_id    int(10)    not null,

  primary key(id),
  CONSTRAINT t_approval_applicant_id    foreign key(applicant_id)    references t_user(id),
  CONSTRAINT t_approval_department_id    foreign key(department_id)    references t_department(id),
  CONSTRAINT t_approval_first_approval_user_id    foreign key(first_approval_user_id)    references t_user(id),
  CONSTRAINT t_approval_second_approval_user_id    foreign key(second_approval_user_id)    references t_user(id),
  CONSTRAINT t_approval_be_carbon_copy_user_id    foreign key(be_carbon_copy_user_id)    references t_user(id),
  CONSTRAINT t_approval_current_approval_user_id    foreign key(current_approval_user_id)    references t_user(id),
  CONSTRAINT t_approval_approval_type_id    foreign key(approval_type_id)    references t_approval_type(id),
  CONSTRAINT t_approval_approval_stage_id    foreign key(approval_stage_id)    references t_approval_stage(id),
  CONSTRAINT t_approval_approval_status_id    foreign key(approval_status_id)    references t_approval_status(id),
  CONSTRAINT t_approval_type_id    foreign key(leave_type_id)    references t_leave_type(id),
  CONSTRAINT t_approval_claim_type_id    foreign key(claim_type_id)    references t_claim_type(id),
  CONSTRAINT t_approval_goods_type_id    foreign key(goods_type_id)    references t_goods_type(id),
  CONSTRAINT t_approval_funds_type_id    foreign key(funds_type_id)    references t_funds_type(id),
  CONSTRAINT t_approval_company_id    foreign key(company_id)    references t_company(id)

) engine = innodb    default    charset = utf8;

create table t_claim_item
(
  id    int(10)    not null    auto_increment,
  approval_id    int(10)    not null,
  info    varchar(100)    not null,
  amount    float(30),
  company_id    int(10)    not null,

  primary key(id),
  CONSTRAINT t_claim_item_approval_id    foreign key(approval_id)    references t_approval(id),
  CONSTRAINT t_claim_item_company_id    foreign key(company_id)    references t_company(id)
) engine = innodb    default    charset = utf8;

create table t_funds_item
(
  id    int(10)    not null    auto_increment,
  approval_id    int(10)    not null,
  info    varchar(100)    not null,
  amount    float(30),
  company_id    int(10)    not null,

  primary key(id),
  CONSTRAINT t_funds_item_approval_id    foreign key(approval_id)    references t_approval(id),
  CONSTRAINT t_funds_item_company_id    foreign key(company_id)    references t_company(id)
) engine = innodb    default    charset = utf8;

create table t_goods_item
(
  id    int(10)    not null    auto_increment,
  approval_id    int(10)    not null,
  name    varchar(100)    not null,
  num    int(30)    not null,
  price    float(30)    not null,
  company_id    int(10)    not null,

  primary key(id),
  CONSTRAINT t_goods_item_approval_id    foreign key(approval_id)    references t_approval(id),
  CONSTRAINT t_goods_item_company_id    foreign key(company_id)    references t_company(id)
) engine = innodb    default    charset = utf8;

create table t_carbon_copy
(
  id    int(10)    not null    auto_increment,
  approval_id    int(10)    not null,
  be_carbon_copy_id    int(10)    not null,
  company_id    int(10)    not null,

  primary key(id),
  CONSTRAINT t_carbon_copy_approval_id    foreign key(approval_id)    references t_approval(id),
  CONSTRAINT t_carbon_copy_be_carbon_copy_id    foreign key(be_carbon_copy_id)    references t_user(id),
  CONSTRAINT t_carbon_copy_company_id    foreign key(company_id)    references t_company(id)
) engine = innodb    default    charset = utf8;