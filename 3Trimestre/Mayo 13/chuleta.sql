--BASE PAQUETE Y FUNCIONES/PROCEDIMIENTOS
--declaracion
CREATE OR REPLACE PACKAGE paquete_nombre as
--Si no quieres pasar dato quita el parentesis
--PROCEDURE ? procedimiento
    --procedimiento con dato a pasar (recuerda el IN/OUT/IN OUT)
    PROCEDURE nombreProcedimiento (nombredato Empleado.numemp%type);

--FUNCTION  ? funcion
    --return con dato a pasar
    FUNCTION nombreFuncion (nombredato Empleado.numemp%type) return boolean; --return de solo el tipo de dato
    
END paquete_nombre;
/
--cuerpo del paquete
CREATE OR REPLACE PACKAGE BODY paquete_nombre as

    --PROCEDURE ? procedimiento
    --procedimiento con dato a pasar 
    PROCEDURE nombreProcedimiento (nombredato Empleado.numemp%type) as
     BEGIN
        null;--quitalo
     END nombreProcedimiento;

    --FUNCTION  ? funcion
    --return con dato a pasar
    FUNCTION nombreFuncion (nombredato Empleado.numemp%type) return boolean as
    booleano boolean;
    BEGIN
    --codigo here!
       RETURN booleano;
    END nombreFuncion;
    --return de solo el tipo de dato

END paquete_nombre;