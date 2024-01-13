select * from Worker;
select * from Title;

--1
SELECT COUNT(*) AS EmployeeCount
FROM Worker
WHERE DEPARTMENT = 'Admin';


--2
SELECT DEPARTMENT, COUNT(*) AS WorkerCount
FROM Worker
GROUP BY DEPARTMENT
ORDER BY WorkerCount DESC;


--3
SELECT DEPARTMENT, COUNT(*) AS WorkerCount
FROM Worker
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 25000;


--4
SELECT W.WORKER_ID, W.FIRST_NAME, W.LAST_NAME
FROM Worker W
JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID
WHERE T.WORKER_TITLE = 'Manager';


--5
SELECT TOP 5 CONCAT(W.FIRST_NAME, ' ', W.LAST_NAME) AS Name, T.WORKER_TITLE AS Designation
FROM Worker W
JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID
ORDER BY Name;


--6
ALTER TABLE Worker
ADD CONSTRAINT PK_Worker PRIMARY KEY (WORKER_ID);

ALTER TABLE Worker
DROP CONSTRAINT PK_Worker;


--7
CREATE CLUSTERED INDEX indexSalary ON Worker (SALARY);


--8
CREATE NONCLUSTERED INDEX indexDepartment ON Worker (DEPARTMENT, Age);


--9
sp_helpindex 'Worker';


--10
DROP INDEX indexDepartment ON Worker;