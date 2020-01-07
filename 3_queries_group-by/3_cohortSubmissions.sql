SELECT cohorts.name as cohort, count(assignment_submissions) as total_submissions
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
JOIN assignment_submissions ON student_id = students.id
GROUP BY cohort
ORDER BY count(assignment_submissions) DESC;

