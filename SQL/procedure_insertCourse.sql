create or replace procedure insertCourse
    (cId in varchar2, cName in varchar2, cUnit in varchar2,cCredit in number,
    cType in number, cMajor in varchar2)
    is
    same_course_unit_error exception;
    vquerynum number;
    begin

    select count(*) as querynum
    into vquerynum
    from course
    where c_unit = cUnit and c_id = cId;

    if vquerynum > 0 then
        raise same_course_unit_error;
    end if;

    insert into course values (cId,cName,cUnit,cCredit,cType,cMajor);
    commit;

    exception
    when same_course_unit_error then
        RAISE_APPLICATION_ERROR(-20011, '현존하는 데이터이므로 확인 바람'); 
end;
/