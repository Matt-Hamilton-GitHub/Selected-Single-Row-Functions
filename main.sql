
Answer to Question 1
====================

SQL> SELECT INITCAP(lastname) "LASTNAME", INITCAP(firstname) "FIRSTNAME"
  FROM customers;

LASTNAME   FIRSTNAME
---------- ----------
Morales    Bonita
Thompson   Ryan
Smith      Leila
Pierson    Thomas
Girard     Cindy
Cruz       Meshia
Giana      Tammy
Jones      Kenneth
Perez      Jorge
Lucas      Jake
Mcgovern   Reese
Mckenzie   William
Nguyen     Nicholas
Lee        Jasmine
Schell     Steve
Daum       Michell
Nelson     Becca
Montiasa   Greg
Smith      Jennifer
Falah      Kenneth

20 rows selected.
 

Answer to Question 2
====================
SQL> SELECT customer#,
           NVL2 (REFERRED,'REFERRED', 'NOT REFERRED') "REFERENCE"
    FROM customers;

 CUSTOMER# REFERENCE
---------- ------------
      1001 NOT REFERRED
      1002 NOT REFERRED
      1003 NOT REFERRED
      1004 NOT REFERRED
      1005 NOT REFERRED
      1006 NOT REFERRED
      1007 REFERRED
      1008 NOT REFERRED
      1009 REFERRED
      1010 NOT REFERRED
      1011 NOT REFERRED
      1012 NOT REFERRED
      1013 REFERRED
      1014 NOT REFERRED
      1015 NOT REFERRED
      1016 REFERRED
      1017 NOT REFERRED
      1018 NOT REFERRED
      1019 REFERRED
      1020 NOT REFERRED

20 rows selected.

Answer to Question 3
====================
SQL> SELECT b.title,
    TO_CHAR(((oi.paideach*oi.quantity)-(b.cost*oi.quantity)), '$999.99') "Profit"
    FROM orders o JOIN orderitems oi
    USING(order#)
       JOIN books b USING(isbn)
    WHERE order# = 1002;

TITLE                          Profit
------------------------------ --------
DATABASE IMPLEMENTATION          $49.10



Answer to Question 4
====================


SQL> SELECT title,
        CONCAT(ROUND(100-(cost*100/retail)), '%') "MARKUP"
        FROM books;

TITLE                          MARKUP
------------------------------ -----------------------------------------
BODYBUILD IN 10 MINUTES A DAY  39%
REVENGE OF MICKEY              35%
BUILDING A CAR WITH TOOTHPICKS 37%
DATABASE IMPLEMENTATION        44%
COOKING WITH MUSHROOMS         37%
HOLY GRAIL OF ORACLE           38%
HANDCRANKED COMPUTERS          13%
E-BUSINESS THE EASY WAY        30%
PAINLESS CHILD-REARING         47%
THE WOK WAY TO COOK            34%
BIG BEAR AND LITTLE DOVE       41%
HOW TO GET FASTER PIZZA        40%
HOW TO MANAGE THE MANAGER      52%
SHORTEST POEMS                 45%

14 rows selected.


	IF WE WANT TO CONSIDER THE DISCOUNT AS WELL:

SQL>  SELECT title,
        CONCAT(ROUND(100-(cost*100/(retail-NVL(discount,0)))), '%') "MARKUP"
        FROM books;

TITLE                          MARKUP
------------------------------ -----------------------------------------
BODYBUILD IN 10 MINUTES A DAY  39%
REVENGE OF MICKEY              35%
BUILDING A CAR WITH TOOTHPICKS 34%
DATABASE IMPLEMENTATION        44%
COOKING WITH MUSHROOMS         37%
HOLY GRAIL OF ORACLE           35%
HANDCRANKED COMPUTERS          13%
E-BUSINESS THE EASY WAY        30%
PAINLESS CHILD-REARING         44%
THE WOK WAY TO COOK            34%
BIG BEAR AND LITTLE DOVE       41%
HOW TO GET FASTER PIZZA        37%
HOW TO MANAGE THE MANAGER      52%
SHORTEST POEMS                 45%

14 rows selected.


Answer to Question 5
====================

SQL> SELECT TO_CHAR(SYSDATE, 'DY HH:MM:SS') "SYSDATE"
       FROM DUAL;

SYSDATE
--------------
WED 02:11:41

Answer to Question 6
====================

SQL> SELECT title, LPAD(cost, 12, '*') "COST"
        FROM books;

TITLE                          COST
------------------------------ ------------------------------------------------
BODYBUILD IN 10 MINUTES A DAY  *******18.75
REVENGE OF MICKEY              ********14.2
BUILDING A CAR WITH TOOTHPICKS ********37.8
DATABASE IMPLEMENTATION        ********31.4
COOKING WITH MUSHROOMS         ********12.5
HOLY GRAIL OF ORACLE           *******47.25
HANDCRANKED COMPUTERS          ********21.8
E-BUSINESS THE EASY WAY        ********37.9
PAINLESS CHILD-REARING         **********48
THE WOK WAY TO COOK            **********19
BIG BEAR AND LITTLE DOVE       ********5.32
HOW TO GET FASTER PIZZA        *******17.85
HOW TO MANAGE THE MANAGER      ********15.4
SHORTEST POEMS                 *******21.85

14 rows selected.



Answer to Question 7
====================

SQL> SELECT distinct LENGTH(isbn) "LENGTH"
    FROM books;

    LENGTH
----------
        10


Answer to Question 8
====================
SQL> SELECT title, pubdate, current_date, TRUNC(MONTHS_BETWEEN(current_date, pubdate), 0) AGE_MTHS
      FROM books;

TITLE                          PUBDATE   CURRENT_D   AGE_MTHS
------------------------------ --------- --------- ----------
BODYBUILD IN 10 MINUTES A DAY  21-JAN-05 18-NOV-20        189
REVENGE OF MICKEY              14-DEC-05 18-NOV-20        179
BUILDING A CAR WITH TOOTHPICKS 18-MAR-06 18-NOV-20        176
DATABASE IMPLEMENTATION        04-JUN-03 18-NOV-20        209
COOKING WITH MUSHROOMS         28-FEB-04 18-NOV-20        200
HOLY GRAIL OF ORACLE           31-DEC-05 18-NOV-20        178
HANDCRANKED COMPUTERS          21-JAN-05 18-NOV-20        189
E-BUSINESS THE EASY WAY        01-MAR-06 18-NOV-20        176
PAINLESS CHILD-REARING         17-JUL-04 18-NOV-20        196
THE WOK WAY TO COOK            11-SEP-04 18-NOV-20        194
BIG BEAR AND LITTLE DOVE       08-NOV-05 18-NOV-20        180
HOW TO GET FASTER PIZZA        11-NOV-06 18-NOV-20        168
HOW TO MANAGE THE MANAGER      09-MAY-03 18-NOV-20        210
SHORTEST POEMS                 01-MAY-05 18-NOV-20        186

14 rows selected.

Answer to Question 9
====================
SQL> SELECT NEXT_DAY(current_date,'WEDNESDAY')
   FROM dual;

NEXT_DAY(
---------
25-NOV-20


Answer to Question 10
====================


SQL>  SELECT customer#, zip, SUBSTR(zip, 3, 2), INSTR(customer#, '3') "POSITION 0F 3"
       FROM customers;

 CUSTOMER# ZIP   SUBSTR(Z POSITION 0F 3
---------- ----- -------- -------------
      1001 32328 32                   0
      1002 90404 40                   0
      1003 32306 30                   4
      1004 83707 70                   0
      1005 98115 11                   0
      1006 12211 21                   0
      1007 78710 71                   0
      1008 82003 00                   0
      1009 91510 51                   0
      1010 30314 31                   0
      1011 60606 60                   0
      1012 02110 11                   0
      1013 34711 71                   4
      1014 82414 41                   0
      1015 33111 11                   0
      1016 91508 50                   0
      1017 49006 00                   0
      1018 31206 20                   0
      1019 07962 96                   0
      1020 08607 60                   0

20 rows selected.


			Advanced Challenge
			------------------


Answer to Question 1
====================
SQL> SELECT title, category, retail "CURRENT PRICE",
            CASE
        WHEN category = 'COMPUTER' THEN ROUND(retail+(retail*0.1),2)
        WHEN category = 'FITNESS' THEN ROUND(retail+(retail*0.15), 2)
        WHEN category = 'SELF HELP' THEN ROUND(retail+(retail*0.25),2)
        ELSE ROUND(retail+(retail*0.03),2)
           END "REVISED PRICE"
        FROM books
        ORDER BY CATEGORY, TITLE;

TITLE                          CATEGORY     CURRENT PRICE REVISED PRICE
------------------------------ ------------ ------------- -------------
HOW TO MANAGE THE MANAGER      BUSINESS             31.95         32.91
BIG BEAR AND LITTLE DOVE       CHILDREN              8.95          9.22
BUILDING A CAR WITH TOOTHPICKS CHILDREN             59.95         61.75
DATABASE IMPLEMENTATION        COMPUTER             55.95         61.55
E-BUSINESS THE EASY WAY        COMPUTER              54.5         59.95
HANDCRANKED COMPUTERS          COMPUTER                25          27.5
HOLY GRAIL OF ORACLE           COMPUTER             75.95         83.55
COOKING WITH MUSHROOMS         COOKING              19.95         20.55
THE WOK WAY TO COOK            COOKING              28.75         29.61
PAINLESS CHILD-REARING         FAMILY LIFE          89.95         92.65
REVENGE OF MICKEY              FAMILY LIFE             22         22.66
BODYBUILD IN 10 MINUTES A DAY  FITNESS              30.95         35.59
SHORTEST POEMS                 LITERATURE           39.95         41.15
HOW TO GET FASTER PIZZA        SELF HELP            29.95         37.44

14 rows selected.

SQL>

