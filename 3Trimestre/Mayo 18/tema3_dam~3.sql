declare
    v_kk number;

BEGIN
    begin 
        EXECUTE IMMEDIATE 'DROP TABLE KK';
    exception
        when others then
        dbms_output.put_line('kok');
    end;
    
    begin
   
    EXECUTE IMMEDIATE 'CREATE TABLE KK (COL1 number(4))';
    end;
   
    EXECUTE IMMEDIATE 'insert into kk values (345)';
    select count(*) into v_kk from kk;
    execute immediate 'select count(*) from kk' into v_kk;
    dbms_output.put_line(v_kk);
    
    
        
END;
