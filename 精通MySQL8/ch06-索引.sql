use school;
drop tables if exists t_class;
CREATE TABLE t_class(
       classno INT(4),
       cname VARCHAR(20),
loc VARCHAR(40),
INDEX index_classno(classno));
SHOW CREATE TABLE t_class ;
EXPLAIN SELECT * FROM t_class WHERE classno=1;

drop table t_class;
CREATE TABLE t_class(
       classno INT(4),
       cname VARCHAR(20),
loc VARCHAR(40),
UNIQUE INDEX index_classno(classno));
SHOW CREATE TABLE t_class ;

drop table t_class;
CREATE TABLE t_class(
       classno INT(4),
       cname VARCHAR(20),
loc VARCHAR(40),
FULLINDEX INDEX index_loc(loc));
SHOW CREATE TABLE t_class ;
EXPLAIN SELECT * FROM t_class WHERE cname=’beijing’ ;

drop table t_class;
CREATE TABLE t_class(
       classno INT(4),
       cname VARCHAR(20),
loc VARCHAR(40),
       INDEX index_cname(cname) INVISIBLE);
SHOW CREATE TABLE t_class ;


drop table t_class;
CREATE TABLE t_class(
       classno INT(4),
       cname VARCHAR(20),
loc VARCHAR(40),
       INDEX index_classno_cname_desc(classno ASC,cname DESC));