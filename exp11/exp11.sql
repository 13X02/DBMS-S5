CREATE TABLE employee (
  name VARCHAR(50) NOT NULL,
  da DECIMAL(10,2) NOT NULL,
  hra DECIMAL(10,2) NOT NULL,
  ta DECIMAL(10,2) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (name)
);

INSERT INTO employee (name, da, hra, ta, salary) VALUES
  ('Anil', 1000, 2000, 1000, 15000),
  ('Arun', 1000, 3000, 1500, 20000),
  ('Anu', 500, 2000, 500, 9000),
  ('Beena', 900, 2500, 1000, 11000),
  ('Remya', 1500, 1000, 2000, 10000);


CREATE OR REPLACE VIEW employee_view AS
  SELECT name, salary FROM employee WHERE salary > 10000;

SELECT * FROM employee_view;

UPDATE employee_view SET salary = 10;

SELECT * FROM employee_view;

CREATE ASSERTION min_salary
  CHECK (NOT EXISTS (SELECT * FROM employee WHERE salary < 10000));

INSERT INTO employee (name, da, hra, ta, salary) VALUES ('Mike', 4000, 2000, 1000, 9000);

SELECT * FROM employee;
