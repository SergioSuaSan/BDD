with Mecagoentodo as
(SELECT  e.alojamiento kk ,count(*)cuantos
from Empleado e
where e.alojamiento in (select a.alojamiento from Empleado a
                        where edad >=40)
Group by e.alojamiento
order by 2 desc,1)

select kk, cuantos  from Mecagoentodo
where cuantos = (select max(cuantos) from Mecagoentodo)

--PAG 47


