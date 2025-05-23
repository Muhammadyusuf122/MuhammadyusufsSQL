DROP TABLE IF EXISTS Groupings;

CREATE TABLE Groupings
(
StepNumber  INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NOT NULL,
[Status]    VARCHAR(100) NOT NULL
);
INSERT INTO Groupings (StepNumber, TestCase, [Status]) 
VALUES
(1,'Test Case 1','Passed'),
(2,'Test Case 2','Passed'),
(3,'Test Case 3','Passed'),
(4,'Test Case 4','Passed'),
(5,'Test Case 5','Failed'),
(6,'Test Case 6','Failed'),
(7,'Test Case 7','Failed'),
(8,'Test Case 8','Failed'),
(9,'Test Case 9','Failed'),
(10,'Test Case 10','Passed'),
(11,'Test Case 11','Passed'),
(12,'Test Case 12','Passed');


DROP TABLE IF EXISTS [dbo].[EMPLOYEES_N];

CREATE TABLE [dbo].[EMPLOYEES_N]
(
    [EMPLOYEE_ID] [int] NOT NULL,
    [FIRST_NAME] [varchar](20) NULL,
    [HIRE_DATE] [date] NOT NULL
)
INSERT INTO [dbo].[EMPLOYEES_N]
VALUES
	(1001,'Pawan','1975-02-21'),
	(1002,'Ramesh','1976-02-21'),
	(1003,'Avtaar','1977-02-21'),
	(1004,'Marank','1979-02-21'),
	(1008,'Ganesh','1979-02-21'),
	(1007,'Prem','1980-02-21'),
	(1016,'Qaue','1975-02-21'),
	(1155,'Rahil','1975-02-21'),
	(1102,'Suresh','1975-02-21'),
	(1103,'Tisha','1975-02-21'),
	(1104,'Umesh','1972-02-21'),
	(1024,'Veeru','1975-02-21'),
	(1207,'Wahim','1974-02-21'),
	(1046,'Xhera','1980-02-21'),
	(1025,'Wasil','1975-02-21'),
	(1052,'Xerra','1982-02-21'),
	(1073,'Yash','1983-02-21'),
	(1084,'Zahar','1984-02-21'),
	(1094,'Queen','1985-02-21'),
	(1027,'Ernst','1980-02-21'),
	(1116,'Ashish','1990-02-21'),
	(1225,'Bushan','1997-02-21');

	select * from groupings
	select * from [dbo].[EMPLOYEES_N]


	--1st task
	SELECT 
    MIN(stepnumber) AS [Min Step Number],
    MAX(stepnumber) AS [Max Step Number],
    [Status],
    COUNT(*) AS [Consecutive Count]
FROM (
    SELECT 
        g1.stepnumber,
        g1.[Status],
        (
            SELECT COUNT(*) 
            FROM groupings g2 
            WHERE g2.stepnumber > g1.stepnumber 
            AND g2.[Status] <> g1.[Status]
        ) AS group_id
    FROM groupings g1
) AS subque
GROUP BY [Status], group_id
ORDER BY [Min Step Number];

INSERT INTO [dbo].[EMPLOYEES_N]
VALUES
	(1001,'Pawan','1975-02-21'),
	(1002,'Ramesh','1976-02-21'),
	(1003,'Avtaar','1977-02-21'),
	(1004,'Marank','1979-02-21'),
	(1008,'Ganesh','1979-02-21'),
	(1007,'Prem','1980-02-21'),
	(1016,'Qaue','1975-02-21'),
	(1155,'Rahil','1975-02-21'),
	(1102,'Suresh','1975-02-21'),
	(1103,'Tisha','1975-02-21'),
	(1104,'Umesh','1972-02-21'),
	(1024,'Veeru','1975-02-21'),
	(1207,'Wahim','1974-02-21'),
	(1046,'Xhera','1980-02-21'),
	(1025,'Wasil','1975-02-21'),
	(1052,'Xerra','1982-02-21'),
	(1073,'Yash','1983-02-21'),
	(1084,'Zahar','1984-02-21'),
	(1094,'Queen','1985-02-21'),
	(1027,'Ernst','1980-02-21'),
	(1116,'Ashish','1990-02-21'),
	(1225,'Bushan','1997-02-21');

---2nd task
--Find all the year-based intervals from 1975 up to current when the company did not hire employees
--Years
--1978 - 1978
--1981 - 1981
--1986 - 1989
--1991 - 1996
--1998 - 2025

--select * from (select hireYear,nextYear, IntervalYear,
--case 
--when intervalyear<2 or hireyear<1975 then null
--when intervalyear>=2 and nextyear isnot null then concat(hireyear+1 as nvarchar)
--when nextyear is null then concat(cast(hireyear+1 as nvarchar), '-', year(getdate())
-- end as years
-- from (select
-- cast(year(hire_date) as int) as hireyear,
-- lead(cast(year(hire_date) as int)) over(order by hire_date) as nextyear,
-- lead(cast(year(hire_date) as int)) over(order by hire_date) - cast(year(hire_date) as intervalyear
-- from [dbo].[EMPLOYEES_N]) as t
-- ) as t2
-- where years is not null
-- order by hireyear


 WITH HiringYears AS (
    SELECT DISTINCT YEAR(hire_date) AS HireYear
    FROM [dbo].[EMPLOYEES_N]
),
YearRanges AS (
    SELECT 
        HireYear,
        LEAD(HireYear) OVER (ORDER BY HireYear) AS NextHireYear
    FROM HiringYears
)
SELECT 
    CASE 
        WHEN HireYear + 1 = NextHireYear - 1 THEN CONVERT(VARCHAR, HireYear + 1)
        ELSE CONVERT(VARCHAR, HireYear + 1) + '-' + CONVERT(VARCHAR, NextHireYear - 1)
    END AS NoHiringPeriod,
    NextHireYear - HireYear - 1 AS YearsWithoutHiring
FROM YearRanges
WHERE NextHireYear - HireYear > 1
ORDER BY HireYear;