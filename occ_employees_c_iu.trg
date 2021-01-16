CREATE OR REPLACE TRIGGER occ_employees_c_iu
FOR INSERT OR UPDATE ON occ_employees
COMPOUND TRIGGER

  BEFORE EACH ROW IS
  BEGIN
    IF UPDATING THEN
      :new.updated_by := USER;
      :new.date_updated := SYSDATE;
    END IF;
  END BEFORE EACH ROW;

END occ_employees_c_iu;
/
