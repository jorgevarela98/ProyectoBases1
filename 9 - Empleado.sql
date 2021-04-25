Create table Empleado (
	id_empleado int primary key,
    name varchar(100),
    telefono varchar(20),
    id_area int, 
    salario int,
    foreign key(id_area) references Area (id_area),
    id_sucursal varchar(10), 
    foreign key(id_sucursal) references Sucursal(id_sucursal)
)