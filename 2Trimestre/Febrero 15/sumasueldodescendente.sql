select o.oficio,sum(e.sueldo) from oficio o join oficioempleado oe on o.numoficio=oe.oficio join empleado e on oe.empleado=e.numemp group by o.oficio
order by sum(e.sueldo) desc