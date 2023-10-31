Assignment: Subqueries in SQL

Database Schema:
Consider a simplified database for a library. The database has two tables: `books` and `borrowers`. The `books` table contains information about books in the library, including `book_id`, `title`, and `author`. The `borrowers` table contains information about library cardholders, including `card_id`, `name`, and `email`. Additionally, there is a third table called `checkouts` that logs book borrowings. It contains `checkout_id`, `card_id` (the borrower), `book_id` (the borrowed book), and `checkout_date`.

books(bid,title,author)-20
borrowers(cardid,name,email) -10

checkouts(checkout_id,cardid,bookid,checkout_date)
 Ck_id   card_id    bkid    date
1    2             2         ‘2023-03-08’
2               2             5         ‘ 2023-03-08’
3               4           5         ‘2023-03-16’
4               3           8          
5   4            9
6               2          10

=================================================================================
-------------------->
mysql> create table books(book_id int PRIMARY KEY AUTO_INCREMENT,b_title varchar(50),b_author varchar(50));
Query OK, 0 rows affected (0.03 sec)

mysql> desc books;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| book_id  | int         | NO   | PRI | NULL    | auto_increment |
| b_title  | varchar(50) | YES  |     | NULL    |                |
| b_author | varchar(50) | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> create table borrowers(card_id int PRIMARY KEY, name varchar(50), email varchar(50));
Query OK, 0 rows affected (0.03 sec)

mysql> desc borrowers;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| card_id | int         | NO   | PRI | NULL    |       |
| name    | varchar(50) | YES  |     | NULL    |       |
| email   | varchar(50) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table checkouts(checkout_id int, cd_id int,bk_id int,checkout_date date, foreign key(cd_id) references borrowers(card_id),foreign key(bk_id) references books(book_id));
 
Query OK, 0 rows affected (0.04 sec)

mysql> desc checkouts;
+---------------+------+------+-----+---------+-------+
| Field         | Type | Null | Key | Default | Extra |
+---------------+------+------+-----+---------+-------+
| checkout_id   | int  | YES  |     | NULL    |       |
| cd_id         | int  | YES  | MUL | NULL    |       |
| bk_id         | int  | YES  | MUL | NULL    |       |
| checkout_date | date | YES  |     | NULL    |       |
+---------------+------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> insert into books(b_title,b_author) values('ABSALOM','WILLIAM FAULKNER'),('A TIME TO KILL','JOHN GRISHAM');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into books(b_title,b_author) values('THE HOUSE OF MIRTH','EDITH WHARTON'),('EAST OF EDEN','JOHN STEINBECK'),(' THE SUN ALSO RISES ','ERNEST HEMINGWAY');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into books(b_title,b_author) values(' VILE BODIES','EVELYN WAUGH'),('A SCANNER DARKLY','PHILIP K. DICK');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into books(b_title,b_author) values('MOAB IS MY WASHPOT','STEPHEN FRY'),('NUMBER THE STARS','LOIS LOWRY'),(' NOLI ME TANGERE','JOSÉ RIZAL');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from books;
+---------+----------------------+------------------+
| book_id | b_title              | b_author         |
+---------+----------------------+------------------+
|       1 | ABSALOM              | WILLIAM FAULKNER |
|       2 | A TIME TO KILL       | JOHN GRISHAM     |
|       3 | THE HOUSE OF MIRTH   | EDITH WHARTON    |
|       4 | EAST OF EDEN         | JOHN STEINBECK   |
|       5 |  THE SUN ALSO RISES  | ERNEST HEMINGWAY |
|       6 |  VILE BODIES         | EVELYN WAUGH     |
|       7 | A SCANNER DARKLY     | PHILIP K. DICK   |
|       8 | MOAB IS MY WASHPOT   | STEPHEN FRY      |
|       9 | NUMBER THE STARS     | LOIS LOWRY       |
|      10 |  NOLI ME TANGERE     | JOSÉ RIZAL       |
+---------+----------------------+------------------+
10 rows in set (0.00 sec)

mysql> insert into borrowers(card_id,name,email) values(1,'HARRY','harry@gmail.com'),(2,'MAC','mac@gmail.com'),(3,'ROX','rox@gmail.com'),(4,'ROHAN','rohan@gmail.com');
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into borrowers(card_id,name,email) values(5,'MAX','max@gmail.com'),(6,'RONY','rony@gmail.com'),(7,'TONY','tony@gmail.com'),(8,'JOHN','john@gmail.com');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into borrowers(card_id,name,email) values(9,'SUNY','suny@gmail.com'),(10,'SANKET','sanket@gmail.com');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from borrowers;
+---------+--------+------------------+
| card_id | name   | email            |
+---------+--------+------------------+
|       1 | HARRY  | harry@gmail.com  |
|       2 | MAC    | mac@gmail.com    |
|       3 | ROX    | rox@gmail.com    |
|       4 | ROHAN  | rohan@gmail.com  |
|       5 | MAX    | max@gmail.com    |
|       6 | RONY   | rony@gmail.com   |
|       7 | TONY   | tony@gmail.com   |
|       8 | JOHN   | john@gmail.com   |
|       9 | SUNY   | suny@gmail.com   |
|      10 | SANKET | sanket@gmail.com |
+---------+--------+------------------+
10 rows in set (0.00 sec)

mysql> insert into checkouts(checkout_id,cd_id,bk_id,checkout_date) values(1,2,2,'2023-03-08'),(2,2,5,'2023-03-08'),(3,4,5,'2023-03-16'),(4,3,8,'2023-08-12');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into checkouts(checkout_id,cd_id,bk_id) values(5,4,9),(6,2,10);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from checkouts;
+-------------+-------+-------+---------------+
| checkout_id | cd_id | bk_id | checkout_date |
+-------------+-------+-------+---------------+
|           1 |     2 |     2 | 2023-03-08    |
|           2 |     2 |     5 | 2023-03-08    |
|           3 |     4 |     5 | 2023-03-16    |
|           4 |     3 |     8 | 2023-08-12    |
|           5 |     4 |     9 | NULL          |
|           6 |     2 |    10 | NULL          |
+-------------+-------+-------+---------------+
6 rows in set (0.00 sec)
=====================================================================================================================
=====================================================================================================================
Tasks:



1. List the books that have been borrowed:
Write a SQL query that retrieves the titles of all the books that have been borrowed at least once. Include the book title only once in the result, even if it has been borrowed multiple times.
ANS:----------------->

mysql> select distinct b_title from books b INNER JOIN checkouts c on b.book_id = c.cd_id;
+--------------------+
| b_title            |
+--------------------+
| A TIME TO KILL     |
| THE HOUSE OF MIRTH |
| EAST OF EDEN       |
+--------------------+
3 rows in set (0.00 sec)

----------------------------------------------




===================================================================================================================

2. List the borrowers who have borrowed more than three books:
Write a SQL query that retrieves the names of borrowers who have borrowed more than three books.
ANS:-------------------->
mysql>  select br.name from borrowers br INNER JOIN checkouts c on(br.card_id = c.cd_id) group by br.name having count(c.cd_id)>2;
+------+
| name |
+------+
| MAC  |+
+------+
1 row in set (0.00 sec)

===================================================================================================================
3. List the books that are currently checked out:
Write a SQL query that retrieves the titles of books that are currently checked out (i.e., they have a checkout record with no return date).
ANS:---------------------->

mysql> select b.b_title from books b INNER JOIN checkouts c on(b.book_id = c.bk_id) where c.checkout_date IS NULL;
+------------------+
| b_title          |
+------------------+
| NUMBER THE STARS |
|  NOLI ME TANGERE |
+------------------+
2 rows in set (0.00 sec)
=
=====================================================================================================================
4. List the borrowers who have not borrowed any books:
Write a SQL query that retrieves the names of borrowers who have not borrowed any books.
ANS:-------------------->

mysql> select br.name from borrowers br LEFT JOIN  checkouts c on(br.card_id = c.cd_id) where c.cd_id IS NULL;
+--------+
| name   |
+--------+
| HARRY  |
| MAX    |
| RONY   |
| TONY   |
| JOHN   |
| SUNY   |
| SANKET |
+--------+
7 rows in set (0.00 sec)

===============================================================================================================
5. List the books borrowed by a specific borrower:
Prompt the user for a borrower's name, and then write a SQL query that retrieves the titles of books borrowed by that borrower.
ANS:----------------------->

mysql> select b.b_title, br.name from books b inner join checkouts c on b.book_id=c.bk_id inner join borrowers br on br.card_id=c.cd_id;
+----------------------+-------+
| b_title              | name  |
+----------------------+-------+
| A TIME TO KILL       | MAC   |
|  THE SUN ALSO RISES  | MAC   |
|  THE SUN ALSO RISES  | ROHAN |
| MOAB IS MY WASHPOT   | ROX   |
| NUMBER THE STARS     | ROHAN |
|  NOLI ME TANGERE     | MAC   |
+----------------------+-------+
6 rows in set (0.00 sec)

mysql> select b.b_title, br.name from books b inner join checkouts c on b.book_id=c.bk_id inner join borrowers br on br.card_id=c.cd_id where br.name = "MAC";

+----------------------+------+
| b_title              | name |
+----------------------+------+
| A TIME TO KILL       | MAC  |
|  THE SUN ALSO RISES  | MAC  |
|  NOLI ME TANGERE     | MAC  |
+----------------------+------+
3 rows in set (0.00 sec)



==============================================================================================================
==============================================================================================================


some additional SQL questions that involve subqueries:

1. Find the authors who have written books in multiple genres:
Write an SQL query to find the authors who have written books in more than one genre. The database has three tables: `authors`, `books`, and `genres`. The `authors` table contains author information, the `books` table contains book information including the author's ID and genre ID, and the `genres` table contains genre information.
ANS:-------------------------->

mysql> select a.author_name from authors a inner join book1 b on (a.author_id=b.author_id) group by b.author_id having count(b.author_id)>1;
+-------------+
| author_name |
+-------------+
| Rich        |
| john        |
| Max         |
| Androw      |
| Anex        |
+-------------+
5 rows in set (0.01 sec)

==========================================================================================================================

2. List the books that have not been borrowed in the last six months:
Write an SQL query to list the titles of books that have not been borrowed in the last six months. You can use the `books` and `checkouts` tables for this task.
-------------------->

mysql> select b_title from books where book_id in(select bk_id from checkouts where checkout_date >=NOW() - INTERVAL 6 month);

+--------------------+
| b_title            |
+--------------------+
| MOAB IS MY WASHPOT |
+--------------------+
1 row in set (0.01 sec)



========================================================

3.

------->

mysql> select * from borrowers where card_id in(select cd_id from checkouts where bk_id in(select book_id from books where b_author='JOHN GRISHAM'));
+---------+------+---------------+
| card_id | name | email         |
+---------+------+---------------+
|       2 | MAC  | mac@gmail.com |
+---------+------+---------------+
1 row in set (0.00 sec)

========================================

4.

mysql> select br.name, ceil(count(*)/count(distinct c.cd_id)) as average from borrowers br left join (select cd_id, count(*) as checkout_count from checkouts group by cd_id ) c on br.
card_id = c.cd_id group by br.name;
+--------+---------+
| name   | average |
+--------+---------+
| HARRY  |    NULL |
| JOHN   |    NULL |
| MAC    |       1 |
| MAX    |    NULL |
| ROHAN  |       1 |
| RONY   |    NULL |
| ROX    |       1 |
| SANKET |    NULL |
| SUNY   |    NULL |
| TONY   |    NULL |
+--------+---------+
10 rows in set, 7 warnings (0.00 sec)


=====================================

5.








