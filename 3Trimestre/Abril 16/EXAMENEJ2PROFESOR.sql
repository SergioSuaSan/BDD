DECLARE
    v_empleadosMAX pls_integer;
    v_empleados pls_integer;
    v_alojamiento Alojamiento%rowtype;
    CURSOR C_alojamiento is
        select * 
        from alojamiento
        where upper(trim(alojamiento)) != 'ROSE HILL'
        order by alojamiento;
    TYPE t_strings is table of Alojamiento.alojamiento%type index by pls_integer;
    v_strings t_strings;
        
BEGIN
    v_empleadosMAX := 0;
    OPEN c_Alojamiento;
    LOOP
        Fetch c_Alojamiento into v_Alojamiento;
        Exit when c_alojamiento%Notfound;
        select count(*) cuantos into v_empleados
        from empleado
        where alojamiento = v_alojamiento.numaloj;
        --si coincide con el rey de l amontaña añado;
        if v_empleados = v_empleadosMAX then
            v_strings (v_strings.count+1):= v_alojamiento.alojamiento;
        end if;
        if v_empleados >v_empleadosMAX then
            v_empleadosMAX := v_empleados;
            v_strings.delete;
            v_strings(1) := v_alojamiento.alojamiento;
        end if;
        
        dbms_output.put_line(v_alojamiento.alojamiento||    ' tiene ' || v_empleados|| ' empleados');
    END LOOP;
    CLOSE c_alojamiento;
    --Ya se que alojamiento tiene más empleados
    dbms_output.put_line('Max empleados '|| v_empleadosMax);
    dbms_output.put_line('He encontrado '|| v_strings.count|| ' Alojamientos con esos empleados');
    for V_i in 1..v_strings.count loop
        dbms_output.put_line(v_strings(v_i));
    end loop;
END;
/