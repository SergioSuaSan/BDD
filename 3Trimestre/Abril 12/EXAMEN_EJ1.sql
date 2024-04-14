/*
"Pg 51 Cursores
Explicar concepto de area de contexto, cursor es un puntero o referencia al area de contexto.
El programa de la pag 52 está recodificado para recorrer la tabla Alojamiento para aquellos con distancia menor que el valor cargado en la variable de acoplamiento v_distanciamax.
Puedes encontrar el programa en Drive con el nombre cursorAlojamiento.sql
Una vez que ejecutes el programa se pide rehacerlo con los siguientes cambios:
- fetch guardará los datos en un registro de tipo rowtype en vez de hacerlo en campos sueltos
- Usará un procedimiento para mostar cada registro con los datos de la fila obtenida
ESTÁ PROHIBIDO USAR DBMS_OUTPUT, HAY QUE USAR EL PROCEDIMIENTO PRINT: ESTÁN EN LOS APUNTES
*/
DECLARE
    
    type t_registro is table of Alojamiento%rowtype;
    v_registro t_registro;  
    v_distanciamax Alojamiento.distancia%type;
  CURSOR c_Alojamiento IS
    SELECT numaloj,alojamiento
    FROM Alojamiento
    WHERE distancia < v_distanciamax
    order by distancia desc;
    
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
  -- Identificar las filas del conjunto activo y preparar el
  -- procesamiento posterior de datos
  v_distanciamax:=11;
  OPEN c_Alojamiento;
  LOOP
    -- Recuperar cada fila del conjunto activo y almacenarlas en
    -- variables PL/SQL
    -- MI: Si no hay más filas no carga nada
    FETCH c_Alojamiento INTO v_registro;
    -- Si no hay más filas salir de bucle
    EXIT WHEN c_Alojamiento%NOTFOUND;
    print(v_registro);
  END LOOP;
  -- Liberar los recursos usados por la consulta
  CLOSE c_Alojamiento;
END;
/