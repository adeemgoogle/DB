--task 1 A
SELECT course_id from course where credits > 3;
--task 1 B
SELECT room_number from classroom where building='Packard' or building='Watson';

--task 1 C
SELECT course_id from course where dept_name = 'Comp. Sci.';

--task 1 D
SELECT course_id from takes where semester = 'Fall';

--task 1 E
SELECT name from student where tot_cred > 45 and tot_cred < 90;

--Task 1 f
select name from student where name like '%a' or name like '%e' or name like '%i' or name like '%o' or name like '%u' or name like '%y';

--Task 1 g
SELECT course_id from prereq where prereq_id='CS-101';

--task 2A
SELECT dept_name, avg(salary) from instructor group by dept_name order by avg(salary) asc;

-- task2 B ???????/
SELECT building from classroom group by building order by max(capacity) desc ;

-- task 2 C Д нету

-- task 2 e
SELECT name from instructor where dept_name='Biology' or dept_name='Philosophy' or dept_name='Music';
-- task 2 f

SELECT name from instructor where id in (Select id from teaches where year='2017');

-- task 3 A
SELECT name from student where dept_name = 'Comp. Sci.' and id in(Select id from takes
    where grade='A' or grade='-A' and course_id='CS-101' or course_id='CS-190'or course_id='CS-315' or
          course_id='CS-319' or course_id='CS-347') order by name asc ;
--task 3 B
SELECT DISTINCT name from student,takes, advisor  where student.id = advisor.s_id not in (grade='A' or grade='A-' or grade='B+' or grade='B');

--task 3C D нет

--3 E
SELECT title from course where course_id in (
SELECT course_id from section where (section.time_slot_id='A' or section.time_slot_id='B'or section.time_slot_id='C' or
                                     section.time_slot_id='E' or section.time_slot_id='H'));

