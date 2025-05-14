CREATE TABLE number_mapping (
    N INT PRIMARY KEY,
    Num INT NOT NULL
);

INSERT INTO number_mapping (N, Num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 6),
(33, 7);

select * from number_mapping

SELECT *, (SELECT AVG(NUM) FROM NUMBER_MAPPING) AS OVERALL_AVG
FROM NUMBER_MAPPING;

select * from number_mapping;
WITH ranked AS (
  SELECT Num, 
         ROW_NUMBER() OVER (ORDER BY Num) AS row_num,
         COUNT(*) OVER () AS total_count
  FROM number_mapping
)
SELECT AVG(Num) AS median
FROM ranked
WHERE row_num IN ((total_count+1)/2);