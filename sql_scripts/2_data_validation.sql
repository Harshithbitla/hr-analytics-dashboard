-- Check tables 
SHOW TABLES;

-- Preview data
SELECT 
    *
FROM
    employee_data
LIMIT 10;

-- Count rows
SELECT 
    COUNT(*) AS total_rows
FROM
    employee_data;
    
DESCRIBE employee_data;