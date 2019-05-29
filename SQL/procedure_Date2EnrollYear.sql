CREATE OR REPLACE FUNCTION Date2EnrollYear(dDate IN DATE)
    RETURN NUMBER
IS
    sMonth CHAR(2);
BEGIN
    SELECT TO_CHAR(dDate, 'mm') INTO sMonth FROM DUAL;
    IF sMonth = '11' OR sMonth = '12' THEN
        RETURN TO_NUMBER(TO_CHAR(dDate, 'yyyy')) + 1;
    ELSE
        RETURN TO_NUMBER(TO_CHAR(dDate, 'yyyy'));
    END IF;
END;
/