--Se restan a todos los nombres, aquellos DISTINTOS  a los que tienen oficio

select e.nombre 
from Empleado e

minus

select distinct e.nombre
from Empleado e, Oficioempleado oe
where oe.empleado = e.numemp
