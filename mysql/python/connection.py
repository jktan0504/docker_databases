# Require mysql-connector-python library
# pip install mysql-connector-python

import mysql.connector

connection - mysql.connector.connect(
    host='location',
    port='3306',
    user='root',
    passwqord='password'
)

cursor = connection.cursor()

# CREATE DATA
cursor.execute("CREATE DATABASE `mydatabase_name`;")

# GET ALL DATABASES
cursor.execute("SHOW DATABASES;")
records = cursor.fetchall()
for r in records:
    print(r)

# Use database
cursor.execute("USE mydatabase_name;")

# Create Table
cursor.execute("CREATE TABLE `qq`(qq INT);")

# Create Data
cursor.execute("INSERT INTO `employee` VALUES(1, 'employee name', 1, 45000);")

# Read Data
cursor.execute("SELECT * FROM `employee`;")

# Update Data
cursor.execute("UPDATE `branch` SET `manager_id` = NULL WHERE `branch_id` = 4;")

# DELETE Data
cursor.execute("DELETE FROM `branch` WHERE `branch_id` = 5;")

# close the connection
cursor.close()
connection.commit() # must use commit if involved in data changed from database
connection.close()
