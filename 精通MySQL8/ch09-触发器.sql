use company;

CREATE TABLE t_logger(
   lid int(11),
       tablename varchar(20),
       ltime datetime);
DROP TRIGGER loggertime;
CREATE TRIGGER loggertime
       BEFORE INSERT ON t_dept FOR EACH ROW
             INSERT INTO t_logger VALUES(NULL, 't_dept', now());

INSERT INTO t_dept VALUES(1,'HR','pivot_gaea','west_3');
SELECT * FROM t_dept;
SELECT * FROM t_logger;


DELIMITER $$
CREATE TRIGGER tri_loggertime2
  AFTER INSERT
        ON t_dept FOR EACH ROW
          BEGIN
            INSERT INTO t_logger VALUES(NULL,'t_dept',now());
            INSERT INTO t_logger VALUES(NULL,'t_dept',now());
          END;
          $$
DELIMITER ;

INSERT INTO t_dept VALUES(2,'test deptment','sky','east_4');
SELECT * FROM t_logger;

SHOW TRIGGERS ;
DROP TRIGGER tri_loggertime2;
DROP TRIGGER longertime;
DROP TRIGGER  loggertime;
