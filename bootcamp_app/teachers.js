const { Pool } = require("pg");
const args = process.argv.slice(2);

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx"
});

pool
  .query(
    `
    SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM assistance_requests
  JOIN teachers ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name = '${args[0] || "JUL02"}'
  ORDER BY teacher 

`
  )
  .then(res => {
    console.log(res.rows);
    res.rows.forEach(assist => {
      console.log(`${assist.cohort}: ${assist.teacher}`);
    });
  })
  .catch(err => console.error("query error", err.stack));
