<img width="1335" height="738" alt="image" src="https://github.com/user-attachments/assets/a6028d84-2eb3-4cb8-b7da-91d0056fbd2d" />

# 🧑‍💼 Employee Management System (MySQL)

## 📌 Project Title & Description
The **Employee Management System (EMS)** is a relational database project built entirely in **MySQL**.  
It is designed to manage employee records, job roles, payroll, qualifications, leaves, and bonuses in a structured and efficient way.  
The project demonstrates how relational database design can ensure **data integrity, scalability, and easy reporting**.

---

## 📖 Project Overview
Organizations often struggle with scattered employee data and manual record-keeping.  
This system provides a **centralized MySQL database** that connects employees with their job roles, payroll, qualifications, and leave records.  
The ER diagram and schema design highlight how MySQL can be used to build a robust employee management solution.

---

## ✨ Features
- Manage employee personal and job-related details  
- Map employees to job roles and departments  
- Track qualifications and requirements  
- Maintain payroll with total and net pay  
- Record employee leaves with reasons and dates  
- Manage annual salary and bonus details  
- Enforce data consistency with **primary keys** and **foreign keys**  

---

## 🧬 Entity-Relationship Diagram (ERD)
<img width="868" height="606" alt="image" src="https://github.com/user-attachments/assets/1206eb68-ebec-44fd-9719-f460c2a20cf9" />

### 📸 ERD Snapshot
*(Insert your ER diagram screenshot here — e.g., `ERD.png`)*

### 🔍 ER Diagram Explanation
The ERD defines the structure of the Employee Management System database:

#### `employee`
- Stores personal and job-related details  
- **Attributes:** `emp_ID` (PK), `firstname`, `lastname`, `gender`, `email_ID`, `emp_contact`, `emp_add`, `emp_pass`, `Job_ID` (FK)

#### `jobdepartment`
- Defines job roles, departments, and salary ranges  
- **Attributes:** `Job_ID` (PK), `Job_name`, `department`, `salaryrange`

#### `qualification`
- Tracks employee qualifications and requirements  
- **Attributes:** `QualID` (PK), `emp_ID` (FK), `Qualification`, `Requirements`

#### `payroll`
- Stores salary and net pay details  
- **Attributes:** `payroll_ID` (PK), `emp_ID` (FK), `Job_ID` (FK), `total_amount`, `netpay`

#### `leaves`
- Records employee leave details  
- **Attributes:** `leave_ID` (PK), `emp_ID` (FK), `date`, `reason`

#### `salarybonus`
- Captures annual salary and bonus data  
- **Attributes:** `salary_ID` (PK), `emp_ID` (FK), `Job_ID` (FK), `annual`, `bonus`

### 🔗 Relationship Summary
- One **employee** can have multiple **qualifications**, **payroll records**, **leaves**, and **salary bonuses**  
- Each employee is linked to a **job role** via `Job_ID`  
- Foreign key constraints ensure **data consistency** across all entities  

---

## 🗄️ Database Schema / Tables
- **Employee** → Employee details  
- **JobDepartment** → Job roles & departments  
- **Qualification** → Employee qualifications  
- **Payroll** → Salary & net pay  
- **Leaves** → Leave records  
- **SalaryBonus** → Annual salary & bonus  

---


Code

---

## 🚀 Getting Started
1. Clone the repository  
   ```bash
   git clone https://github.com/vaibhav-umbarkar47/Employee-Management-System
Open MySQL Workbench (or any MySQL client)

Import the SQL schema from SQL_Scripts/schema.sql

Run queries to manage employees, payroll, leaves, and bonuses

🛠️ Tech Stack
Database: MySQL

Modeling Tool: MySQL Workbench (or any ERD tool)

Language: SQL

🧠 Author
Designed and documented by Vaibhav, with a focus on clarity, precision, and scalable database design.

📬 Contact
For queries, feedback, or collaboration:

📧 Email: vumbarkar227@gmail.com

💼 [LinkedIn](https://www.linkedin.com/in/vaibhav-umbarkar-023667324/)
