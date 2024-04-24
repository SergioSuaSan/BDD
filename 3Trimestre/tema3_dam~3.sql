DECLARE
    v_detallepedido detallepedido%rowtype;
    Cursor c_detallepedido is
        select numpedido,count(lineadetalle)
        from detallepedido
        group by numpedido;
    
BEGIN
    Open c_detallepedido;
      LOOP
        FETCH c_detallepedido into v_detallepedido.numpedido, v_detallepedido.lineadetalle;
        EXIT WHEN c_detallepedido%NOTFOUND;
        dbms_output.put_line(v_detallepedido.numpedido ||'       '|| v_detallepedido.lineadetalle);
    END LOOP;
    CLOSE C_detallepedido;
END;
/