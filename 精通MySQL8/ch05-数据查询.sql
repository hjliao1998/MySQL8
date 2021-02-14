use school;
/*创建student表*/
drop tables if exists t_student;
CREATE TABLE t_student(
         stuno INT PRIMARY KEY,
         name VARCHAR(20),
         age INT,
         gender VARCHAR(4));
DESCRIBE t_student;
SELECT age FROM t_student;
SELECT DISTINCT age FROM t_student;
/*创建score表*/
CREATE TABLE s_score( 
         stuid INT(11),
         name VARCHAR(20), 
     Chinese INT(4),
     English INT(4),
     Math INT(4),
    Chemistry INT(4),
    Physics INT(4));
INSERT INTO s_score
       (stuid,name,Chinese,English,Math,Chemistry,Physics)
           VALUES(1001,'Jack Ma',87,94,99,89,91),
                  (1002,'Rebecca Zhang', 76,78,89,80,90),
                  (1003,'Justin Zhou',92,98,99,93,80),
                  (1004,'Jessy Li', 77,67,78,87,88),
                  (1005,'Lucy Wang', 91,78,89,90,91),
                  (1006,'Lily lv', 90,88,92,93,94),
                  (1007,'Tom Cai', 80,98,82,73,84),
                  (1008,'Emily Wang',89,99,78,89,91),
                  (1009,'Betty Ying',90,89,89,90,91),
                  (1010,'Jane Hu',89,98,75,94,89);
SELECT name FROM s_score WHERE stuid IN(1001,1004,1009,1010);

SELECT name,Chinese
	FROM s_score WHERE Chinese BETWEEN 85 AND 90;
SELECT name FROM s_score WHERE name LIKE ‘L%’;
SELECT name,English FROM s_score WHERE English LIKE ‘%9%’;
SELECT stuid,name,Chinese FROM s_score ORDER BY Chinese ASC;
/*自连接*/
drop tables if exists t_student;
CREATE TABLE t_student (
       stuid int(10) DEFAULT NULL,
       name varchar(20) DEFAULT NULL,
			 gender varchar(10) DEFAULT NULL,
age int(4) DEFAULT NULL,
       classno int(11) DEFAULT NULL);
INSERT INTO t_student(stuid,name,gender,age,classno)
        VALUES(1001,'Alicia Florric','Female',33,1),
               (1002,'Kalinda Sharma','Female',31,1),
               (1003,'Cary Agos','Male',27,1),
               (1004,'Diane Lockhart','Female',43,2),
               (1005,'Eli Gold','Male',44,3),
               (1006,'Peter Florric','Male',34,3),
               (1007,'Will Gardner','Male',38,2),
               (1008,'Jacquiline Florriok','Male',38,4),
               (1009,'Zach Florriok','Male',14,4),
               (1010,'Grace Florriok','Male',12,4);
SELECT ts1.stuid,ts1.name,ts1.classno
     FROM t_student AS ts1,t_student AS ts2
WHERE ts1.classno=ts2.classno AND ts2.name='Alicia Florric';
/*等值连接*/
drop tables if exists t_class;
CREATE TABLE t_class (
    	classno int(11) DEFAULT NULL,
    	cname varchar(20) DEFAULT NULL,
    	loc varchar(40) DEFAULT NULL,
    	advisor varchar(20) DEFAULT NULL
    );
		INSERT INTO t_class(classno,cname,loc,advisor)
        VALUES(1,'class_1','loc_1','advisor_1'),
               (2,'class_2','loc_2','advisor_2'),
               (3,'class_3','loc_3','advisor_3'),
               (4,'class_4','loc_4','advisor_4');
SELECT s.stuid,s.name,s.gender,s.age,s.classno,
             c.cname,c.loc,c.advisor
       FROM t_student s,t_class c WHERE s.classno=c.classno;

/*创建奖学金表*/
CREATE TABLE t_scholarship(
       id int(4),
       score int(4),
       level int(4),
       description varchar(20)); 
INSERT INTO t_scholarship VALUES(1,430,3,'三等奖学金'),
    (2,440,2,'二等奖学金'),(3,450,1,'一等奖学金');

SELECT st.stuid,st.name,
    sc.Chinese+sc.English+sc.Math+sc.Chemistry+sc.Physics total
    FROM t_student st, s_score sc WHERE st.stuid=sc.stuid 
       AND st.stuid in (SELECT stuid FROM s_score
          WHERE Chinese+English+Math+Chemistry+Physics>=ANY
            (SELECT score FROM t_scholarship));


 SELECT st.stuid,st.name,
   	sc.Chinese+sc.English+sc.Math+sc.Chemistry+sc.Physics total
       FROM t_student st, s_score sc
       WHERE st.stuid=sc.stuid 
         AND st.stuid in
          (SELECT stuid FROM s_score
             WHERE Chinese+English+Math+Chemistry+Physics>=ALL
                (SELECT score FROM t_scholarship));