--  question 1  --------------------------------------
INSERT INTO `students` (name, email, phone)
VALUES
('Karim Ahmed', 'karim@gmail.com' , '01066666666')  ,
('Mariam Ali' , 'mariam@gmail.com', '01077777777')  ;

--  question 2  ----------------------------------------
INSERT INTO `Instructors` (name, email)
VALUES
('Omar Hassan', 'omarhassan@gmail.com')  ,
('SamehAhmed' , 'samehahmed@gmail.com')  ;

--  question 3  ---------------------------------------
UPDATE `students`
SET email = 'abdoahmed33@gmail.com'
WHERE name = 'abdo Ahmed';

--  question 4   --------------------------------------
INSERT INTO `Courses` (name, instructor_id)
VALUES
('Introduction to MySQL', 1 )   ,
('JavaScript Basics', 2 )       ,
('Laravel', 3 )                 ;

--  question 5   --------------------------------------
INSERT INTO `Enrollments` (student_id, course_id)
VALUES (6, 5);

--  question 6   --------------------------------------
DELETE FROM Enrollments
WHERE id = 8;

--  question 7   --------------------------------------
SELECT COUNT(*) AS total_students
FROM `students`;

--  question 8   --------------------------------------
SELECT students.name
FROM students
JOIN enrollments
    ON students.id = enrollments.student_id
JOIN courses
    ON enrollments.course_id = courses.id
WHERE courses.name = 'Introduction to MySQL';

--  question 9   --------------------------------------

SELECT
    name AS course_name,
    (SELECT name
     FROM instructors
     WHERE instructors.id = courses.instructor_id) AS instructor_name
FROM courses;

--  question 10   --------------------------------------
SELECT
    courses.name AS course_name,
    COUNT(enrollments.student_id) AS student_count
FROM courses
LEFT JOIN enrollments
    ON courses.id = enrollments.course_id
GROUP BY courses.id, courses.name;

--  question 11   --------------------------------------

SELECT courses.name AS course_name
FROM courses
JOIN enrollments
    ON courses.id = enrollments.course_id
JOIN students
    ON enrollments.student_id = students.id
WHERE students.name = 'aliali';

--  question 12    --------------------------------------

SELECT instructors.name
FROM instructors
JOIN courses
    ON instructors.id = courses.instructor_id
GROUP BY instructors.id, instructors.name
HAVING COUNT(courses.id) > 1;


--  question 13    --------------------------------------
SELECT students.name
FROM students
LEFT JOIN enrollments
    ON students.id = enrollments.student_id
WHERE enrollments.student_id IS NULL;

--  question 14    --------------------------------------

SELECT
    instructors.name AS instructor_name,
    COUNT(courses.id) AS course_count
FROM instructors
LEFT JOIN courses
    ON instructors.id = courses.instructor_id
GROUP BY instructors.id, instructors.name;

--  question 15    --------------------------------------
SELECT AVG(student_count) AS average_students_per_course
FROM (
    SELECT course_id, COUNT(student_id) AS student_count
    FROM enrollments
    GROUP BY course_id
) 
AS course_counts;


