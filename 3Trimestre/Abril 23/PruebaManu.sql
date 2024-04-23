DECLARE
    v_empleado Empleado%rowtype;
    v_Alojamiento Alojamiento%rowtype;  
    v_oficio Oficio%rowtype;
    
    Cursor c_empleado is
        select *
        from Empleado
        order by nombre;
        
    Cursor c_alojamiento (p_alojamiento Empleado.alojamiento%type )is
        select *
        from Alojamiento
        where numaloj = p_alojamiento;
        
    Cursor c_oficio (p_numemp Empleado.numemp%type) is
        select *
        from oficio o
        where o.numoficio = (select oe.oficio 
                            from Oficioempleado oe
                            where oe.empleado =4);
        
BEGIN
    OPEN c_empleado;
        LOOP
            Fetch c_empleado into v_empleado;
            Exit when c_empleado%Notfound;
            dbms_output.put_line(v_empleado.nombre);
            if v_empleado.alojamiento is not null then
                OPEN c_alojamiento(v_empleado.alojamiento);
                    Fetch c_alojamiento into v_alojamiento;
                    Exit when c_alojamiento%Notfound;
                    dbms_output.put_line(chr(9)||v_alojamiento.alojamiento);
                CLOSE c_alojamiento;
            else  dbms_output.put_line(chr(9)||'Sin alojamiento');
            end if;
            
            OPEN c_oficio(v_empleado.numemp);
                LOOP
                    Fetch c_oficio into v_oficio.oficio;
                    Exit when c_oficio%Notfound;
                    dbms_output.put_line(chr(9)*2||v_oficio.oficio);
                END LOOP;
            CLOSE c_oficio;
        
        
        END LOOP;
    CLOSE c_empleado;
    
    
END;
/