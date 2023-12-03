--List each employee with first name Hercules:

SELECT employees.first_name,
	employees.last_name,
	employees.sex
	FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE '%B%';