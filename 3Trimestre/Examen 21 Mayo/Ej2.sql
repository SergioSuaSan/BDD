create or replace trigger Alojamiento_NoNull_BI
before insert on empleado
for each row
when (new.alojamiento is null)
Declare
    v_aloj Empleado.alojamiento%type;
Begin
    with cte as (select count (numemp) cuantos, e.alojamiento alojamiento from Empleado e
                group by alojamiento
                order by cuantos)

                select alojamiento into v_aloj from cte
                where cuantos = (select min(cuantos) from cte);
    :new.alojamiento := v_aloj;
                        

End;