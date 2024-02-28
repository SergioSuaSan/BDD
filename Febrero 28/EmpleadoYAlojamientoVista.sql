create or replace view EmpleadoYAlojamiento as
select e.nombre EMPLEADO ,nvl(a.alojamiento,'Sin alojamiento') ALOJAMIENTO 
from Empleado e left outer join Alojamiento a
on e.alojamiento = a.numaloj;