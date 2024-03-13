select nombre from (

        select j.nombre,count(t.nombre)
        from trabajador t, trabajador j
        where t.cod_jefe =j.cod_emp
        group by j.nombre
        order by 2 desc
        fetch first 1 row only

)