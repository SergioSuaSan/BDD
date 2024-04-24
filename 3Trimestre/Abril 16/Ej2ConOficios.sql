DECLARE
    v_empleadosMAX pls_integer;
    v_empleados pls_integer;
    v_oficio Oficio%rowtype;
    CURSOR C_Oficio is
        select * 
        from Oficio
        where upper(trim(oficio)) != 'HERRERO'
        order by oficio;
    TYPE t_strings is table of Oficio.oficio%type index by pls_integer;
    v_strings t_strings;
        
BEGIN
    v_empleadosMAX := 0;
    OPEN c_Oficio;
    LOOP
        Fetch c_Oficio into v_Oficio;
        Exit when c_Oficio%Notfound;
        select count(*) cuantos into v_empleados
        from Oficioempleado oe
        where oe.oficio = v_Oficio.numoficio;
        --si coincide con el rey de l amontaña añado;
        if v_empleados = v_empleadosMAX then
            v_strings (v_strings.count+1):= v_Oficio.Oficio;
        end if;
        if v_empleados >v_empleadosMAX then
            v_empleadosMAX := v_empleados;
            v_strings.delete;
            v_strings(1) := v_Oficio.Oficio;
        end if;
        
        dbms_output.put_line(v_Oficio.Oficio||    ' tiene ' || v_empleados|| ' empleados');
    END LOOP;
    CLOSE c_Oficio;
    --Ya se que alojamiento tiene más empleados
    dbms_output.put_line('Max empleados '|| v_empleadosMax);
    dbms_output.put_line('He encontrado '|| v_strings.count|| ' Alojamientos con esos empleados');
    for V_i in 1..v_strings.count loop
        dbms_output.put_line(v_strings(v_i));
    end loop;
END;
/