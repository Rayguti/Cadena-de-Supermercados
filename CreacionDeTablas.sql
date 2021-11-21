if object_id ('Existencias') is not null
	drop table Existencias;
if object_id ('SucursalXProvedor') is not null
	drop table SucursalXProvedor;
if object_id ('Compra') is not null
	drop table Compra;
if object_id ('Envio') is not null
	drop table Envio;
if object_id ('Bono') is not null
	drop table Bono;
if object_id ('Exhibidor') is not null
	drop table Exhibidor;
if object_id ('Administrador') is not null
	drop table Administrador;
if object_id ('Telefonos') is not null
	drop table Telefonos;
if object_id ('DireccionSucursal') is not null
	drop table DireccionSucursal;
if object_id ('DireccionCliente') is not null
	drop table DireccionCliente;
if object_id ('Producto') is not null
	drop table Producto;
if object_id ('Provedor') is not null
	drop table Provedor;

if object_id ('Cliente') is not null
	drop table Cliente;
if object_id ('Empleado') is not null
	drop table Empleado;
if object_id ('Sucursal') is not null
	drop table Sucursal;
if object_id ('Supermercado') is not null
	drop table Supermercado;




create table Supermercado(
	idSupermercado int primary key identity(1,1) ,
	nombre varchar(20) not null,
	PaginaWeb varchar(20) not null,
);
create table Sucursal(
	idSucursal int primary key identity(1,1) ,
	idSupermercado int,
	constraint fk_Supermercado
	FOREIGN KEY (idSupermercado)
	references Supermercado
);
create table Cliente(
	idCliente int primary key not null,/*cedula*/
	nombre varchar(20) not null,
);
create table Compra(
	idCompra int primary key identity (1,1),
	fecha date not null,
	monto float not null,
	tipoPago varchar(20) not null,
	cantidad int not null,
	gananciaNeta float not null,
	idProducto int not null, --no es una clave foranea no hace falta
	idSucursal int not null,
	idCliente int not null,
	constraint fk_Sucursal7
	FOREIGN KEY (idSucursal)
	references Sucursal,
	constraint fk_Cliente2
	FOREIGN KEY (idCliente)
	references Cliente
);

create table DireccionSucursal( /*luego linkearlo con sucursal,cliente*/
	idDireccion int primary key identity (1,1) not null,
	ciudad varchar(20) not null,
	pais varchar(20) not null,
	calle varchar(20) not null,
	idSucursal int,
	constraint fk_Sucursal4
	FOREIGN KEY (idSucursal)
	references Sucursal
);

create table Empleado(
	idEmpleado int primary key identity(1,1),
	tipo varchar(20) not null,
	salario int not null,
	--ultimoBono int, --puede ser que si
	nombre varchar(20) not null,
	productosFacturados int,
	idSucursal int,
	constraint fk_Sucursal2
	FOREIGN KEY (idSucursal)
	references Sucursal
);
create table Telefonos( /*luego linkearlo con cliente*/
	idTelefono int primary key  identity(1,1),/*Este seria el telefono*/
	Telefono int not null,
	idCliente int,
	constraint fk_Cliente
	FOREIGN KEY (idCliente)
	references Cliente

);
create table DireccionCliente( /*luego linkearlo con sucursal,cliente*/
	idDireccion int primary key identity (1,1)  not null,
	ciudad varchar(20) not null,
	pais varchar(20) not null,
	calle varchar(20) not null,
	idCliente int,
	constraint fk_Cliente5
	FOREIGN KEY (idCliente)
	references Cliente
);


create table Provedor(
	idProvedor int primary key identity(1,1),
	nombre varchar(20),
	idSucursal int,
	constraint fk_Sucursal3
	FOREIGN KEY (idSucursal)
	references Sucursal
);
create table Producto(
	idProducto int primary key identity(1,1),
	categoria varchar(20) not null,
	nombre varchar(20) not null,
	precio float not null,
	idProvedor int,
	constraint fk_provedor
	FOREIGN KEY (idProvedor)
	references Provedor
);

create table Envio(
	idEnvio int primary key identity(1,1),
	coste int not null,
	idProvedor int,
	constraint fk_provedor2
	FOREIGN KEY (idProvedor)
	references Provedor
);

create table SucursalXProvedor(
	idSucursalXProvedor int primary key identity(1,1),
	portanjeDeGanancia float,--porcentaje
	idSucursal int,
	idProvedor int,
	constraint fk_Sucursal8
	FOREIGN KEY (idSucursal)
	references Sucursal,
	constraint fk_Provedor9
	FOREIGN KEY (idProvedor)
	references Provedor
);
create table Existencias(
	Existencias int primary key identity(1,1),
	maximo int not null,
	minimo int not null,
	cantidadActual int not null,
	idSucursal int,
	idProducto int,
	constraint fk_Sucursal10
	FOREIGN KEY (idSucursal)
	references Sucursal,
	constraint fk_Producto2
	FOREIGN KEY (idProducto)
	references Producto
);
create table Exhibidor(
	idExhibidor int primary key identity(1,1),
	--categoria varchar(20) not null,
	fechaCreacion date not null,
	fechaExpiracion date not null,
	impuesto float,
	descuento float,
	idSucursal int,
	idProducto int,
	constraint fk_Sucursal5
	FOREIGN KEY (idSucursal)
	references Sucursal,
	constraint fk_Producto3
	FOREIGN KEY (idProducto)
	references Producto
);

create table Administrador(
	idAdministrador int primary key identity(1,1),
	nombre varchar(20) not null,
	idSucursal int,
	constraint fk_Sucursal6
	FOREIGN KEY (idSucursal)
	references Sucursal
);
create table Bono( --conectar con el empleado
	idBono int primary key identity(1,1),
	monto int not null,
	fecha date not null,
	idEmpleado int
	constraint fk_Empleado
	FOREIGN KEY (idEmpleado)
	references Empleado

);