CREATE DATABASE hr_db;
USE hr_db;

DROP TABLE IF EXISTS EMPLOYEES;
DROP TABLE IF EXISTS JOB_HISTORY;
DROP TABLE IF EXISTS JOBS;
DROP TABLE IF EXISTS DEPARTMENTS;
DROP TABLE IF EXISTS LOCATIONS;


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
                          PRIMARY KEY (EMP_ID)
                        );

CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID)
                          );

CREATE TABLE JOBS (
                    JOB_IDENT CHAR(9) NOT NULL,
                    JOB_TITLE VARCHAR(30) ,
                    MIN_SALARY DECIMAL(10,2),
                    MAX_SALARY DECIMAL(10,2),
                    PRIMARY KEY (JOB_IDENT)
                  );

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP)
                          );

CREATE TABLE LOCATIONS (
                          LOCT_ID CHAR(9) NOT NULL,
                          DEP_ID_LOC CHAR(9) NOT NULL,
                          PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
                        );
			
            -- now add data
            

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM jobs;
SELECT * FROM locations;


-- creating views

CREATE VIEW empsalary AS
	SELECT emp_id, f_name, l_name, b_date, sex, salary
	FROM employees;

SELECT * FROM empsalary;


-- modifying existing view

CREATE OR REPLACE VIEW empsalary AS
	SELECT E.emp_id, E.f_name, E.l_name, E.b_date, E.sex, E.job_id, 
		   J.job_title, J.min_salary, J.max_salary
    FROM employees E, jobs J
		WHERE E.job_id = J.job_ident;

SELECT * FROM empsalary;



-- creating emp dept view

CREATE VIEW emp_dept AS
	SELECT emp_id, f_name, l_name, dep_id
    FROM employees;

SELECT * FROM emp_dept;



-- Modify “EMP_DEPT” such that it displays Department names instead of Department IDs

CREATE OR REPLACE VIEW emp_dept AS
	SELECT emp_id, f_name, l_name, dep_name
    FROM employees, departments
		WHERE employees.dep_id = departments.dept_id_dep;

SELECT * FROM emp_dept;
DROP VIEW emp_dept;





















