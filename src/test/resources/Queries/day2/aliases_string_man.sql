SELECT * FROM EMPLOYEES;

/*
    1.Column alieases --> it is temporary name to show in display

    2.Table alieases which we will learn later
        Employees --> E

 */

--the query below second column name is "ROUND(AVG(SALARY))" which is not nice.
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) as "Average salary"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from the result
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >6000
ORDER BY 2 ASC;

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) as Average_salary
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from the result
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >6000
ORDER BY 2 ASC;


--manager is asking display annual salary for all employees as annual_salary
SELECT FIRST_NAME, SALARY*12 as annual_salary
FROM EMPLOYEES;

--NOTE --> we are just displaying and nothing will change it DB

---------------------STRING MANIPULATION---------------------
/*
        CONCAT
            --Java --> + first_name+" "+last_name
            --SQL --> || first_name||' '||last_name
 */
--I want to get fullname column where we have firstname+' '+lastname
    SELECT FIRST_NAME||' '||LAST_NAME as full_name
    FROM EMPLOYEES;

--add @cydeo.com to all the emails in the employee table.
SELECT email||'@cydeo.com' FROM EMPLOYEES;

SELECT concat(EMAIL,'@cydeo.com') FROM  EMPLOYEES;

--lowercase
SELECT lower(email||'@cydeo.com') FROM EMPLOYEES;

--uppercase

SELECT UPPER(email||'@cydeo.com') FROM EMPLOYEES;

--INITCAP
--it makes first letter uppercase

SELECT INITCAP(email||'@cydeo.com') FROM EMPLOYEES;

--LENGTH
select email, length(email) as email_length FROM EMPLOYEES;

    --display all employees where firstname length equals 6
    SELECT FIRST_NAME from EMPLOYEES
    WHERE length(FIRST_NAME) = 6;

    --another solution
    SELECT FIRST_NAME FROM EMPLOYEES
    WHERE FIRST_NAME LIKE '______';

    --how many question ??
    SELECT COUNT(*) FROM EMPLOYEES
    WHERE FIRST_NAME LIKE '______'

--display initial from firstname and lastname --> S.K.  ---- N.K.

--SUBSTR(columName,beginningIndex,numberOfChar)
    select * from EMPLOYEES;

    select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1)||'.' as initials from EMPLOYEES;

    select substr(FIRST_NAME,1,1)||'.'||substr(LAST_NAM  E,1,1)||'.' as initials from EMPLOYEES;

    select FIRST_NAME,substr(FIRST_NAME,-2,2) from EMPLOYEES;

    select FIRST_NAME,substr(FIRST_NAME,-3) from EMPLOYEES;

/*
    - if beginning index is 0, it is treated as 1
    -if the beginning index negative, it will start from backwards
    -if we dont specify number of char it will work till the end
 */