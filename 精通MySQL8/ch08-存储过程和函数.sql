use company;
/*先将这个关键字的结束语设置成$$*/ DELIMITER $$
/*创建存储过程*/
    CREATE PROCEDURE proc_employee()
    COMMENT'查询某个员工的薪水'
    BEGIN
       SELECT salary
       FROM t_employee;
       
    END;
    $$
/*将结束语设置回分号*/  DELIMITER ;
SHOW PROCEDURE STATUS LIKE 'proc_employee' ;
/* 调用存储过程*/CALL proc_employee();
/*删除存储过程*/drop procedure proc_employee_sp;
DELIMITER $$
CREATE PROCEDURE proc_employee_sp(IN empid INT,OUT sal INT)
COMMENT '查询某个员工的薪水'
BEGIN
	SELECT salary
	FROM t_employee
	WHERE id = empid;
END;
$$
DELIMITER ;
call proc_employee_sp(1001,@n);

ALTER PROCEDURE proc_employee
   MODIFIES SQL DATA SQL SECURITY INVOKER;
	 
SELECT specific_name,sql_data_access,security_type
    FROM information_schema.Routines
    WHERE routine_name = 'proc_employee';
		
drop procedure proc_employee;

------------------------------------------------------------
-----------------------------------------------------------------------
use company;
show variables like 'log_bin_trust_function_creators';
set global log_bin_trust_function_creators = 1;

/*先将这个关键字的结束语设置成$$*/ DELIMITER $$
/*创建存储过程*/
    CREATE FUNCTION func_employee(id INT(4))
       RETURNS INT(6)
    COMMENT'查询某个员工的薪水'
    BEGIN
       RETURN (SELECT salary
         FROM t_employee
         WHERE t_employee.id=id);
    END;
    $$

/*将结束语设置回分号*/  DELIMITER ;
/*筛选编号1002的薪资*/ SELECT func_employee(1002);

/*修改权限*/ ALTER FUNCTION func_employee READS SQL DATA COMMENT 'FIND NAME';

SELECT specific_name,sql_data_access ,security_type
FROM information_schema.Routines
WHERE routine_name = 'func_employee';
----------------------------------------------------------------------
SELECT id INTO test_sql
         FROM t_employee WEHRE id=3;
//方法一：使用sqlstate_value
DECLARE can_not_find CONDITION FOR SQLSTATE '42S02';
//方法二：使用mysql_error_code
DECLARE can_not_find CONDITION FOR 1146;
//方法一：捕获sqlstate_value
DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' 
SET @info=’NOT FOUND’;
//方法二：使用mysql_error_code
DECLARE CONTINUE HANDLER FOR 1146 SET @info='NOT FOUND';
//方法三：先定义条件，然后调用
DECLARE not_found CONDITION FOR 1146;
DECLARE CONTINUE HANDLER FOR not_found SET @info='NOT FOUND';
//方法四：使用SQLWARNING
DECLARE EXIT HANDLER FOR SQLWARNING SET @info='ERROR';
//方法五：使用NOT FOUND
DECLARE EXIT HANDLER FOR NOT FOUND SET @info='NOT FOUND';
//方法六：使用SQLEXCEPTION
DECLARE EXIT HANDLER FOR SQLEXCEPTION SET @info='ERROR';

IF age>20 THEN SET @count1=@count1+1;
   ELSEIF age=20 THEN @count2=@count2+1;
   ELSE @count3=@count3+1;
END IF;

CASE age
    WHEN 20 THEN SET @count1=@count1+1;
    ELSE SET @count2=@count2+1;
END CASE;

add_num:LOOP
    SET @count=@count+1;
    IF @count=100 THEN
         LEAVE add_num;
END LOOP add_num;

add_num:LOOP
    SET @count=@count+1;
    IF @count=100 THEN
         LEAVE add_num;
    ELSE IF MOD（@count,3）=0 THEN
         ITERATE add_num;
    SELECT * FROM employee;
END LOOP add_num;

DELIMITER $$
    CREATE PROCEDURE proc_employee_sp(IN empid INT, OUT sal INT)
    COMMENT'查询某个员工薪水'
    BEGIN
    SELECT salary
        FROM t_employee
        WHERE id=empid;
END;
$$
DELIMITER ;
CALL proc_employee_sp(1001,@n);


DELIMITER $$
    CREATE FUNCTION func_employee_sp(id INT)
       RETURNS INT
    BEGIN
       RETURN (SELECT salary
          FROM t_employee
       WHERE t_employee.id=id);
    END;
    $$
    DELIMITER ;
SELECT func_employee(1002);


SELECT * FROM information_schema.Routines 
     WHERE ROUTINE_NAME='proc_employee' \G;

ALTER PROCEDURE proc_employee
       MODIFIES SQL DATA SQL SECURITY INVOKER;

SELECT specific_name,sql_data_access,security_type 
       FROM information_schema.Routines 
     WHERE routine_name='proc_employee';

SELECT specific_name,sql_data_access,routine_comment
       FROM information_schema.routines
           WHERE routine_name='func_employee';