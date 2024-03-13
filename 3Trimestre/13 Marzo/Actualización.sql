update Empleado2

set sueldo =
(select max(sueldo) from Empleado e
where  e.numemp in (select e.numemp from Empleado e, OficioEmpleado oe, Oficio o
                    where e.numemp = oe.empleado
                    and oe.oficio = o.numoficio 
                    and upper(trim(o.oficio)) = upper(trim('HERRERO')) ))

where numemp in (
                select e.numemp from Empleado e, OficioEmpleado oe, Oficio o
                where e.numemp = oe.empleado
                and oe.oficio = o.numoficio 
                and upper(trim(o.oficio)) = upper(trim('HERRERO'))                
                )