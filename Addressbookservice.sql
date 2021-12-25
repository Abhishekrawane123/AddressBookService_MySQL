---------------UC1------------------------

mysql> create database AddressBookService;
Query OK, 1 row affected (0.03 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| addressbookservice   |
| emppayrollservice    |
| information_schema   |
| mybridgelabzdatabase |
| mysql                |
| performance_schema   |
| sakila               |
| sys                  |
| world                |
+----------------------+
9 rows in set (0.01 sec)

mysql> use addressbookservice;
Database changed

-------------------------------------------------

------------------UC2-----------------------------

mysql> create table AddressBook(
    -> id int unsigned not null auto_increment,
    ->  FirstName varchar(50) not null,
    -> LastName varchar(50) not null,
    -> Address varchar(150),
    -> city varchar(50),
    ->  state varchar(50),
    -> Zip long not null,
    ->  PhoneNumber long not null,
    -> email varchar(150) not null,
    ->  primary key (id)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> describe addressbook;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int unsigned | NO   | PRI | NULL    | auto_increment |
| FirstName   | varchar(50)  | NO   |     | NULL    |                |
| LastName    | varchar(50)  | NO   |     | NULL    |                |
| Address     | varchar(150) | YES  |     | NULL    |                |
| city        | varchar(50)  | YES  |     | NULL    |                |
| state       | varchar(50)  | YES  |     | NULL    |                |
| Zip         | mediumtext   | NO   |     | NULL    |                |
| PhoneNumber | mediumtext   | NO   |     | NULL    |                |
| email       | varchar(150) | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
9 rows in set (0.03 sec)

--------------------------------------------------------------------------

-------------------UC3--------------------------------------

mysql> insert into addressbook (firstname,lastname,address,city,state,zip,phonenumber,email) values ('Akash','Rahane','Adarsh colony,congress nagar','Akola','Maharashtra','444001','7789654236','AkashRahane56@gmail.com');
Query OK, 1 row affected (0.03 sec)

mysql> insert into addressbook (firstname,lastname,address,city,state,zip,phonenumber,email) values ('Abhishek','Rawane','Gajanan nagar','Akola','Maharashtra','444001','7720957882','Abhishekrawane1195@gmail.com');
Query OK, 1 row affected (0.00 sec)

mysql> select * from addressbook;
+----+-----------+----------+------------------------------+-------+-------------+--------+-------------+------------------------------+
| id | FirstName | LastName | Address                      | city  | state       | Zip    | PhoneNumber | email                        |
+----+-----------+----------+------------------------------+-------+-------------+--------+-------------+------------------------------+
|  1 | Akash     | Rahane   | Adarsh colony,congress nagar | Akola | Maharashtra | 444001 | 7789654236  | AkashRahane56@gmail.com      |
|  2 | Abhishek  | Rawane   | Gajanan nagar                | Akola | Maharashtra | 444001 | 7720957882  | Abhishekrawane1195@gmail.com |
+----+-----------+----------+------------------------------+-------+-------------+--------+-------------+------------------------------+
2 rows in set (0.00 sec)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------UC4-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

mysql> update addressbook set
    -> firstname = 'Akash'
    -> where id ='1';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 1  Changed: 0  Warnings: 0

mysql> update addressbook set lastname ='Khambalkar' where id = '1';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook;
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
| id | FirstName | LastName   | Address                      | city  | state       | Zip    | PhoneNumber | email                        |
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
|  1 | Akash     | Khambalkar | Adarsh colony,congress nagar | Akola | Maharashtra | 444001 | 7789654236  | AkashRahane56@gmail.com      |
|  2 | Abhishek  | Rawane     | Gajanan nagar                | Akola | Maharashtra | 444001 | 7720957882  | Abhishekrawane1195@gmail.com |
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
2 rows in set (0.01 sec)

mysql> update addressbook set
    -> firstname = 'Ram'
    -> where id ='1';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook;
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
| id | FirstName | LastName   | Address                      | city  | state       | Zip    | PhoneNumber | email                        |
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
|  1 | Ram       | Khambalkar | Adarsh colony,congress nagar | Akola | Maharashtra | 444001 | 7789654236  | AkashRahane56@gmail.com      |
|  2 | Abhishek  | Rawane     | Gajanan nagar                | Akola | Maharashtra | 444001 | 7720957882  | Abhishekrawane1195@gmail.com |
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
2 rows in set (0.00 sec)

---------------------------------------------------------------------------------------------------------------------------------
------------------------------UC5-------------------------------------------------------------------------------

mysql> delete from addressbook where firstname = 'empty';
Query OK, 0 rows affected (0.01 sec)

mysql> select * from addressbook;
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
| id | FirstName | LastName   | Address                      | city  | state       | Zip    | PhoneNumber | email                        |
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
|  1 | Ram       | Khambalkar | Adarsh colony,congress nagar | Akola | Maharashtra | 444001 | 7789654236  | AkashRahane56@gmail.com      |
|  2 | Abhishek  | Rawane     | Gajanan nagar                | Akola | Maharashtra | 444001 | 7720957882  | Abhishekrawane1195@gmail.com |
|  3 | Kiran     | Deshmukh   | at post chikhli              | Risod | Maharashtra | 444505 | 9763093295  | KiranDeshmukh56@gmail.com    |
|  4 | Manish    | Jangid     | at post sikar                | Sikar | Rajasthan   | 444001 | 7325468596  | Jangidmanish143@gmail.com    |
+----+-----------+------------+------------------------------+-------+-------------+--------+-------------+------------------------------+
4 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------
----------------------------------UC6----------------------------------------------------------------------------------------


mysql> select firstname from addressbook where city ='Sikar';
+-----------+
| firstname |
+-----------+
| Manish    |
+-----------+
1 row in set (0.00 sec)

mysql> select firstname from addressbook where state ='Rajasthan';
+-----------+
| firstname |
+-----------+
| Manish    |
+-----------+
1 row in set (0.00 sec)

---------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------UC7---------------------------------------------------------------------------------------------------------------

mysql> select city,count(*) from addressbook where city = 'Risod';
+-------+----------+
| city  | count(*) |
+-------+----------+
| Risod |        1 |
+-------+----------+
1 row in set (0.01 sec)

mysql> select state,count(*) from addressbook where state = 'Maharashtra';
+-------------+----------+
| state       | count(*) |
+-------------+----------+
| Maharashtra |        3 |
+-------------+----------+
1 row in set (0.00 sec)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------UC8---------------------------------------------------------------------------------------------

mysql> select * from addressbook where  city = 'Pune' order by firstname;
+----+-----------+-----------+----------------------------+------+-------------+--------+-------------+---------------------------+
| id | FirstName | LastName  | Address                    | city | state       | Zip    | PhoneNumber | email                     |
+----+-----------+-----------+----------------------------+------+-------------+--------+-------------+---------------------------+
|  7 | Ashish    | Rawane    | Tilak road, somwar peth    | Pune | Maharashtra | 443210 | 7895623411  | Ashishrawane@gmail.com    |
|  6 | Mahesh    | Manvatkar | sawarkar marg, karve nagar | Pune | Maharashtra | 443210 | 7276451245  | mahimanvatkar12@gmail.com |
+----+-----------+-----------+----------------------------+------+-------------+--------+-------------+---------------------------+
2 rows in set (0.01 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------UC9--------------------------------------------------------------------------------------------------


mysql> alter table addressbook add type varchar(50) after email;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from addressbook;
+----+-----------+------------+------------------------------+--------+-------------+--------+-------------+------------------------------+------+
| id | FirstName | LastName   | Address                      | city   | state       | Zip    | PhoneNumber | email                        | type |
+----+-----------+------------+------------------------------+--------+-------------+--------+-------------+------------------------------+------+
|  1 | Ram       | Khambalkar | Adarsh colony,congress nagar | Akola  | Maharashtra | 444001 | 7789654236  | AkashRahane56@gmail.com      | NULL |
|  2 | Abhishek  | Rawane     | Gajanan nagar                | Akola  | Maharashtra | 444001 | 7720957882  | Abhishekrawane1195@gmail.com | NULL |
|  3 | Kiran     | Deshmukh   | at post chikhli              | Risod  | Maharashtra | 444505 | 9763093295  | KiranDeshmukh56@gmail.com    | NULL |
|  4 | Manish    | Jangid     | at post sikar                | Sikar  | Rajasthan   | 444001 | 7325468596  | Jangidmanish143@gmail.com    | NULL |
|  5 | Santosh   | Daware     | at post jaulka               | Jaulka | Maharashtra | 444504 | 8664562532  | santoshdaware@gmail.com      | NULL |
|  6 | Mahesh    | Manvatkar  | sawarkar marg, karve nagar   | Pune   | Maharashtra | 443210 | 7276451245  | mahimanvatkar12@gmail.com    | NULL |
|  7 | Ashish    | Rawane     | Tilak road, somwar peth      | Pune   | Maharashtra | 443210 | 7895623411  | Ashishrawane@gmail.com       | NULL |
+----+-----------+------------+------------------------------+--------+-------------+--------+-------------+------------------------------+------+
7 rows in set (0.00 sec)

mysql> update addressbook set type = 'family' where firstname = 'Manish';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressbook set type = 'friend' where firstname = 'Kiran';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressbook set type = 'friend' where firstname = 'santosh';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressbook set type = 'profissional' where firstname = 'Mahesh';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressbook set type = 'profissional' where firstname = 'Ashish';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  update addressbook set type = 'profissional' where firstname = 'Abhishek';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  update addressbook set type = 'others' where firstname = 'Ram';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook;
+----+-----------+------------+------------------------------+--------+-------------+--------+-------------+------------------------------+--------------+
| id | FirstName | LastName   | Address                      | city   | state       | Zip    | PhoneNumber | email                        | type         |
+----+-----------+------------+------------------------------+--------+-------------+--------+-------------+------------------------------+--------------+
|  1 | Ram       | Khambalkar | Adarsh colony,congress nagar | Akola  | Maharashtra | 444001 | 7789654236  | AkashRahane56@gmail.com      | others       |
|  2 | Abhishek  | Rawane     | Gajanan nagar                | Akola  | Maharashtra | 444001 | 7720957882  | Abhishekrawane1195@gmail.com | profissional |
|  3 | Kiran     | Deshmukh   | at post chikhli              | Risod  | Maharashtra | 444505 | 9763093295  | KiranDeshmukh56@gmail.com    | friend       |
|  4 | Manish    | Jangid     | at post sikar                | Sikar  | Rajasthan   | 444001 | 7325468596  | Jangidmanish143@gmail.com    | family       |
|  5 | Santosh   | Daware     | at post jaulka               | Jaulka | Maharashtra | 444504 | 8664562532  | santoshdaware@gmail.com      | friend       |
|  6 | Mahesh    | Manvatkar  | sawarkar marg, karve nagar   | Pune   | Maharashtra | 443210 | 7276451245  | mahimanvatkar12@gmail.com    | profissional |
|  7 | Ashish    | Rawane     | Tilak road, somwar peth      | Pune   | Maharashtra | 443210 | 7895623411  | Ashishrawane@gmail.com       | profissional |
+----+-----------+------------+------------------------------+--------+-------------+--------+-------------+------------------------------+--------------+
7 rows in set (0.00 sec)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------UC10-------------------------------------------------------------------------------------------

mysql>  select * from addressbook where type = 'family' order by firstname;
+----+-----------+----------+---------------+-------+-----------+--------+-------------+---------------------------+--------+
| id | FirstName | LastName | Address       | city  | state     | Zip    | PhoneNumber | email                     | type   |
+----+-----------+----------+---------------+-------+-----------+--------+-------------+---------------------------+--------+
|  4 | Manish    | Jangid   | at post sikar | Sikar | Rajasthan | 444001 | 7325468596  | Jangidmanish143@gmail.com | family |
+----+-----------+----------+---------------+-------+-----------+--------+-------------+---------------------------+--------+
1 row in set (0.00 sec)

mysql> select type,count(*) from addressbook where type = 'profissional';
+--------------+----------+
| type         | count(*) |
+--------------+----------+
| profissional |        3 |
+--------------+----------+
1 row in set (0.00 sec)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

