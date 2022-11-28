Create table emp(emp_id char(8) check(emp_id like 'E%') primary key, emp_name
varchar(18),street_no int,city varchar(18));
Create table company(company_name varchar(18) primary key, city varchar(18));
Create table works(emp_id char(8) references emp(emp_id),company_name varchar(18) references company(company_name),salary float,primary key(emp_id,company_name));


Create table manages(emp_id char(8) references emp2(emp_id),manager_id char(8) references emp2(emp_id),unique(emp_id,manager_id));
alter table emp MODIFY emp_name varchar(18) NOT NULL;