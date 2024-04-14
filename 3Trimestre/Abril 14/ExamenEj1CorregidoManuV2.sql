--No he conseguido sacarlo, voy a comentar lo que creo entender y lo que no para ver qué puntos necesito mejorar o comprender
DECLARE
    --Pides que usemos un registro
--    v_registro Alojamiento%rowtype;
    type t_registro is record (
    v_numaloj Alojamiento.numaloj%type,
    v_alojamiento Alojamiento.alojamiento%type
    );
    v_registro t_registro;
  
    v_distanciamax Alojamiento.distancia%type;
  CURSOR c_Alojamiento IS
    SELECT numaloj,alojamiento
    FROM Alojamiento
    WHERE distancia < v_distanciamax
    order by distancia desc;
    
    --El procedure no lo entiendo bien, he cogido el de los apuntes y he cambiado los datos por los de mi ejercicio, pero no entiendo por qué exige un
    -- %type en v_registro, la verdad. Sin embargo, al ponerlo parece que no da error si pondo la declaración en una hoja nueva.
  PROCEDURE Print(P_registro in t_registro) IS
    Begin
    dbms_output.put_line(P_registro.v_numaloj||', '|| P_registro.v_alojamiento);
    END Print;
BEGIN
    --Inicializamos la distancia
  v_distanciamax:=11;
  --Abrimos el cursor, por lo que deberíamos tener acceso al select que lo compone.
  OPEN c_Alojamiento;
  LOOP
    FETCH c_Alojamiento INTO v_registro;
    EXIT WHEN c_Alojamiento%NOTFOUND;
    print(v_registro);
  END LOOP;
  -- Liberar los recursos usados por la consulta
  CLOSE c_Alojamiento;
END;
/