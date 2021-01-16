PROMPT 1. Create OCC Roles
@create_occ_roles.sql

PROMPT 2. DDL Script to create tables 
@create_occ_tables.sql

PROMPT 3. Grants to roles
@create_occ_grants.gr

PROMPT 4. Create Database triggers
@occ_employees_c_iu.trg
@occ_employees_c_iu.trg

PROMPT 5. Create OCC package
@p_occ.psp
@p_occ.pbd

PROMPT 6. Insert business data
@occ_data.bd

PROMPT 7. Save changes
COMMIT;


