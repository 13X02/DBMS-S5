mysql> -- Create a new database named "test_db"
mysql> CREATE DATABASE test_db;
Query OK, 1 row affected (0.01 sec)

mysql> 
mysql> -- Use the "test_db" database
mysql> USE test_db;
Database changed
mysql> 
mysql> -- Create a new table named "employees"
mysql> CREATE TABLE employees (
    ->   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->   name VARCHAR(50) NOT NULL,
    ->   salary DECIMAL(10,2) NOT NULL
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> -- Create a new user named "newuser" with the password "password"
mysql> CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> -- Grant the SELECT, INSERT, UPDATE, DELETE privileges on all tables in the database "test_db" to the user "newuser"
mysql> GRANT SELECT, INSERT, UPDATE, DELETE ON test_db.* TO 'newuser'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> -- Display the privileges granted to the user "newuser"
mysql> SHOW GRANTS FOR 'newuser'@'localhost';
+------------------------------------------------------------------------------+
| Grants for newuser@localhost                                                 |
+------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `newuser`@`localhost`                                  |
| GRANT SELECT, INSERT, UPDATE, DELETE ON `test_db`.* TO `newuser`@`localhost` |
+------------------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> 
mysql> -- Revoke the INSERT and UPDATE privileges on the table "employees" in the database "test_db" from the user "newuser"
mysql> REVOKE INSERT, UPDATE ON test_db.employees FROM 'newuser'@'localhost';
ERROR 1147 (42000): There is no such grant defined for user 'newuser' on host 'localhost' on table 'employees'
mysql> 
mysql> -- Display the privileges granted to the user "newuser"
mysql> SHOW GRANTS FOR 'newuser'@'localhost';
+------------------------------------------------------------------------------+
| Grants for newuser@localhost                                                 |
+------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `newuser`@`localhost`                                  |
| GRANT SELECT, INSERT, UPDATE, DELETE ON `test_db`.* TO `newuser`@`localhost` |
+------------------------------------------------------------------------------+
2 rows in set (0.00 sec)
