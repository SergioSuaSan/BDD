select a.alojamiento, count(o.oficio) cuantos
from Alojamiento a left join Empleado e 
on a.numaloj = e.alojamiento left join Oficioempleado oe
on e.numemp = oe.empleado left join Oficio o 
on oe.oficio= o.numoficio and
upper(trim(o.oficio)) = 'HERRERO'
group by a.alojamiento 

