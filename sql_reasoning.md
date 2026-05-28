# SQL Reasoning Explanations

## 1. LEFT JOIN vs INNER JOIN

Query Used:
Students and enrollments query.

Reason:
LEFT JOIN was more appropriate because we wanted to include students who were not enrolled in any course.

If INNER JOIN had been used, non-enrolled students would disappear from the output.

---

# 2. HAVING vs WHERE

Query Used:
Students with more than 10 submissions.

Reason:
COUNT(*) is an aggregate function.

WHERE cannot filter aggregated results after grouping, so HAVING was required.

Example:

```sql id="h2bn6j"
HAVING COUNT(*) > 10
```

---

# 3. Subquery Usage

Query Used:
Students whose average score is above overall average.

Reason:
The subquery calculates the overall database average score first.

Then the outer query compares each student's average against that value.

---

# 4. Duplicate Record Risk

Query Used:
Course enrollment counts.

Potential Issue:
Duplicate enrollment rows could artificially increase enrollment counts.

Example:
If one student appears twice for the same course, COUNT(*) becomes misleading.

Solution:
Use DISTINCT or clean duplicate records during auditing.

---

# 5. Edge Case Considered

Query Used:
Problems never attempted.

Edge Case:
NULL values inside the subquery could affect NOT IN behavior.

To avoid issues:
problem_id should be NOT NULL in submissions table.

Alternative safer approach:
Use NOT EXISTS instead of NOT IN in some DBMS implementations.
