DECLARE @Year INT = 2025;
DECLARE @Month INT = 05;
DECLARE @FirstDayOfMonth DATE = DATEFROMPARTS(@Year, @Month, 1);
DECLARE @FirstDayOfCalendar DATE = DATEADD(DAY, -(DATEPART(WEEKDAY, @FirstDayOfMonth) - 1), @FirstDayOfMonth);
DECLARE @LastDayOfCalendar DATE = DATEADD(DAY, -1, DATEADD(WEEK, 
    DATEDIFF(WEEK, @FirstDayOfCalendar, DATEADD(MONTH, 1, @FirstDayOfMonth)) + 1, 
    @FirstDayOfCalendar));

WITH Calendar AS (
    SELECT 
        DATEADD(DAY, number, @FirstDayOfCalendar) AS DateValue
    FROM 
        master.dbo.spt_values
    WHERE 
        type = 'P' 
        AND number <= DATEDIFF(DAY, @FirstDayOfCalendar, @LastDayOfCalendar)
)
SELECT 
    WeekNumber,
    MAX(CASE WHEN Weekday = 1 THEN DayNumber ELSE NULL END) AS Sunday,
    MAX(CASE WHEN Weekday = 2 THEN DayNumber ELSE NULL END) AS Monday,
    MAX(CASE WHEN Weekday = 3 THEN DayNumber ELSE NULL END) AS Tuesday,
    MAX(CASE WHEN Weekday = 4 THEN DayNumber ELSE NULL END) AS Wednesday,
    MAX(CASE WHEN Weekday = 5 THEN DayNumber ELSE NULL END) AS Thursday,
    MAX(CASE WHEN Weekday = 6 THEN DayNumber ELSE NULL END) AS Friday,
    MAX(CASE WHEN Weekday = 7 THEN DayNumber ELSE NULL END) AS Saturday
FROM (
    SELECT 
        DateValue,
        DAY(DateValue) AS DayNumber,
        DATEPART(WEEKDAY, DateValue) AS Weekday,
        DATEDIFF(WEEK, @FirstDayOfCalendar, DateValue) + 1 AS WeekNumber
    FROM 
        Calendar
) AS PreparedData
GROUP BY 
    WeekNumber
ORDER BY 
    WeekNumber;