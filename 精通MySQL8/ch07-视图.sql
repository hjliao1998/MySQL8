CREATE DATABASE company;
USE company;
/*创建雇员表*/
CREATE TABLE t_employee(
       id INT(4),
       name VARCHAR(20),
       gender VARCHAR(6),
       age INT(4),
       salary INT(6),
deptno INT(4)
    );
/*插入数据*/
INSERT INTO t_employee(id,name,gender,age,salary,deptno)
       VALUES(1001,'Alicia Florric','Female',33,10000,1),
              (1002,'Kalinda Sharma','Female',31,9000,1),
              (1003,'Cary Agos','Male',27,8000,1),
              (1004,'Eli Gold','Male',44,20000,2),
              (1005,'Peter Florric','Male',34,30000,2),
              (1006,'Diane Lockhart','Female',43,50000,3),
              (1007,'Maia Rindell','Female',43,9000,3),
              (1008,'Will Gardner','Male',36,50000,3),
              (1009,'Jacquiline Florric','Female',57,9000,4),
              (1010,'Zach Florric','Female',17,5000,5),
              (1011,'Grace Florric','Female',14,4000,5);

SELECT * FROM t_employee;
/*创建视图*/
CREATE VIEW view_selectemployee AS 
        SELECT id,name,gender,age,deptno FROM t_employee;

DESCRIBE view_selectemployee;
SELECT * FROM view_selectemployee;

/*创建部门表*/
CREATE TABLE t_dept(
       deptno int(4),
       deptname varchar(20),
       product varchar(20),
       location varchar(20));

/*创建多表视图*/
CREATE ALGORITHM=MERGE VIEW
       view_dept_employee(name,dept,gender,age,loc)
       AS SELECT name,t_dept.deptname,gender,age,t_dept.location
  FROM t_employee, t_dept WHERE t_employee.deptno=t_dept.deptno
       WITH LOCAL CHECK OPTION;

/*在视图表中查看视图信息*/
SELECT * FROM views WHERE table_name=’view_selectemployee’ \G;

/*修改视图*/
CREATE OR REPLACE VIEW view_selectemployee
AS SELECT id,name,gender,age,deptno 
      FROM t_employee;
SELECT * FROM view_selectemployee;
/*修改视图*/
ALTER VIEW view_selectemployee
   AS SELECT name,gender,age,deptno FROM t_employee;
/*更新视图*/
UPDATE view_selectdept 
SET name='hr_department',
     product='hr_system',loc='east_10';

DELETE FROM view_selectdept 
       WHERE name='hr department';
/*不能更新的视图*/
CREATE VIEW view_1(name,product,loc,total)
       AS SELECT deptname,product,location,count(deptname) 
     FROM t_dept;
CREATE VIEW view_2(name,product,loc)
  	   AS SELECT deptname,product,location 
          FROM t_dept GROUP BY deptno;
CREATE VIEW view_3 AS SELECT 'Rebecca' AS name;
CREATE VIEW view_4(name)
        AS SELECT (SELECT deptname FROM t_dept WHERE deptno=1);
CREATE VIEW view_5 AS SELECT * FROM view_4;
CREATE ALGORITHM=TEMPLATE VIEW view_6 
    AS SELECT * FROM t_dept;
