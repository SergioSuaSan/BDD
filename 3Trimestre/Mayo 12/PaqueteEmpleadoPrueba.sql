/* 
 	
Punto extra para examen procedimientos y paquetes (gente trabajadora, máximo 5 integrantes, fecha presentación la del examen proc y paquete)
Explicar cómo se aplica el patrón DAO con las operaciones CRDU en el backend al programar en Java.
Las tablas (realmente las entidades) se manejan como Clases en Java y se necesita otras clases tipo DAOEmpleado etc que encapsulen las operaciones CRDU para ese empleado.
Esa clase tendrá los métodos (los nombres no tienen por qué ser éstos)
-add (Empleado e) Para añadir un empleado a la BD usando los datos del objeto empleado
-set (Empleado e) Para cambiar los valores con los pasados
-get (id) devuelve Empleado, para devolver el empleado (objeto) con ese id
-delete (Empleado e) Para borrar el empleado con ese id.
Esos métodos se pueden codificar usando la librería jdbc desde la que podemos mandar sentencias SQL al servidor de BD.
Aunque no se lo habitual, podemos programar en la base de datos un paquete que contenga los métodos CRDU sobre empleado, de tal forma que el método de la clase DAOEmpleado no tenga mas que llamar al procedimiento correspondiente en el paquete PaqueteEmpleado.
El PaqueteEmpleado tendría como procedimientos:
--add (p_e IN OUT Empleado%rowtype) -- Se modifica asignando al campo id el que le corresponda según la secuencia
--set (p_e Empleado%rowtype)
--get (id) devuelve Empleado%rowtype o podemos poner otro parámetro de tipo out
--delete (p_e Empleado%rotype)
Se pide una especificación previa del comportamiento de cada uno de los métodos en el que se describa la forma de uso y qué tiene que hacer (sin decir el cómo)
En una segunda fase se pide la implementación acompañada de unos test para ver que funciona correctamente.
Se debe tomar la decisión sobre los posibles errores si se manejan con excepciones o se integran en el propio comportamiento del método.
MUY IMPORTANTE: Lo id se deberán intentar ocultar mediante el uso de secuencias por lo que una vez creado un Empleado tendremos que "devolver" el valor asignado, una forma de hacerlo es através del mismo parámetro pasado de tipo Empleado%rowtype en plsql o de la clase Empleado en Java
*/

CREATE OR REPLACE PACKAGE PAQUETEEMPLEADOPRUEBA AS
    PROCEDURE PEADD (p_e IN OUT EmpleadoPRUEBA%rowtype); --SI NO RETORNA NADA ES UN PROCEDIMIENTO
    FUNCTION PEset (p_e IN OUT EmpleadoPRUEBA%rowtype)RETURN BOOLEAN; --UNA FUNCIÓN DEBE RETORNAR ALGO, QUE QUEREMOS MODIFICAR
    FUNCTION PEget (P_NUMEMP EMPLEADOPRUEBA.NUMEMP%TYPE) RETURN EMPLEADOPRUEBA%ROWTYPE; 
    FUNCTION PEDELETE (P_E IN OUT EMPLEADOPRUEBA%ROWTYPE) RETURN BOOLEAN;
END PAQUETEEMPLEADOPRUEBA; --HAY QUE PONER EL NOMBRE DEL PAQUETE
/

CREATE OR REPLACE PACKAGE BODY PAQUETEEMPLEADOPRUEBA AS

    PROCEDURE PEADD (P_E IN OUT EMPLEADOPRUEBA%ROWTYPE) AS
        BEGIN
            INSERT INTO EMPLEADOPRUEBA VALUES P_E;
        END PEADD;
        
    FUNCTION PESET (P_E IN OUT EMPLEADOPRUEBA%ROWTYPE) RETURN BOOLEAN AS
        BEGIN      
                UPDATE EMPLEADOPRUEBA E SET 
                    E.NOMBRE = P_E.NOMBRE,
                    E.EDAD = P_E.EDAD,
                    E.ALOJAMIENTO = P_E.ALOJAMIENTO,
                    E.SUELDO = P_E.SUELDO               
                    WHERE E.NUMEMP = P_E.NUMEMP;
                RETURN SQL%ROWCOUNT = 1;          
        END PESET;
        
     FUNCTION PEGET (P_NUMEMP EMPLEADOPRUEBA.NUMEMP%TYPE) RETURN EMPLEADOPRUEBA%ROWTYPE AS
            V_EMPLEADO EMPLEADOPRUEBA%ROWTYPE;
        BEGIN
            SELECT * INTO V_EMPLEADO FROM EMPLEADOPRUEBA E 
            WHERE E.NUMEMP = P_NUMEMP;
            RETURN V_EMPLEADO;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        END PEGET;
        
    FUNCTION PEDELETE (P_E IN OUT EMPLEADOPRUEBA%ROWTYPE)RETURN BOOLEAN AS
        BEGIN
            
            UPDATE EMPLEADOPRUEBA E SET 
                    E.ACTIVO = 0
                    WHERE E.NUMEMP = P_E.NUMEMP;
            RETURN SQL%ROWCOUNT = 1; 
        END PEDELETE;
        
END PAQUETEEMPLEADOPRUEBA;
  
      
    