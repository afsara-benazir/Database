1.

CREATE OR REPLACE FUNCTION CHECKSAL  (MID IN INT,SAL IN NUMBER)
RETURN NUMBER IS
CO INT;
BEGIN
select count(*) INTO CO
from employees
where salary<SAL and department_id=MID
group by department_id;
RETURN CO;
END ;

2.

CREATE OR REPLACE PROCEDURE changeAll  (MID IN INT,SAL IN NUMBER)
IS
CO NUMBER;
BEGIN
FOR R IN (SELECT DEPARTMENT_ID from employees)
LOOP
CO:=CHECKSAL(R.DEPARTMENT_ID,SAL);
IF CO<MID THEN
DELETE FROM EMPLOYEES WHERE DEPARTMENT_ID=R.DEPARTMENT_ID;
ELSE
DBMS_OUTPUT.PUT_LINE('No change') ;
END IF;
END LOOP ;
END ;

3.
CREATE OR REPLACE TRIGGER CheckConsistency
BEFORE DELETE
ON EMPLOYEES
FOR EACH ROW
DECLARE

BEGIN

DELETE FROM JOB_HISTORY
WHERE DEPARTMENT_ID=:OLD.DEPARTMENT_ID;
END ;
/
