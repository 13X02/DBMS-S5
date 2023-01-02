CREATE TABLE dept(department_id int primary key , department_name VARCHAR(20) NOT NULL , manager_id int, loc varchar(10));

create table emp1(EMP_no int Primary Key,Emp_Name Varchar(10),Job Varchar(10),Hiredate Date,Salary
int,Comm int,Depno Int References Dept(Department_Id));

INSERT INTO emp1 VALUES(1,'Steven', 'Marketing','1995-01-06',24000, NULL,2);
INSERT INTO emp1 VALUES(2,'Neena', 'FI_ACCOUNT', '1987-02-06',34000, NULL,1);
INSERT INTO emp1 VALUES(3,'Lex', 'FI_MGR', '1980-01-06',240000, NULL,1);
INSERT INTO emp1 VALUES(4,'Alexander', 'Sa_Rep', '1987-06-06',20000, NULL,4);
INSERT INTO emp1 VALUES(5,'Bruce', 'IT_PROG', '1990-07-06',24000, NULL,4);
INSERT INTO emp1 VALUES(6,'David', 'IT_PROG', '1991-09-06',22000, NULL,4);
INSERT INTO emp1 VALUES(7,'vipin', 'IT_PROG', '1987-11-16',28000, NULL,4);
INSERT INTO emp1 VALUES(8,'Diana', 'Pur_Man', '1987-01-26',24000, NULL,3);
INSERT INTO emp1 VALUES(9,'John', 'FI_ACCOUNT', '1992-12-01', 24000, NULL,1);
INSERT INTO emp1 VALUES(10,'Ismael', 'CLERK', '1994-03-29', 4000, NULL,3);
INSERT INTO emp1 VALUES(11,'Mathew', 'CLERK', '1992-10-12', 46000, 200,3);
INSERT INTO emp1 VALUES(12,'Hayes', 'Marketing', '1998-04-21',14000, 1000,2);
INSERT INTO emp1 VALUES(13,'sarun', 'Marketing', '1993-05-18',18000, NULL,2);
INSERT INTO emp1 VALUES(14,'Henin','FI_MGR', '1980-08-06',240000, NULL,1);
INSERT INTO emp1 VALUES(15,'Greesh','Clerk', '1980-08-06',240000, NULL,5);


INSERT INTO dept values(1, 'Administration', null, 'Boston');
INSERT INTO dept values(2, 'Marketing', null, 'Boston');
INSERT INTO dept values(3, 'Purchase', null, 'perryridge');
INSERT INTO dept values(4, 'Programming',null, 'Hudson');
INSERT INTO dept values(5, 'HR', null, 'Hudson');


ALTER TABLE dept ADD FOREIGN KEY (manager_id) REFERENCES emp1(EMP_no);



Update dept set manager_id=2 where department_id=1;
Update dept set manager_id=1 where department_id=2;
Update dept set manager_id=8 where department_id=3;
Update dept set manager_id=7 where department_id=4;

SELECT emp_name, salary FROM emp1 WHERE salary NOT BETWEEN 5000 AND
35000;

SELECT emp_name, job, hiredate FROM emp1 WHERE hiredate BETWEEN '1990-02-20' AND '1998-05-01' ORDER BY hiredate;

SELECT emp_name "Employee", salary "Monthly Salary" ,depno FROM emp1
WHERE salary BETWEEN 5000 AND 30000 AND depno IN (2, 4);

SELECT emp_name, hiredate FROM emp1 WHERE hiredate LIKE '1994%';

SELECT emp_name, salary, comm FROM emp1 WHERE comm >0
ORDER BY salary DESC, comm DESC;

SELECT emp_name, job FROM emp1,dept where emp1.Depno=dept.Department_id and dept.manager_id is NULL;

SELECT emp_name FROM emp1 WHERE emp_name LIKE '__a%';

SELECT emp_name FROM emp1 WHERE emp_name LIKE '%a%' AND emp_name
LIKE '%e%';

SELECT emp_name, job, salary FROM emp1 WHERE job IN ('Sa_rep', 'CLERK')
AND salary NOT IN (2000, 4000, 7000);



SELECT emp_name, ROUND(MONTH(CURRENT_DATE) - MONTH(hiredate)) MONTHS_WORKED, ROUND(YEAR(CURRENT_DATE) - YEAR(hiredate), 2) "NO: Of YEARS" FROM emp1 ORDER BY MONTH(CURRENT_DATE) - MONTH(hiredate);


SELECT emp1.emp_name, emp1.depno, dept.department_name FROM emp1 , dept
WHERE emp1.depno = dept.department_id order by dept.department_name;


SELECT emp_Name, HireDate FROM emp1 WHERE ((HireDate)>any(SELECT
HireDate FROM emp1 WHERE emp_Name='Mathew'));


SELECT emp1.emp_name employee , emp1.hiredate "EMP HIRE DATE", emp1.salary,
manager.emp_name manager, manager.hiredate "MANAGER HIRE DATE" FROM emp1 ,
dept, emp1 manager WHERE dept.manager_id = manager.emp_no and
emp1.depno=dept.department_id and
emp1.hiredate < manager.hiredate;


SELECT Job, COUNT(*) "No: of Jobs" FROM emp1 GROUP BY job;


SELECT min(salary) "MINIMUM SALARY",manager_id, department_name FROM
emp1,dept where emp1.depno=dept.department_id AND manager_id IS NOT NULL
GROUP BY manager_id, department_name HAVING MIN(salary) > 6000
ORDER BY "MINIMUM SALARY" DESC;


select emp_name "manager",emp1.depno,emp1.emp_no, (select min(salary) from emp1 e
where (emp1.depno=e.depno) group by e.depno having min(salary)>15000) "salary" from
emp1,dept where emp1.emp_no=dept. MANAGER_ID
and emp1.depno=dept.
DEPARTMENT_ID;



select emp_name "manager", (select min(salary) from emp1 e where (emp1.depno=e.depno) group by
e.depno having min(salary)>13000) "salary" from emp1,dept where emp1.emp_no=dept.
MANAGER_ID and emp1.depno=dept. DEPARTMENT_ID;


select min(emp1.salary) from emp1,emp1 e where (emp1.depno=e.depno) group by e.depno having
min(emp1.salary)>15000;


SELECT d.department_name "Name", d.loc "Location ",
COUNT(*) "Number of People", ROUND(AVG(salary),2) "Salary"
FROM emp1 e, dept d
WHERE e.depno = d.department_id GROUP BY d.department_name, d.loc;


SELECT emp_name, hiredate FROM emp1 WHERE depno = (SELECT depno
FROM emp1 WHERE emp_name = 'John') and emp_name<>'John';

SELECT emp_no, emp_name,department_name FROM emp1,dept
WHERE depno IN (SELECT depno FROM emp1 WHERE emp_name like '%u%') and
emp1.depno=dept.department_id;


SELECT Emp_name, department_name FROM emp1 INNER JOIN dept ON emp1.depno = dept.department_id WHERE emp1.depno IN (SELECT depno FROM emp1 GROUP BY depno HAVING COUNT(*) > 4) ORDER BY department_name, emp_name;

SELECT emp_name "employee", CONCAT(FLOOR(DATEDIFF(CURDATE(), hiredate)/12), ' years ', MOD(DATEDIFF(CURDATE(), hiredate),12), ' months ') "length of service" FROM emp1;