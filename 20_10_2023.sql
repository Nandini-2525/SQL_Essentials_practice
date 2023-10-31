1. select first_name,department_id from employees where last_name='De Haan';

2. select * from departments where department_name='Sales';

3.select first_name,last_name,department_id,salary from employees where salary>9700 ;

4. select * from employees where hire_date<='1992-01-01';

5.select employee_id,first_name,job_id,department_id from employees where department_id in(20,60,80);

6.select employee_id,first_name,job_id,department_id from employees where department_id not in(20,60,80);

7.select last_name,phone_number,salary,manager_id from employees where department_id in(100,102,103);

8.select first_name,salary from employees where first_name like '%e';

9.select last_name,department_id from employees where last_name like '_i%';

10.select * from employees where last_name like '%l%' and last_name like '%j%' or last_name like '%h%' order by salary desc;

11.select first_name,hire_date,salary,department_id from employees where first_name not like '%a%';

12.select employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id from employees;

13.select first_name,last_name,salary, concat(first_name,',',last_name) as fullname from employees where salary not in(7000,15000) order by fullname;

14.select concat(first_name,',',last_name) as FULL_NAME,concat(phone_number,'_',email) as CONTACTS,salary as SAL from employees where salary in(5000,10000);

15.select * from employees where salary in(800,6000) AND commission_pct IS NOT NULL OR department_id not in(80,90,100) AND hire_date < '1990-01-01';

16.select last_name, job_id,hire_date from employees where hire_date between '1995-12-12' and '1998-04-17';

17.select concat(first_name,last_name),hire_date,commission_pct,phone_number,salary from employees where salary >10000 AND phone_number like '__5%' order by first_name desc;

18.select last_name,salary from employees where salary >12000;

19. I}select last_name,department_id from employees where department_id in(50,80);
    II}select last_name,department_id from employees where department_id= 50 OR 80;
    
20.select first_name,salary from employees where commission_pct IS NULL;

21.select first_name,salary,manager_id from employees where manager_id IS NOT NULL;


#######################################################################################################
*******************************************************************************************************
#######################################################################################################

****** Problem Statements to be solved using – SQL Scalar/Numeric Functions *******

1.select lower(first_name),upper(last_name) from employees where employee_id BETWEEN 80 AND 150;

2.select first_name,last_name from employees where last_name = 'King';

3.select first_name,last_name,email, concat(LEFT(first_name,1),LEFT(last_name,3),'@oracle.com') as newEmail from employees;

4.select first_name,last_name,email, concat(LEFT(first_name,1),RIGHT(last_name,3),'@oracle.com') as newEmail from employees;

5.	a) select concat(first_name,last_name) from employees;
	b) select concat(first_name,last_name,hire_date) from employees;

6.select last_name from employees where LENGTH(last_name)>8;

7.	a) select first_name,last_name,phone_number, REPLACE(phone_number,'515',815) as new_phone_number from employees;
	b) select first_name,last_name,phone_number,CONCAT('815', RIGHT(phone_number, LENGTH(phone_number) - 3)) AS new_phone_number from employees;

8.select first_name,salary, salary + (salary * 0.12) as raise_salary, round(salary + (salary * 0.12)) as rounded_salary, floor(salary + (salary * 0.12)) as nearest_salary from employees;

9.select first_name,last_name,hire_date,TIMESTAMPDIFF(MONTH, hire_date, CURDATE()) as months_worked, TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked from employees;

10.




#############################################################################################
*********************************************************************************************
############################################################################################
**** Problem Statements to be solved using – Basic Select Statements *****


1.select employee_id,first_name,last_name,phone_number,department_id from employees;

2.select first_name,last_name,hire_date,salary,salary+(salary * 0.20) as ANNUAL_SAL from employees;

3.select concat(last_name,' ',first_name) FULL_NAME, concat(phone_number,'-',email) as CONTACT_DETAILS from employees;

4.select distinct manager_id from employees;

5.select concat(last_name,' ',job_id) as EMPLOYEE_AND_TITLE from employees;

6.

7.select distinct salary from employees;

8.select distinct concat(department_id,job_id) from employees;


##############################################################################################
**********************************************************************************************
#############################################################################################

******* Problem Statements to be solved using – Group By  *******


1.select lower(last_name) from employees order by last_name;

2.select min(last_name) from employees order by last_name;

3.select max(last_name) from employees order by last_name;

4.select commission_pct from employees where commission_pct is NOT NULL;

5.select count(*) as NULL_COUNT from employees where commission_pct IS NULL ;

6.select max(salary) as Max_salary, min(salary) as Min_salary, avg(salary) as Avg_salary from employees;


####################################################################################################
****************************************************************************************************
###################################################################################################


***** Problem Statements to be solved using - GROUP BY and HAVING Clauses ******


7.	a)select department_id, avg(salary) as AVG_SAL from employees group by department_id;
	b)select department_id, avg(salary) as AVG_SAL from employees group by department_id having department_id in(50,80);

8.	a)select job_id, count(employee_id) from employees group by job_id;
	b)select job_id,count(employee_id) as no_of_employee from employees where salary>10000  group by job_id;
	c)select job_id,count(employee_id) as no_of_employee from employees group by job_id having count(employee_id)>2;

9.select department_id,job_id, avg(salary) as AVG_SAL from employees full group by department_id,job_id;

10.	a)select manager_id,max(salary) from employees group by manager_id;
	b)select manager_id,max(salary) from employees where salary > 10000  group by manager_id;
	
11.select job_id,min(salary) from employees group by job_id having min(salary)>7000;


12.select department_id, avg(salary) from employees group by department_id having department_id between 20 and 80 and avg(salary)>9000;


###################################################################################################
***************************************************************************************************
###################################################################################################

********* Problem Statements to be solved using – SQL Sub-Queries **********

1.  select employee_id, first_name, salary from employees where salary >( select salary from employees where employee_id = 103);

2.select department_id, department_name from departments where location_id=(select location_id from departments where department_id=90);

3.select last_name,hire_date from employees where hire_date >( select hire_date from employees where employee_id=101);

4.


####################################################################################################
****************************************************************************************************
####################################################################################################

***** Problem Statements to be solved using – Inner JOIN ******

1.	a)select first_name,last_name, e.department_id,d.department_name from employees e inner join departments d;
	b)select first_name,last_name, e.department_id,d.department_name from employees e inner join departments d on (e.department_id in(50,90));

2.	a)select department_name,city,state_province from departments inner join locations;
	b)select concat(e.first_name, ' ', e.last_name) as Full_name,d.department_name,l.city,l.state_province from employees e INNER JOIN departments d ON 			e.department_id=d.department_id INNER JOIN locations l ON d.location_id = l.location_id;
	c)




*******************************************************************************************************************************

