DECLARE
/* Comienzo de la sección declarativa */


BEGIN /* Comienzo de la sección ejecutable */

    for  v_i in 1..10 loop
        DBMS_OUTPUT.PUT_LINE(v_i);

    end loop;

--EXCEPTION /* Comienzo de la sección de manejo de excepciones */

END;
/