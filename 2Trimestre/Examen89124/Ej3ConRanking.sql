select oficio from (
select count(oe.empleado) cuantos ,oe.oficio, rank() over (order by count(*) desc) ranking
from OficioEmpleado oe
where oe.oficio in (select distinct oe.oficio from OficioEmpleado oe
                    where oe.empleado in (select e.numemp from Empleado e
                                             where edad>40))
group by oficio)
where ranking=1


