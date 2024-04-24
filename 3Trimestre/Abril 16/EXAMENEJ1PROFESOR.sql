DECLARE
    v_alojamiento Alojamiento%rowtype;
    --variable del acoplamiento utilizada en la consulta
    CURSOR c_alojamiento IS 
        select *
        from Alojamiento
        WHERE distancia < 11;
    PROCEDURE print (p_alojamiento Alojamiento%rowtype) is
    BEGIN
        dbms_output.put_line(p_Alojamiento.numaloj);
        dbms_output.put_line(p_Alojamiento.alojamiento);
    END;
BEGIN
    OPEN C_Alojamiento;
    LOOP
        FETCH c_Alojamiento into v_alojamiento;
        EXIT WHEN c_alojamiento%NOTFOUND;
        print (v_alojamiento);
    END LOOP;
    CLOSE C_Alojamiento;
END;
/