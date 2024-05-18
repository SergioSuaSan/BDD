/*
(5 puntos) Crea un disparador que al insertar un nuevo oficio a un empleado lo catalogue
como “EXCELENTE” si ya tuviera 2 oficios o más creados antes de crear éste.
Tendrás que demostrar en la corrección que funciona
*/
CREATE OR REPLACE TRIGGER OficioEmpleado_trigger
BEFORE  INSERT  ON OFICIOEmpleado
FOR EACH ROW
    declare
    v_num number;
    BEGIN
       select count(oficio) into v_num from oficioempleado
       where empleado = :new.empleado;
       
       if v_num >= 2 then     
 --      dbms_output.put_line('EXCELENTE');
        :new.calificacion := 'EXCELENTE';
        end if;
    END;
