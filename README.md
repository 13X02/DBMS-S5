# DBMS Lab Experiments

This repository contains the experiments for the database management systems lab using MySQL. The experiments cover a range of topics, including creating tables, inserting and updating data, and querying data.

## Getting Started

1. Install MySQL on your computer. You can download the latest version from the [MySQL website](https://www.mysql.com/downloads/).

2. Start the MySQL server. On Windows, you can do this by going to the Start menu and searching for "MySQL". On macOS, you can use the `mysql.server` command in the terminal.

3. Connect to the MySQL server using a client. On Windows, you can use the MySQL Workbench. On macOS, you can use the `mysql` command in the terminal.

4. Create a new database and user for the lab. Use the following commands:

Here is an example of a README.md file for a repository used to store the experiments for a database management systems lab using MySQL:

Copy code
# DBMS Lab Experiments

This repository contains the experiments for the database management systems lab using MySQL. The experiments cover a range of topics, including creating tables, inserting and updating data, and querying data.

## Getting Started

1. Install MySQL on your computer. You can download the latest version from the [MySQL website](https://www.mysql.com/downloads/).

2. Start the MySQL server. On Windows, you can do this by going to the Start menu and searching for "MySQL". On macOS, you can use the `mysql.server` command in the terminal.

3. Connect to the MySQL server using a client. On Windows, you can use the MySQL Workbench. On macOS, you can use the `mysql` command in the terminal.

4. Create a new database and user for the lab. Use the following commands:

CREATE DATABASE dbms_lab;
CREATE USER 'lab_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON dbms_lab.* TO 'lab_user'@'localhost';
FLUSH PRIVILEGES;


5. Import the provided `dbms_lab.sql` file to create the tables and sample data for the lab. You can do this using the MySQL Workbench or the following command in the terminal:

mysql -u lab_user -p dbms_lab < dbms_lab.sql



## Additional Resources

- [MySQL documentation](https://dev.mysql.com/doc/)
- [SQL tutorial](https://www.w3schools.com/sql/)
