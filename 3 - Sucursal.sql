Create table Sucursal (
	id_sucursal varchar(10) primary key,
    departamento varchar(100),
    direccion varchar(200),
    telefono varchar(20),
    id_gerente int, 
    foreign key(id_gerente) references Gerente(id_gerente)
)