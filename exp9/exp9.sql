START TRANSACTION;

INSERT INTO employee (name, salary) VALUES ('John', 10000);
SAVEPOINT sp1;

INSERT INTO employee (name, salary) VALUES ('Jane', 12000);
SAVEPOINT sp2;


INSERT INTO employee (name, salary) VALUES ('Bob', 15000);

select * from employee;

ROLLBACK TO sp2;

select * from employee;


INSERT INTO employee (name, salary) VALUES ('Sue', 13000);

commit;

select * from employee;
