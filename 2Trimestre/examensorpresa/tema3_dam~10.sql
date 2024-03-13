
select a.alojamiento from Alojamiento a, Empleado e, Oficioempleado oe, Oficio o 
where a.numaloj= e.alojamiento and
e.numemp=oe.empleado and
oe.oficio = o.numoficio and
o.oficio ='HERRERO'
union

select a.alojamiento from Alojamiento a, Empleado e
where a.numaloj= e.alojamiento and
upper(trim(e.nombre)) like 'P%'