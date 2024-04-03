DECLARE
/* Comienzo de la sección declarativa */
v_i NUMBER;
v_MAX constant number := 10;

BEGIN /* Comienzo de la sección ejecutable */
v_i := 1;
    while  v_i <= v_MAX loop
        DBMS_OUTPUT.PUT_LINE(v_i);
        v_i := v_i + 1;
    end loop;

--EXCEPTION /* Comienzo de la sección de manejo de excepciones */

END;
/