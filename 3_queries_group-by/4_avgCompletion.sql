SELECT name, AVG(duration) as avg_assignment_duration
FROM students
JOIN assignment_submissions on student_id = students.id
WHERE end_date IS NULL
GROUP BY name
ORDER BY AVG(duration) DESC