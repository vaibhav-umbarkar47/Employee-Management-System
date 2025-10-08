-- create databse
create database emp_db;
use emp_db;
-- drop database emp_db;

-- Table 1: Job Department
CREATE TABLE JobDepartment (
    Job_ID INT PRIMARY KEY,
    jobdept VARCHAR(50),
    name VARCHAR(100),
    description TEXT,
    salaryrange VARCHAR(50)
);
-- Table 2: Salary/Bonus
CREATE TABLE SalaryBonus (
    salary_ID INT PRIMARY KEY,
    Job_ID INT,
    amount DECIMAL(10,2),
    annual DECIMAL(10,2),
    bonus DECIMAL(10,2),
    FOREIGN KEY (job_ID) REFERENCES JobDepartment(Job_ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);
-- Table 3: Employee
CREATE TABLE Employee (
    emp_ID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    contact_add VARCHAR(100),
    emp_email VARCHAR(100) UNIQUE,
    emp_pass VARCHAR(50),
    Job_ID INT,
    FOREIGN KEY (Job_ID) REFERENCES JobDepartment(Job_ID)
	ON DELETE SET NULL ON UPDATE CASCADE
);

-- Table 4: Qualification
CREATE TABLE Qualification (
    QualID INT PRIMARY KEY,
    Emp_ID INT,
    Position VARCHAR(50),
    Requirements VARCHAR(255),
    Date_In DATE,
    FOREIGN KEY (Emp_ID) REFERENCES Employee(emp_ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table 5: Leaves
CREATE TABLE Leaves (
    leave_ID INT PRIMARY KEY,
    emp_ID INT,
    date DATE,
    reason TEXT,
    FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table 6: Payroll
CREATE TABLE Payroll (
    payroll_ID INT PRIMARY KEY,
    emp_ID INT,
    job_ID INT,
    salary_ID INT,
    leave_ID INT,
    date DATE,
    report TEXT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (job_ID) REFERENCES JobDepartment(job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY (salary_ID) REFERENCES SalaryBonus(salary_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (leave_ID) REFERENCES Leaves(leave_ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

select * from employee;
select * from jobdepartment;
select * from leaves;
select * from qualification;
select * from salarybonus;
select * from Payroll;

-- 1. EMPLOYEE INSIGHTS 
-- ● How many unique employees are currently in the system? 
	select count(distinct emp_id) as No_of_emp
	from employee;                                    -- 60
    
    
-- ● Which departments have the highest number of employees? 
select jobdept,No_of_emp,rnk
from (
	select jobdept,count(emp_id) as No_of_emp,
    dense_rank() over(order by count(emp_id) desc) as rnk
	from jobdepartment jd
    join  employee e
    on jd.job_id = e.job_id					
    group by jobdept
    order by No_of_emp desc) as i
where rnk=1;
    
    
-- ● What is the average salary per department? 
	select jobdept,avg(amount) as avg_salary
    from jobdepartment jd
    join salarybonus sb
    on sb.job_id = jd.job_id
    group by jobdept;
    
    
-- ● Who are the top 5 highest-paid employees? 
   select e.emp_id,jd.jobdept,e.firstname,e.lastname,sb.amount
    from salarybonus sb
    join jobdepartment jd
    on jd.job_id  = sb.job_id
    left join employee e
    on e.job_id  = jd.job_id
    order by amount desc
    limit 5;
    
    
-- ● What is the total salary expenditure across the company? 
select sum(amount) as total_salary_expenditure
from salarybonus;



-- 2. JOB ROLE AND DEPARTMENT ANALYSIS 
-- ● How many different job roles exist in each department? 
	select jobdept,count(name) as diff_job_role
    from jobdepartment
    group by jobdept;
	
    
-- ● What is the average salary range per department? 
	select jobdept,avg(amount) as avg_salary_dep
	from salarybonus sb 
    join jobdepartment jd
    on jd.job_id  = sb.job_id
    group by jobdept;
    
    
-- ● Which job roles offer the highest salary? 
	select jd.name ,sb.amount
	from salarybonus sb
    join jobdepartment jd
    on jd.job_id = sb.job_id
    order by amount desc
    limit 5;
    
    
-- ● Which departments have the highest total salary allocation? 
	select jobdept,sum(amount) as highest_total_salary
	from salarybonus sb
    join jobdepartment jd
    on jd.job_id = sb.job_id
    group by jobdept
    order by highest_total_salary desc;
    
    
-- 3. QUALIFICATION AND SKILLS ANALYSIS 
-- ● How many employees have at least one qualification listed? 
	select count(e.emp_id) as emp_with_qualification
	from employee e
	join qualification q
    on e.emp_id = q.emp_id
    where q.requirements is not null;
    
    
-- ● Which positions require the most qualifications? 
	select Position,Requirements
	from qualification 
    where Requirements like '%/%';
    
    
-- ● Which employees have the highest number of qualifications? 
	select e.firstname,e.lastname ,q.position,q.requirements
	from employee e
    join qualification q
    on q.emp_ID = e.emp_ID
    where q.requirements like '%/%';
    
    
-- 4. LEAVE AND ABSENCE PATTERNS 
-- ● Which year had the most employees taking leaves? 
    select year(date) as year,count(date) as leaves
	from employee e
    join leaves l
    on l.emp_id = e.emp_id
    group by year(date);
    
    
-- ● What is the average number of leave days taken by its employees per department? 
select jobdept,avg(sum_Leave_Days) as sum_of_leaves
from (SELECT jobdept,sum(Total_Leave_Days) AS sum_Leave_Days
FROM (SELECT e.emp_ID,jd.jobdept,COUNT(l.Date) AS Total_Leave_Days
    FROM Leaves l
    join employee e
    on e.emp_id = l.emp_id
    join jobdepartment jd
    on jd.job_id = e.job_id
    GROUP BY emp_ID, jobdept
) AS F
GROUP BY jobdept) as S
group by jobdept;
-- --------------------------------------------------------------------------------------------------------------------------------
SELECT jobdept, 
       AVG(leave_count) AS avg_leave_days
FROM (
    SELECT e.emp_ID, jd.jobdept, COUNT(l.date) AS leave_count
    FROM Leaves l
    JOIN Employee e ON e.emp_id = l.emp_id
    JOIN JobDepartment jd ON jd.job_id = e.job_id
    GROUP BY e.emp_ID, jd.jobdept
) AS emp_leaves
GROUP BY jobdept;





-- ● Which employees have taken the most leaves? 
	 select e.emp_id,e.firstname,e.lastname,count(l.date) as most_leave
     from leaves l 
     join employee e
     on e.emp_id = l.emp_id
     group by e.emp_id
     order by most_leave;
     
--      select e.emp_id, e.firstname, e.lastname, count(l.date) as total_leaves
-- from leaves l
-- join employee e on e.emp_id = l.emp_id
-- group by e.emp_id, e.firstname, e.lastname
-- having count(l.date) = (
--     select max(cnt)
--     from (
--         select count(*) as cnt
--         from leaves
--         group by emp_id
--     ) as sub
-- );

	
-- ● What is the total number of leave days taken company-wide? 
	select sum(n_leaves) as total_leave_days
    from(select emp_id,count(date) as n_leaves
	from leaves l
    group by emp_id) as s;
    

-- ● How do leave days correlate with payroll amounts?
	SELECT e.emp_id,e.firstname,e.lastname, COUNT(l.date) AS leave_days,
    p.total_amount AS payroll_amount
	FROM employee e
	JOIN leaves l ON e.emp_id = l.emp_id
	JOIN payroll p ON e.emp_id = p.emp_id
	GROUP BY e.emp_id, p.total_amount;

-- 5. PAYROLL AND COMPENSATION ANALYSIS 
-- ● What is the total monthly payroll processed? 
	select report,sum(total_amount) as total_monthly_payroll
	from payroll
    group by report;
    
-- ● What is the average bonus given per department? 
	select jobdept,avg(bonus) as avg_bonus
	from salarybonus s
    join jobdepartment jd
    on jd.job_id = s.job_id
    group by jobdept;
    
-- ● Which department receives the highest total bonuses? 
	select jobdept,highest_bonus,rnk
    from (select jobdept,sum(bonus) as highest_bonus,
    dense_rank() over(order by sum(bonus) desc) as rnk
	from salarybonus s
    join jobdepartment jd
    on jd.job_id = s.job_id
    group by jobdept
    order by highest_bonus desc) as sum_of_bonus
    where rnk = 1;
    
-- ● What is the average value of total_amount after considering leave deductions? 
select avg(p.total_amount) as avg_net_amount
from payroll p
join salarybonus s
on s.salary_id = p.salary_id;

    
   --  select avg(s.amount - p.total_amount) as total_amount_avg
-- 	from payroll p
--     join salarybonus s
--     on s.salary_id = p.salary_id;
