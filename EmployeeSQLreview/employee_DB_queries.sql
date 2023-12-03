--List employee number, name and salary:

SELECT employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees 
INNER JOIN salaries ON 
employees.emp_no = salaries.emp_no;

--List name and hire date for employees hired in 1986:

SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List manager for each department and identifying info:

SELECT departments.dept_no,
	departments.dept_name,
	dept_manager.dept_no,
	employees.last_name,
	employees.first_name,
	dept_manager.emp_no
FROM departments 
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees 
ON dept_manager.emp_no = employees.emp_no;

--List department number for each employee:

SELECT dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--List each employee with first name Hercules:

SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE '%B%';

--List Sales department employees:

SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List Sales and Dev department employees:

SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--List frequency counts by last name:

SELECT last_name,
COUNT (last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT (last_name) DESC;