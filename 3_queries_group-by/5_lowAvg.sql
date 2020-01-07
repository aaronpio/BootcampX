SELECT students.name, AVG(assignment_submissions.duration) as avg_assignment_duration, AVG(assignments.duration) as avg_estimate_duration
FROM students
JOIN assignment_submissions on student_id = students.id
JOIN assignments on  assignments.id = assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY AVG(assignment_submissions.duration)