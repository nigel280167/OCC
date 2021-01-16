-- TEST PLAN

PROMPT 1. Test Departments data loaded correctly
-- After initial data load query departments and compare to source data
PROMPT Confirm all 4 records created with correct values in each column

COL department_name FORMAT A30
COL location FORMAT A30

SELECT department_id, 
       department_name, 
       location
FROM   occ_departments
ORDER BY department_id;

PROMPT

PROMPT 2. Test Employees data loaded correctly 
PROMPT Confirm all 10 records created with correct values in each column
-- As we are using the p_occ.create_employee procedure this also tests that it has worked

COL employee_name FORMAT A20
COL job_title FORMAT A15
COL DATE_HIRED FORMAT A10
SET LINESIZE 100

SELECT employee_id, 
       employee_name, 
       job_title, 
       date_hired, 
       salary, 
       department_id, 
       manager_id
FROM   occ_employees
ORDER BY employee_id;

PROMPT

PROMPT 3. Test the adjust salary function
PROMPT
PROMPT Give John Smith a 10% raise 
PROMPT

EXEC p_occ.adjust_salary(90001,110);

PROMPT John's salary should now be 110000 
SELECT employee_name,
       salary
FROM   occ_employees
WHERE  employee_id = 90001;

PROMPT
PROMPT Give Gus Jones a 50% pay cut
PROMPT

EXEC p_occ.adjust_salary(90009,50);

PROMPT Gus's salary should now be £25000

SELECT employee_name,
       salary
FROM   occ_employees
WHERE  employee_id = 90009;

PROMPT

PROMPT 4. Test the Transfer employee function
PROMPT Transfer Mildred to Sales
PROMPT

EXEC p_occ.transfer_employee(90010,4);

SELECT employee_name||' is now in the '||department_name||' department' "Employee Department"
FROM   occ_employees   oe,
       occ_departments od
WHERE  od.department_id = oe.department_id
AND    oe.employee_id   = 90010;

PROMPT
PROMPT 5. Test the get Employee Salary function
PROMPT
PROMPT Get Sarah's salary - should be £45000
SELECT '£'||p_occ.get_employee_salary(90006) "Sarah's Salary"
FROM   DUAL;


PROMPT Running the Department Employees Report
PROMPT
PROMPT Department 1 (Management)
PROMPT
PROMPT To run for all departments - pass 0

start department_employees_report.sql 1

PROMPT Running the Department Salary Report
PROMPT
PROMPT Department 4 (Sales)
PROMPT
PROMPT To run for all departments - pass 0

start department_salary_report.sql 4

PROMPT
PROMPT Changes have not been saved until manually commited


