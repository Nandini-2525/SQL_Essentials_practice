
mysql> create table Employee(eid int, name varchar(20), surname varchar(20),mobile varchar(10),jid varchar(20), sal int,mid int,deptid int);
Query OK, 0 rows affected (0.03 sec)

mysql> desc Employee;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| eid     | int         | YES  |     | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| surname | varchar(20) | YES  |     | NULL    |       |
| mobile  | varchar(10) | YES  |     | NULL    |       |
| jid     | varchar(20) | YES  |     | NULL    |       |
| sal     | int         | YES  |     | NULL    |       |
| mid     | int         | YES  |     | NULL    |       |
| deptid  | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

mysql> alter table Employee add column doj date after mobile;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Employee;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| eid     | int         | YES  |     | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| surname | varchar(20) | YES  |     | NULL    |       |
| mobile  | varchar(10) | YES  |     | NULL    |       |
| doj     | date        | YES  |     | NULL    |       |
| jid     | varchar(20) | YES  |     | NULL    |       |
| sal     | int         | YES  |     | NULL    |       |
| mid     | int         | YES  |     | NULL    |       |
| deptid  | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> insert into Employee(eid,name,surname,mobile,doj,jid,sal,mid,deptid) values(101,'Harry','King','555555','2016-06-01','IT_PROG',7000,104,95);
Query OK, 1 row affected (0.00 sec)

mysql> insert into Employee(eid,name,surname,mobile,doj,jid,sal,mid,deptid) values(102,'Mac','Mohan','56666665','2019-09-10','IT_PROG',6000,103,95);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Employee(eid,name,surname,mobile,doj,jid,sal,mid,deptid) values(103,'Rox','Bernst','98988898','2020-08-19','Support',9000,101,90);
Query OK, 1 row affected (0.00 sec)

mysql> insert into Employee(eid,name,surname,mobile,doj,jid,sal,deptid) values(104,'Shree','John','96446781','2021-07-07','IT_PROG',9500,95);
Query OK, 1 row affected (0.01 sec)

mysql> select * from Employee;
+------+-------+---------+----------+------------+---------+------+------+--------+
| eid  | name  | surname | mobile   | doj        | jid     | sal  | mid  | deptid |
+------+-------+---------+----------+------------+---------+------+------+--------+
|  101 | Harry | King    | 555555   | 2016-06-01 | IT_PROG | 7000 |  104 |     95 |
|  102 | Mac   | Mohan   | 56666665 | 2019-09-10 | IT_PROG | 6000 |  103 |     95 |
|  103 | Rox   | Bernst  | 98988898 | 2020-08-19 | Support | 9000 |  101 |     90 |
|  104 | Shree | John    | 96446781 | 2021-07-07 | IT_PROG | 9500 | NULL |     95 |
+------+-------+---------+----------+------------+---------+------+------+--------+
4 rows in set (0.00 sec)

mysql> create table 
    -> Department(deptid int,name varchar(20),mid int, loc_id int);
Query OK, 0 rows affected (0.03 sec)

mysql> desc Department;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| deptid | int         | YES  |     | NULL    |       |
| name   | varchar(20) | YES  |     | NULL    |       |
| mid    | int         | YES  |     | NULL    |       |
| loc_id | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into Department(deptid,name,mid,loc_id) values(10,'Administration',200,1700);
Query OK, 1 row affected (0.00 sec)

mysql> insert into Department(deptid,name,mid,loc_id) values(20,'Marketing',201,1800);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Department(deptid,name,mid,loc_id) values(30,'Purchase',114,1700);
Query OK, 1 row affected (0.00 sec)

mysql> insert into Department(deptid,name,mid,loc_id) values(40,'Sales',145,2500);
Query OK, 1 row affected (0.01 sec)

mysql> select * from Department;
+--------+----------------+------+--------+
| deptid | name           | mid  | loc_id |
+--------+----------------+------+--------+
|     10 | Administration |  200 |   1700 |
|     20 | Marketing      |  201 |   1800 |
|     30 | Purchase       |  114 |   1700 |
|     40 | Sales          |  145 |   2500 |
+--------+----------------+------+--------+
4 rows in set (0.00 sec)
===============================================
1) Write a query to get a unique department id from the employee table.
ANS:--.

mysql> select distinct deptid from Employee;
+--------+
| deptid |
+--------+
|     95 |
|     90 |
+--------+
2 rows in set (0.00 sec)
=======================================================
2) Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
ANS:-->
mysql> select name, surname, sal, (sal*0.15) as PF from Employee;
+-------+---------+------+---------+
| name  | surname | sal  | PF      |
+-------+---------+------+---------+
| Harry | King    | 7000 | 1050.00 |
| Mac   | Mohan   | 6000 |  900.00 |
| Rox   | Bernst  | 9000 | 1350.00 |
| Shree | John    | 9500 | 1425.00 |
+-------+---------+------+---------+
4 rows in set (0.00 sec)

==========================================================
3) Write a query to get the employee ID, names (name,surname), salary in ascending order of salary.
ANS:-->

mysql> select eid,name,surname,sal from Employee order by sal;
+------+-------+---------+------+
| eid  | name  | surname | sal  |
+------+-------+---------+------+
|  102 | Mac   | Mohan   | 6000 |
|  101 | Harry | King    | 7000 |
|  103 | Rox   | Bernst  | 9000 |
|  104 | Shree | John    | 9500 |
+------+-------+---------+------+
4 rows in set (0.00 sec)

======================================================
4) Write a query to get the total salaries payable to employees.
ANS:-->

mysql> select sum(sal) as Total_Salary from Employee;
+--------------+
| Total_Salary |
+--------------+
|        31500 |
+--------------+
1 row in set (0.00 sec)
========================================
5) Write a query to get the maximum and minimum salary from the employees table
ANS:-->

mysql> select max(sal) as Maximum_salary, min(sal) as Minimum_Salary from Employee;
+----------------+----------------+
| Maximum_salary | Minimum_Salary |
+----------------+----------------+
|           9500 |           6000 |
+----------------+----------------+
1 row in set (0.00 sec)

========================================
6) Write a query to get the average salary and number of employees in the
employees table
ANS-->

mysql> select avg(sal) as Average_Salary, count(eid) as No_of_Employees  from Employee;
+----------------+-----------------+
| Average_Salary | No_of_Employees |
+----------------+-----------------+
|      7875.0000 |               4 |
+----------------+-----------------+
1 row in set (0.00 sec)
================================================
7) Write a query to get the first 5 characters of name from the employees table
ANS:-->

mysql> select name from Employee limit 0,5;
+-------+
| name  |
+-------+
| Harry |
| Mac   |
| Rox   |
| Shree |
+-------+
4 rows in set (0.00 sec)
====================================================
8) Write a query to display the name,surname, department ID of all employees in departments 30 or 100 in ascending order.
ANS:-->

mysql> select name,surname,deptid from Employee limit 1,3;
+-------+---------+--------+
| name  | surname | deptid |
+-------+---------+--------+
| Mac   | Mohan   |     95 |
| Rox   | Bernst  |     90 |
| Shree | John    |     95 |
+-------+---------+--------+
3 rows in set (0.00 sec)
===============================================
9) Write a query to display the name of all employees who have both "a" and "r" in their name.
ANS:-->

mysql> select name,surname,deptid from Employee where deptid in(90,95) order by deptid asc;
+-------+---------+--------+
| name  | surname | deptid |
+-------+---------+--------+
| Rox   | Bernst  |     90 |
| Harry | King    |     95 |
| Mac   | Mohan   |     95 |
| Shree | John    |     95 |
+-------+---------+--------+
4 rows in set (0.00 sec)
==================================================

mysql> select name from Employee where name like '%a%' and name like '%r%';
+-------+
| name  |
+-------+
| Harry |
+-------+
1 row in set (0.00 sec)
=======================================
10) Write a query to display the last name of employees having 'h' as the third character.
ANS:-->

mysql> select surname from Employee where surname like '__h%';
+---------+
| surname |
+---------+
| Mohan   |
| John    |
+---------+
2 rows in set (0.00 sec)

==============================================
11) Write a query to get the difference between the highest and lowest salaries.

mysql> select max(sal)-min(sal) as Salary_Difference from Employee;
+-------------------+
| Salary_Difference |
+-------------------+
|              3500 |
+-------------------+
1 row in set (0.00 sec)
==================================================

12) Write a query to get the department ID and the total salary payable in each department.
ANS:-->
mysql> select deptid, sum(sal) as Total_sal from Employee group by deptid;
+--------+-----------+
| deptid | Total_sal |
+--------+-----------+
|     95 |     22500 |
|     90 |      9000 |
+--------+-----------+
2 rows in set (0.00 sec)

===========================================
13) Write a query to display the name,department name for all employees.

ANS:-->
mysql> select e.name,d.name from Employee e inner join Department d on e.mid=d.mid;
+-------+----------------+
| name  | name           |
+-------+----------------+
| Harry | Administration |
+-------+----------------+
1 row in set (0.00 sec)

====================================
14. Write a query to find the employee id, name along with their manager_id .

ANS:-->
mysql> select eid,name,mid from Employee;
+------+-------+------+
| eid  | name  | mid  |
+------+-------+------+
|  101 | Harry |  104 |
|  102 | Mac   |  103 |
|  103 | Rox   |  101 |
|  104 | Shree | NULL |
+------+-------+------+
4 rows in set (0.00 sec)

=================================
15) Write a query to find the name and the salary of the employees who
have a higher salary than the employee whose surname =’king' 
ANS:-->
mysql> select name, sal from Employee where sal >(select sal from Employee where surname='King');
+-------+------+
| name  | sal  |
+-------+------+
| Rox   | 9000 |
| Shree | 9500 |
+-------+------+
2 rows in set (0.00 sec)
==============================
==============================
***********END****************









