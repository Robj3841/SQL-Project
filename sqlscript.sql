REM   Script: SQL Project: Business Questions
REM   This script contains my CTE and queries to obtain the results to my business questions listed below:
- Which city is each department located in ?
- Who is the research manager?
- How many employees work for the research manager?
- What is the average monthly salary for Dallas? 
- Are they the highest paid department in the company?

SELECT dname,loc 
FROM scott.dept 
 
;

WITH ED as 
(SELECT scott.dept.dname as "Department", scott.dept.loc as "City Located", 
scott.emp.ename as "Employee", scott.emp.job as "Title", 
scott.emp.sal as "Monthly Salary" 
FROM scott.dept join scott.emp on scott.dept.deptno = scott.emp.deptno) 
 
--This shows who is the manager for the Research department-- 
SELECT "Department", "Title", "Employee" 
FROM ED 
WHERE "Department" = 'RESEARCH' AND "Title" = 'MANAGER' 
 
 



WITH ED as 
(SELECT scott.dept.dname as "Department", scott.dept.loc as "City Located", 
scott.emp.ename as "Employee", scott.emp.job as "Title", 
scott.emp.sal as "Monthly Salary" 
FROM scott.dept join scott.emp on scott.dept.deptno = scott.emp.deptno) 
 
--How many employees work for the research manager?-- 
--Counts all record for employees in research except the manager-- 
SELECT COUNT(*) 
FROM ED 
WHERE "Department" ='RESEARCH' AND "Title" NOT LIKE 'MANAGER' 
 
 
 



WITH ED as 
(SELECT scott.dept.dname as "Department", scott.dept.loc as "City Located", 
scott.emp.ename as "Employee", scott.emp.job as "Title", 
scott.emp.sal as "Monthly Salary" 
FROM scott.dept join scott.emp on scott.dept.deptno = scott.emp.deptno) 
 
-- What is the average monthly salary for Dallas? Are they the highest paid department? 
 
--Thisis the average monthly salary per department and location-- 
SELECT TRUNC(AVG("Monthly Salary")) as "Average Monthly Salary", "Department", "City Located" 
FROM ED 
GROUP BY "Department", "City Located" 
ORDER BY "Average Monthly Salary" DESC 
 
 
 
 



