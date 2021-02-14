


CREATE TABLE user  (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  username varchar(20) NOT NULL COMMENT '用户名',
  password varchar(32)  NOT NULL COMMENT '密码',
  nickname varchar(20) NOT NULL COMMENT '昵称',
  userLevel int(255) NOT NULL COMMENT '等级',
  createTime datetime(0) NOT NULL COMMENT '创建时间',
  lastLoginTime datetime(0)  COMMENT '最后登录时间',
  sex varchar(1) COMMENT '性别',
  birthday date COMMENT '生日',
  email varchar(50)  NOT NULL COMMENT '邮箱',
  experience int(11) NOT NULL COMMENT '经验值',
  remark varchar(200)  COMMENT '用户说明',
  PRIMARY KEY (`id`) USING BTREE
);

CREATE TABLE admin  (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  adminUsername varchar(20) NOT NULL COMMENT '账号',
  adminPassword varchar(32)  NOT NULL COMMENT '密码',
  realname varchar(20) NOT NULL COMMENT '真实姓名',
  createTime datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (id) USING BTREE
);

CREATE TABLE section(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  sectionName varchar(20) NOT NULL COMMENT '版块名称',
  userId int(11)  NOT NULL COMMENT '版主ID',
  remark varchar(200) NOT NULL COMMENT '版块说明',
  createTime datetime(0) NOT NULL COMMENT '创建时间',
clickCount int(11)  NOT NULL COMMENT '点击数',
topicCount int(11)  NOT NULL COMMENT '主贴数',
  PRIMARY KEY (id) 
);
CREATE INDEX index_section_name on section(sectionName);
drop TABLE IF EXISTS topic;
CREATE TABLE topic(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  title varchar(100) NOT NULL COMMENT '主贴标题',
  createTime datetime(0)  NOT NULL COMMENT '发帖时间',
  userId int(11)  NOT NULL COMMENT '发帖人ID',
  sectionId int(11)  NOT NULL COMMENT '发帖版块',
content varchar(500)  NOT NULL COMMENT '帖子内容',
clickCount int(11)  NOT NULL COMMENT '浏览次数',
lastReplyTime datetime(0)  NOT NULL COMMENT '最后回复时间',
  PRIMARY KEY (id) 
);
drop TABLE IF EXISTS reply ;

CREATE TABLE reply(
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  topicId int(11) NOT NULL COMMENT '主贴ID',
replyContent varchar(500)  NOT NULL COMMENT '回复内容',
replyTime datetime(0)  NOT NULL COMMENT '回复时间',
replyClickCount int(11)  NOT NULL COMMENT '浏览次数',
  PRIMARY KEY (id) 
);

CREATE VIEW topic_view
AS select t.id,t.title,t.createTime,t.content,r.replyContent,r.replyTime
from topic t, reply r
where t.id = r.topicId


CREATE TRIGGER section_topicCount
AFTER INSERT ON topic FOR EACH ROW
UPDATE section set topicCount = topicCount+1 where id=NEW.sectionId


CREATE TRIGGER topic_delete
AFTER DELETE ON topic FOR EACH ROW
BEGIN
UPDATE section set topicCount = topicCount-1 
where id=OLD.sectionId;
DELETE from reply where topicId = OLD.id;
END
