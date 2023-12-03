--List frequency counts by last name:

SELECT last_name,
COUNT (last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT (last_name) DESC;