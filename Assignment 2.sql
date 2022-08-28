    CREATE TABLE dept
(
    deptno int primary key,
    dname varchar(20),
    loc varchar(20)
)

create table EMP
(
   empno int,
   ename varchar(20),
   job varchar(20),
   mgr_id int,
   hiredate DATE,
   sal int,
   comm smallint,
   deptno int references dept(deptno)
)


insert into dept(deptno,dname,loc)
values 
('10','Accounting','New York'),
('20','Research','Dallas'),
('30','Sales','Chicago'),
('40','Operations','Boston');

insert into emp(empno,ename,job,mgr_id,hiredate,sal,comm,deptno)
values
('7369','SMITH','CLERK','7902','17-DEC-80','800',null,'20'),
('7499','ALLEN','SALESMAN','7698','20-FEB-81','1600','300','30'),
('7521', 'WARD','SALESMAN','7698','22-FEB-81','1250','500','30'),
('7566','JONES','MANAGER','7839','02-APR-81','2975',null,'20'),
('7654','MARTIN','SALESMAN','7698','28-SEP-81','1250','1400','30'),
('7698','BLAKE','MANAGER','7839','01-MAY-81','2850',null,'30'),
('7782','CLARK','MANAGER','7839','09-JUN-81','2450',null,'10'),
('7788','SCOTT','ANALYST','7566','19-APR-87','3000',null,'20'),
('7839','KING','PRESIDENT',null,'17-NOV-81','5000',null,'10'),
('7844','TURNER','SALESMAN','7698','08-SEP-81','1500','0','30'),
('7876','ADAMS','CLERK','7788','23-MAY-87','1100',null,'20'),
('7900','JAMES','CLERK','7698','03-DEC-81','950',null,'30'),
('7902','FORD','ANALYST','7566','03-DEC-81','3000',null,'20'),
('7934','MILLER','CLERK','7782','23-JAN-82','1300',null,'10');

-- 1. List all employees whose name begins with 'A'
SELECT ename FROM EMP
WHERE ename LIKE 'A%';

--2. Select all those employees who don't have a manager
SELECT * FROM emp
WHERE mgr_id IS NULL;

--3.List employee name, number and salary for those employees who earn in the range 1200 to 1400.
SELECT ename,empno,sal FROM emp
WHERE sal BETWEEN (select 1000) AND 1400;

--4.Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise.
UPDATE emp
SET sal = sal + (sal * 10/100);
SELECT* FROM emp

--5. Find the number of CLERKS employed. Give it a descriptive heading.
SELECT COUNT(*) FROM emp
WHERE job LIKE 'CLERK%'

--6. Find the average salary for each job type and the number of people employed in each job. 
SELECT COUNT(*),
       avg(sal),
       job
FROM emp
GROUP BY job;

--7. List the employees with the lowest and highest salary.
SELECT * FROM emp
WHERE
	sal = (SELECT MIN(sal)FROM emp) or 
	sal = (SELECT Max(sal )FROM emp);
    
--8. List full details of departments that don't have any employees.
SELECT * FROM dept
WHERE deptno
NOT IN (select deptno FROM emp);

