


/*Bonos por Empleado,Pais,fecha y sucursal*/

create procedure bonos_por_empleado
@idEmpleado int
as
	select * from Bono
	where Bono.idEmpleado = @idEmpleado
go

create procedure bonos_por_pais
@Pais varchar(20)
as
	select Bono.idBono, Bono.monto, Bono.fecha, Bono.idEmpleado from Bono
	inner join Empleado on Bono.idEmpleado = Empleado.idEmpleado
	inner join Sucursal on Sucursal.idSucursal = Empleado.idSucursal
	inner join DireccionSucursal on Sucursal.idSucursal = DireccionSucursal.idSucursal
	where DireccionSucursal.pais = @Pais
go

create procedure bonos_por_fecha 
@fecha date
as
	select * from Bono
	where Bono.Fecha = @fecha
go

create procedure bonos_por_sucursal
@idSucursal int
as
	select Bono.idBono, Bono.monto, Bono.fecha, Bono.idEmpleado from Bono
	inner join Empleado on Bono.idEmpleado = Empleado.idEmpleado
	inner join Sucursal on Sucursal.idSucursal = Empleado.idSucursal
	where Sucursal.idSucursal = @idSucursal
go

/*Procedimientos de estadiscas*/

--Muestra los productos mas vendidos de una o de todas las sucursales
--no esta valido que solo salga de un supermercado
create procedure producto_mas_vendidos
@idSupermercado int,
@idSucursal int--si es cero muestras todos las sucursales
as
	if(@idSucursal = 0)
	begin
		select Top 3 Compra.idProducto,count( Compra.idProducto )as productosVendidos from Compra
		inner join Supermercado on Supermercado.idSupermercado = @idSupermercado
		inner join Sucursal on Sucursal.idSupermercado = Supermercado.idSupermercado
		where Supermercado.idSupermercado = @idSupermercado
		group by  Compra.idProducto
		order by  count(1) desc--order by count seria el 
	end;
	else
		select Top 3 Compra.idProducto,count( Compra.idProducto )as productosVendidos from Compra
		inner join Sucursal on Sucursal.idSucursal = @idSucursal
		inner join Supermercado on Supermercado.idSupermercado = Sucursal.idSupermercado
		where Compra.idSucursal = @idSucursal and Supermercado.idSupermercado = @idSupermercado
		group by  Compra.idProducto
		order by  count(1) desc--order by count seria el 
go

--Muestra los clientes mas frecuentes de una o de todas las sucursales
create procedure clientes_mas_frecuentes
@idSupermercado int,
@idSucursal int--si es cero muestras todos las sucursales
as
	if(@idSucursal=0)
	begin
		select Top 3 Compra.idCliente,count( Compra.idCliente )as ComprasTotales from Compra
		inner join Supermercado on Supermercado.idSupermercado = @idSupermercado
		inner join Sucursal on Sucursal.idSupermercado = Supermercado.idSupermercado
		where Supermercado.idSupermercado = @idSupermercado
		group by  Compra.idCliente
		order by  count(1)desc;--order by count seria el 
	end;
	else
		select Top 3 Compra.idCliente,count( Compra.idCliente )as ComprasTotales from Compra
		inner join Sucursal on Sucursal.idSucursal = @idSucursal
		inner join Supermercado on Supermercado.idSupermercado = Sucursal.idSupermercado
		where Compra.idSucursal = @idSucursal and Supermercado.idSupermercado = @idSupermercado
		group by  Compra.idCliente
		order by  count(1)desc;--order by count seria el 
go

--Muestra los productos que hayan expirado de una o de todas las sucursales
create procedure productos_que_expiraron
@idSupermercado int,
@idSucursal int--si es cero muestras todos las sucursales
as
	if(@idSucursal=0)
	begin
		select * from Exhibidor
		inner join Supermercado on Supermercado.idSupermercado = @idSupermercado
		inner join Sucursal on Sucursal.idSupermercado = Supermercado.idSupermercado
		where Supermercado.idSupermercado = @idSupermercado and  GETDATE() > Exhibidor.fechaExpiracion
	end;
	else
		select * from Exhibidor
		inner join Supermercado on Supermercado.idSupermercado = @idSupermercado
		inner join Sucursal on Sucursal.idSupermercado = Supermercado.idSupermercado
		where Exhibidor.idSucursal = 1 and GETDATE() > Exhibidor.fechaExpiracion and Supermercado.idSupermercado = @idSupermercado
go

--ganancias netas de pais, fechas, sucursales y/o categoria de productos
create procedure ganancias_pais
@Pais varchar(20)
as
	select DireccionSucursal.pais,sum(Compra.gananciaNeta) as GanaciasXPais from Compra--Compra.idSucursal,sum(Compra.monto) as Total 
	inner join Sucursal on Sucursal.idSucursal = Compra.idSucursal
	inner join DireccionSucursal on DireccionSucursal.idSucursal = Sucursal.idSucursal 
	where DireccionSucursal.pais= @Pais
	group by DireccionSucursal.pais
go

create procedure ganancias_fechas
@fecha date
as
	select Compra.fecha,sum(Compra.gananciaNeta) as Total from Compra
	where Compra.fecha = @fecha--mes/dia/anyo
	group by Compra.fecha
go

create procedure ganancias_sucursales
@idSucursal int
as
	select Compra.idSucursal,sum(Compra.gananciaNeta) as Total from Compra
	where Compra.idSucursal= @idSucursal
	group by Compra.idSucursal
go

create procedure ganancias_categoria
@Categoria varchar(20)
as
	select Producto.Categoria,sum(Compra.gananciaNeta) as TotalXCategoria from Compra
	inner join Producto on Producto.idProducto =Compra.idProducto
	where Producto.categoria = @Categoria
	group by Producto.categoria
go

/*Obtiene los productos por provedor*/
create procedure obtener_productos 
@idProvedor int 
as
	select * from Producto
	where Producto.idProducto = @idProvedor;
go


/*Realiza una compra esta compra esta sujeta a varias condiciones*/

create procedure pago_de_cliente
@idCliente int,
@idProducto int,
@idSucursal int,
@cantidad int,--cantidad de productos deseado
@fecha date,
@metodoDePago varchar(20),
@envio bit --el bit es tipo de dato tipo boolean, solo se puede guardar 1 o 0 
as
	--selecciona la cantidad actual del producto deseado en la sucursal deseada
	declare @gananciaNeta float;
	declare @cantidadActual int;
	set @cantidadActual = (select Existencias.cantidadActual from Existencias
		where Existencias.idSucursal = @idSucursal and Existencias.idProducto = @idProducto);
	if (@cantidad is null) and (@cantidadActual < @cantidad)
	begin
		print 'No hay cantidades sufientes del producto solicitado'
		return
	end;
	--selecciona la id del provedor del producto
	declare @idProvedor int;
	set @idProvedor = (select Producto.idProvedor from Producto
		where Producto.idProducto = @idProducto)
	declare @monto float;
	--seleccion el precio base del producto
	set @monto =(select Producto.precio from Producto 
		where Producto.idProducto = @idProducto);
	set @gananciaNeta = @monto*@cantidad; --Se guarda el valor del producto para despues sacar la ganancia neta
	--selecciona el precio que tiene que pagar por el agragado de SucursalXProvedor
	set @monto = @monto * (select SucursalXProvedor.portanjeDeGanancia from SucursalXProvedor
		where SucursalXProvedor.idProvedor = @idProvedor  and SucursalXProvedor.idSucursal = @idSucursal);
	--pregunta si hay impuestos, si es asi se los agrega
	declare @impuesto float = (select Exhibidor.impuesto from Exhibidor 
		where Exhibidor.idSucursal = @idSucursal and Exhibidor.idProducto=@idProducto)
	if (@impuesto is not null)
		set @monto = @monto + @monto *@impuesto;
	--pregunta si hay descuentos, si es asi se los agrega
	declare @descuento float = (select Exhibidor.descuento from Exhibidor 
		where Exhibidor.idSucursal = @idSucursal and Exhibidor.idProducto=@idProducto)
	if (@descuento is not null)
		set @monto = @monto * @descuento;
	if(@envio = 1)
		set @monto = @monto + @monto * 0.1;

	set @monto = @monto * @cantidad;--multiplica el monto por la cantidad de productos solicitados
	--Se pregunta si es un envio o no

	set @gananciaNeta = @monto-@gananciaNeta;-- se busca la ganancia neta de la venta
	--se hace el insert de la compra 
	insert into Compra(fecha,idCliente,idSucursal,monto,tipoPago,cantidad,idProducto,gananciaNeta) values (@fecha,@idCliente,@idSucursal,@monto,@metodoDePago,@cantidad,@idProducto,@gananciaNeta);
	--se resta la cantidad del producto comprado a la cantidad actual
	update Existencias set cantidadActual = cantidadActual-@cantidad
		where Existencias.idSucursal = @idSucursal and Existencias.idProducto = @idProducto;
go--termina el procedimiento

/*Hace un bono a los empleados este bono esta sujeto a varias condiciones*/
create procedure bono_a_empleados
@idEmpleado int,
@monto int
as
	--saca la ultima fecha que un empleado recibio un bono, puede ser null
	declare @fecha date;
	set @fecha = (select max(Bono.fecha) from Bono
		where Bono.idEmpleado = @idEmpleado)
	--saca la tipo del empleado, esto se hace para saber como se va pagar el bono
	declare @tipoEmplado varchar(20);
	set @tipoEmplado = (select Empleado.tipo from Empleado
		where Empleado.idEmpleado = @idEmpleado)
	declare @productosFacturados int;
	set @productosFacturados = (select Empleado.productosFacturados from Empleado
		where Empleado.idEmpleado = @idEmpleado)
	--pregunta si es facturador, ya que ellos tiene un bono difente
	--pregunta se se le ha dado un bono la ultima semana y si ha facturado 1000 productos
	if((upper(@tipoEmplado) = 'FACTURADOR')and (@fecha < getdate()-7) and (@productosFacturados>=1000)) or (@fecha is null)
		insert into Bono(fecha,idEmpleado,monto) values (GETDATE(),@idEmpleado,@monto)
	else if(@fecha < getdate()-30 and upper(@tipoEmplado) != 'FACTURADOR') or (@fecha is null )
		insert into Bono(fecha,idEmpleado,monto) values (GETDATE(),@idEmpleado,@monto);
go 


/* Los prodecimientos a continuacion son adicionales basados en la rubrica*/

/*Da los empleados que no tienen bonos,no se puede probar*/
create procedure empleados_sin_bonos
@idSucursal int
as
	select * from Bono
	inner join Empleado on Empleado.idEmpleado =Bono.idEmpleado
	where Empleado.idSucursal = @idSucursal and Bono.fecha < GETDATE()-7 and upper(Empleado.tipo) ='FACTURADOR';

	select * from Bono
	inner join Empleado on Empleado.idEmpleado =Bono.idEmpleado
	where Empleado.idSucursal = @idSucursal and Bono.fecha < GETDATE()-30 and upper(Empleado.tipo) !='FACTURADOR';

go
/*Productos que estan a punto de expirar este puede que no sirve*/
create procedure productos_en_expirar
@descuento float
as
	select Exhibidor.descuento from Exhibidor
	update Exhibidor set Exhibidor.descuento = @descuento
	where Exhibidor.fechaExpiracion < GETDATE()+7 and Exhibidor.fechaExpiracion < GETDATE();
go

--elimina los productos expirados 
create procedure productos_expirados
as
	declare @cantidad int;
	select Top 0 cantidadActual from Existencias
	inner join Exhibidor on Existencias.idProducto = Exhibidor.idProducto;

	update Existencias
	set Existencias.cantidadActual = Existencias.minimo
	from Existencias
	inner join Exhibidor on Existencias.idProducto = Exhibidor.idProducto
	where Exhibidor.fechaExpiracion < GETDATE();

	delete from Exhibidor
	where Exhibidor.fechaExpiracion < GETDATE();
go



--verifica cuales son lo productos con existencias al minimo
create procedure existencias_minimas
@idSucursal int
as
	select Producto.idProducto,Producto.idProvedor,Producto.categoria,Producto.nombre from Producto
	inner join Existencias on Producto.idProducto  = Existencias.idProducto
	inner join Sucursal on Sucursal.idSucursal  = Existencias.idSucursal
	where Existencias.cantidadActual <= Existencias.minimo
go

--realiza un pedido de productos
create procedure pedido_productos
@idSucursal int,
@idProducto int,
@fechaCreacion date,
@fechaExpiracion date
as
	declare @cantidadActual int;
	declare @maximo int;
	set @cantidadActual =(select sum(Existencias.cantidadActual) from Existencias
		where @idProducto = Existencias.idProducto and @idSucursal = Existencias.idSucursal );
	set @maximo=(select Top 1 Existencias.maximo from Existencias
		where @idProducto = Existencias.idProducto and @idSucursal = Existencias.idSucursal );
	if (@cantidadActual<@maximo)
	begin
		update Existencias
		set Existencias.cantidadActual = @maximo
		where @idProducto = Existencias.idProducto and @idSucursal = Existencias.idSucursal;
		update Exhibidor 
		set Exhibidor.fechaCreacion=@fechaCreacion , Exhibidor.fechaExpiracion=@fechaExpiracion
		where @idProducto = Exhibidor.idProducto and @idSucursal = Exhibidor.idSucursal;
		print 'Se actualizo el stock con exito'
		end;
	else
		print 'El Stock ya esta al maximo';
go
