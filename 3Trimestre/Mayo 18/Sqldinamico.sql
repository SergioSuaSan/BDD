DECLARE
    v_num number;
    v_tabla varchar (23);
Begin
    v_tabla:= 'torito22';
    begin 
        Execute immediate 'drop table '|| v_tabla;
    exception
    when others then
     dbms_output.put_line('No se pudo borrar');
    end;
    
    Begin
        Execute immediate 'create table '||v_tabla||' (col1 number(3))';
        Execute immediate ' insert into '||v_tabla||' values (3)';
    end;
    
    Begin
        Execute immediate ' select count(*) from '||v_tabla into v_num;
    end;
    
    dbms_output.put_line(v_num);
    
end;



