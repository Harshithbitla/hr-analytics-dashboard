-- Total Employees
SELECT 
    COUNT(*) AS total_employees
FROM employee_data;

-- Attrition Count
SELECT 
    COUNT(*) AS attrition_count
FROM employee_data
WHERE attrition = 'Yes';

-- Attrition Rate
SELECT 
ROUND(
    (
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0
    ) / COUNT(*),
2
) AS attrition_rate
FROM employee_data;

-- Employees by Department
SELECT 
    department, COUNT(*) AS total_employees
FROM
    employee_data
GROUP BY department
ORDER BY total_employees DESC;

-- Attrition by Department
SELECT 
    department, COUNT(*) AS attrition_count
FROM
    employee_data
WHERE
    attrition = 'Yes'
GROUP BY department
ORDER BY attrition_count DESC;

-- Average Salary by Job Role
SELECT 
    job_role, ROUND(AVG(monthly_income), 2) AS avg_salary
FROM
    employee_data
GROUP BY job_role
ORDER BY avg_salary DESC;

-- Overtime Impact on Attrition
SELECT 
    overtime,
    COUNT(*) AS attrition_count
FROM employee_data
WHERE attrition = 'Yes'
GROUP BY overtime;

-- Gender Distribution
SELECT 
    gender, COUNT(*) AS total_employees
FROM
    employee_data
GROUP BY gender
ORDER BY total_employees DESC;

-- Job Satisfaction Distribution
SELECT 
    job_satisfaction,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

-- Average Working Years
SELECT 
    ROUND(AVG(total_working_years), 2) AS avg_working_years
FROM
    employee_data;
    
