create or replace procedure insertTeach
    (pId in varchar2, cId in varchar2, cUnit in varchar2, tYear in number,
    tSemester in number, tDay1 in number, tTime1 in number, tDay2 in number,
    tTime2 in number, tPerssonnel in number, tLocation in varchar2)
    is
    vqueryNum1 number;
    vqueryNum2 number;
    same_location_datetime_error exception;
    same_datetime_error exception;
    begin
    select count(*)
    into vqueryNum1
    from teach
    where t_location = tLocation and t_day1 = tDay1 and t_time1 = tTime1;
    if (vqueryNum1 > 0) then
        raise same_location_datetime_error;
    end if;

    select count(*)
    into vqueryNum2
    from teach
    where t_location = tLocation and t_day2 = tDay2 and t_time2 = tTime2;

    if(vqueryNum2 > 0) then
        raise same_location_datetime_error;
    end if;

    insert into teach values (pId, cId, cUnit, tYear, tSemester, tDay1, tTime1, tDay2,
    tTime2, tPerssonnel, tLocation);
    
    commit;

    exception
    when same_location_datetime_error then
    RAISE_APPLICATION_ERROR(-20013,'이미 동일한 시간에 동일한 장소 내 수업이 존재');
end;
/
        