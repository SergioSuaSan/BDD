select e.nombre, e.numemp
from empleado e
where exists ( select * from oficioempleado oe
                where e.numemp= oe.empleado);

