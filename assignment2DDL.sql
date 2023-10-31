nandini@nandini:~$ mysql -u root -p; 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.34-0ubuntu0.23.04.1 (Ubuntu)

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select * from Employee;
ERROR 1046 (3D000): No database selected
mysql> select * from Department;
ERROR 1046 (3D000): No database selected
mysql> use testdb
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from Employee;
+----+----------+--------+-------------+
| id | name     | salary | designation |
+----+----------+--------+-------------+
|  1 | payal    |  10000 | NULL        |
|  2 | nandini  |  15000 | NULL        |
|  3 | vikas    |  50000 | NULL        |
|  4 | virajash |  35000 | NULL        |
+----+----------+--------+-------------+
4 rows in set (0.00 sec)

mysql> select * from Department;
ERROR 1146 (42S02): Table 'testdb.Department' doesn't exist
mysql> drop table Employee;
Query OK, 0 rows affected (0.04 sec)

mysql> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| Orders           |
| cust             |
| customer         |
| emp              |
| new_dept         |
| ord              |
| stud1            |
| stud2            |
| stud3            |
| stud4            |
+------------------+
10 rows in set (0.00 sec)

mysql> create table Department(dept_id int PRIMARY KEY, dept_name vrachar(20) NOT NULL);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'vrachar(20) NOT NULL)' at line 1
mysql> create table Department(dept_id int PRIMARY KEY, dept_name varchar(20) NOT NULL);
Query OK, 0 rows affected (0.04 sec)

mysql> desc Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(20) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> insert into Department(dept_id,dept_name) values(1,'IT'),(2,'IT'),(3,'Support');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into Department(dept_id,dept_name) values(4,'HR'),(5,'Supprt'),(6,'HR');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into Department(dept_id,dept_name) values(7,'Testing'),(8,'IT'),(9,'HR'),(10,'IT');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from Department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | IT        |
|       2 | IT        |
|       3 | Support   |
|       4 | HR        |
|       5 | Supprt    |
|       6 | HR        |
|       7 | Testing   |
|       8 | IT        |
|       9 | HR        |
|      10 | IT        |
+---------+-----------+
10 rows in set (0.00 sec)

mysql> create table Employee(id int PRIMARY KEY,name varchar(50) UNIQUE,salary DEFAULT 2000, FOREIGN KEY(id) references Department(dept_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DEFAULT 2000, FOREIGN KEY(id) references Department(dept_id))' at line 1
mysql> create table Employee(id int PRIMARY KEY,name varchar(50) UNIQUE,salary int DEFAULT 2000, FOREIGN KEY(id) references Department(dept_id));
Query OK, 0 rows affected (0.04 sec)

mysql> desc Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(20) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> show ceate table Employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ceate table Employee' at line 1
mysql> show create table Employee;
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                                                                                                  |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Employee | CREATE TABLE `Employee` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `salary` int DEFAULT '2000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> alter table Employee add designation varchar(20);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(20) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> desc Employee
    -> ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id          | int         | NO   | PRI | NULL    |       |
| name        | varchar(50) | YES  | UNI | NULL    |       |
| salary      | int         | YES  |     | 2000    |       |
| designation | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into Employee(id,name)  values(1,'mac'),(2,'rox'),(3,'nick');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into Employee(id,name)  values(4,'max'),(5,'john'),(6,'rohn');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into Employee(id,name)  values(7,'jack'),(8,'harry'),(9,'jain'),(10,'bruce');
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from Employee;
+----+-------+--------+-------------+
| id | name  | salary | designation |
+----+-------+--------+-------------+
|  1 | mac   |   2000 | NULL        |
|  2 | rox   |   2000 | NULL        |
|  3 | nick  |   2000 | NULL        |
|  4 | max   |   2000 | NULL        |
|  5 | john  |   2000 | NULL        |
|  6 | rohn  |   2000 | NULL        |
|  7 | jack  |   2000 | NULL        |
|  8 | harry |   2000 | NULL        |
|  9 | jain  |   2000 | NULL        |
| 10 | bruce |   2000 | NULL        |
+----+-------+--------+-------------+
10 rows in set (0.00 sec)

mysql> alter table Department add column no_of_days int;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Department;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| dept_id    | int         | NO   | PRI | NULL    |       |
| dept_name  | varchar(20) | NO   |     | NULL    |       |
| no_of_days | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> update Department set no_of_days=30 where dept_id=1, no_of_days=30 where dept_id=1, 
    -> no_of_days=30 where dept_id=1, 
    -> no_of_days=30 where dept_id=1, 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', no_of_days=30 where dept_id=1, 
no_of_days=30 where dept_id=1, 
no_of_days=30 ' at line 1
mysql> update Department set no_of_days=30 where dept_id=1, no_of_days=40 where dept_id=4,  no_of_days=30 where dept_id=2,  no_of_days=30 where dept_id=3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', no_of_days=40 where dept_id=4,  no_of_days=30 where dept_id=2,  no_of_days=30 ' at line 1
mysql> update Department set no_of_days=30 where dept_id=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=30 where dept_id=2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=30 where dept_id=3
    -> ;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=50 where dept_id=4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=40 where dept_id=5;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=50 where dept_id=6;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=60 where dept_id=7;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=60 where dept_id=8;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=50 where dept_id=9;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Department set no_of_days=40 where dept_id=10;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Department;
+---------+-----------+------------+
| dept_id | dept_name | no_of_days |
+---------+-----------+------------+
|       1 | IT        |         30 |
|       2 | IT        |         30 |
|       3 | Support   |         30 |
|       4 | HR        |         50 |
|       5 | Supprt    |         40 |
|       6 | HR        |         50 |
|       7 | Testing   |         60 |
|       8 | IT        |         60 |
|       9 | HR        |         50 |
|      10 | IT        |         40 |
+---------+-----------+------------+
10 rows in set (0.00 sec)

mysql> rename table Department to new_dept;
ERROR 1050 (42S01): Table 'new_dept' already exists
mysql> drop table new_dept;
Query OK, 0 rows affected (0.01 sec)

mysql> rename table Department to new_dept;
Query OK, 0 rows affected (0.03 sec)

mysql> update Employee set name='Virajash' where id=5;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Employee;;
+----+----------+--------+-------------+
| id | name     | salary | designation |
+----+----------+--------+-------------+
|  1 | mac      |   2000 | NULL        |
|  2 | rox      |   2000 | NULL        |
|  3 | nick     |   2000 | NULL        |
|  4 | max      |   2000 | NULL        |
|  5 | Virajash |   2000 | NULL        |
|  6 | rohn     |   2000 | NULL        |
|  7 | jack     |   2000 | NULL        |
|  8 | harry    |   2000 | NULL        |
|  9 | jain     |   2000 | NULL        |
| 10 | bruce    |   2000 | NULL        |
+----+----------+--------+-------------+
10 rows in set (0.00 sec)

ERROR: 
No query specified

mysql> update new_dept set salary = 50000 where id=3;
ERROR 1054 (42S22): Unknown column 'id' in 'where clause'
mysql> update Employee set salary = 50000 where id=3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Employee;;
+----+----------+--------+-------------+
| id | name     | salary | designation |
+----+----------+--------+-------------+
|  1 | mac      |   2000 | NULL        |
|  2 | rox      |   2000 | NULL        |
|  3 | nick     |  50000 | NULL        |
|  4 | max      |   2000 | NULL        |
|  5 | Virajash |   2000 | NULL        |
|  6 | rohn     |   2000 | NULL        |
|  7 | jack     |   2000 | NULL        |
|  8 | harry    |   2000 | NULL        |
|  9 | jain     |   2000 | NULL        |
| 10 | bruce    |   2000 | NULL        |
+----+----------+--------+-------------+
10 rows in set (0.00 sec)

ERROR: 
No query specified

mysql> delete from Department where dept_name='IT';
ERROR 1146 (42S02): Table 'testdb.Department' doesn't exist
mysql> delete from new_dept where dept_name='IT';
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`testdb`.`Employee`, CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`id`) REFERENCES `new_dept` (`dept_id`))
mysql> alter table Employee
    -> ;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from Employee;;
+----+----------+--------+-------------+
| id | name     | salary | designation |
+----+----------+--------+-------------+
|  1 | mac      |   2000 | NULL        |
|  2 | rox      |   2000 | NULL        |
|  3 | nick     |  50000 | NULL        |
|  4 | max      |   2000 | NULL        |
|  5 | Virajash |   2000 | NULL        |
|  6 | rohn     |   2000 | NULL        |
|  7 | jack     |   2000 | NULL        |
|  8 | harry    |   2000 | NULL        |
|  9 | jain     |   2000 | NULL        |
| 10 | bruce    |   2000 | NULL        |
+----+----------+--------+-------------+
10 rows in set (0.00 sec)

ERROR: 
No query specified

mysql> alter table Employee add foreign key(id) references new_dept(dept_id) on delete cascade on update cascade;
Query OK, 10 rows affected (0.07 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> show create table Employee;
+----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
+----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Employee | CREATE TABLE `Employee` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `salary` int DEFAULT '2000',
  `designation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`id`) REFERENCES `new_dept` (`dept_id`),
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`id`) REFERENCES `new_dept` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> alter table Employee drop constraint Employee_ibfk_1;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> delete from new_dept where dept_name='IT';
Query OK, 4 rows affected (0.01 sec)

mysql> select * from new_dept;
+---------+-----------+------------+
| dept_id | dept_name | no_of_days |
+---------+-----------+------------+
|       3 | Support   |         30 |
|       4 | HR        |         50 |
|       5 | Supprt    |         40 |
|       6 | HR        |         50 |
|       7 | Testing   |         60 |
|       9 | HR        |         50 |
+---------+-----------+------------+
6 rows in set (0.00 sec)

mysql> drop table Employee;
Query OK, 0 rows affected (0.02 sec)

mysql> drop table new_dept;
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| Orders           |
| cust             |
| customer         |
| emp              |
| ord              |
| stud1            |
| stud2            |
| stud3            |
| stud4            |
+------------------+
9 rows in set (0.00 sec)

mysql> 

