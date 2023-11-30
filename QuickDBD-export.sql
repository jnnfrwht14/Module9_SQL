-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "ID" int   NOT NULL,
    "emp_no" INT   NOT NULL,
    "emp_title_id" CHAR(6)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(40)   NOT NULL,
    "sex" CHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "dept_emp" (
    "ID" int   NOT NULL,
    "emp_no" INT   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "departments" (
    "ID" int   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL,
    "dept_name" VARCHAR(35)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "titles" (
    "ID" char(5)   NOT NULL,
    "title_id" INT   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "salaries" (
    "ID" int   NOT NULL,
    "emp_no" INT   NOT NULL,
    "salary" FLOAT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "dept_manager" (
    "ID" int   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("ID");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("ID");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("ID");

