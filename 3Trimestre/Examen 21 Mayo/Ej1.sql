Declare
    v_res pls_integer;
    function  buscar_registros (p_tabla varchar2) return pls_integer is
            v_num pls_integer;
        begin
            Execute immediate 'select count(*) from '|| p_tabla into v_num;
            return v_num;
        Exception
            when others then 
            return -1;
        end;
    
Begin
    v_res := buscar_registros('Empleado');
    dbms_output.put_line(v_res);
    v_res := buscar_registros('NoEmpleados');
    dbms_output.put_line(v_res);
End;
