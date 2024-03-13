--Usando la tabla DetallePedido, mostrar el número de pedido con un mayor número de líneas de detalle.

with cte as (
            select numpedido, (count(lineadetalle)) cuantas, 
            rank() over (order by count(lineadetalle) desc) ranking
            from Detallepedido
            group by numpedido
            )

select numpedido,cuantas from cte
where ranking = 1
