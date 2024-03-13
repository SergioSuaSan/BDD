select o.oficio, avg(e.edad) from oficio o , empleado e
group by oficio;

select e.nombre,e.edad from empleado e
where e.edad is not null and
e.numemp in (select oe.empleado from oficioempleado oe)
