DECLARE
v_alojamiento Alojamiento%rowtype;
CURSOR c_alojamiento is
    select *
    from alojamiento
    order by alojamiento;
    
v_empleado Empleado%rowtype;
CURSOR c_empleado (p_numaloj Alojamiento.numaloj%type)  is
    select *
    from Empleado
    where alojamiento = p_numaloj
    order by nombre;

BEGIN
OPEN c_Alojamiento;
LOOP
    Fetch c_alojamiento into v_alojamiento;
    exit when c_alojamiento%Notfound;
    dbms_output.put_line(v_alojamiento.alojamiento);
        
    OPEN c_empleado(v_alojamiento.numaloj);
    LOOP
        Fetch c_empleado into v_empleado;
        Exit when c_empleado%Notfound;
        dbms_output.put_line(chr(9)||v_Empleado.nombre);
    END LOOP;
    CLOSE c_empleado;
END LOOP;
CLOSE c_alojamiento;
END;
/