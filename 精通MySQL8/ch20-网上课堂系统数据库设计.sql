CREATE TABLE student(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  username varchar(20) NOT NULL COMMENT '账号',
  password varchar(32)  NOT NULL COMMENT '密码',
  realname varchar(20) NOT NULL COMMENT '姓名',
email varchar(50)  NOT NULL COMMENT '邮箱',
phone varchar(11)  NOT NULL COMMENT '手机号',
  createTime datetime(0) NOT NULL COMMENT '创建时间',
  lastLoginTime datetime(0)  COMMENT '最后登录时间',
  sex varchar(1) NOT NULL COMMENT '性别',
  birthday date NOT NULL COMMENT '生日',  
  total int(11) NOT NULL COMMENT '学习总时长',
membership int(11) NOT NULL COMMENT '会员等级',
  remark varchar(200)  COMMENT '说明',
  PRIMARY KEY (id) 
);

CREATE TABLE teacher(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  username varchar(20) NOT NULL COMMENT '账号',
  password varchar(32)  NOT NULL COMMENT '密码',
  realname varchar(20) NOT NULL COMMENT '姓名',
email varchar(50)  NOT NULL COMMENT '邮箱',
phone varchar(11)  NOT NULL COMMENT '手机号',
  createTime datetime(0) NOT NULL COMMENT '创建时间',
  lastLoginTime datetime(0)  COMMENT '最后登录时间',
  sex varchar(1) NOT NULL COMMENT '性别',
  birthday date NOT NULL COMMENT '生日',  
teachLevel int(11) NOT NULL COMMENT '教师等级',
  remark varchar(200)  COMMENT '说明',
  PRIMARY KEY (id) 
);

CREATE TABLE admin(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  username varchar(20) NOT NULL COMMENT '账号',
  password varchar(32)  NOT NULL COMMENT '密码',
  realname varchar(20) NOT NULL COMMENT '姓名',
  PRIMARY KEY (id) 
);


CREATE TABLE course_type(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  typename varchar(20) NOT NULL COMMENT '名称',
  PRIMARY KEY (id) 
);

CREATE TABLE course(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  name varchar(20) NOT NULL COMMENT '课程名称',
  typeId int(11)  NOT NULL COMMENT '课程类别',
  createTime datetime(0) NOT NULL COMMENT '创建时间',
teacherId int(11)  NOT NULL COMMENT '创建教师',
totalDuration int(11)  NOT NULL COMMENT '总时长（秒）',
filePath varchar(100)  NOT NULL COMMENT '视频地址',
clickCount int(11) NOT NULL COMMENT '被学习次数',
remark varchar(500)  NOT NULL COMMENT '课程说明',
  PRIMARY KEY (id) 
);

CREATE TABLE student_course(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  courseId int(11)  NOT NULL COMMENT '对应课程Id',
studentId int(11)  NOT NULL COMMENT '对应学生Id',
  createTime datetime(0) NOT NULL COMMENT '开始学习的时间',
viewedDuration int(11)  NOT NULL COMMENT '已观看时长（秒）',
finish int(11) NOT NULL COMMENT '是否完成学习，0：否，1：是',
  PRIMARY KEY (id) 
);


CREATE INDEX index_course_name on course(name);

CREATE VIEW course_view AS select
c.id,c.name,c.totalDuration,c.clickCount,
ct.typename,t.realname
from course c, course_type ct,teacher t
where c.typeId = ct.id and c.teacherId = t.id



CREATE TRIGGER student_totalDuration
AFTER UPDATE ON student_course FOR EACH ROW
UPDATE student set totalDuration =
 totalDuration+(NEW.viewedDuration-OLD.viewedDuration) 
where id=NEW.studentId