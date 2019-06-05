CREATE OR REPLACE trigger update_professor_trigger
BEFORE
UPDATE ON professor
FOR EACH ROW

DECLARE
    v_cnt NUMBER;
    PASSWORD_DIGIT_ERROR EXCEPTION;
    PASSWORD_BLANK_ERROR EXCEPTION;
    INVALID_PHONE_FORMAT_ERROR EXCEPTION;
    INVALID_EMAIL_FORMAT_ERROR EXCEPTION;
BEGIN
    IF length(:new.p_pwd) < 4 then
        RAISE PASSWORD_DIGIT_ERROR;
    ELSIF :new.p_pwd like '% %' then
        RAISE PASSWORD_BLANK_ERROR;
    end if;

    IF not regexp_like(:new.p_phone, '^\d{3}-\d{3,4}-\d{4}$') THEN
        RAISE INVALID_PHONE_FORMAT_ERROR;
    END IF;

    IF not regexp_like(:new.p_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') THEN
        RAISE INVALID_EMAIL_FORMAT_ERROR;
    END IF;

EXCEPTION
    WHEN PASSWORD_DIGIT_ERROR then
        RAISE_APPLICATION_ERROR(-20002, '암호자릿수 부족');
    WHEN PASSWORD_BLANK_ERROR then
        RAISE_APPLICATION_ERROR(-20003, '암호 공백');
    WHEN INVALID_PHONE_FORMAT_ERROR then
        RAISE_APPLICATION_ERROR(-20004, '부적절한 전화번호 형식');
    WHEN INVALID_EMAIL_FORMAT_ERROR then
        RAISE_APPLICATION_ERROR(-20005, '부적절한 이메일 형식');
END;
/
