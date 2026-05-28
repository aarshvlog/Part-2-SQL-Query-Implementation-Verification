-- =====================================================
-- 1. Active students
-- Purpose:
-- List all active students with basic details.
-- =====================================================

SELECT
s.student_id,
s.name,
s.email,
b.batch_name,
s.admission_date
FROM students s
LEFT JOIN batches b
ON s.batch_id = b.batch_id
WHERE s.status = 'Active';

---

-- 2. Invalid or missing emails

SELECT
student_id,
name,
email
FROM students
WHERE email IS NULL
OR email NOT LIKE '%@%.%';

---

-- 3. Problems with Easy or Medium difficulty

SELECT
problem_id,
title,
difficulty
FROM problems
WHERE difficulty IN ('Easy', 'Medium');

---

-- 4. Latest 20 submissions

SELECT *
FROM submissions
ORDER BY submitted_at DESC
LIMIT 20;

---

-- 5. Failed submissions

SELECT
submission_id,
student_id,
problem_id,
status
FROM submissions
WHERE status <> 'Accepted';

---

## -- JOINS

-- 6. Submission details with joins

SELECT
sub.submission_id,
st.name AS student_name,
p.title AS problem_title,
sub.language,
sub.status,
sub.score,
sub.submitted_at
FROM submissions sub
JOIN students st
ON sub.student_id = st.student_id
JOIN problems p
ON sub.problem_id = p.problem_id;

---

-- 7. Students and enrollments including non-enrolled

SELECT
s.student_id,
s.name,
e.course_id
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id;

---

-- 8. Courses with enrollment count

SELECT
c.course_id,
c.course_name,
COUNT(e.student_id) AS enrolled_students
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

---

-- 9. Test-case results with student and problem

SELECT
tr.result_id,
st.name AS student_name,
p.title AS problem_title,
tr.result_status
FROM test_results tr
JOIN submissions sub
ON tr.submission_id = sub.submission_id
JOIN students st
ON sub.student_id = st.student_id
JOIN problems p
ON sub.problem_id = p.problem_id;

---

-- 10. Enrolled students with no submissions

SELECT DISTINCT
s.student_id,
s.name
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN submissions sub
ON s.student_id = sub.student_id
WHERE sub.submission_id IS NULL;

---

## -- AGGREGATION

-- 11. Submission count by status

SELECT
status,
COUNT(*) AS total_submissions
FROM submissions
GROUP BY status;

---

-- 12. Average score per problem

SELECT
p.problem_id,
p.title,
AVG(sub.score) AS average_score
FROM submissions sub
JOIN problems p
ON sub.problem_id = p.problem_id
GROUP BY p.problem_id, p.title;

---

-- 13. Students with more than 10 submissions

SELECT
student_id,
COUNT(*) AS submission_count
FROM submissions
GROUP BY student_id
HAVING COUNT(*) > 10;

---

-- 14. Problems with success rate below 40%

SELECT
p.problem_id,
p.title,
ROUND(
SUM(CASE WHEN sub.status = 'Accepted' THEN 1 ELSE 0 END) * 100.0
/ COUNT(*),
2
) AS success_rate
FROM submissions sub
JOIN problems p
ON sub.problem_id = p.problem_id
GROUP BY p.problem_id, p.title
HAVING (
SUM(CASE WHEN sub.status = 'Accepted' THEN 1 ELSE 0 END) * 100.0
/ COUNT(*)
) < 40;

---

-- 15. Top 10 most attempted problems

SELECT
p.problem_id,
p.title,
COUNT(sub.submission_id) AS attempts
FROM problems p
JOIN submissions sub
ON p.problem_id = sub.problem_id
GROUP BY p.problem_id, p.title
ORDER BY attempts DESC
LIMIT 10;

---

## -- SUBQUERIES

-- 16. Students scoring above overall average

SELECT
student_id,
AVG(score) AS avg_score
FROM submissions
GROUP BY student_id
HAVING AVG(score) > (
SELECT AVG(score)
FROM submissions
);

---

-- 17. Problems never attempted

SELECT
problem_id,
title
FROM problems
WHERE problem_id NOT IN (
SELECT DISTINCT problem_id
FROM submissions
);

---

-- 18. Enrolled students with no submissions

SELECT
student_id,
name
FROM students
WHERE student_id IN (
SELECT student_id
FROM enrollments
)
AND student_id NOT IN (
SELECT DISTINCT student_id
FROM submissions
);

---

-- 19. Students using both Python and Java

SELECT
student_id
FROM submissions
WHERE language IN ('Python', 'Java')
GROUP BY student_id
HAVING COUNT(DISTINCT language) = 2;

---

-- 20. Second-highest score for a problem

SELECT MAX(score) AS second_highest_score
FROM submissions
WHERE problem_id = 12
AND score < (
SELECT MAX(score)
FROM submissions
WHERE problem_id = 12
);
