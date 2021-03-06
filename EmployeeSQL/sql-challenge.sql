-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no ASC

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date ASC

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dpt.dept_no, dpt.dept_name, dptmgr.emp_no, emp.last_name, emp.first_name FROM dept_manager AS dptmgr
INNER JOIN departments AS dpt ON dptmgr.dept_no = dpt.dept_no
INNER JOIN employees AS emp ON emp.emp_no = dptmgr.emp_no
ORDER BY dept_no ASC

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dpt.dept_name FROM employees AS emp
INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
INNER JOIN departments AS dpt ON dept_emp.dept_no = dpt.dept_no
ORDER BY dept_name ASC

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dpt.dept_name FROM employees AS emp
INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
INNER JOIN departments AS dpt ON dept_emp.dept_no = dpt.dept_no
WHERE dept_name = 'Sales'
ORDER BY dept_name ASC

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dpt.dept_name FROM employees AS emp
INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
INNER JOIN departments AS dpt ON dept_emp.dept_no = dpt.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY dept_name ASC

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) FROM employees
GROUP BY last_name
ORDER BY count DESC