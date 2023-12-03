-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_no" char(6)   NOT NULL,
    "emp_title_id" CHAR(6)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(40)   NOT NULL,
    "last_name" VARCHAR(40)   NOT NULL,
    "sex" CHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" CHAR(6)   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" CHAR(4)   NOT NULL,
    "dept_name" VARCHAR(40)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" CHAR(5)   NOT NULL,
    "title" VARCHAR(40)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salaries" (
    "emp_no" CHAR(6)   NOT NULL,
    "salary" FLOAT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" CHAR(4)   NOT NULL,
    "emp_no" CHAR(6)   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--Review tables and datapoints. Run each select separately after importing each .csv file:

SELECT * FROM titles;

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM salaries;

SELECT * FROM dept_manager;

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