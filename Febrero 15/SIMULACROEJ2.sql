select e.nombre, e.sueldo from empleado e
where sueldo > (select min(sueldo) 
                from empleado) 
and sueldo < (select max(sueldo) 
               from empleado);
                       