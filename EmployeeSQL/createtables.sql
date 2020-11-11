CREATE TABLE titles(
title_id varchar(30) NOT NULL,
title varchar(30) NOT NULL,
CONSTRAINT pk_title_id PRIMARY KEY (title_id)
);

CREATE TABLE employees(
emp_no int NOT NULL,
emp_title varchar(30) NOT NULL,
birth_date date NOT NULL,
first_name varchar(30) NOT NULL,
last_name varchar(30) NOT NULL,
sex varchar(30) NOT NULL,
hire_date date NOT NULL,
CONSTRAINT pk_emp_no PRIMARY KEY(emp_no)
);

CREATE TABLE departments(
dept_no varchar(30) NOT NULL,
dept_name varchar(30) NOT NULL,
CONSTRAINT pk_dept_no PRIMARY KEY(dept_no)
);

CREATE TABLE salaries(
emp_no int NOT NULL,
salary int NOT NULL,
CONSTRAINT pk_emp_no_salary PRIMARY KEY(emp_no),
CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
emp_no int NOT NULL,
dept_no varchar(30) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager(
dept_no varchar(30) NOT NULL,
emp_no int NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
);