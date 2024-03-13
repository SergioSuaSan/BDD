/*3) Usando la tabla DetallePedido, mostrar cada número de pedido junto con la cantidad de líneas de detalle de
esos pedidos para los números de pedido >=618. Todos los pedidos tienen alguna línea de detalle (order by
1)
*/
select numpedido,count(lineadetalle) from detallepedido
where numpedido >=618 
group by numpedido
order by 1