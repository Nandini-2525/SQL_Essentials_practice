DDL Questions:

1. Create a table called "Customers" with the following columns:
   - id (integer, primary key)
   - FirstName (varchar(50))
   - LastName (varchar(50))
   - Email (varchar(100))
   - Age (integer
  
 ANS:-

 create  table Customers(id int PRIMARY KEY, FirstName varchar(50),LastName varchar(50),Email varchar(100),Age int);
 
Query OK, 0 rows affected (0.03 sec)

output
mysql> desc Customers;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int          | NO   | PRI | NULL    |       |
| FirstName | varchar(50)  | YES  |     | NULL    |       |
| LastName  | varchar(50)  | YES  |     | NULL    |       |
| Email     | varchar(100) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)
=========================================================

2. Add a new column called "Address" to the "Customers" table with the data type varchar(200).
ANS:-

mysql> alter table Customers
    -> add Address varchar(200);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

Output:-
mysql> desc Customers;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int          | NO   | PRI | NULL    |       |
| FirstName | varchar(50)  | YES  |     | NULL    |       |
| LastName  | varchar(50)  | YES  |     | NULL    |       |
| Email     | varchar(100) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
| Address   | varchar(200) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)
==================================================

3. Create a table called "Orders" with the following columns:
   - OrderID (integer, primary key)
   - CustomerID (integer, foreign key referencing Customeers.id)
   - OrderDate (date)
   - TotalAmount (decimal(10,2))
ANS:-
mysql> create table Orders(orderId int PRIMARY KEY,CustomerId int, OrderDate date, TotalAmount decimal(10,2), foreign key(CustomerId) references Customers(id));
Query OK, 0 rows affected (0.04 sec)

mysql> desc Orders;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| orderId     | int           | NO   | PRI | NULL    |       |
| CustomerId  | int           | YES  | MUL | NULL    |       |
| OrderDate   | date          | YES  |     | NULL    |       |
| TotalAmount | decimal(10,2) | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
=========================================================

4. Define a unique constraint on the "Email" column of the "Customers" table.

ANS:-
mysql> alter table Customers
    -> add UNIQUE(Email);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Customers;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int          | NO   | PRI | NULL    |       |
| FirstName | varchar(50)  | YES  |     | NULL    |       |
| LastName  | varchar(50)  | YES  |     | NULL    |       |
| Email     | varchar(100) | YES  | UNI | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
| Address   | varchar(200) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

========================================================
========================================================
DML Questions:

1. Insert a new customer into the "Customers" table with the following details:
   - CustomerID: 1
   - FirstName: "John"
   - LastName: "Doe"
   - Email: "johndoe@example.com"
   - Age: 30
   - Address: "123 Main St, Anytown, USA"
ANS:-

mysql> insert into Customers(id,FirstName,LastName,Email,Age,Address) values(1,'John','Doe','johndoe@exampl.com',30,'123 Main St, Anytown, USA');
Query OK, 1 row affected (0.01 sec)

mysql> select * from Customers;
+----+-----------+----------+--------------------+------+---------------------------+
| id | FirstName | LastName | Email              | Age  | Address                   |
+----+-----------+----------+--------------------+------+---------------------------+
|  1 | John      | Doe      | johndoe@exampl.com |   30 | 123 Main St, Anytown, USA |
+----+-----------+----------+--------------------+------+---------------------------+
1 row in set (0.00 sec)
=====================================================

2. Update the age of customer with CustomerID 1 to 35.
mysql> update Customers set Age = 35 WHERE id=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Customers;
+----+-----------+----------+--------------------+------+---------------------------+
| id | FirstName | LastName | Email              | Age  | Address                   |
+----+-----------+----------+--------------------+------+---------------------------+
|  1 | John      | Doe      | johndoe@exampl.com |   35 | 123 Main St, Anytown, USA |
+----+-----------+----------+--------------------+------+---------------------------+
1 row in set (0.00 sec)
========================================================

3. Delete all orders placed before a specific date from the "Orders" table.

ANS:-

mysql> delete from orders where orderdate <= '2023-10-17';

======================================================

4. Retrieve all customers who have the last name "Smith" from the "Customers" table.
ANS:-
select * from customer where lastname in('Smith');

======================================================

5. Calculate the average total amount of all orders from the "Orders" table.

ANS:-


 select avg(TotalAmount) as avgAmount from orders;
 
 
 
 
 
 
 ****************************************
 ========================================
 ****************************************
 ASSIGNMENT : DDL Assignment
 
 
 Create tables Employee and Department as given below 
Employee(id,name,salary)
Department(dept_id,dept_name)
Relationship Employee -> Department (M-1)
(  Note: 1’s Primary key goes to M’s table
I.e. use foreign key
1-One
M-Many   )

Write a query as per questions

1.Create a Table department(put primary key) with not null constraint on dept_name .
ANS:--->
create table Department(dept_id int PRIMARY KEY,dept_name varchar(20) NOT NULL);


desc Department;

===============================================================

2.Create a Table Employee(put primary key and foreign key) with default constraint on salary(default value is 2000)  and unique constraint on name.
ANS:- 
create table Employee(id int PRIMARY KEY, name varchar(20) UNIQUE, salary int DEFAULT 2000, FOREIGN KEY(id) references Department(dept_id));


desc Employee;


==============================================================

3.In the Employee table add column designation with datatype varchar(20)

ANS:-->

alter table Employee add column designantion varchar(20);


========================================================

5.Add attribute no_of_days in department.
ANS:-->

alter table Department add no_of_days int;


=====================================================
6.Set different no_of_days values for all 10 records.
ANS:-->
update Department set no_of_days=30 where dept_id=1;

=================================================

7.Rename table Department to new_dept.

ANS:-->
rename table Department to new_dept;


===========================================
8.Update the employee name to ‘Virajash’ whose id is 5.

ANS:-->
update table Employee set name='Virajash' where id=5;

==========================================

9.Update employee salary as 50000 whose dept_id is 3. 
ANS:-->
update Employee set salary=5000 where id=3;


=========================================
10. Delete all records from the department whose dept_name is ‘IT’.
ANS:-->
 delete from Department where dept_name='IT';
 
 ================================
 
 11. Remove Tables employee and department from the database.
ANS:--> drop table Department;
drop table Employee;


