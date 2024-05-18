Declare
    v_tabla varchar2(25) := 'kk';
    v_res boolean;
    function borrarTabla (p_tabla varchar2) return boolean as
        begin
            execute immediate 'drop table '|| p_tabla;
            return true;
      Exception
        when others then
            return false;
        end;
    
Begin
    execute immediate 'create table '|| v_tabla || ' (col1 varchar2(25))';
    v_res:= borrarTabla(v_tabla);
    if v_res then
        dbms_output.put_line('conseguido');
    else
         dbms_output.put_line('fallado');
    end if;
    
End;
/