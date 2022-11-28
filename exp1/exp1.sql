
create database testdb;

use testdb;
create table student (stname varchar(30), stid varchar(10), stage char(30), starea varchar(20));

desc student;

alter table student modify stage varchar(30);

desc student;

alter table student drop stdept;

desc student;

truncate table student;
desc student;


drop table student;
desc student;

DROP DATABASE testdb;


