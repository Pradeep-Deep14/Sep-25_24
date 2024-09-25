CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    job_category VARCHAR(10)
);


INSERT INTO employees (employee_id, first_name, last_name, salary, job_category) VALUES
(101, 'John', 'Doe', 50000, 'DEV'),
(102, 'Jane', 'Smith', 60000, 'DEV'),
(104, 'Charlie', 'Davis', 58000, 'DEV'),
(108, 'Ivan', 'Hall', 62000, 'DEV'),
(103, 'Alice', 'Johnson', 61000, 'HR'),
(105, 'Eve', 'Miller', 61000, 'HR'),
(107, 'Heidi', 'Clark', 57000, 'HR'),
(109, 'Judy', 'Lewis', 53000, 'HR'),
(110, 'Paul', 'Allen', 70000, 'FIN'),
(113, 'Olivia', 'Scott', 65000, 'FIN'),
(115, 'Nora', 'Adams', 72000, 'FIN'),
(106, 'Grace', 'Wilson', 66000, 'PDT'),
(111, 'Rose', 'Baker', 68000, 'PDT'),
(112, 'Max', 'Carter', 66000, 'PDT'),
(114, 'Lucas', 'Turner', 64000, 'PDT');


SELECT * FROM EMPLOYEES

/*Write a query to display the details of the employees who have the 3rd highest salary in
each job category. Return the columns 'employee_id', 'first_name', and 'job_category'.
Return the result ordered by employee_id in ascending order.*/


WITH CTE AS
(SELECT *,
DENSE_RANK()OVER(PARTITION BY JOB_CATEGORY ORDER BY SALARY DESC)AS DRNK
FROM EMPLOYEES)
SELECT EMPLOYEE_ID,
FIRST_NAME, 
JOB_CATEGORY
FROM CTE 
WHERE DRNK =3
ORDER BY EMPLOYEE_ID ASC