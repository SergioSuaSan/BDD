DECLARE
    v_num number;
Begin
    begin 
        Execute immediate 'drop table kk';
    end;
    
    Begin
        Execute immediate 'create table kk (col1 number(3))';
        Execute immediate ' insert into kk values (3)';
    end;
    
    Begin
        Execute immediate ' select count(*) from kk' into v_num;
    end;
    
    dbms_output.put_line(v_num);
    
end;



