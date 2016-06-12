drop table if exists SYS_FILE;

drop table if exists SYS_FUNC;

drop table if exists SYS_LOG;

drop table if exists SYS_PARAM;

drop table if exists SYS_ROLE;

drop table if exists SYS_ROLE_FUNC;

drop table if exists SYS_TASK;

drop table if exists SYS_USER;

/*==============================================================*/
/* Table: SYS_FILE                                              */
/*==============================================================*/
create table SYS_FILE
(
   UUID                 varchar(32) not null,
   TYPE                 char(1) not null,
   NAME                 varchar(80) not null,
   EXT                  varchar(8),
   BYTES                int(12) not null,
   DATA                 BLOB not null,
   EXPIRED              TIMESTAMP,
   DESC_INFO            varchar(200),
   UPDATE_BY            varchar(40) not null,
   UPDATE_TIME          TIMESTAMP not null,
   primary key (UUID)
);

/*==============================================================*/
/* Table: SYS_FUNC                                              */
/*==============================================================*/
create table SYS_FUNC
(
   FUNC_CODE            varchar(40) not null,
   FUNC_NAME            varchar(40),
   FUNC_TYPE            varchar(40),
   FUNC_PATH            varchar(40),
   ORDER_SEQ            int(10),
   DISABLE_FLAH         char(1),
   DESC_INFO            varchar(200),
   CREATE_BY            varchar(40) not null,
   CREATE_TIME          TIMESTAMP not null,
   UPDATE_BY            varchar(40) not null,
   UPDATE_TIME          TIMESTAMP not null,
   primary key (FUNC_CODE)
);

/*==============================================================*/
/* Table: SYS_LOG                                               */
/*==============================================================*/
create table SYS_LOG
(
   LOG_TASK             varchar(100) not null,
   LOG_TIME             TIMESTAMP not null,
   LOG_TEXT             varchar(1000) not null,
   REF01                varchar(200),
   REF02                varchar(200),
   REF03                varchar(200),
   REF04                varchar(200),
   REF05                varchar(200),
   REF06                varchar(200),
   REF07                varchar(200),
   REF08                varchar(200),
   REF09                varchar(200),
   REF10                varchar(200)
);

/*==============================================================*/
/* Table: SYS_PARAM                                             */
/*==============================================================*/
create table SYS_PARAM
(
   PARAM_CODE           varchar(40) not null,
   PARAM_NAME           varchar(40),
   PARAM_VALUE          varchar(40),
   DESC_INFO            varchar(200),
   CREATE_BY            varchar(40) not null,
   CREATE_TIME          TIMESTAMP not null,
   UPDATE_BY            varchar(40) not null,
   UPDATE_TIME          TIMESTAMP not null,
   primary key (PARAM_CODE)
);

/*==============================================================*/
/* Table: SYS_ROLE                                              */
/*==============================================================*/
create table SYS_ROLE
(
   ROLE_CODE            VARCHAR(40) not null comment '角色代码',
   ROLE_NAME            VARCHAR(40) comment '角色名称',
   DISABLE_FLAG         char(1) comment '禁用标记',
   DESC_INFO            VARCHAR(200) comment '备注',
   CREATE_BY            varchar(40) not null comment '创建人',
   CREATE_TIME          TIMESTAMP not null comment '创建时间',
   UPDATE_BY            varchar(40) not null comment '更新人',
   UPDATE_TIME          TIMESTAMP not null comment '更新时间',
   primary key (ROLE_CODE)
);

/*==============================================================*/
/* Table: SYS_ROLE_FUNC                                         */
/*==============================================================*/
create table SYS_ROLE_FUNC
(
   ROLE_CODE            varchar(40) not null,
   FUNC_CODE            varchar(40) not null,
   primary key (ROLE_CODE, FUNC_CODE)
);

/*==============================================================*/
/* Table: SYS_TASK                                              */
/*==============================================================*/
create table SYS_TASK
(
   TASK_CODE            varchar(40) not null,
   TASK_NAME            varchar(100) not null,
   LAST_TIME            TIMESTAMP,
   key AK_SYS_TASK_01 (TASK_CODE)
);

/*==============================================================*/
/* Table: SYS_USER                                              */
/*==============================================================*/
create table SYS_USER
(
   USER_ID              varchar(40) not null comment '用户ID',
   ROLE_CODE            VARCHAR(40) comment '角色代码',
   PASSWORD             varchar(128) not null comment '密码',
   USER_NAME            varchar(40) not null comment '用户名',
   ORG_ID               varchar(32) comment '机构标识',
   EMAIL                varchar(40) comment '邮件',
   LOGIN_COUNT          int(10) comment '登陆次数',
   LAST_LOGIN_TIME      TIMESTAMP comment '最后登陆时间',
   LAST_LOGIN_IP        varchar(40) comment '最后登陆客户端',
   DISABLE_FLAG         char(1) comment '禁用标记',
   DESC_INFO            varchar(200) comment '备注',
   CREATE_BY            varchar(40) not null comment '创建人',
   CREATE_TIME          TIMESTAMP not null comment '创建时间',
   UPDATE_BY            varchar(40) not null comment '更新人',
   UPDATE_TIME          TIMESTAMP not null comment '更新时间',
   primary key (USER_ID),
   key AK_SYS_USER_01 (USER_NAME)
);

alter table SYS_ROLE_FUNC add constraint FK_SYS_ROLE_FUNC_FUNC foreign key (FUNC_CODE)
      references SYS_FUNC (FUNC_CODE) on delete restrict on update restrict;

alter table SYS_ROLE_FUNC add constraint FK_SYS_ROLE_FUNC_ROLE foreign key (ROLE_CODE)
      references SYS_ROLE (ROLE_CODE) on delete restrict on update restrict;

alter table SYS_USER add constraint FK_SYS_USER_ROLE foreign key (ROLE_CODE)
      references SYS_ROLE (ROLE_CODE) on delete restrict on update restrict;
