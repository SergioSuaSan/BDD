select e.nombre 
from empleado e join  oficioempleado oe on 
e.numemp=oe.empleado join oficio o on 
oe.oficio= o.numoficio 
and upper(trim(o.oficio)) = 'HERRERO';