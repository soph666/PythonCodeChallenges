SELECT
T.Department, T.Employee, T.Salary
FROM(
    SELECT
        D.name as Department,
        E.name as Employee,
        E.salary as Salary,
        dense_rank() OVER (partition by D.name order by E.salary DESC) AS R
    FROM Employee E LEFT JOIN Department D ON E.departmentId = D.id
    ) AS T
WHERE T.R <= 3