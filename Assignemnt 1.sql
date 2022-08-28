CREATE TABLE CLIENTS
(
CLIENT_ID INT PRIMARY KEY,
CNAME VARCHAR(40) NOT NULL,
ADDRESS VARCHAR(30),
EMAIL VARCHAR(30) UNIQUE,
PHONE INT,
BUSINESS VARCHAR(20) NOT NULL
);

CREATE TABLE DEPARTMENTS
(
 DEPTNO INT PRIMARY KEY,
 DNAME VARCHAR(15) NOT NULL,
 LOC VARCHAR(20)
); 

CREATE TABLE EMPLOYEES
(
 EMPNO INT PRIMARY KEY,
 ENAME VARCHAR(20) NOT NULL,
 JOB VARCHAR(15),
 SALARY INT CHECK(SALARY > 0),
 DEPTNO INT REFERENCES DEPARTMENTS(DEPTNO)
);

CREATE TABLE PROJECTS
(
PROJECT_ID INT PRIMARY KEY,
DESCR VARCHAR(30) NOT NULL,
START_DATE DATE,
PLANNED_END_DATE DATE,
ACTUAL_END_DATE DATE,
BUDGET INT CHECK(BUDGET > 0),
CLIENT_ID INT REFERENCES CLIENTS(CLIENT_ID)
);

CREATE TABLE PROJECTTASKS
(
PROJECT_ID INT REFERENCES PROJECTS(PROJECT_ID),
EMPNO INT REFERENCES EMPLOYEES(EMPNO),
START_DATE DATE,
TASK VARCHAR(25) NOT NULL,
STATUS VARCHAR(15) NOT NULL
);

INSERT INTO CLIENTS
(CLIENT_ID,CNAME,ADDRESS,EMAIL,PHONE,BUSINESS)
VALUES
(1001,'ACME Utilities','Noida','contact@acmeutil.com',9567880032,'Manufacturing'),
(1002,'Trackon Consultants','Mumbai','consult@trackon.com',8734210090,'Consultant'),
(1003,'MoneySaver Distributors','Bangalore','save@moneysaver.com',7799886655,'Reseller'),
(1004,'Lawful Corp','Chennai','justice@lawful.com',9210342219,'Professional');

Insert into DEPARTMENTS (DEPTNO,DNAME,LOC) 
values
(10,'Design','Pune'),
(20,'Development','Pune'),
(30,'Testing','Mumbai'),
(40,'Document','Mumbai');

Insert into EMPLOYEES
(EMPNO,ENAME,JOB,SALARY,DEPTNO) 
values
(7001,'Sandeep','Analyst',25000,10),
(7002,'Rajesh','Designer',30000,10),
(7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Developer',40000,20),
(7005,'Abhay','Designer',35000,10),
(7006,'Uma','Tester',30000,30),
(7007,'Gita','Tech. Writer',30000,40),
(7008,'Priya','Tester',35000,30),
(7009,'Nutan','Developer',45000,20),
(7010,'Smita','Analyst',20000,10),
(7011,'Anand','Project Mgr',65000,10);

Insert into PROJECTS
(PROJECT_ID,DESCR,START_DATE,PLANNED_END_DATE,ACTUAL_END_DATE,BUDGET,CLIENT_ID) 
values
(401,'Inventory',to_date('01-APR-11','DD-MONRR'),to_date('01-OCT-11','DD-MON-RR'),to_date('31-OCT11','DD-MON-RR'),150000,1001),
(402,'Accounting',to_date('01-AUG-11','DD-MONRR'),to_date('01-JAN-12','DD-MON-RR'),null,500000,1002),
(403,'Payroll',to_date('01-OCT-11','DD-MONRR'),to_date('31-DEC-11','DD-MON-RR'),null,75000,1003),
(404,'ContactMgmt',to_date('01-NOV-11','DD-MON-RR'),to_date('31-DEC11','DD-MON-RR'),null,50000,1004);

Insert into EMPPROJECTTASKS
(PROJECT_ID,EMPNO,START_DATE,END_DATE,TASK,STATUS)
values 
(401,7001,to_date('01-APR-11','DD-MONRR'),to_date('20-APR-11','DD-MON-RR'),'System Analysis','Completed'),
(401,7002,to_date('21-APR-11','DD-MONRR'),to_date('30-MAY-11','DD-MON-RR'),'System Design','Completed'),
(401,7003,to_date('01-JUN-11','DD-MONRR'),to_date('15-JUL-11','DD-MONRR'),'Coding','Completed'),
(401,7004,to_date('18-JUL-11','DD-MONRR'),to_date('01-SEP-11','DD-MONRR'),'Coding','Completed'),
(401,7006,to_date('03-SEP-11','DD-MONRR'),to_date('15-SEP-11','DD-MONRR'),'Testing','Completed'),
(401,7009,to_date('18-SEP-11','DD-MONRR'),to_date('05-OCT-11','DD-MON-RR'),'Code Change','Completed'),
(401,7008,to_date('06-OCT-11','DD-MONRR'),to_date('16-OCT-11','DD-MONRR'),'Testing','Completed'),
(401,7007,to_date('06-OCT-11','DD-MONRR'),to_date('22-OCT-11','DD-MONRR'),'Documentation','Completed'),
(401,7011,to_date('22-OCT-11','DD-MONRR'),to_date('31-OCT-11','DD-MON-RR'),'Signof','Completed'),
(402,7010,to_date('01-AUG-11','DD-MONRR'),to_date('20-AUG-11','DD-MON-RR'),'System Analysis','Completed'),
(402,7002,to_date('22-AUG-11','DD-MONRR'),to_date('30-SEP-11','DD-MON-RR'),'System Design','Completed'),
(402,7004,to_date('01-OCT-11','DD-MONRR'),null,'Coding','In Progress');
