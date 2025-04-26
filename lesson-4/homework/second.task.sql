drop table if exists TestMax
CREATE TABLE TestMax
(
    Year1 INT
    ,Max1 INT
    ,Max2 INT
    ,Max3 INT
);
GO
INSERT INTO TestMax 
VALUES
    (2001,10,101,87)
    ,(2002,103,19,88)
    ,(2003,21,23,89)
    ,(2004,27,28,91);

	
	
SELECT 
    *,
    (SELECT MAX(a) FROM (VALUES (Max1), (Max2), (Max3)) AS value(a)) AS MaxValue
FROM TestMax
order by MaxValue desc

select max(Max1) as maxa,MAX(Max2) as maxb,max(Max3) AS maxc from TestMax

select max(Max3) AS MAXVAL from TestMax
