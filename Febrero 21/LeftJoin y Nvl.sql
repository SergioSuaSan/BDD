select e.nombre, nvl(oe.oficio,0)
from Empleado e left join Oficioempleado oe on oe.empleado = e.numemp
