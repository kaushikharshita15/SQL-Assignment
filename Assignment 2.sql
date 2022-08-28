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
('10','Accounting','New York'),
('20','Research','Dallas'),
('30','Sales','Chicago'),
('40','Operations','Boston');

insert into emp('empno','ename','job','mgr_id','hiredate','sal','comm','deptno')
values
('7369','SMITH','CLERK','7902','17-DEC-80','800','null','20'),
('7499','ALLEN','SALESMAN','7698','20-FEB-81','1600','300','30'),
('7521', 'WARD','SALESMAN','7698','22-FEB-81','1250','500','30'),
('7566','JONES','MANAGER','7839','02-APR-81','2975','null','20'),
('7654','MARTIN','SALESMAN','7698','28-SEP-81','1250','1400','30'),
('7698','BLAKE','MANAGER','7839','01-MAY-81','2850','null','30'),
('7782','CLARK','MANAGER','7839','09-JUN-81','2450','null','10'),
('7788','SCOTT','ANALYST','7566','19-APR-87','3000','null','20'),
('7839','KING','PRESIDENT','null','17-NOV-81','5000','null','10'),
('7844','TURNER','SALESMAN','7698','08-SEP-81','1500','0','30'),
('7876','ADAMS','CLERK','7788','23-MAY-87','1100','null','20'),
('7900','JAMES','CLERK','7698','03-DEC-81','950','null','30'),
('7902','FORD','ANALYST','7566','03-DEC-81','3000','null','20'),
('7934','MILLER','CLERK','7782','23-JAN-82','1300','null','10');

-- 1. List all employees whose name begins with 'A'
Select ename from EMP
Where ename LIKE 'A%';


