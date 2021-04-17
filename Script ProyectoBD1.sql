use proyectoBD1;

Create table Gerente (
	id_gerente int primary key,
    name varchar(100),
    telefono varchar(15),
    email varchar(100)
)

Create table Sucursal (
	id_sucursal varchar(10) primary key,
    departamento varchar(100),
    telefono varchar(20),
    id_gerente int, 
    foreign key(id_gerente) references Gerente(id_gerente)
)

Create table Jefe (
	id_jefe int primary key,
    name varchar(100),
    telefono varchar(20),
    email varchar(100)
)

Create table Area (
	id_area int primary key,
    name varchar(100),
    sueldo_base int,
    id_jefe int, 
    foreign key(id_jefe) references Jefe(id_jefe)
)

Create table Empleado (
	id_empleado int primary key,
    name varchar(100),
    telefono varchar(20),
    id_area int, 
    foreign key(id_area) references Area (id_area),
    id_sucursal varchar(10), 
    foreign key(id_sucursal) references Sucursal(id_sucursal)
)

Create table Proveedor (
	id_proveedor int primary key,
    name varchar(100),
    telefono varchar(20),
    email varchar(100), 
    direccion varchar (150)
)

Create table Producto (
	id_producto int primary key,
    name varchar(100),
    descripcion varchar(200),
    precio int,
    id_empleado int, 
    foreign key(id_empleado) references Empleado(id_empleado)
)

 Create table Producto_Proveedor(
	id_producto int, 
    id_proveedor int,
	primary key (id_producto, id_proveedor),
	foreign key (id_producto) references Producto(id_producto),
	foreign key (id_proveedor) references Proveedor(id_proveedor)
)    

Create table Inventario (
	id_inventario int primary key,
    fecha_registro date,
    cantidad int,
    id_producto int, 
    foreign key(id_producto) references Producto(id_producto)
)

select * from Tabla