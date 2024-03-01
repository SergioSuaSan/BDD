with OficioCuantos  as
(select distinct oe.oficio, count(oe.empleado) cuantos from Oficioempleado oe
where oe.oficio in (select  oe.oficio 
                    from Oficioempleado oe
                    where oe.empleado in (select e.numemp from empleado e
                                            where edad>40))
group by oe.oficio)

select oc.oficio "NUMERO DE OFICIO" from Oficiocuantos oc
where oc.cuantos = (select max(oc.cuantos) from Oficiocuantos oc)
