/*Actualizar 
    update Table
    set Dato = newDato
*/
/*Eliminar 
    delete from table
    wher table.id = id
*/
/*Lecturas
    select * from table   

    select * from Supermercado --Este para ver todos lo productos
	inner join Sucursal on Sucursal.idSupermercado = Supermercado.idSupermercado
	inner join Provedor on Provedor.idSucursal = Sucursal.idSucursal
	inner join Producto on Producto.idProvedor = Provedor.idProvedor
*/
    

/* Inserciones
    insert into Supermercado(nombre,PaginaWeb) values ('PageMenos','PageMenos.com');

    insert into Sucursal(idSupermercado) values (1);

    insert into DireccionSucursal(ciudad,pais,calle,idSucursal) values ('Cartago','Costa Rica','Calle N 11',1);

    insert into Provedor(nombre,idSucursal) values ('Helados Santa Clara',1);

    insert into Producto(idProvedor,nombre,categoria,precio) values (1,'Helado Chocolate','Helados',1);

    insert into Exhibidor(fechaCreacion,fechaExpiracion,idProducto,idSucursal) values ('11-08-2021','10-01-2022',1,1);

    insert into Existencias(maximo,minimo,cantidadActual,idProducto,idSucursal) values (30,11,15,3,1);

    insert into Cliente(nombre,idCliente) values ('Raul Gutierrez',11780616);

    insert into DireccionCliente(calle,ciudad,pais,idCliente) values ('Cartago','Costa Rica','Calle N 08',11780616);

    insert into Telefonos(Telefono,idCLiente) values (87019911,11780616);

    insert into SucursalXProvedor(portanjeDeGanancia,idProvedor,idSucursal) values (1.1,1,1);

    insert into Empleado(idSucursal,nombre,salario,tipo) values (1,'Roberto Gomez',400000,'Facturador'); --FACTURADOR

    insert into Empleado(idSucursal,nombre,salario,tipo) values (1,'Mauricio Alvarez',300000,'Carnicero');--OTRO
*/

/*Procedimientos



Bonos por Empleado,Pais,fecha y sucursal
    exec bonos_por_empleado 2
    exec bonos_por_pais 'Costa Rica'
    exec bonos_por_fecha '2021-11-16'
    exec bonos_por_sucursal 1

Procedimientos de estadiscas
    exec producto_mas_vendidos 1,1
    exec clientes_mas_frecuentes 1,0
    exec productos_que_expiraron 1,1

Ganancias netas de pais, fechas, sucursales y/o categoria de productos
    exec ganancias_pais 'Costa Rica'
    exec ganancias_categoria 'Helados'
    exec ganancias_fechas'2021-11-15'
    exec ganancias_sucursales 1

Obtiene los productos por provedor
    exec obtener_productos 1

Realiza una compra esta compra esta sujeta a varias condiciones
    exec pago_de_cliente 11380516,4,2,4,'11-21-2021','Tarjeta',1 --el ultimo 1 indica si hay envio, en caso de 0 no lo hay

Hace un bono a los empleados este bono esta sujeto a varias condiciones
    exec bono_a_empleados 3,4000

Estos procesos fueron agragados a ultima hora

Da los empleados que no tienen bonos,no se puede probar
    exec empleados_sin_bonos 2

Pone en descuento los productos que estan por expirar
    exec productos_en_expirar  0.2

Elimina los productos expirados 
    exec productos_expirados  
    
Rellena el strock de nuevos productos   
    exec pedido_productos 2,4,'11-21-2021','11-21-2022'

*/


