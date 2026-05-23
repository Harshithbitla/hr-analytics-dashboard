-- Rank Job Roles by Average Salary
SELECT 
    job_role,
    ROUND(AVG(monthly_income),2) AS avg_salary,
    RANK() OVER(
        ORDER BY AVG(monthly_income) DESC
    ) AS salary_rank
FROM employee_data
GROUP BY job_role;

-- Attrition Rate by Department
SELECT 
    department,
    ROUND(
        (
            SUM(
                CASE 
                    WHEN attrition = 'Yes' THEN 1
                    ELSE 0
                END
            ) * 100.0
        ) / COUNT(*),
    2) AS attrition_rate
FROM employee_data
GROUP BY department
ORDER BY attrition_rate DESC;

-- Average Salary by Gender
SELECT 
    gender, ROUND(AVG(monthly_income), 2) AS avg_salary
FROM
    employee_data
GROUP BY gender;

-- Overtime vs Attrition
SELECT 
    overtime,attrition,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY overtime, attrition
ORDER BY overtime;

-- Average Years at Company by Attrition
SELECT 
    attrition, ROUND(AVG(years_at_company), 2) AS avg_years
FROM
    employee_data
GROUP BY attrition;

-- Most Common Job Roles
SELECT 
    job_role, COUNT(*) AS employee_count
FROM
    employee_data
GROUP BY job_role
ORDER BY employee_count DESC;

-- Work-Life Balance Analysis
SELECT 
    work_life_balance, COUNT(*) AS employee_count
FROM
    employee_data
GROUP BY work_life_balance
ORDER BY work_life_balance;

-- Employees with Highest Salary
SELECT 
    job_role, monthly_income
FROM
    employee_data
ORDER BY monthly_income DESC
LIMIT 10;

-- Attrition by Age Group
SELECT 
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    COUNT(*) AS attrition_count
FROM
    employee_data
WHERE
    attrition = 'yes'
GROUP BY age_group
ORDER BY attrition_count DESC;

-- Running Total of Employees by Income
SELECT 
    monthly_income,
    SUM(monthly_income) OVER(
        ORDER BY monthly_income
    ) AS running_total_income
FROM employee_data;