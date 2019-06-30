
--List the following details of each employee: employee number, last name, first name,
--gender, and salary.

select e.emp_no, e.last_name, e.first_name, e.gender, s.emp_no, s.salary
from employees as e
inner join salaries as s
on e.emp_no=s.emp_no;

--List employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date>='1986-01-01' and hire_date<='1986-12-31';

--List the manager of each department with the following information: department number,
--department name, the manager's employee number, last name, first name, and start
--and end employment dates.
select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date as end_date
from  dept_manager as dm
left join employees as e
on e.emp_no=dm.emp_no
left join departments as d
on d.dept_no=dm.dept_no;

--List the department of each employee with the following information: employee number,
--last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from  employees as e
left join dept_emp as de
on de.emp_no=e.emp_no
left join departments as d
on d.dept_no=de.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
from employees
where first_name='Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on (e.emp_no = de.emp_no)
join departments as d
on (de.dept_no=d.dept_no)
where d.dept_name='Sales';

--List all employees in the Sales and Development departments, including their
--employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on (e.emp_no = de.emp_no)
join departments as d
on (de.dept_no=d.dept_no)
where d.dept_name='Sales' or d.dept_name='Development';

--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

select last_name, count(last_name) as "last name count" from employees
group by last_name
order by "last name count" desc;