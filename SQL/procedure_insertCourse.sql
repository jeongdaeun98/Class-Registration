create or replace procedure insertCourse
    (cId in varchar2, cName in varchar2, cUnit in varchar2,cCredit in number,
    cType in number, cMajor in varchar2)
    is
    same_course_unit_error exception;
    incorrect_unit_error exception;
    sameCourseNum number;
    cunitNum number;
    begin

    select count(*) as querynum
    into sameCourseNum
    from course
    where c_unit = cUnit and c_name = cName;

    if sameCourseNum > 0 then
        raise same_course_unit_error;
    end if;
    if(cUnit != '001') then
        select count(*)
        into cunitNum
        from course
        where c_unit = to_char((to_number(cUnit) -1),'999');
    end if;

    if cunitNum < 1 then
        raise incorrect_unit_error;
    end if;

    insert into course values (cId,cName,cUnit,cCredit,cType,cMajor);
    commit;

    exception
    when same_course_unit_error then
        RAISE_APPLICATION_ERROR(-20011, '현존하는 데이터이므로 확인 바람');
    when incorrect_unit_error then
        RAISE_APPLICATION_ERROR(-20012,'분반이 잘못되었음'); 
end;
/
