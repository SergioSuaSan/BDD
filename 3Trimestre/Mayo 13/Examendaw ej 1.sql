Create or replace function getEmpleado(p_id number) return Empleado%rowtype as
        v_emp Empleado%rowtype;
    begin
        select * into v_emp from Empleado e
        where e.numemp = p_id;
        return v_emp;
    Exception
        when no_data_found then
        return null;
       
    end;