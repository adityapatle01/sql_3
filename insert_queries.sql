-- Department
insert into department(dept_name, location, budget, head_of_dept, established_year) values
('Computer Science','Block A', 500000, 'Dr. Meena', 1999),
('Electronics', 'Block B', 400000, 'Dr. Patil', 2002);

select * from department;
copy department from '/private/tmp/department_data.csv'
delimiter ','
csv header;


--Student
INSERT INTO Student (student_name, email, age, dept_id, gender) VALUES 
('Niyaz Khan','niyazkhan@gmail.com',22,1,'M'),
('Aditya Patle','adityapatle@gmail.com',21,2,'M');

select * from student;


copy student from '/private/tmp/student_data.csv'
delimiter ','
csv header;

--Intructor
INSERT INTO Instructor (name, email, dept_id, salary, experience) VALUES
('Prof. Kimatkar', 'kim@univ.com', 1, 60000, 5),
('Prof. Wankhede', 'wank@univ.com', 2, 55000, 5);

select * from instructor;

copy instructor from '/private/tmp/instructor_data.csv'
delimiter ','
csv header;

--course
INSERT INTO Course (course_name, credits, dept_id, instructor_id, semester)
VALUES
('Database Management System', 4, 1, 1, 5),
('Microcontrollers', 3, 5, 2, 4);

select * from course;

copy course from '/private/tmp/course_data.csv'
delimiter ','
csv header;

--Enrollment
INSERT INTO Enrollment (student_id, course_id, enroll_date, grade)
VALUES
(1, 1, '2025-06-01', 'B'),
(2, 2, '2025-06-02', 'A');

select * from enrollment;

copy enrollment from '/private/tmp/enrollment_data.csv'
delimiter ','
csv header;

--Exam
INSERT INTO Exam (exam_id,course_id, exam_date, total_marks, passing_marks, exam_type)VALUES
(1, '2025-07-10', 100, 40, 'Final'),
(2, '2025-07-12', 100, 35, 'Midterm');

select * from exam;

copy exam from '/private/tmp/exam_data.csv'
delimiter ','
csv header;


