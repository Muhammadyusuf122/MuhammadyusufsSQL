-- Create a temporary table to store our results
CREATE TABLE #SchemaInventory (
    DatabaseName NVARCHAR(128),
    SchemaName NVARCHAR(128),
    TableName NVARCHAR(128),
    ColumnName NVARCHAR(128),
    DataType NVARCHAR(128),
    MaxLength INT,
    Precision INT,
    Scale INT,
    IsNullable BIT
);

-- Dynamic SQL to query each database
DECLARE @sql NVARCHAR(MAX);
DECLARE @dbname NVARCHAR(128);

-- Get all non-system databases
DECLARE db_cursor CURSOR FOR 
SELECT name FROM sys.databases 
WHERE database_id > 4 -- Exclude system DBs
AND state = 0; -- Only online databases

OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @dbname;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Build query for current database
    SET @sql = N'
    USE [' + @dbname + N'];
    INSERT INTO #SchemaInventory
    SELECT 
        DB_NAME() AS DatabaseName,
        SCHEMA_NAME(t.schema_id) AS SchemaName,
        t.name AS TableName,
        c.name AS ColumnName,
        ty.name AS DataType,
        c.max_length AS MaxLength,
        c.precision AS Precision,
        c.scale AS Scale,
        c.is_nullable AS IsNullable
    FROM sys.tables t
    INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
    INNER JOIN sys.columns c ON t.object_id = c.object_id
    INNER JOIN sys.types ty ON c.user_type_id = ty.user_type_id
    WHERE t.is_ms_shipped = 0;'; -- Exclude system tables
    
    EXEC sp_executesql @sql;
    FETCH NEXT FROM db_cursor INTO @dbname;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;

-- Display formatted results
SELECT 
    DatabaseName,
    SchemaName,
    TableName,
    ColumnName,
    DataType,
    CASE 
        WHEN DataType IN ('nvarchar','varchar','char','nchar') 
        THEN CASE WHEN MaxLength = -1 THEN 'MAX' ELSE CAST(MaxLength AS VARCHAR) END
        WHEN DataType IN ('decimal','numeric') 
        THEN CAST(Precision AS VARCHAR) + ',' + CAST(Scale AS VARCHAR)
        ELSE CAST(MaxLength AS VARCHAR)
    END AS SizeInfo,
    CASE IsNullable WHEN 1 THEN 'YES' ELSE 'NO' END AS Nullable
FROM #SchemaInventory
ORDER BY DatabaseName, SchemaName, TableName, ColumnName;

-- Clean up
DROP TABLE #SchemaInventory;