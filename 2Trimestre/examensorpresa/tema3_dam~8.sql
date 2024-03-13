--Calcular cuántos empleados tienen como oficio conductor de segadora. El oficio no tiene por qué estar escrito en minúsculas

select count(oe.empleado) from OficioEmpleado oe join Oficio o 
on oe.oficio = o.numoficio and
lower(trim(o.oficio)) = 'conductor de segadora'