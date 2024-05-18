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


create or replace package PaqueteEmpleado as
    procedure PEadd (p_e in out Empleado%rowtype);
    function PEget (p_numemp  in  Empleado.numemp%type) return Empleado%rowtype;
    function PEset (p_e in  Empleado%rowtype) return boolean;
    function PEdelete (p_e in   Empleado%rowtype) return boolean;
end PaqueteEmpleado;
/

create or replace package body PaqueteEmpleado as
    
    procedure PEadd (p_e in out Empleado%rowtype) as
      v_numemp Empleado.numemp%type := seq_empleado_numemp.nextval;
        begin
            p_e.numemp:= v_numemp;
            Insert into Empleado
            values p_e;
        end PEadd;
        
    function PEget (p_numemp in Empleado.numemp%type) return Empleado%rowtype as
        v_e Empleado%rowtype;
        begin
            select * into v_e from Empleado e
            where e.numemp =p_numemp;
            return v_e;
        exception
            when no_data_found then
            return null;
        end PEget;
        
    function PEset (p_e in Empleado%rowtype) return boolean as
        begin
            update Empleado e set
                e.nombre = p_e.nombre,
                e.edad = p_e.edad,
                e.alojamiento = p_e.alojamiento,
                e.sueldo = p_e.sueldo;
            return sql%rowcount = 1;
        end PEset;
    
     function PEdelete (p_e in Empleado%rowtype) return boolean as
        begin
            update Empleado e set
                e.activo = 0;
            return sql%rowcount = 1;
        end PEdelete;
end PaqueteEmpleado;