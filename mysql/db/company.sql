--
-- EMPLOYEE
--
CREATE TABLE `employee` (
    `emp_id` INT,
    `name` VARCHAR(30) NOT NULL,
    `birth_date` DATE,
    `sex` TINYINT DEFAULT 1,
    `salary` INT DEFAULT 0,
    `branch_id` INT,
    `sup_id` INT,
    PRIMARY KEY (`emp_id`)
);

--
-- Branch
--
CREATE TABLE `branch` (
    `branch_id` INT,
    `branch_name` VARCHAR(30),
    `manager_id` INT,
    PRIMARY KEY (`branch_id`),
    FOREIGN KEY (`manager_id`) REFERENCES `employee`(`emp_id`) ON DELETE SET NULL
);

--
-- ALTER EMPLOYEE TABLE
--
ALTER TABLE `employee`
ADD FOREIGN KEY (`branch_id`)
REFERENCES `branch`(`branch_id`)
ON DELETE SET NULL;

ALTER TABLE `employee`
ADD FOREIGN KEY (`sup_id`)
REFERENCES `employee`(`emp_id`)
ON DELETE SET NULL;

--
-- CLIENT
--
CREATE TABLE `client`(
    `client_id` INT,
    `client_name` VARCHAR(20),
    `phone` VARCHAR(20)
    PRIMARY KEY (`client_id`)
);

--
-- WORK WITH
--
CREATE TABLE `works_with`(
    `emp_id` INT,
    `client_id` INT,
    `total_sales` INT,
    PRIMARY KEY (`emp_id`, `client_id`),
    FOREIGN KEY (`emp_id`) REFERENCES `employee`(`emp_id`) ON DELETE CASCADE,
    FOREIGN KEY (`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE
);

--
-- INSERT DATA - BRANCH
--
INSERT INTO `branch` VALUES('development', NULL);
INSERT INTO `branch` VALUES('operation', NULL);
INSERT INTO `branch` VALUES('information', NULL);

--
-- INSERT DATA - EMPLOYEE
--
INSERT INTO `employee` VALUES(206, 'little yellow'. '1998-10-08', 'F', 50000, 1, NULL);
INSERT INTO `employee` VALUES(207, 'little green', '1985-09-16', 'M', 29000, 2, 206);
INSERT INTO `employee` VALUES(208, 'little black', '2000-12-19', 'M', 35000, 3, 206);
INSERT INTO `employee` VALUES(209, 'little white', '1997-01-22', 'F', 39000, 3, 207);
INSERT INTO `employee` VALUES(210, 'little blue', '1925-11-10', 'F', 84000, 1, 207);

--
-- UPDATE DATA - BRANCH
--
UPDATE `branch` SET `manager_id` = 206 WHERE `branch_id` = 1;
UPDATE `branch` SET `manager_id` = 207 WHERE `branch_id` = 2;
UPDATE `branch` SET `manager_id` = 208 WHERE `branch_id` = 3;

--
-- INSERT DATA - CLIENT
--
INSERT INTO `client` VALUES(400, 'AH GOU', '254354335');
INSERT INTO `client` VALUES(401, 'AH MAU', '25633899'); 
INSERT INTO `client` VALUES(402, 'WANG LAI', '45354345');
INSERT INTO `client` VALUES(403, 'LUCI', '54354365');
INSERT INTO `client` VALUES(404, 'HOLICK', '18783783');

--
-- INSERT DATA - WORK WITH
--
INSERT INTO `works_with` VALUES(206,400,'70000');
INSERT INTO `works_with` VALUES(207, 401, '24000');
INSERT INTO `works_with` VALUES(208, 402, '9800');
INSERT INTO `works_with` VALUES(208, 403, '24000');
INSERT INTO `works_with` VALUES(210, 403, '87940');




