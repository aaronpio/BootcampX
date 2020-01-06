CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  start_date TEXT NOT NULL,
  end_date TEXT NOT NULL
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  github VARCHAR(225),
  start_date DATE,
  end_date DATE,
  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
);