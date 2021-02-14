/*删除库*/ DROP DATABASE datatype;
/*创建库，如已存在可忽略*/
CREATE DATABASE datatype CHARACTER SET utf8 COLLATE utf8_general_ci; 
SHOW DATABASES; 
USE  datatype; 
/*创建整数类型表*/
CREATE TABLE int_example(
int_value INTEGER);
insert into int_example values(0),(-3),(6.1),(214783647),(-214783648);
select * from int_example;
/*创建浮点类型表*/
CREATE TABLE fdd_example(
a float(10,5),
b double(10,5),
c decimal(10,5));
insert into fdd_example values(12345.00001,12345.00001,12345.00001);
select * from fdd_example;
/*创建时间类型表*/
CREATE TABLE dt_example(
e_date DATE,
e_datetime DATETIME,
e_timestamp TIMESTAMP,
e_time TIME,
e_year YEAR);
/*插入数据*/
 insert into dt_example values(CURDATE(),NOW(),NOW(),time(NOW()),YEAR(NOW()));
/*查看数据*/
select * from dt_example;

CREATE TABLE movie_char(
id INT,
name VARCHAR(10));
insert into movie_char values(1,'战狼2'),(2,'地球神奇的一天'),(3,'三生三世十里桃林起');
insert into movie_char values(1,'战狼2'),(2,'地球神奇的一天'),(3,'三生三世十里桃林');
/*插入json值*/
CREATE TABLE json_example(
jdoc JSON
);
INSERT INTO json_example VALUES('{"key1": "json_value1", "key2": "json_value2"}');

/*合并函数*/
SELECT JSON_MERGE_PATCH('[1, 2]', '[true, false]');
SELECT JSON_MERGE_PATCH('[1, 2]', '{"id": 47}');
SELECT JSON_MERGE_PATCH('{ "a": 1, "b":2 }','{ "a": 3, "c":4 }','{ "b": null, "d":6 }');
/*聚合函数*/
create table json_arrayagg_example(
o_id int,
attribute varchar(20),
value varchar(20));
insert into json_arrayagg_example values(2,'color','red'),(2,'fabric','silk'),(3,'color','green'),(3,'shape','square');
select o_id,attribute,value from json_arrayagg_example;
select o_id,JSON_ARRAYAGG(attribute) from json_arrayagg_example group by o_id;
/*查看权重*/
SELECT HEX(WEIGHT_STRING('AaBb' COLLATE gbk_chinese_ci));
SELECT WEIGHT_STRING(BINARY 'AaBb');

/*创建库，如已存在可忽略*/
CREATE DATABASE school CHARACTER SET utf8 COLLATE utf8_general_ci; 
SHOW DATABASES; 
 USE school; 
/*创建t_class表*/
use school;
CREATE TABLE t_class(
		classno INT,
        cname VARCHAR(20),
        loc VARCHAR(40),
        stucount INT);
/*创建t_json表*/
CREATE TABLE t_json (
id INT NOT NULL AUTO_INCREMENT,
json_col JSON, 
PRIMARY KEY(id) );
DROP TABLE t_class;
ALTER TABLE t_class RENAME tab_class;
ALTER TABLE t_class ADD advisor VARCHAR(20);
ALTER TABLE t_class DROP advisor;
ALTER TABLE t_class ADD advisor VARCHAR(20) FIRST;
ALTER TABLE t_class DROP advisor;
ALTER TABLE t_class ADD advisor VARCHAR(20) AFTER cname;
ALTER TABLE t_class DROP advisor;
ALTER TABLE t_class DROP cname;
DROP TABLE t_class;
CREATE TABLE t_class (
  	classno INT(11) NOT NULL,
  	cname VARCHAR(20),
  	loc VARCHAR(40),
  	stucount INT(11));
DROP TABLE t_class;
CREATE TABLE t_class (
         classno INT(11) NOT NULL,
         cname VARCHAR(20) DEFAULT 'class_3',
         loc VARCHAR(40),
      	 stucount INT(11));

CREATE TABLE t_class (
        classno INT(11) NOT NULL,
        cname VARCHAR(20) UNIQUE,
      	loc VARCHAR(40),
      	stucount INT(11));

CREATE TABLE t_student(
         stuno INT PRIMARY KEY,
         sname VARCHAR(20),
         sage INT,
         sgender VARCHAR(4));
DESCRIBE t_student;
INSERT INTO t_student VALUES(1,'Justin',20,'m');
INSERT INTO t_student values(2,'rebecca',32,'f');

CREATE TABLE t_student_pk(
   stuno INT,
   sname VARCHAR(20),
   sage INT(11),
   sgender VARCHAR(4),
   CONSTRAINT pk_stuno PRIMARY KEY(stuno));
DESC t_student_pk;

CREATE TABLE t_student_m_pk(
         stuno INT,
         sname VARCHAR(20),
         sage INT(10),
         sgender VARCHAR(4),
         CONSTRAINT pk_stuno_sname PRIMARY KEY(stuno, sname));
    DESC t_student_m_pk;
   
INSERT INTO t_student values(1,'rebecca',32,'f');
INSERT INTO t_student values(2,'rebecca',12,'f');
INSERT INTO t_student values(1,jack,12,'f');
INSERT INTO t_student values(1,'rebecca',12,'f');