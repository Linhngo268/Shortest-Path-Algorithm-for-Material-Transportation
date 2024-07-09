--  empty the table 
TRUNCATE TABLE Results;
GO
 
-- import the file
BULK INSERT Results
-- change file path
FROM 'C:\Users\8vict\Downloads\export.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
GO