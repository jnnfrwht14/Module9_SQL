--List name and hire date for employees hired in 1986:

SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';