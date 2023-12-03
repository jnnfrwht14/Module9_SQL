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