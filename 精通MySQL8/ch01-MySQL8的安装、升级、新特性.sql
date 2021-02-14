/* 删除数据库*/ DROP DATABASE school;
/*创建数据库并使用utf8格式*/ CREATE DATABASE school CHARACTER SET utf8; 
/*显示数据库*/ SHOW DATABASES; 
/*使用数据库*/ USE school; 
/*建表*/ CREATE TABLE school.t_class ( classno INT NOT NULL, cname VARCHAR(20), loc VARCHAR(20), student INT, PRIMARY KEY (classno) ); 
/*显示数据库下的表属性*/ SHOW TABLE STATUS FROM school LIKE 't_class'; 
/*显示数据表*/ SHOW FULL FIELDS FROM school.t_class; 
/*显示创建的数据表*/ SHOW CREATE TABLE school.t_class; 
/*删除表*/ DROP TABLE t_class; 
/*描述表（不存在该表会报错）*/ DESCRIBE t_class; /*[Error Code 1146: Table 'school.t_class' doesn't exist]*/ 
/*创建表*/ CREATE TABLE school.t_class ( classno INT NOT NULL, cname VARCHAR(20), loc VARCHAR(20), student INT, PRIMARY KEY (classno) ); 
/*描述表*/ DESCRIBE school.t_class; 
/*插入一行信息*/ INSERT INTO school.t_class (classno, cname, loc, student) VALUES (1, 'class_1', 'loc_1', 20); 
/*插入信息*/ INSERT INTO school.t_class (classno, cname, loc, student) VALUES (2, 'class_2', 'loc_2', 40); 
/*指定信息修改*/ UPDATE school.t_class SET loc = 'loc_2new' WHERE classno = 2; 

/*删除指定信息*/ DELETE FROM school.t_class WHERE classno = 2; 
drop table t_class;/*删除表方便后续学习*/