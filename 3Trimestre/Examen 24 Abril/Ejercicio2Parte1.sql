DECLARE
    v_Empleado Empleado%rowtype;
    v_oficioempleado Oficioempleado%rowtype;
    v_ooficio Oficio.oficio%type;
    v_countempleados pls_integer;
    Cursor C_Empleado is
        select * 
        from empleado
        order by nombre desc;
        
    Cursor c_oficioempleado (p_empleado Empleado.numemp%type) is
        select *
        from Oficioempleado
        where empleado=p_empleado;
    

        

BEGIN
    OPEN C_empleado;
        Loop
            Fetch c_empleado into v_empleado;
            Exit when c_empleado%notfound;
            dbms_output.put_line('Empleado/a '||v_empleado.nombre);

        
            OPEN C_oficioempleado(v_empleado.numemp);
                Loop
               
                    Fetch c_oficioempleado into v_oficioempleado;
                    Exit when c_oficioempleado%notfound;
                    select o.oficio into v_ooficio from oficio o
                    where o.numoficio = v_oficioempleado.oficio;
                    select count(empleado)into v_countempleados from Oficioempleado
                    where oficio = v_oficioempleado.oficio;
                    dbms_output.put_line(chr(9)||'Oficio '||v_ooficio||chr(9)||'tiene '|| v_countempleados||' Empleados');
            
                end loop;            
            CLOSE C_oficioempleado;
         
        end loop;
    CLOSE C_empleado;

END;
/