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
    DBMS_OUTPUT.put_line(sStudentId || '님이 과목번호 ' || sCourseId || ', 분반 ' ||
                            nCourseIdNo || '의 수강 등록을 요청하였습니다.');

    /* 년도, 학기 알아내기 */
    nYear := Date2EnrollYear(SYSDATE);
    nSemester := Date2EnrollSemester(SYSDATE);

    /* 에러 처리 1 : 최대학점 초과여부 */
    SELECT SUM(t.t_personnel) INTO nSumCourseUnit FROM   teach t, enroll e
    WHERE  e.s_id = sStudentId AND e.e_year = nYear AND e.e_semester = nSemester
             AND  e.c_id = t.c_id AND e.c_unit = t.c_unit;

    SELECT t_personnel INTO nCourseUnit FROM teach 
    WHERE c_id = sCourseId AND c_unit = nCourseIdNo AND t_year = nYear AND t_semester = nSemester;

    IF (nSumCourseUnit + nCourseUnit > 18) THEN
        RAISE too_many_sumCourseUnit;   --사용자 정의 예외
    END IF;

    /* 에러 처리 2 : 동일한 과목 신청 여부 */
    SELECT COUNT(*) INTO nCnt FROM enroll
    WHERE s_id = sStudentId AND c_id = sCourseId;
    IF (nCnt > 0) THEN
        RAISE too_many_courses;
    END IF;

    /* 에러 처리 3 : 수강신청 인원 초과 여부 */
    SELECT t_personnel INTO nTeachMax FROM teach
    WHERE t_year = nYear AND t_semester = nSemester AND c_id = sCourseId AND c_unit= nCourseIdNo;
    SELECT COUNT(*) INTO nCnt FROM enroll
    WHERE e_year = nYear AND e_semester = nSemester 
            AND c_id = sCourseId AND c_unit = nCourseIdNo;
    IF (nCnt >= nTeachMax) THEN
        RAISE too_many_students;
    END IF;


    /* 에러 처리 4 : 신청한 과목들 시간 중복 여부  */
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



    /* 수강 신청 등록. 여기까지 왔다는 것은 예외 상황에 걸리지 않았다는 것 */
    SELECT CONCAT('00', nCourseIdNo) INTO final_c_unit FROM DUAL;
    INSERT INTO enroll(S_ID,C_ID,C_UNIT,E_YEAR,E_SEMESTER)
    VALUES (sStudentId, sCourseId, final_c_unit, nYear, nSemester);

    COMMIT;
    result := '수강신청 등록이 완료되었습니다.';

EXCEPTION
    WHEN too_many_sumCourseUnit THEN
        result := '최대학점을 초과하였습니다';
    WHEN too_many_courses THEN
        result := '이미 등록된 과목을 신청하였습니다';
    WHEN too_many_students THEN
        result := '수강신청 인원이 초과되어 등록이 불가능합니다';
    WHEN duplicate_time THEN
        result := '이미 등록된 과목 중 중복되는 시간이 존재합니다';
    WHEN OTHERS THEN
        ROLLBACK;
        result := SQLERRM(SQLCODE);
END;
/