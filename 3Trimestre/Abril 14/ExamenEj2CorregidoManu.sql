DECLARE
    type t_registro is record (
    v_numaloj Alojamiento.numaloj%type,
    v_alojamiento Alojamiento.alojamiento%type
    );
    v_registro t_registro;
    v_contador Alojamiento.numaloj%type;
    V_mayor pls_integer;
    
    type t_nombre is table of Alojamiento.alojamiento%type;
    v_nombre t_nombre;
    
 
  CURSOR c_Alojamiento IS
    SELECT numaloj,alojamiento
    FROM Alojamiento;

  PROCEDURE Print(P_registro in t_registro) IS
    Begin
    dbms_output.put_line(P_registro.v_numaloj||', '|| P_registro.v_alojamiento);
    END Print;

  PROCEDURE Contar(P_alojamiento v_registro.v_numaloj%type) IS
    BEGIN
        select count(*) into v_contador
        from  Empleado e
        where P_alojamiento=e.alojamiento
        ;
    END Contar;
  
BEGIN
    v_nombre:=t_nombre();
    v_mayor:= 0;
  OPEN c_Alojamiento;
  LOOP
    FETCH c_Alojamiento INTO v_registro;
    EXIT WHEN c_Alojamiento%NOTFOUND;
    Contar(v_registro.v_numaloj);
        if v_mayor< v_contador then
            v_mayor:= v_contador;
            v_nombre:=t_nombre(null);
            v_nombre(1):= v_registro.v_alojamiento;
        elsif v_mayor = v_contador then
            v_nombre.extend;
            v_nombre(v_nombre.last):= v_registro.v_alojamiento;
        end if;
  END LOOP;
  dbms_output.put_line('El/los alojamiento/s llamado/s ');
  for v_i in 1..v_nombre.last loop
    dbms_output.put_line(v_nombre(v_i));
  end loop;
  dbms_output.put_line('tiene ' || v_mayor || ' empleados.');
  CLOSE c_Alojamiento;
END;
/


