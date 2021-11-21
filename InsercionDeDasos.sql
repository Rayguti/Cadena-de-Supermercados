
insert into Supermercado(nombre,PaginaWeb) values ('PageMenos','PageMenos.com');
insert into Sucursal(idSupermercado) values (1);
insert into DireccionSucursal(ciudad,pais,calle,idSucursal) values ('Cartago','Costa Rica','Calle N 11',1);
insert into Provedor(nombre,idSucursal) values ('Helados Santa Clara',1);
insert into Producto(idProvedor,nombre,categoria,precio) values (1,'Helado Chocolate','Helados',1);
insert into Producto(idProvedor,nombre,categoria,precio) values (1,'Helado Vanilla','Helados',1);
insert into Producto(idProvedor,nombre,categoria,precio) values (1,'Helado Fresa','Helados',1);
insert into Exhibidor(fechaCreacion,fechaExpiracion,idProducto,idSucursal) values ('11-08-2021','10-01-2022',1,1);
insert into Exhibidor(fechaCreacion,fechaExpiracion,idProducto,idSucursal) values ('11-08-2021','10-01-2022',2,1);
insert into Exhibidor(fechaCreacion,fechaExpiracion,idProducto,idSucursal) values ('11-08-2021','10-01-2022',3,1);
insert into Existencias(maximo,minimo,cantidadActual,idProducto,idSucursal) values (30,11,15,1,1);
insert into Existencias(maximo,minimo,cantidadActual,idProducto,idSucursal) values (30,11,15,2,1);
insert into Existencias(maximo,minimo,cantidadActual,idProducto,idSucursal) values (30,11,15,3,1);
insert into Cliente(nombre,idCliente) values ('Raul Gutierrez',11780616);
insert into Cliente(nombre,idCliente) values ('Juan Gonzales',11606910);
insert into DireccionCliente(calle,ciudad,pais,idCliente) values ('Cartago','Costa Rica','Calle N 08',11780616);
insert into DireccionCliente(calle,ciudad,pais,idCliente) values ('Cartago','Costa Rica','Calle N 10',11606910);
insert into Telefonos(Telefono) values (87019911);
insert into Telefonos(Telefono) values (76022562);
insert into SucursalXProvedor(portanjeDeGanancia,idProvedor,idSucursal) values (1.1,1,1);
insert into Empleado(idSucursal,nombre,salario,tipo) values (1,'Roberto Gomez',400000,'Facturador');
insert into Empleado(idSucursal,nombre,salario,tipo) values (1,'Mauricio Alvarez',300000,'Carnicero');


/*Estos datos fueron agragados en una segunda prueba
insert into Supermercado(nombre,PaginaWeb) values ('SuperMas','SuperMas.com');

insert into Sucursal(idSupermercado) values (2);

insert into DireccionSucursal(ciudad,pais,calle,idSucursal) values ('San Jose','Costa Rica','Calle N 11',2);

insert into Provedor(nombre,idSucursal) values ('Cereales Marco',2);

insert into Producto(idProvedor,nombre,categoria,precio) values (2,'Cereal de Avena','Cereales',4);

insert into Exhibidor(fechaCreacion,fechaExpiracion,idProducto,idSucursal) values ('11-08-2021','10-01-2022',4,2);

insert into Existencias(maximo,minimo,cantidadActual,idProducto,idSucursal) values (30,11,16,4,2);

insert into Cliente(nombre,idCliente) values ('Juan Alvarez',11380516);

insert into DireccionCliente(calle,ciudad,pais,idCliente) values ('San Jose','Costa Rica','Calle N 08',11380516);

insert into Telefonos(Telefono,idCLiente) values (70348312,11380516);

insert into SucursalXProvedor(portanjeDeGanancia,idProvedor,idSucursal) values (1.3,2,2);

insert into Empleado(idSucursal,nombre,salario,tipo) values (2,'Roberto Gomez',400000,'Facturador'); --FACTURADOR

insert into Empleado(idSucursal,nombre,salario,tipo) values (2,'Mauricio Alvarez',300000,'Carnicero');--OTRO

*/



--select * from Supermercado;
--select * from Sucursal;
--select * from DireccionSucursal
--select * from Provedor
--select * from Producto

--borra todo en la tabla XD

--delete from Producto;
--delete from Provedor;
--delete from DireccionSucursal;
--delete from Sucursal;
--delete from Supermercado;


--select * from Supermercado;

--exec pago_de_cliente 11780616,1,1,2,'11-15-2021','Tarjeta';
--exec pago_de_cliente 11606910,2,1,2,'11-15-2021','Tarjeta';
--exec pago_de_cliente 11606910,3,1,2,'11-15-2021','Tarjeta';
--exec pago_de_cliente 11780616,1,1,2,'11-15-2021','Tarjeta';
--exec pago_de_cliente 11780616,2,1,2,'11-15-2021','Tarjeta';
--exec pago_de_cliente 11780616,3,1,2,'11-15-2021','Tarjeta';


/*exec pago_de_cliente 11780616,1,1,2,'11-15-2021','Tarjeta';
exec pago_de_cliente 11780616,2,1,2,'11-15-2021','Tarjeta';
exec pago_de_cliente 11780616,3,1,2,'11-15-2021','Tarjeta';
select * from Compra;*/
