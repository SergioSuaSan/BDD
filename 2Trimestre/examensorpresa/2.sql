--Usando la tabla DetallePedido, calcular el total a pagar para el pedido no 605
select sum(precioactual*cantidad) from DetallePedido 
where numpedido =605