--6TH TASK
SELECT * FROM EMPLOYEES
SELECT *, SUM(SALARY) OVER(PARTITION BY DEPARTMENT) AS SUM1 FROM EMPLOYEES

---5TH TASK
SELECT DEPARTMENT , SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT

--7TH TASK
SELECT *,AVG(SALARY) OVER(PARTITION BY DEPARTMENT) AS AVG1, 
cast(salary - avg(salary) over(partition by department) as decimal(10,2)) as diff from employees
order by department
--8th tassk
--Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)

select *, cast(avg(salary) over(order by salary rows between 1 preceding and 1 following) 
as decimal(10,2)) as movavg from employees
order by department

--Find the Sum of Salaries for the Last 3 Hired Employees
select * from(select *, sum(salary) over(order by HireDate desc rows between current row and 2 following) 
as lasts from employees) news
order by HireDate desc
offset 0 rows fetch next 1 row only

--Calculate the Running Average of Salaries Over All Previous Employees
select * from(select *, sum(salary) over(order by HireDate desc rows between current row and 2 following) 
as lasts from employees) news
order by HireDate desc
offset 3 rows fetch next 7 rows only

--Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After
select *, max(salary) over(order by hiredate rows between  2 preceding and 2 following) as slide from employees
order by department

--Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary

select *, sum(salary) over(partition by department) as n from employees
select *, cast( salary/sum(salary)  over(order by department) * 100 as decimal(10,2)) as percentag from employees