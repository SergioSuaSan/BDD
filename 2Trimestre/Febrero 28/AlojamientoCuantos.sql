create or replace view AlojamientoCuantos as
select a.alojamiento, count(*) cuantos
from Empleado e join Alojamiento a on e.alojamiento=a.numaloj
group by a.alojamiento