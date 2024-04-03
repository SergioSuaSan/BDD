DECLARE
    a boolean;
    b boolean;
BEGIN
    a:= true;
    b:= false;
    if a or b then
        dbms_output.put_line('then');
    else
        dbms_output.put_line('else');
    end if;
END;
/