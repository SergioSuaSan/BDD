  DECLARE
    v_Alojamiento Alojamiento%rowtype;
    type t_empleado is record (
        numemp Empleado.numemp%type,
        nombre Empleado.nombre%type,
        alojamiento Empleado.alojamiento%type);
    v_empleado t_empleado; 
    v_numoficio Oficio.numoficio%type;
    v_nombreOficio Oficio.oficio%type;

    
    Cursor c_empleado is
        select e.numemp, e.nombre, e.alojamiento
        from Empleado e;
          
    Cursor c_alojamiento (p_alojamiento Empleado.alojamiento%type )is
        select *
        from Alojamiento
        where numaloj = p_alojamiento;
        
    Cursor c_oficioempleado(p_numemp Oficio.numoficio%type) is
        select oe.oficio
        from OficioEmpleado oe
        where oe.empleado = p_numemp;
        
BEGIN
    open c_empleado;
    loop
        fetch c_empleado into v_empleado;
        exit when c_empleado%notfound;
        dbms_output.put_line(v_empleado.nombre);
        if v_empleado.alojamiento is not null then
                OPEN c_alojamiento(v_empleado.alojamiento);
                    Fetch c_alojamiento into v_alojamiento;
                    Exit when c_alojamiento%Notfound;
                    dbms_output.put_line(chr(9)||v_alojamiento.alojamiento);
                CLOSE c_alojamiento;
            else  dbms_output.put_line(chr(9)||'Sin alojamiento');
            end if;
        open c_oficioempleado(v_empleado.numemp);
        loop
            fetch c_oficioempleado into v_numoficio;
            exit when c_oficioempleado%notfound;
            select o.oficio into v_nombreOficio
            from Oficio o
            where o.numoficio = v_numoficio;
            dbms_output.put_line('  ' || v_nombreOficio);
        end loop;
        if c_oficioEmpleado%rowcount < 1 then
            dbms_output.put_line('  ' || 'sin oficio');
        end if;
        close c_oficioempleado;
    end loop;
    close c_empleado;
END;