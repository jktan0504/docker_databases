--
-- Create a database using `MYSQL_DATABASE` placeholder ==> refer from .env
--
CREATE DATABASE IF NOT EXISTS `MYSQL_DATABASE`;

--
-- SHOW DATABASES
--
SHOW DATABASES;

--
-- DROP DATABASE
--
DROP DATABASE IF EXISTS `MYSQL_DATABASE`;

--
-- USE DATABASE TO DEFINE THE DATABASE 
--
USE `MYSQL_DATABASE`;


--
-- VARIABLE TYPES
--
-- INT
-- DECIMAL(m,n) m == total number of m , total number of n
-- VARCHAR(n) n == number of text
-- BLOB == binary larage object (image. video, file)
-- DATE == YYYY-MM-DD
-- TIMESTAMP == record datetime

--
-- CREATE TABLE
--
CREATE TABLE `student`(
    `student_id` INT,
    `name` VARCHAR(26),
    `major` VARCHAR(20),
    PRIMARY KEY(`student_id`)
);

--
-- Checking Existing TABLE - how it looks like
--
DESCRIBE `student`;

--
-- DROP TABLE
--
DROP TABLE `student`;

--
-- Alter /Edit Existing TABLE
--
ALTER TABLE `student` ADD gpa DECIMALS(3,2);
ALTER TABLE `student` DROP COLUMN gpa;

--
-- INSERT RECORD INTO TABLE
--
INSERT INTO `student` VALUES(1, "JK", "IT");
INSERT INTO `student`(`name`, `major`,`student_id`) VALUES("NP", "HR", 2);

--
-- LIST ALL RECORDS of TABLE
--
SELECT * FROM `student`;

--
-- CONSTRAIT or LIMIT 限制
-- NOT NULL | UNIQUE | LANGUAGE | AUTO_INCREMENT
CREATE TABLE `teacher`(
    `teacher_id` INT AUTO_INCREMENT,
    `name` VARCHAR(26) NOT NULL,
    `major` VARCHAR(20) DEFAULT "LANGUAGE",
    PRIMARY KEY(`teacher_id`)
);

--
-- TURN OFF SQL_SAFE_UPDATES
-- 
SET SQL_SAFE_UPDATES = 0;

--
-- CREATE TABLE DRIVER
--
CREATE TABLE `driver`(
    `driver_id` INT AUTO_INCREMENT,
    `name` VARCHAR(26),
    `major` VARCHAR(20),
    `score` INT,
    PRIMARY KEY(`driver_id`)
);

--
-- UPDATE DATA
--
UPDATE `driver` SET `major` = "ENG" WHERE `major` = "ENGLISH";
UPDATE `driver` SET `major` = "ENG" WHERE `driver_id` = 3;
UPDATE `driver` SET `major` = "COACH" WHERE `major` = "traffic" OR `major` = "car";
UPDATE `driver` SET `name` = "asd", `major` = "COACH" WHERE `driver_id` = 3;

--
-- DELETE DATA <> (not equal)
--
DELETE FROM `student` where `student_id` = 1;
DELETE FROM `driver` where `score` < 60;

--
-- QUERY or SEARCH DATA
--
SELECT * FROM `driver`;
SELECT `name`, `major` from `driver`;
SELECT `name`, `major` from `driver` ORDER BY `score`, `student_id` DESC;
SELECT `name`, `major` from `driver` WHERE `major` = "coach" AND `major` = "ENG" ORDER BY `score`, `student_id` DESC LIMIT 3; -- LIMIT or Pagination
SELECT `name`, `major` from `driver` WHERE `major` IN("coach", "eng") ORDER BY `score`, `student_id` DESC LIMIT 3; -- IN x = a or x = b

--
-- FOREIGN KEY
--
CREATE TABLE `branch` (
    `branch_id` INT,
    `branch_name` VARCHAR(30),
    `manager_id` INT,
    PRIMARY KEY (`branch_id`),
    FOREIGN KEY (`manager_id`) REFERENCES `employee`(`emp_id`) ON DELETE SET NULL
);

--
-- TASKS
-- 
-- Get all employee data
SELECT * FROM `employee`;

-- Get all client data
SELECT * FROM `client`;

-- Arrange Employee order based on salary
SELECT * FROM `employee` ORDER BY `salary`;

-- Get the 3 highest salary employee data
SELECT * FROM `employee` ORDER BY `salary` DESC LIMIT 3; 

-- Get all the names of employee
SELECT `name` FROM `employee`;

-- Get disticnt (not repeat)
SELECT DISTINCT `branch_id` FROM `employee`;

--
-- Aggregate Function
-- 
-- Get total number of employees
SELECT COUNT(*) FROM `employee`;

-- Get all female employee who born after 1970-01-01
SELECT COUNT(*) FROM `employee` WHERE `birth_date` > '1970-01-01' AND `sex` = 'F';

-- Get the average salary of all employees
SELECT AVG(`salary`) FROM `employee`;

-- Get the sum salary of all employees
SELECT SUM(`salary`) FROM `employee`;

-- Get the highest salary employee
SELECT MAX(`salary`) FROM `employee`;

-- Get the lowest salary of employee
SELECT MIN(`salary`) FROM `employee`;

--
-- WildCard % multiple characters, _ single
-- 
-- Get the clients who phone end with 355
SELECT * FROM `client` WHERE `phone` LIKE '%355';

-- Get the client who named Ai
SELECT * FROM `client` WHERE `client_name` LIKE 'Ai%';

-- Get the employees who born in Dec
SELECT * FROM `employee` WHERE `birth_date` LIKE '_____12%';

--
-- Union (U) combine data
-- 
-- eployee name union client name
SELECT `name` AS `total_name` FROM `employee` UNION
SELECT `client_name` FROM `client`;

-- Employee ID + Name union Client id + Client Name
SELECT `emp_id`, `name` FROM `emloyeee` UNION
SELECT `client_id`, `client_name` FROM `client`;

-- Employee salary union total sales
SELECT `salary` FROM `employee` UNION 
SELECT `total_sales` FROM `works_with`;

--
-- Join
-- 
-- Get all branch manager id, name and branch name
SELECT `emp_id`, `name`, `branch_name` 
FROM `employee` JOIN `branch`
ON `emp_id` = `manager_id`;

-- SAME NAME ``.``
SELECT `employee`.`emp_id`, `employee`.`name`, `branch`.`branch_name` 
FROM `employee` JOIN `branch`
ON `employee`.`emp_id` = `branch`.`manager_id`;

-- LEFT JOIN
-- LEFT TABLE RETURN ALL but RIGHT ONLY RETURN WHEN CONDITION IS TRUE
-- Or
-- RIGHT JOIN
-- RIGHT TABLE RETURN ALL but LEFT ONLY RETURN WHEN CONDITION IS TRUE
SELECT `employee`.`emp_id`, `employee`.`name`, `branch`.`branch_name` 
FROM `employee` LEFT JOIN `branch`
ON `employee`.`emp_id` = `branch`.`manager_id`;

--
-- Subquery (query inside query)
--

-- Find dev manager name
SELECT `name` FROM `employee` WHERE `emp_id` = (
    SELECT `manager_id` 
    FROM `branch` 
    WHERE `branch_name` = 'dev'
);

-- Find the employee who has the client that total sales more than 50k
SELECT `name` FROM `employee` WHERE `emp_id` IN(
    SELECT `emp_id` 
    FROM `works_with` 
    WHERE `total_sales` > 50000;
);

-- NOTE:
-- ON DELETE
-- ON DELETE SET NULL (set null to those data which is deleted)
-- ON DELETE CASCADE (delete together when data is deleted), primary key must be cascade

