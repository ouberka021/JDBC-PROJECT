/*
-----Weekend SQL Live Class Schedule----

10Am-5Pm EST(1 Hour Lunch Break)
45min*6session
10:00 - 10:45
11:00 - 11:45
12:00 - 12:45
---Lunch Break----
2:00 - 2:45
3:00 - 3:45
4:00 - 4:45

1. What is Database ?
2. What kinds of Database Management Systems we have?
3. What is Relational Database?
4. What is Non Relational Database?
5. What is SQL ?
6. What is the primary categories of SQL languages?
7. What is common SQL COMMANDS under this categories?
8. What is Database Flow?
9. Which tools can be used for Database Testing?
10. How can we create EC2 Server and getting run and up IP address?
11. When we try to reach out one APP in server how can we find related APP that we want?

    1. Oracle DB         → 1521 →SQL & JDBC Classes → at cydeo we have HR
    2. MySQL DB          → 3306 →SQL & JDBC Classes → at cydeo we have Library2
    3. PostgreSQL DB     → 5432 →SQL & JDBC Classes → at cydeo we have Bookit
    4. Spartan App       → 8000 →API Classes
    5. Spartan with Auth.→ 7000 →API Classes
    6. HR ORDS           → 1000 →API Classes
    7. Jenkins           → 8081 →CI/CD Classes

12. How can we reach Oracle database?

    54.235.28.231:1521

13. How can I make connection with credentials?
14. Why we should use OUR OWN IP for first week ORACLE DB classes?
    CRUD
    */
CREATE TABLE ARTHUR_SESSION (STUDENT_ID Integer PRIMARY KEY);

DROP TABLE ARTHUR_SESSION;
/*
15. What is Query ?
16. How can we type our queries?
*/
SELECT * FROM EMPLOYEES;
/*
17. How can we type our comments in sql files?

//
--


*/

-- TASK 1-1 - Display department names  from departments table
SELECT DEPARTMENT_NAME FROM DEPARTMENTS;
-- TASK 1-2 - Display just JOB_TITLE from JOBS table
SELECT JOB_TITLE FROM JOBS;
-- TASK 2 - Display first_name, last_name, department_id, salary from employees
selecT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES;

select * from DEPARTMENTS
WHERE DEPARTMENT_NAME='Marketing';



-- TASK 3 - Display first_name, last_name, department_id, salary from employees whose salary is higher than 9000

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES
WHERE SALARY > 9000;







-- TASK 4 - Display first_name, last_name, department_id, salary from employees whose salary equals or more than 9000 and salary equals or less than 15000 sort result based on salary asc

--OPT1
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES
WHERE SALARY >= 9000 AND SALARY<=15000
ORDER BY SALARY ;

--OPT2
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 15000
ORDER BY 4 DESC ;


-- TASK 5 - Display first_name, last_name, department_id, salary from employees whose firstname is Peter and salary is bigger than 5000 sort result based on salary desc

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES
WHERE FIRST_NAME='Peter' AND SALARY>5000
ORDER BY SALARY DESC ;



-- TASK 6 - Display country_id, country_name, region_id from countries table for region id 2 or 4 sort result based on region_id desc and country_name asc

--OPT1
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID FROM COUNTRIES
WHERE REGION_ID=2 OR REGION_ID=4
ORDER BY REGION_ID DESC , COUNTRY_NAME;

--OPT2
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID FROM COUNTRIES
WHERE REGION_ID IN (2,4)
ORDER BY REGION_ID DESC , COUNTRY_NAME;






-- TASK 7-1 - Display employee firstname and lastname as full_name , salary as annual salary  , job_id from employees in descending order
--concatination JAVA : + SQL: ||
SELECT  FIRST_NAME||' '||LAST_NAME AS FULL_NAME, SALARY*12 AS ANNUAL_SALARY, JOB_ID FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;

-- TASK 7-2 - Display employee firstname and lastname as full_name , salary as annual salary  , job_id from employees in descending order, whose job ID starts with S

SELECT  FIRST_NAME||' '||LAST_NAME AS FULL_NAME, SALARY*12 AS ANNUAL_SALARY, JOB_ID FROM EMPLOYEES
WHERE JOB_ID LIKE 'S%' OR JOB_ID LIKE 's%'
ORDER BY ANNUAL_SALARY DESC;

--wildcard
-- % zero one or more than one characters
-- _ just one character

select * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%';

select * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a%';


-- TASK 7 - 3 - Display employee firstname and lastname as full_name , salary as annual salary  , job_id from employees in descending order whose job ID starts with S and it has 6 letter TOTALLY

SELECT  FIRST_NAME||' '||LAST_NAME AS FULL_NAME, SALARY*12 AS ANNUAL_SALARY, JOB_ID FROM EMPLOYEES
WHERE JOB_ID LIKE 'S_____'
ORDER BY ANNUAL_SALARY DESC;


-- TASK 8 - Display country id and country name where country name ends with a

SELECT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES
WHERE COUNTRY_NAME LIKE '%a';

-- TASK 9 - Display country id and country name where country name ends with a and third letter is i

SELECT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES
WHERE COUNTRY_NAME LIKE '__i%a';

-- IQ 1 - Get me employees where employee ids are even number

--EVEN:
SELECT * FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID,2)=0;

--ODD:
SELECT * FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID,2)=1;

--MOD(100,2)=0 --> EVEN NUMBER
--MOD(100,2)=1 --> ODD NUMBER

-- IQ 2 --> Write a query to print first_name and salary for all employees in the Employee table who earn a salary larger than 3000. Sort your results in ascending order of the last 3 characters in the employees first_name if two or more employees have first_names ending with same 3 characters, then sort them by highest salary in desc

--OPT1
SELECT FIRST_NAME,SALARY, LOWER(SUBSTR(FIRST_NAME,-3)) AS LAST_THREE FROM EMPLOYEES
WHERE SALARY>3000
ORDER BY LAST_THREE,SALARY DESC;



--OPT2 is not solve; original data is not effecting:
SELECT LOWER(FIRST_NAME),SALARY, SUBSTR(FIRST_NAME,-3) AS LAST_THREE FROM EMPLOYEES
WHERE SALARY>3000
ORDER BY LAST_THREE,SALARY DESC;

-- OPT3 Taieb's solution
SELECT FIRST_NAME,SALARY, SUBSTR(FIRST_NAME,-3) AS LAST_THREE
FROM employees WHERE SALARY > 3000
ORDER BY LOWER(LAST_THREE), SALARY DESC ;






-- TASK 10- 1 - How many city we have in each country from locations table

SELECT COUNTRY_ID, COUNT(*)
FROM LOCATIONS
GROUP BY COUNTRY_ID;

SELECT COUNT(*) FROM EMPLOYEES;--107

SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES;--106

SELECT DEPARTMENT_ID FROM EMPLOYEES;


-- TASK 10- 2  - order them based on city count in desc
SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
GROUP BY COUNTRY_ID
ORDER BY CITY_COUNT DESC , COUNTRY_ID;

-- TASK 10- 3 - Filter result where country id starts with C

--OPT1 better option
SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
WHERE  COUNTRY_ID LIKE 'C%'
GROUP BY COUNTRY_ID
ORDER BY CITY_COUNT DESC;

--OPT2
SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNTRY_ID LIKE 'C%'
ORDER BY CITY_COUNT DESC;

-- TASK 10- 4 -  Display country id if city count is bigger than 1
SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNT(*)>1
ORDER BY CITY_COUNT DESC;

-- TASK 10- 5 - Display country id that starts with C and also if city count is bigger than 1
SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
WHERE  COUNTRY_ID LIKE 'C%'
GROUP BY COUNTRY_ID
HAVING COUNT(*)>1
ORDER BY CITY_COUNT DESC;

SELECT COUNTRY_ID, COUNT(*) AS CITY_COUNT
FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNT(*)>1 AND COUNTRY_ID LIKE 'C%'
ORDER BY CITY_COUNT DESC;

-- TASK 11 -1  How many employees is working for EACH department

SELECT DEPARTMENT_ID, COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- TASK 11 -2 Max_salary / min_salary / total_expense / avg for each department
SELECT DEPARTMENT_ID, MAX(SALARY),MIN(SALARY),SUM(SALARY),ROUND(AVG(SALARY)) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;
-- TASK 11 -3 Ignore null departments
SELECT DEPARTMENT_ID, COUNT(*) FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID ;
-- TASK 11 -4 Display department id where employees count is less than 5
SELECT DEPARTMENT_ID, COUNT(*) FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING  COUNT(*)<5;

-- TASK 12 - Display those employees firstname,lastname and salary who get higher salary than the employee whose employee_id is 104

-- TASK 13 -1  Display Manager firstname,lastname of Peter,Vargas from employees table

-- TASK 13 -2 Display Manager firstname,lastname for where employee name Peter

-- TASK 14 - Display all information who is getting 11th highest salary

-- TASK 15 - Display all first_name and  related department_name

SELECT  FIRST_NAME,DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
                      ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- INNER JOIN(JOIN)
-- OUTER
--> LEFT OUTER JOIN(LEFT JOIN)
--> RIGHT OUTER JOIN(RIGHT JOIN)
--> FULL OUTER JOIN(FULL JOIN)
-- SELF JOIN





-- TASK 16 -1 Display all first_name, last name and department_name including the  employee without

-- TASK 16 -2 Display all first_name and department_name including the  department without employee

-- TASK 16 -3 Display all first_name and department_name including the department without employee

-- TASK 16 -4 Display all first_name and department_name including the  employee without department

-- TASK 16 -5 Display all firstname and department name including the department without employees and also employees without the department

-- TASK 17 -1 How many employees working for each department (use department name)

-- TASK 17 -2 Display if the employee count is bigger than 10

-- TASK 18 - Display all employees with their manager first_name and last_names

-- TASK 19 - Display all EMPLOYEES who is manager

-- TASK 20 - Display all EMPLOYEES who is not manager
--First find all manager IDs

-- IQ3 - Given the Employee table, write a SQL query that finds out employees who earn more than their managers.

SELECT WORKERS.FIRST_NAME, WORKERS.LAST_NAME, WORKERS.SALARY, MANAGERS.SALARY, MANAGERS.FIRST_NAME,MANAGERS.LAST_NAME
FROM EMPLOYEES WORKERS JOIN  EMPLOYEES MANAGERS
                             ON WORKERS.MANAGER_ID = MANAGERS.EMPLOYEE_ID
WHERE WORKERS.SALARY> MANAGERS.SALARY;

-- IQ4 - Given the Employee table, write a SQL query that finds out amount of the 3th highest salary

SELECT SALARY FROM EMPLOYEES;

SELECT DISTINCT  SALARY FROM EMPLOYEES
ORDER BY SALARY DESC ;

--OPT1
SELECT SALARY FROM (SELECT DISTINCT  SALARY FROM EMPLOYEES
                    ORDER BY SALARY DESC)
WHERE ROWNUM<4
MINUS
SELECT SALARY FROM (SELECT DISTINCT  SALARY FROM EMPLOYEES
                    ORDER BY SALARY DESC)
WHERE ROWNUM<3;

--OPT2
SELECT MIN(SALARY) FROM (SELECT DISTINCT  SALARY FROM EMPLOYEES
                         ORDER BY SALARY DESC)
WHERE ROWNUM<4

--OPT3

SELECT MIN(SALARY)  FROM EMPLOYEES
WHERE SALARY=(SELECT MIN(SALARY) FROM (SELECT SALARY FROM  (SELECT DISTINCT SALARY
                                                            FROM EMPLOYEES
                                                            ORDER BY SALARY DESC)
                                       WHERE ROWNUM <4));


-- IQ5 - Given the Employee table and Job table, write a SQL query that finds out the difference between maximum salary of the job title and salary of the employees. Return job_id, first_name, maximum salary of the job title, salary of the employee and salary difference.
