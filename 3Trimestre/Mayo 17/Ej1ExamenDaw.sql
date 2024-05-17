Declare
    v_tabla varchar(25);
    v_boolean boolean;
    function borrartabla (p_tabla varchar2) return boolean is
        begin  
            execute immediate 'DROP TABLE '|| p_tabla;
            return true;
        Exception
            when others then
            return false;      
        end;
Begin
    v_tabla:= 'PRUEBESITA';
 --   execute immediate 'CREATE TABLE '|| v_tabla ||' (col1 VARCHAR(10))';
    v_boolean := borrartabla(v_tabla);
    if v_boolean then
        dbms_output.put_line('Conseguido');
    else
        dbms_output.put_line('Fallado');
    end if;
    
End;
/