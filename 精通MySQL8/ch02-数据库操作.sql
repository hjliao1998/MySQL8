SHOW DATABASES;
CREATE DATABASE test;
USE test;
DROP DATABASE test;
SHOW ENGINES ;
SHOW VARIABLES LIKE 'have%';

SET DEFAULT_STORAGE_ENGINE = MyISAM;
SHOW VARIABLES LIKE '%storage_engine%';