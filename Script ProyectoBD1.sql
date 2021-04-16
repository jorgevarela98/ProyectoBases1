use proyectoBD1;

Create table Gerente (
	id_gerente int primary key,
    name varchar(100),
    telefono varchar(15),
    email varchar(100)
)

Create table Sucursal (
	id_sucursal int primary key,
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
    id_area int, 
    foreign key(id_area) references Area (id_area),
    id_sucursal int, 
    foreign key(id_sucursal) references Sucursal(id_sucursal)
)

Create table proveedor (
	id_proveedor int primary key,
    name varchar(100),
    telefono varchar(20),
    email varchar(100), 
    direccion varchar (150)
)

Create table producto (
	id_producto int primary key,
    name varchar(100),
    descripcion varchar(200),
    precio int
)

Create table Inventario (
	id_inventario int primary key,
    cantidad int,
    fecha_encargo date,
    fecha_entrega date,
    id_empleado int, 
    foreign key(id_empleado) references Empleado (id_empleado),
    id_producto int, 
    foreign key(id_producto) references producto (id_producto),
    id_proveedor int, 
    foreign key(id_proveedor) references proveedor (id_proveedor)
)

select * from Tabla