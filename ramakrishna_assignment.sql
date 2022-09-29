# 1. Write a SQL query to find the salaries of all employees
SELECT  first_name,salary
FROM employees;

# 2. Write a SQL query to find the unique designations of the employees. Return job name.
SELECT DISTINCT job_title 
FROM jobs;

# 3. write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.
select first_name,salary*1.15 "salary(No of Dollars)"
    from employees;
    
# 4. Write a SQL query to list the employee's name and job name as a format of "Employee & Job".
select concat(job_id," & ",job_title)"EMP NAME & JOB"
     from jobs;
     
# 5. Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
select employee_id,first_name,salary,date_format(hire_date,'%M,%d,%Y') "Hire Date"
     from employees;
     
# 6. Write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
 select job_title, length(job_title) "No of Characters"
     from jobs;

# 7. Write a SQL query to find the employee ID, salary, and commission of all the employees. 
select employee_id,salary,commission_pct
     from employees;

# 8. Write a SQL query to find the unique department with jobs. Return department ID, Job name. 
 select distinct (department_id),department_name
     from departments;

# 9. Write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
select employee_id,first_name,last_name,email,phone_number,job_id,salary,department_id, hire_date
       from employees
       where hire_date<'1991-01-01';

# 10. Write a SQL query to compute the average salary of those employees who work as ‘shipping clerk’. Return average salary.
select  avg(salary)"shipping clerk"
     from employees
     where job_id='sh_clerk';

