use school;
DROP TABLE t_class;
CREATE TABLE t_class (
  	classno INT(11) NOT NULL,
  	cname VARCHAR(20),
  	loc VARCHAR(40),
  	stucount INT(11));
DROP TABLE t_class;
CREATE TABLE t_class (
         classno INT(11) NOT NULL ,
         cname VARCHAR(20) DEFAULT 'class_3',
         loc VARCHAR(40),
      	 advisor varchar(20));
INSERT INTO t_class(classno, cname, loc, advisor)
	     VALUES(1, '高一(2)班','西教学楼3楼','张三');
SELECT * FROM t_class;
INSERT INTO t_class(classno,cname, loc)
   VALUES(2,'高一(8)班','西教学楼4楼');
SELECT * from t_class;
/*创建t_json表*/
DROP TABLE t_json;
CREATE TABLE t_json (
id INT NOT NULL AUTO_INCREMENT,
json_col JSON, 
PRIMARY KEY(id) );
INSERT INTO t_json(json_col) VALUES ('{"name": "Zhangsan", "sex": 				"男"}');
SELECT * from t_json;


update t_json
set json_col=JSON_REPLACE(json_col,'$.sex','女')
Where id =1;
SELECT * from t_json;

DELETE FROM t_class WHERE cname=’class_3’;/*报错，没有class_3*/
SELECT * FROM t_class;