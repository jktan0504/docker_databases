--
-- Create a database using `MYSQL_DATABASE` placeholder ==> refer from .env
--
CREATE DATABASE IF NOT EXISTS `MYSQL_DATABASE`;
USE `MYSQL_DATABASE`;

-- Rest of queries
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
    `emp_id` INT AUTO_INCREMENT,
    `sup_id` INT,
    PRIMARY KEY (`emp_id`)
);