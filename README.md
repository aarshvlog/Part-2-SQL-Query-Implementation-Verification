# CodeJudge SQL Queries – Part 2

## Objective

This project contains SQL queries written on top of the designed CodeJudge relational database.

The goal is to:

* practice SQL querying
* validate outputs using imported dataset
* demonstrate joins, aggregations, subqueries, and filtering
* reason about correctness of results

---

# Repository Files

| File             | Purpose                             |
| ---------------- | ----------------------------------- |
| queries.sql      | All SQL queries                     |
| query_outputs.md | Sample outputs and validation notes |
| sql_reasoning.md | Explanation answers                 |

---

# Query Categories

## Basic Retrieval and Filtering

Queries involving:

* WHERE
* ORDER BY
* LIMIT
* filtering conditions

## Joins

Queries using:

* INNER JOIN
* LEFT JOIN
* multi-table joins

## Aggregation

Queries using:

* COUNT
* AVG
* GROUP BY
* HAVING

## Subqueries and Set Logic

Queries involving:

* nested queries
* IN / EXISTS
* comparison with aggregates

---

# Database Assumptions

Main tables used:

* students
* batches
* courses
* enrollments
* problems
* submissions
* test_cases
* test_results
* contests

The queries are written to be executable directly on the imported relational schema.
