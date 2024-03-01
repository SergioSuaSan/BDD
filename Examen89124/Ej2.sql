select distinct oe.oficio "NUMERO DE OFICIO" , count(oe.empleado) cuantos from Oficioempleado oe
where oe.oficio in (select  oe.oficio 
                    from Oficioempleado oe
                    where oe.empleado in (select e.numemp from empleado e
                                            where edad>40))
group by oe.oficio;