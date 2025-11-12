-- Department Table
CREATE TABLE Department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE NOT NULL,
    location text NOT NULL,
    budget NUMERIC CHECK (budget > 100000),
    head_of_dept VARCHAR(50),
    established_year INT,CHECK(established_year BETWEEN 1950 AND 2025));

-- Student Table
CREATE TABLE Student ()
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age BETWEEN 17 AND 30),
    dept_id INT REFERENCES Department(dept_id),
    gender CHAR(1) CHECK (gender IN ('M','F'))
);

-- Instructor Table
CREATE TABLE Instructor (
    instructor_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dept_id INT REFERENCES Department(dept_id),
    salary NUMERIC CHECK (salary > 20000),
    experience INT CHECK (experience >= 1)
);
--Course Table
CREATE TABLE Course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    credits INT CHECK (credits BETWEEN 1 AND 5),
    dept_id INT REFERENCES Department(dept_id),
    instructor_id INT REFERENCES Instructor(instructor_id),
    semester INT CHECK (semester BETWEEN 1 AND 8)
);
--Enrollment Table
CREATE TABLE Enrollment (
    enroll_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Student(student_id),
    course_id INT REFERENCES Course(course_id),
    enroll_date DATE NOT NULL,
    grade CHAR(2) CHECK (grade IN ('A','B','C','D','F','NA'))
);
drop table enrollment

-- Exam Table
CREATE TABLE Exam (
    exam_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES Course(course_id),
    exam_date DATE NOT NULL,
    total_marks INT CHECK (total_marks <= 100),
    passing_marks INT CHECK (passing_marks < total_marks),
    exam_type VARCHAR(20) CHECK (exam_type IN ('Midterm','Final','Viva'))
);