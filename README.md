# OCC
Oracle Code Challenge

To run the OCC application you will need to do the following:-

Copy all the files to a folder in your filesystem

1. Login to SQL*Plus with DBA privileges. 
This will be required to create the database objects

2. Run CREATE_OCC.sql from the folder you copied the files

start CREATE_OCC.sql

This will create the following objects

Roles (optional)
Tables
Grants to roles (optional)
Database Triggers
Database Package

It will then load the business data

3. Run the  OCC Test Plan

start OCC_TEST_PLAN.sql

This will run the tests in each case. Output can be inspected.

It will also generate the 2 repports which are sent to the same folder

department_salaries_report.txt
and
department_employees_report.txt
