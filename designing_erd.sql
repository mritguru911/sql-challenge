--[Step 1] Create table for Department Information
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL, 
	dept_name VARCHAR(20),
	CONSTRAINT pk_dept PRIMARY KEY (dept_no) 
); 
-- Viewing the table
SELECT * FROM departments;


--[Step 2] Create the table for Title Information
CREATE TABLE  titles (
	title_id VARCHAR(10) NOT NULL,
	title VARCHAR(20) NOT NULL,
	CONSTRAINT pk_titles PRIMARY KEY (title_id)
);
-- Viewing the table
SELECT * FROM titles;


--[Step 3] Create the table for Employee Information
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT pk_employees PRIMARY KEY (emp_no),
	CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
-- Viewing the table
SELECT * FROM employees;


--[Step 4] Create the table for Department Employment Information  
CREATE TABLE dept_emp (
	emp_no INT NOT NULL, 	
	dept_no VARCHAR(4) NOT NULL,
	CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no), 
	CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);	
-- Viewing the table
SELECT * FROM dept_emp;


--[Step 5] Create the table for Department Managers Information
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL, 
	emp_no INT NOT NULL, 	
	CONSTRAINT pk_dept_manager PRIMARY KEY (emp_no, dept_no), 
	CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
-- Viewing the table
SELECT * FROM dept_manager;


--[Step 6] Create the table for Salaries Information
CREATE TABLE salaries (
	emp_no INT NOT NULL, 	
	salary INT NOT NULL,
	CONSTRAINT pk_salaries PRIMARY KEY (emp_no),
	CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
-- Viewing the table
SELECT * FROM salaries;