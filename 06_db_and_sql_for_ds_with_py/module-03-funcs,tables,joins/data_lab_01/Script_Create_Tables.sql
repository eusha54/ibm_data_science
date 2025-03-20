USE testdb;

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));

SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY;
SELECT * FROM JOBS;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;


SELECT F_NAME, L_NAME, ADDRESS
	FROM EMPLOYEES
	WHERE ADDRESS LIKE '%a%';

SELECT F_NAME, L_NAME, B_DATE
	FROM EMPLOYEES
	WHERE B_DATE LIKE '%197%';
    
SELECT *
	FROM EMPLOYEES
	WHERE (SALARY BETWEEN 50000 AND 80000) AND DEP_ID = 5;

SELECT F_NAME, L_NAME, DEP_ID
	FROM EMPLOYEES
    ORDER BY DEP_ID, F_NAME, L_NAME;


SELECT F_NAME, L_NAME, DEP_ID
	FROM EMPLOYEES
    ORDER BY DEP_ID DESC, L_NAME DESC;    
    

SELECT AVG(SALARY) FROM EMPLOYEES;

SELECT DEP_ID, COUNT(DEP_ID) AS COUNT
		FROM EMPLOYEES
        GROUP BY DEP_ID;
    
SELECT DEP_ID, COUNT(DEP_ID) AS EMPLOYEE_COUNT, AVG(SALARY) AS AVG_SALARY
		FROM EMPLOYEES
        GROUP BY DEP_ID;    

SELECT DEP_ID, COUNT(DEP_ID) AS EMPLOYEE_COUNT, AVG(SALARY) AS AVG_SALARY
		FROM EMPLOYEES
        GROUP BY DEP_ID
        ORDER BY AVG_SALARY;      
    

SELECT DEP_ID, COUNT(DEP_ID) AS EMPLOYEE_COUNT, AVG(SALARY) AS AVG_SALARY
		FROM EMPLOYEES
        GROUP BY DEP_ID
        HAVING EMPLOYEE_COUNT < 4
        ORDER BY AVG_SALARY;      
		

SELECT F_NAME, L_NAME FROM EMPLOYEES
        WHERE F_NAME LIKE "S%";    


SELECT * FROM EMPLOYEES
	ORDER BY B_DATE;
    

SELECT DEP_ID, AVG(SALARY) AS AVG_SALARY
	FROM EMPLOYEES
    GROUP BY DEP_ID
    HAVING AVG_SALARY >= 60000;


SELECT DEP_ID, AVG(SALARY) AS AVG_SALARY
	FROM EMPLOYEES
    GROUP BY DEP_ID
    HAVING AVG_SALARY >= 60000
    ORDER BY AVG_SALARY DESC;