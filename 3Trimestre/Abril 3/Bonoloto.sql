--Obtener 6 numeros aleatorios del 1 al 49
DECLARE
    v_random pls_integer;
BEGIN
    for v_i in 1..6 loop
        v_random:= dbms_random.value(1,49);
        dbms_output.put_line(v_random);
    end loop;
END;
/