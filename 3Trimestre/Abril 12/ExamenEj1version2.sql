--No he conseguido sacarlo, voy a comentar lo que creo entender y lo que no para ver qué puntos necesito mejorar o comprender
DECLARE
    --Como pides que usemos un registro, he decidido crear una tabla con el tipo de Alojamiento
    type t_registro is table of Alojamiento%rowtype;
    --Esto es como v_bonoloto, hay que crear este array usando la t_registro.
    v_registro t_registro;  

    v_distanciamax Alojamiento.distancia%type;
  CURSOR c_Alojamiento IS
    SELECT numaloj,alojamiento
    FROM Alojamiento
    WHERE distancia < v_distanciamax
    order by distancia desc;
    
    --El procedure no lo entiendo bien, he cogido el de los apuntes y he cambiado los datos por los de mi ejercicio, pero no entiendo por qué exige un
    -- %type en v_registro, la verdad. Sin embargo, al ponerlo parece que no da error si pondo la declaración en una hoja nueva.
  PROCEDURE Print(t_registro IN v_registro%type) IS
         v_Index INTEGER;
    BEGIN
         v_Index := t_registro.FIRST;
         WHILE v_Index <= t_registro.LAST LOOP
         DBMS_OUTPUT.PUT( v_Index );
         v_Index := t_registro.NEXT(v_Index);
    END LOOP;
  END Print;
BEGIN
    --Inicializamos la distancia
  v_distanciamax:=11;
  --Abrimos el cursor, por lo que deberíamos tener acceso al select que lo compone.
  OPEN c_Alojamiento;
  LOOP
     /*
    Aquí es donde la fastidio, no entiendo bien la inserción con registro. He intentado muchas cosas y he dado muchas vueltas, pero 
    Esto es lo más cercano que he conseguido, he leído lo de v_registro.numaloj en los apuntes, pero creo que es cuando quieres leer un
    dato del registro, no meterlo. Pero intentaba meter simplemente v_registro y me dice que es el "tipo incorrecto" Entiendo que se refiere
    a que es un array, pero entonces, si necesito una variable propia para cada dato, no entiendo el sentido del rowtype, se convierte en el 
    ejercicio original.
    */
    FETCH c_Alojamiento INTO v_registro.numaloj, v_registro.alojamiento;
    EXIT WHEN c_Alojamiento%NOTFOUND;
    print(v_registro);
  END LOOP;
  -- Liberar los recursos usados por la consulta
  CLOSE c_Alojamiento;
END;
/