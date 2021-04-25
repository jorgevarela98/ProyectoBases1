Create table Producto (
	id_producto int primary key,
    name varchar(100),
    descripcion varchar(200),
    precio int,
    id_empleado int, 
    foreign key(id_empleado) references Empleado(id_empleado)
)