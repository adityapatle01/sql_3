--select queries
select * from student;
select * from course;
select * from enrollment;
select * from exam;
select * from department;
select * from instructor;

select count(*) from student;
select max(budget)as max_budget from department;
select min(budget)as min_budget from department;
select sum(budget)as total_budget_of_dept from department;
select avg(budget)as avg_budget_of_dept from department;

select * from instructor where salary between 50000 and 100000;

select s.student_id,student_name,grade from student as s
join enrollment as e on s.student_id=e.student_id
group by s.student_id,student_name,grade 
having grade in ('A','B','C')
order by grade,s.student_id ;

select student_id,student_name,age from student
group by student_id,student_name,age 
having age >=18
order by age asc,student_id;

select count(student_name) as student_less_than_18 from student where age<18 

select distinct course_id,course_name, student_id,student_name
from course c join department d on c.dept_id=d.dept_id
join student s on s.dept_id=d.dept_id
group by course_name, course_id,student_id,student_name
order by student_id;

--count of courses taken by individual student
select student_name,count(student_name) as c_student_name
from course c join department d on c.dept_id=d.dept_id
join student s on s.dept_id=d.dept_id
group by student_name,s.student_id
order by student_id;

select * from student as s
inner join department as d
on s.dept_id=d.dept_id
order by student_id;

select * from course as c
inner join department as d
on c.dept_id=d.dept_id
left join instructor as i
on c.instructor_id=i.instructor_id
order by course_id
limit 100
offset 50;

select s.student_id as student_id,student_name,c.course_id,course_name,grade,semester,exam_type from student as s
inner join enrollment as e
on s.student_id=e.student_id
right join course as c
on e.course_id=c.course_id
inner join exam as ex
on c.course_id=ex.course_id
where exam_type='Final'
order by s.student_id;

-- alter queries

alter table student add column colom varchar(100) null;
alter table student rename column colom to c_column;
alter table student alter column c_column set default null;
alter table student drop column c_column;
alter table enrollment drop constraint enrollment_course_id_fkey;

ALTER TABLE enrollment
ADD CONSTRAINT enrollment_course_id_fkey
foreign key(course_id)
REFERENCES course (course_id);

alter table student alter column age drop not null;
alter table student alter column age set not null;

alter table student alter column student_name type text;
alter table student alter column student_name type varchar(100);

delete from student where student_name='Aditya Patle';

INSERT INTO Student (student_id,student_name, email, age, dept_id, gender) VALUES
(2,'Aditya Patle','adityapatle@gmail.com',21,2,'M');

select * from enrollment where grade ='A'
union 
select * from enrollment where grade='B'
order by grade

SELECT course_id
FROM enrollment
WHERE grade = 'A'
INTERSECT
SELECT course_id
FROM exam
WHERE exam_type = 'Final';

select * from enrollment where grade ='A'
except 
select * from enrollment where grade='B'
order by grade



