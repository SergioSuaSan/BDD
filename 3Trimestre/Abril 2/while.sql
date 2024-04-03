DECLARE
/* Comienzo de la sección declarativa */
v_i NUMBER;

BEGIN /* Comienzo de la sección ejecutable */
v_i := 1;
    while  v_i <= 10 loop
        DBMS_OUTPUT.PUT_LINE(v_i);
        v_i := v_i + 1;
    end loop;

--EXCEPTION /* Comienzo de la sección de manejo de excepciones */

END;
/