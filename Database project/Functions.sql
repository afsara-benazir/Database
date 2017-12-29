1.
create or replace FUNCTION GET_AUTHOR_NAME(EID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
COUNTER NUMBER;
BEGIN
MSG:='';
COUNTER:=0;
FOR R IN (Select AUTHOR_NAME from AUTHOR WHERE BOOK_ID=EID)
LOOP
COUNTER:=COUNTER+1;
IF COUNTER>1 THEN
MSG:=MSG||',';
END IF;
MSG:=MSG||R.AUTHOR_NAME;
END LOOP ;
RETURN MSG ;
END;

2.
create or replace FUNCTION GET_STATUS(EID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
BEGIN
IF EID=0 THEN
MSG:='UNPAID';
ELSIF EID=1 THEN
MSG:='DUE';
ELSE
MSG:='PAID';
END IF;
RETURN MSG;
END;
/

3.
create or replace FUNCTION ENOUGH_IN_STORE(EID IN NUMBER,BID IN VARCHAR2)
RETURN VARCHAR2 IS
MSG VARCHAR2(100) ;
CO NUMBER;
BEGIN
SELECT TOTAL_IN_STORAGE INTO CO
FROM BOOK B
WHERE B.BOOK_ID=BID;
IF EID>CO THEN
MSG:='N';
ELSE
MSG:='Y';
END IF;
RETURN MSG;
END;
/
