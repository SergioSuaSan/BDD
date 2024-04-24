DECLARE
    v_oficio Oficio%rowtype;
    v_oficioempleado Oficioempleado%rowtype;

    Cursor C_oficio is
        select *
        from Oficio
        order by oficio asc;
        
    Cursor C_Oficioempleado (p_oficio Oficioempleado.oficio%type) is
        select *
        from oficioempleado
        where oficio = p_oficio
        order by empleado desc;

BEGIN
    OPEN C_oficio;
        Loop
            Fetch c_oficio into v_oficio;
            Exit when c_oficio%Notfound;
            dbms_output.put_line('Oficio  '||v_oficio.oficio);
            OPEN C_oficioempleado (v_oficio.numoficio);
                Loop
                    Fetch c_oficioempleado into v_oficioempleado;
                    Exit when c_oficioempleado%notfound;
                    dbms_output.put_line(chr(9)||'Empleado  '||v_oficioempleado.empleado);
                End loop;
            CLOSE C_oficioempleado;
        End loop;
    CLOSE C_oficio;
    
END;
/