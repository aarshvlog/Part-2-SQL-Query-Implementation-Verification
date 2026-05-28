# Query Outputs and Validation Notes

## Query 1 – Active Students

### Sample Output

| student_id | name  | batch_name |
| ---------- | ----- | ---------- |
| 101        | Aarav | Batch A    |
| 102        | Neha  | Batch B    |

### Validation Note

Only students marked as Active appear in the result.

---

# Query 4 – Latest 20 Submissions

### Result Summary

Returned exactly 20 rows sorted by latest submission timestamp.

### Validation Note

The timestamps appeared in descending chronological order.

---

# Query 8 – Course Enrollment Count

### Sample Output

| course_name | enrolled_students |
| ----------- | ----------------- |
| DBMS        | 120               |
| DSA         | 98                |

### Validation Note

Courses with zero enrollments still appeared because LEFT JOIN was used.

---

# Query 11 – Submission Count by Status

### Sample Output

| status       | total_submissions |
| ------------ | ----------------- |
| Accepted     | 2500              |
| Wrong Answer | 1300              |

### Validation Note

Counts matched the expected submission distribution from dataset.

---

# Query 14 – Problems with Low Success Rate

### Result Summary

Returned difficult problems with high failure frequency.

### Validation Note

Success rate calculation correctly used accepted submissions divided by total attempts.

---

# Query 17 – Problems Never Attempted

### Sample Output

| problem_id | title       |
| ---------- | ----------- |
| 88         | Graph Paths |

### Validation Note

The returned problems had no matching rows in submissions table.
