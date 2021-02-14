CREATE DATABASE test;
USE test;

CREATE TABLE test_1(
       id INT,
   username VARCHAR(20)
)ENGINE=InnoDB;

INSERT INTO test_1 
VALUES(1,'Rebecca'), 
       (2,'Jack'), 
       (3,'Emily'), 
       (4,'Water');

BEGIN;
UPDATE test_1 SET username=’Selina’ WHERE id=1;
COMMIT；
SELECT * FROM test_1;




