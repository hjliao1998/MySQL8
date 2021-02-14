DROP DATABASE books;
/*创建数据库*/


/*1、创建图书管理系统数据库books*/
CREATE DATABASE books;
USE books;

/*2、创建用户表user*/
DROP TABLE IF EXISTS user ;
CREATE TABLE user (
	id int (11) NOT NULL,
	user_name varchar(255) DEFAULT NULL,
	birth_date date DEFAULT NULL,
	id_card varchar(255) DEFAULT NULL,
	login_name varchar(255) DEFAULT NULL,
	password varchar(255) DEFAULT NULL,
	mobile varchar(255) DEFAULT NULL,
	email varchar(255) DEFAULT NULL,
	dept_id int(11) DEFAULT NULL,
	role_id int(11) DEFAULT NULL,
	PRIMARY KEY (id)
	)
ENGINE = INNODB DEFAULT CHARSET = utf8;

/*3、创建部门表dept*/
DROP TABLE IF EXISTS dept;
CREATE TABLE dept(
	id int(11) NOT NULL,
	dept_name varchar(255) DEFAULT NULL,
	create_date date DEFAULT NULL,
	PRIMARY KEY(id))
ENGINE = INNODB DEFAULT CHARSET = utf8;

/*4、创建角色表role*/
DROP TABLE IF EXISTS role;
CREATE TABLE role(
	id int(11) NOT NULL,
	role_name varchar(255) DEFAULT NULL,
	remark varchar(255) DEFAULT NULL,
PRIMARY KEY (id))
ENGINE = INNODB DEFAULT CHARSET = utf8;

/*5、创建图书表book*/
DROP TABLE IF EXISTS book;
CREATE TABLE book(
	id int(11) NOT NULL,
	book_name varchar(255) DEFAULT NULL,
	author varchar(255) DEFAULT NULL,
	price decimal(10,0) DEFAULT NULL,
	cd int(11) DEFAULT NULL,
	publish varchar(50) DEFAULT NULL,
	book_classify_id int(11) DEFAULT NULL,
	account int(11) DEFAULT NULL,
	isbn varchar(50) DEFAULT NULL,
	create_time datetime DEFAULT NULL,
	remark varchar(255) DEFAULT NULL,
	PRIMARY KEY (id))
ENGINE = INNODB DEFAULT CHARSET = utf8;

/*6、创建图书分类表*/
DROP TABLE IF EXISTS  book_classify;
CREATE TABLE book_classify(
	id int(11) NOT NULL,
	book_classify_name varchar(255) DEFAULT NULL,
	father_id int(11) DEFAULT NULL,
	create_time datetime DEFAULT NULL,
	PRIMARY KEY (id))
ENGINE = INNODB DEFAULT CHARSET = utf8;

/*7、创建图书借阅表*/
DROP TABLE IF EXISTS book_borrow;
CREATE TABLE book_borrow (
	id int(11) NOT NULL,
	book_id int(11) NOT NULL,
	user_id int(11) NOT NULL,
	borrow_time date DEFAULT NULL,
	return_time date DEFAULT NULL,
	create_time datetime DEFAULT NULL,
	remark varchar(255) DEFAULT NULL,
	PRIMARY KEY(id))
ENGINE = INNODB DEFAULT CHARSET = utf8;

/*8、创建还书表book_return*/
DROP TABLE IF EXISTS book_return;
CREATE TABLE book_return(
	id int(11) NOT NULL,
	borrow_id int(11) DEFAULT NULL,
	return_time date DEFAULT NULL,
	create_time datetime DEFAULT NULL,
	remark varchar(255) DEFAULT NULL,
	PRIMARY KEY (id))
ENGINE = INNODB DEFAULT CHARSET = utf8;

/*9、创建图书预约表book_appoint*/
DROP TABLE IF EXISTS book_appoint;
CREATE TABLE book_appoint(
	id int(11) NOT NULL,
	book_id int(11) DEFAULT NULL,
	user_id int(11) DEFAULT NULL,
	appoint_time date DEFAULT NULL,
	create_time datetime DEFAULT NULL,
	remark varchar(255) DEFAULT NULL,
	PRIMARY KEY(id))
ENGINE = INNODB DEFAULT CHARSET = utf8;


/*10、创建图书遗失表*/
DROP TABLE IF EXISTS book_lose;
CREATE TABLE book_lose(
	id int(11) NOT NULL,
	borrow_id int(11) DEFAULT NULL,
	create_time datetime DEFAULT NULL,
	remark varchar(255) DEFAULT NULL,
	PRIMARY KEY (id))
ENGINE = INNODB DEFAULT CHARSET = utf8;



/*初始化数据*/

/*1、插入数据到用户表user*/
INSERT INTO user 
VALUES(1,'小刚','1985-05-25','230822111122223333','xiaogang','123456','1521111222',NULL,1,1),
			(2,'小影','1989-02-19','101211111222233333','xiaoying','123456','138111122222',NULL,1,1),
			(3,'大梅','1989-06-01','23788111122223333','daemi','123456','13811112222',NULL,2,2),
			(4,'admin','1988-03-25','23457111122223333','admin','123456','15122223333',NULL,3,3);

SELECT * FROM user;

/*2、插入数据到角色表role*/
INSERT INTO role 
VALUES 	(1,'普通用户',NULL),
				(2,'图书管理员',NULL),
				(3,'系统管理员',NULL);
				
SELECT * FROM role;

/*3、插入数据到部门表dept*/
INSERT INTO dept
VALUES 	(1,'行政部','2020-06-03'),
				(2,'后勤部','2020-06-03'),
				(3,'运维部','2020-06-03');
				
SELECT * FROM dept;

/*4、插入数据到图书表*/
INSERT INTO book 
VALUES 	(1,'微信小程序开发图解教程','刘刚','59.80',1,'人民邮电出版社',3,1000,9787115450456,'2020-06-10 14:20:56',NULL),
				(2,'Axure PR8 原型设计图解视频教程Web+App','刘刚','79.80',1,'人民邮电出版社',3,2000,9787115445131,'2020-06-03 14:26:36',NULL),
				(3,'军事小百科','张柏赫','76.80',1,'吉林出版社',1,500,9787553478203,'2020-06-03 14:28:52',NULL),
				(4,'牛奶可乐经济学','罗伯特','49.90',1,'北京联合出版社',2,500,9787550292505,'2020-06-03 14:34:17',NULL);

SELECT * FROM book;

/*5、插入数据到图书借阅表book_borrow*/
INSERT INTO book_borrow 
VALUES 	(1,1,2,'2020-04-01','2020-06-03','2020-04-01 14:35:29',NULL),
				(2,2,1,'2020-05-14','2020-07-14','2020-05-14 14:36:37',NULL),
				(3,4,2,'2020-05-01','2020-05-30','2020-05-01 14:41:18',NULL);
				
SELECT * FROM book_borrow;

/*6、插入数据到图书分类表book_classify*/
INSERT INTO book_classify 
VALUES (1,'E军事',0,'2020-06-03 14:23:05'),
			 (2,'F经济',0,'2020-06-03 14:23:35'),
			 (3,'T工业技术',0,'2020-06-03 14:24:16');

SELECT * FROM book_classify;

/*7、插入数据到图书预约表book_appoint*/
INSERT INTO book_appoint 
VALUES 	(1,1,2,'2020-03-30','2020-03-30 14:37:40',NULL),
				(2,2,1,'2020-05-10','2020-05-10 14:38:31',NULL);
				
SELECT * FROM book_appoint;


/*8、插入数据到还书表book_return*/
INSERT INTO book_return
VALUES 	(1,1,'2020-06-03','2020-06-03 14:39:30',NULL),
				(2,2,'2020-06-14','2020-06-14 14:40:12',NULL);
				
SELECT * FROM book_return;

/*9、插入数据到图书遗失表book_lose*/
INSERT INTO book_lose VALUES(1,3,'2020-05-30 14:41:38',NULL);
SELECT * FROM book_lose;


/*1 用户信息管理*/

/*1.1 新增一个借阅图书的用户小红，隶属行政部，角色是普通用户*/
INSERT INTO user 
VALUES (5,'小红','1985-06-27','101201111122223333','xiaohong','123456','15211112222',NULL,1,1);

/*1.2 修改用户小红的部门，修改成运维部*/
UPDATE user SET dept_id = 2 WHERE login_name = 'xiaohong';

/*1.3 查询用户小红的姓名、登录名、部门名称、角色名称*/
SELECT u.user_name,u.login_name,d.dept_name,r.role_name FROM user u,dept d ,role r where u.dept_id = d.id AND 
u.role_id = r.id AND u.login_name = 'xiaohong';

/*1.4 删除用户小红*/
DELETE FROM user WHERE login_name = 'xiaohong';



/*2 部门管理*/
/*2.1 新增一个办公室部门 */
INSERT INTO dept VALUES (4,'办公室','2020-06-08');
/*2.2 查询所有部门*/
SELECT * FROM dept;


/*3 图书管理*/

/*3.1 新增图书分类*/
INSERT INTO book_classify VALUES (4,'R 医药、卫生',0,'2020-06-08 14:23:05');
SELECT * FROM book_classify;

/*3.2 新增图书*/
INSERT INTO book VALUES(5,'疑难杂病临证手册','余孟学',158,1,'河南科技出版社',4,1000,9787534989230,'2020-06-22 18:20:56',NULL);

/*查询所有图书的图书名称、作者、图书定价、出版社、图书分类名称、图书总数量*/
SELECT b.book_name,b.author,b.price,b.publish,c.book_classify_name,b.account FROM book b,book_classify c 
WHERE b.book_classify_id = c.id;

/*4 借书管理*/
/*4.1 借书预约登记*/
INSERT INTO book_appoint VALUES(3,2,2,'2020-04-03','2020-04-03 14:37:40',NULL);
/*查询用户小影的借书预约记录，包括用户姓名、借阅图书名称、作者、图书总数量、预约登记时间*/
SELECT u.user_name,b.book_name,w.borrow_time,l.create_time FROM user u,book b,book_borrow w,book_lose l 
WHERE w.book_id = b.id AND w.user_id = u.id AND w.id = l.borrow_id;

/*4.2 借书登记*/
INSERT INTO book_borrow VALUES(4,2,2,'2020-06-01','2020-08-01','2020-06-01 14:35:29',NULL);
/*查询用户小影的借书记录，包括用户姓名、借阅图书名称、出版社、借书时间、归还时间*/
SELECT u.user_name,b.book_name,b.publish,w.borrow_time,w.return_time 
FROM user u,book b,book_borrow w 
WHERE w.book_id = b.id AND w.user_id = u.id AND u.login_name = 'xiaoying';

/*4.3 还书登记*/
INSERT INTO book_return VALUES(3,4,'2020-07-03','2020-07-30 14:40:12',NULL);
/*查询用户小影的还书记录，包括用户姓名、借阅图书记录、借阅图书名称、借书时间、还书时间*/
SELECT u.user_name,b.book_name,w.borrow_time,r.return_time FROM user u,book b,book_borrow w,book_return r 
WHERE w.book_id = b.id AND w.user_id = u.id AND w.id = r.borrow_id AND u.login_name = 'xiaoying';

/*4.4 图书遗失登记*/
INSERT INTO book_lose VALUES(3,2,'2020-08-01 14:41:38',NULL);
/*查询图书遗失记录，包括用户姓名、借阅、书籍名称、借阅时间、遗失登记时间*/
SELECT u.user_name,b.book_name,b.author,b.account,a.appoint_time FROM user u ,book b,book_appoint a 
WHERE a.book_id = b.id AND a.user_id = u.id AND u.login_name = 'xiaoying';

/*5视图管理*/
/*5.1用户信息查询视图：
针对用户表user、部门表dept、角色表role建立一个用户信息查询视图user_info_view,查询用户编号、姓名、登录名称、部门名称、角色名称*/
CREATE OR REPLACE VIEW user_info_view AS
SELECT u.id,u.user_name,u.login_name,d.dept_name,r.role_name FROM user u,dept d,role r
WHERE u.dept_id = d.id AND u.role_id = r.id;
/*查看视图内容*/
SELECT * FROM user_info_view;

/*5.2 用户借阅图书查询视图：
针对用户表user、图书表book、图书借阅表book_borrow建立一个用户借阅图书信息查询视图user_book_borrow_view,查询用户编号、登记名称、姓名、图书名称、出版社、借阅时间、归还时间*/
CREATE OR REPLACE VIEW user_book_borrow_view AS 
SELECT u.id,u.login_name,u.user_name,b.book_name,b.publish,w.borrow_time,w.return_time
FROM user u,book b,book_borrow w WHERE w.book_id = b.id AND w.user_id = u.id;

SELECT * FROM user_book_borrow_view;

/*5.3 用户还书查询视图:
针对用户表user、图书表book、图书借阅表book_borrow、还书表book_return建立一个用户还书查询视图user_book_return_view,查询用户编号、登记名称、姓名、图书名称、归还时间*/
CREATE OR REPLACE VIEW user_book_return_view AS 
SELECT u.id,u.login_name,u.user_name,b.book_name,w.borrow_time,r.return_time 
FROM user u,book b,book_borrow w,book_return r 
WHERE w.book_id = b.id AND w.user_id = u.id AND w.id = r.borrow_id;

SELECT * FROM user_book_return_view;

/*小结：
图书管理系统数据库的设计与使用，建立9张数据库表，包括用户表、部门表、图书表、图书借阅表等；然后插入初始化数据；接着进行用户信息管理、图书管理、借书管理等操作；对于多表查询，通过建立视图的方式加快数据库的查询。*/

