DECLARE
    v_nombre Empleado.nombre%type;
    type t_Empleado is record (
    NUMEMP	NUMBER(2,0),
    NOMBRE	CHAR(25 BYTE),
    EDAD	NUMBER,
    ALOJAMIENTO	NUMBER(2,0),
    SUELDO	NUMBER(5,2)
    );
    v_Empleado t_empleado;
    v_Empleado2 empleado%rowtype;
BEGIN
    select nombre into v_nombre
    from Empleado
    where numemp = 4;
    dbms_output.put_line(v_nombre);
    select * into v_Empleado
    from Empleado
    where numemp=4;
    dbms_output.put_line(v_Empleado.nombre);
    v_Empleado2 :=v_Empleado;
    dbms_output.put_line(v_Empleado2.nombre);
END;
/