DECLARE
/* Comienzo de la sección declarativa */


BEGIN /* Comienzo de la sección ejecutable */

    for  v_i in 1..10 loop
       if mod(v_i,2) = 0 then
            DBMS_OUTPUT.PUT_LINE(v_i);
        end if;
    end loop;

--EXCEPTION /* Comienzo de la sección de manejo de excepciones */

END;
/