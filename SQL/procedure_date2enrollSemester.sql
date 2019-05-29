CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
    RETURN NUMBER
IS
    nMonth NUMBER;
BEGIN
    SELECT TO_NUMBER(TO_CHAR(dDate, 'mm')) INTO nMonth FROM DUAL;
    IF nMonth >= 5 AND nMonth <= 10 THEN
        RETURN 2;
    ELSE
        RETURN 1;
    END IF;
END;
/