select o.oficio, count(oe.empleado) "NUMERO DE EMPLEADOS"
from Oficio o left join Oficioempleado oe
on oe.oficio=o.numoficio
group by o.oficio
