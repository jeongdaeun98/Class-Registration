CREATE OR REPLACE PROCEDURE InsertEnroll
    (sStudentId IN VARCHAR2, sCourseId IN VARCHAR2,
     nCourseIdNo IN NUMBER, result OUT VARCHAR2)
IS
    too_many_sumCourseUnit   EXCEPTION;
    too_many_courses      EXCEPTION;
    too_many_students      EXCEPTION;  
    duplicate_time         EXCEPTION;
    nYear         NUMBER;  
    nSemester         NUMBER; 
    nSumCourseUnit      NUMBER;  
    nCourseUnit         NUMBER;  
    nCnt         NUMBER;  
    nTeachMax         NUMBER;
    r_day1          NUMBER;
    r_time1          NUMBER;
    r_day2	           NUMBER;
    r_time2          NUMBER;
    final_c_unit    VARCHAR2(3);
BEGIN
    result := '';

    DBMS_OUTPUT.put_line('#');
    DBMS_OUTPUT.put_line(sStudentId || '���� �����ȣ ' || sCourseId || ', �й� ' ||
                            nCourseIdNo || '�� ���� ����� ��û�Ͽ����ϴ�.');

    /* �⵵, �б� �˾Ƴ��� */
    nYear := Date2EnrollYear(SYSDATE);
    nSemester := Date2EnrollSemester(SYSDATE);

    /* ���� ó�� 1 : �ִ����� �ʰ����� */
    SELECT SUM(t.t_personnel) INTO nSumCourseUnit FROM   teach t, enroll e
    WHERE  e.s_id = sStudentId AND e.e_year = nYear AND e.e_semester = nSemester
             AND  e.c_id = t.c_id AND e.c_unit = t.c_unit;

    SELECT t_personnel INTO nCourseUnit FROM teach 
    WHERE c_id = sCourseId AND c_unit = nCourseIdNo AND t_year = nYear AND t_semester = nSemester;

    IF (nSumCourseUnit + nCourseUnit > 18) THEN
        RAISE too_many_sumCourseUnit;   --����� ���� ����
    END IF;

    /* ���� ó�� 2 : ������ ���� ��û ���� */
    SELECT COUNT(*) INTO nCnt FROM enroll
    WHERE s_id = sStudentId AND c_id = sCourseId;
    IF (nCnt > 0) THEN
        RAISE too_many_courses;
    END IF;

    /* ���� ó�� 3 : ������û �ο� �ʰ� ���� */
    SELECT t_personnel INTO nTeachMax FROM teach
    WHERE t_year = nYear AND t_semester = nSemester AND c_id = sCourseId AND c_unit= nCourseIdNo;
    SELECT COUNT(*) INTO nCnt FROM enroll
    WHERE e_year = nYear AND e_semester = nSemester 
            AND c_id = sCourseId AND c_unit = nCourseIdNo;
    IF (nCnt >= nTeachMax) THEN
        RAISE too_many_students;
    END IF;


    /* ���� ó�� 4 : ��û�� ����� �ð� �ߺ� ����  */
    SELECT t_day1, t_time1, NVL(t_day2,-2), NVL(t_time2,-2) INTO r_day1, r_time1, r_day2, r_time2 FROM teach
    WHERE c_id = sCourseId AND c_unit = nCourseIdNo AND 
	t_semester = nSemester AND t_year = nYear;
    
    SELECT COUNT(*) INTO nCnt
    FROM
    (
	SELECT t.t_day1 as day, t.t_time1 as time
    	FROM enroll e, teach t
    	WHERE e.s_id = sStudentId AND e.e_year = nYear AND e.e_semester = nSemester AND e.c_id=t.c_id AND e.c_unit = t.c_unit
    	UNION
    	SELECT NVL(t.t_day2,-1), NVL(t.t_time2,-1)
    	FROM enroll e, teach t
    	WHERE e.s_id = sStudentId AND e.e_year = nYear AND e.e_semester = nSemester AND e.c_id=t.c_id AND e.c_unit = t.c_unit
    )
    WHERE day=r_day1 and time = r_time1 or day=r_day2 and time=r_time2;

    IF (nCnt > 0) THEN
        RAISE duplicate_time;
    END IF;



    /* ���� ��û ���. ������� �Դٴ� ���� ���� ��Ȳ�� �ɸ��� �ʾҴٴ� �� */
    SELECT CONCAT('00', nCourseIdNo) INTO final_c_unit FROM DUAL;
    INSERT INTO enroll(S_ID,C_ID,C_UNIT,E_YEAR,E_SEMESTER)
    VALUES (sStudentId, sCourseId, final_c_unit, nYear, nSemester);

    COMMIT;
    result := '������û ����� �Ϸ�Ǿ����ϴ�.';

EXCEPTION
    WHEN too_many_sumCourseUnit THEN
        result := '�ִ������� �ʰ��Ͽ����ϴ�';
    WHEN too_many_courses THEN
        result := '�̹� ��ϵ� ������ ��û�Ͽ����ϴ�';
    WHEN too_many_students THEN
        result := '������û �ο��� �ʰ��Ǿ� ����� �Ұ����մϴ�';
    WHEN duplicate_time THEN
        result := '�̹� ��ϵ� ���� �� �ߺ��Ǵ� �ð��� �����մϴ�';
    WHEN OTHERS THEN
        ROLLBACK;
        result := SQLERRM(SQLCODE);
END;
/