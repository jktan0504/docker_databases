--
-- Create a database using `MYSQL_DATABASE` placeholder ==> refer from .env
--
CREATE DATABASE IF NOT EXISTS `MYSQL_DATABASE`;
USE `MYSQL_DATABASE`;

--
-- EMPLOYEE
--
CREATE TABLE `employee` (
    `emp_id` INT AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL,
    `birth_date` DATE,
    `sex` TINYINT DEFAULT 1,
    `salary` INT,
    `branch_id` INT,
    `sup_id` INT,
    PRIMARY KEY (`emp_id`)
);

DESCRIBE `employee`;