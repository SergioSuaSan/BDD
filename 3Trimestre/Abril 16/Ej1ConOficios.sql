DECLARE
    v_oficio Oficio%rowtype;
    --variable del acoplamiento utilizada en la consulta
    CURSOR c_oficio IS 
        select *
        from Oficio;
 --       WHERE distancia < 11;
    PROCEDURE print (p_Oficio Oficio%rowtype) is
    BEGIN
        dbms_output.put_line(p_Oficio.numoficio);
        dbms_output.put_line(p_Oficio.oficio);
    END;
BEGIN
    OPEN C_Oficio;
    LOOP
        FETCH c_Oficio into v_oficio;
        EXIT WHEN c_Oficio%NOTFOUND;
        print (v_oficio);
    END LOOP;
    CLOSE C_oficio;
END;
/