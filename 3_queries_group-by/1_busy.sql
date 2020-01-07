SELECT day, count(assignments)
FROM assignments
GROUP BY day
HAVING count(assignments) > 9
ORDER BY day;