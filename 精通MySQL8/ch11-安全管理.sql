/*备份*/
mysqldump -uroot -p school>c:\sqls\school.sql

mysqldump -uroot -p school t_class>
       C:\sqls\t_class.sql

mysqldump -uroot -p --databases school company > 
    C:\sqls\two_database.sql

mysqldump -uroot -p –-all-databases>
C:\sqls\all.sql
/*恢复*/
mysql –u root –p < c:\sqls\all.sql

/*表的导入导出*/
USE school;
SELECT * FROM t_class;
SELECT * FROM t_class INTO OUTFILE "c:/sqls/class.txt";
SHOW GLOBAL VARIABLES LIKE '%secure%';
SELECT * FROM t_class INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/class.txt";
mysqldump -uroot -p -T 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/" school t_class

mysqldump -uroot -p -T 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/"
school t_class 
--fields-terminated-by=, --fields-optionally-enclosed-by=\" 

 mysql -uroot -p --execute="SELECT * FROM t_class;" school> "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class.txt"

 mysql -uroot -p --vertical --execute="SELECT * FROM t_class;" school > 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class_1.txt"

mysql -uroot -p --html --execute="SELECT * FROM t_class;" school > 
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class_2.html"

mysql -uroot -p --xml--execute="SELECT * FROM t_class;" school> "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class_3.xml"

SELECT * FROM school.t_class
   INTO OUTFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class0.txt';

DELETE FROM school.t_class;
SELECT * FROM t_class;

LOAD DATA INFILE 
   'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class0.txt'
   INTO TABLE school.t_class;

SELECT * FROM school.t_class 
INTO OUTFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class1.txt'
FIELDS 
TERMINATED BY ','
ENCLOSED BY '\"';

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class1.txt'
		INTO TABLE school.t_class
		FIELDS
	TERMINATED BY ','
ENCLOSED BY '\"';

mysqlimport -uroot -p school 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/t_class.txt'
 --fields-terminated-by=, --fields-optionally-enclosed-by=\"

