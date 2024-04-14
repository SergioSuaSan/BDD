SELECT  e.alojamiento,count(*)
from Empleado e
where e.alojamiento in (select a.alojamiento from Empleado a
                        where edad >=40)
Group by e.alojamiento
order by 2 desc,1