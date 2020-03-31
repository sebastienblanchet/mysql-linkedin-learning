-- field: column
-- each row in table has unique key
-- if a colum is used as key ==> primary key
-- foreign keys ==> refered to IDs of other table, used for joined queries

-- 03 Selecting Rows
USE world;
SELECT 'Hello, World';
SELECT 1 + 2;

-- all rows from all colum country
SELECT * FROM Country;

-- order is specified
SELECT * FROM Country ORDER BY Name;

SELECT Name, LifeExpectancy FROM Country ORDER BY Name;
-- AS clause is for an alias
SELECT Name, LifeExpectancy AS "Life Expectancy" FROM Country ORDER BY Name;
-- COUNT returns the number results
SELECT COUNT(*) FROM Country;
-- LIMIT does what you think
SELECT * FROM Country ORDER BY Name LIMIT 5;
-- LIMIT {OFFSET}, {NEXT OFFSET}
SELECT * FROM Country ORDER BY Name LIMIT 5, 5;
SELECT * FROM Country ORDER BY Name LIMIT 10, 5;

-- 04 Selecting Columns

USE world;
-- wildcard * ALL cols
SELECT * FROM Country ORDER BY Code;
-- limit cols to run query
SELECT Name, Code, Region, Population FROM Country ORDER BY Code;
-- AS is alias
SELECT Name AS Country, Code AS ISO, Region, Population AS Pop FROM Country ORDER BY Code;

-- 05 Counting Rows
USE world;
-- as per previou
SELECT COUNT(*) FROM Country;
-- WHERE clause is a checks where rows meet condition
SELECT COUNT(*) FROM Country WHERE Population > 1000000;
SELECT COUNT(*) FROM Country WHERE Population > 100000000;
SELECT COUNT(*) FROM Country WHERE Population > 100000000 AND Continent = 'Europe' ;
SELECT COUNT(*) FROM Country;
-- ONLY counts the rows where LifeExpectancy has data i.e. not empty
SELECT COUNT(LifeExpectancy) FROM Country;


-- 06 Inserting Data

USE scratch;
SELECT * FROM customer;
-- creating a new row in table
INSERT INTO customer (name, address, city, state, zip) VALUES ('Fred Flintstone', '123 Cobblestone Way', 'Bedrock', 'CA', '91234');
-- did not specify all values, null is inserted into unspecified files
INSERT INTO customer (name, city, state) VALUES ('Jimi Hendrix', 'Renton', 'WA');
SELECT * FROM customer;


-- 07 Updating Data

USE scratch;
SELECT * FROM customer;
-- LIKE clause is similar to REGEX, wildcard %
SELECT * FROM customer WHERE name LIKE 'Jimi%';
-- Now we update the Jimi%
UPDATE customer SET address = '123 Music Avenue', zip = '98056' WHERE name LIKE 'Jimi%';
-- update again
UPDATE customer SET address = '987 Mockingbird Lane' WHERE name LIKE 'Jimi%';
UPDATE customer SET address = NULL, zip = NULL WHERE name LIKE 'Jimi%';


-- 08 Deleting Data

USE scratch;

-- create some bs db
CREATE TABLE test ( a INT, b VARCHAR(16), c VARCHAR(16) );
INSERT INTO test VALUES ( 1, 'this', 'right here!' );
INSERT INTO test VALUES ( 2, 'that', 'over there!' );
INSERT INTO test VALUES ( 3, 'another', 'nowhere.' );
INSERT INTO test VALUES ( 4, 'again', 'guess where?' );
INSERT INTO test VALUES ( 1, 'one more', 'everywhere!' );

-- start deleting some stuff
SELECT * FROM test;
-- specific ID
DELETE FROM test WHERE a = 2;
DELETE FROM test WHERE a = 1;
-- deletes everything
DELETE FROM test;
SELECT * FROM test;

-- removes the db test
DROP TABLE test;

-- go back and delete those added rows ^^
SELECT * FROM customer;
SELECT * FROM customer WHERE name LIKE 'Jimi%' OR name LIKE 'Fred%';
DELETE FROM customer WHERE name LIKE 'Jimi%' OR name LIKE 'Fred%';
SELECT * FROM customer;


-- 09 Joining queries

USE album;
-- each album has track table
SELECT * FROM album;
SELECT * FROM track;

-- join those two select *
SELECT a.artist AS Artist, a.title AS Album, t.track_number AS 'Track Num',
    t.title AS Track, t.duration AS Seconds
  FROM album AS a
  -- THIS IS THE POWER OF RELATIONAL DATABASES
  JOIN track AS t ON a.id = t.album_id
  ORDER BY a.artist, a.title, t.track_number;


-- 10 Finding databases, tables, and columns

USE scratch;
-- available dbs in server
SHOW databases;
-- available tables in server
SHOW tables;
-- lsit cols in table
DESCRIBE item;

