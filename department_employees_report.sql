SET TERMOUT OFF
SET VERIFY OFF
SET ECHO OFF
SET LINESIZE  100
DEFINE p_department = &1
SET ECHO OFF
SET NEWPAGE 0
SET SPACE 0
SET FEEDBACK OFF
SET VERIFY OFF
SET PAGESIZE 100

TTITLE 'Department Employees Report'
BREAK ON "Department"
COL "Department"    FORMAT A30
COL "Employee Name" FORMAT A30

SPOOL department_employees_report.txt

SELECT department_name "Department",
       employee_name   "Employee Name"
FROM   occ_employees   oe,
       occ_departments od
WHERE  oe.department_id = od.department_id
AND   (oe.department_id = &p_department OR &p_department = 0)
ORDER BY 1,2;

SPOOL OFF

SET TERMOUT ON

PROMPT Report has been created and sent to department_employees_report.txt
