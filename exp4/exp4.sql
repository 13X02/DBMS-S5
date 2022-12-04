
SELECT emp_name FROM works,emp WHERE company_name='SBI'
and emp.emp_id=works.emp_id;


SELECT emp.emp_name FROM emp, works,company WHERE 
emp.emp_id = works. emp_id AND works. company_name=
company.company_name AND emp.city = company.city;

SELECT emp.emp_name,e2.emp_name "manager_name" FROM emp,emp e2,
manages WHERE emp.emp_id = manages.emp_id AND e2.Emp_id=
manages.manager_id AND emp.street_no = e2.street_no AND emp.city = e2.city;


SELECT emp_name,emp.emp_id,salary FROM works ,emp WHERE salary >
(SELECT AVG (salary) FROM works S WHERE works.company_name
=S.company_name) and emp.emp_id=works.emp_id;

 SELECT company_name,sum(salary) "SALARY PAID" from Works GROUP
 BY company_name HAVING sum(salary) <= all (SELECT sum(salary) FROM
 Works GROUP BY company_name);

UPDATE works SET salary = salary * 1.1 WHERE emp_id in (select manager_id
from manages) and company_name ='SBT';

SELECT company_name FROM works GROUP BY company_name
HAVING COUNT(DISTINCT emp_id) >= ALL (SELECT COUNT(DISTINCT
emp_id) FROM works GROUP BY company_name);


SELECT company_name FROM works GROUP BY company_name HAVING
AVG(salary)> (SELECT AVG(salary) FROM works WHERE company_name =
'Indian Bank' GROUP BY company_name);


SELECT emp_name,salary FROM works,emp
WHERE salary > (SELECT MAX(salary) FROM works WHERE company_name =
'Indian Bank' GROUP BY company_name) and emp.emp_id=works.emp_id;
