🧑‍💼 Employee Management System (MySQL-Based)
📋 Overview

The Employee Management System is a MySQL-based database project designed to efficiently manage and organize employee-related information, including job details, payroll, bonuses, qualifications, and leaves.
This system helps HR teams store, track, and analyze employee data in a structured and relational manner.

🎯 Objectives

To store and manage employee records and related company data efficiently.

To perform CRUD operations (Create, Read, Update, Delete) using SQL.

To ensure relational integrity among multiple employee-related entities.

To generate useful insights about employee details, payroll, leaves, and qualifications.

🗄️ Database Information

Database Type: MySQL

Total Tables: 6

Schema Design: Fully normalized with primary and foreign key constraints

🧩 Tables and Description
1. 🧑‍💼 employee

Stores core employee information.
Columns:

emp_ID (INT, Primary Key)

firstname (VARCHAR 50)

lastname (VARCHAR 50)

gender (VARCHAR 10)

age (INT)

contact_add (VARCHAR 100)

emp_email (VARCHAR 100)

emp_pass (VARCHAR 50)

Job_ID (INT, Foreign Key → jobdepartment.Job_ID)

2. 🏢 jobdepartment

Stores details about departments and job roles.
Columns:

Job_ID (INT, Primary Key)

jobdept (VARCHAR 50)

name (VARCHAR 100) — Job title or position name

description (TEXT) — Role description

salaryrange (VARCHAR 50) — Salary range info

3. 💰 salarybonus

Stores salary and bonus information for each job role.
Columns:

salary_ID (INT, Primary Key)

job_ID (INT, Foreign Key → jobdepartment.Job_ID)

amount (DECIMAL 10,2)

annual (DECIMAL 10,2)

bonus (DECIMAL 10,2)

4. 🧾 payroll

Maintains payroll records for each employee.
Columns:

payroll_ID (INT, Primary Key)

emp_ID (INT, Foreign Key → employee.emp_ID)

job_ID (INT, Foreign Key → jobdepartment.Job_ID)

salary_ID (INT, Foreign Key → salarybonus.salary_ID)

leave_ID (INT, Foreign Key → leaves.leave_ID)

date (DATE)

report (TEXT)

total_amount (DECIMAL 10,2)

5. 🌴 leaves

Tracks employee leave records.
Columns:

leave_ID (INT, Primary Key)

emp_ID (INT, Foreign Key → employee.emp_ID)

date (DATE)

reason (TEXT)

6. 🎓 qualification

Stores employee qualification and position details.
Columns:

QualID (INT, Primary Key)

Emp_ID (INT, Foreign Key → employee.emp_ID)

Position (VARCHAR 50)

Requirements (VARCHAR 255)

Date_In (DATE)

🔗 Relationships

Employee → JobDepartment → Many employees can belong to one job department.

Employee → Payroll / Leaves / Qualification → Each employee can have multiple payrolls, leaves, and qualifications.

JobDepartment → SalaryBonus / Payroll → Each job department is linked to specific salary and payroll details.

⚙️ Key Features

Complete relational model using MySQL.

Supports full data manipulation (INSERT, UPDATE, DELETE).

Retrieve data easily using JOIN and aggregate queries.

Generate insights such as:

Total employees per department

Salary statistics (max, min, avg)

Leave summaries per employee

Payroll and bonus tracking

📂 Project Structure
Employee_Management_System_MySQL/
 ┣─ employee_management.sql     # SQL file containing database creation, tables & queries
 ┣─ README.md                  # Project documentation
 ┗─ ER_Diagram.png             # Entity-Relationship Diagram (this image)

🚀 How to Run

Open MySQL Workbench or any MySQL-supported database tool.

Open the employee_management.sql file.

Execute the SQL commands in order:

Create Database

Create Tables

Define Foreign Keys

Insert Sample Data

Run SELECT queries to explore employee, payroll, and department data.

Use JOIN queries to generate detailed reports.

🧠 Example Analytical Queries
-- Total number of employees in each department
SELECT j.jobdept, COUNT(e.emp_ID) AS total_employees
FROM employee e
JOIN jobdepartment j ON e.Job_ID = j.Job_ID
GROUP BY j.jobdept;

-- Average salary by department
SELECT j.jobdept, AVG(s.amount) AS avg_salary
FROM salarybonus s
JOIN jobdepartment j ON s.job_ID = j.Job_ID
GROUP BY j.jobdept;

-- Total leaves taken by each employee
SELECT e.firstname, e.lastname, COUNT(l.leave_ID) AS total_leaves
FROM employee e
JOIN leaves l ON e.emp_ID = l.emp_ID
GROUP BY e.emp_ID;

💬 Future Enhancements

Add stored procedures for payroll generation.

Implement views for easier HR reporting.

Add triggers to automatically update salary or leave info.

Connect this database to a web or desktop frontend in the future.

📌 Notes

This project is 100% SQL-based (no external programming languages).

Developed and tested in MySQL Workbench.

Ideal for learning database normalization, ER modeling, and relational design.
