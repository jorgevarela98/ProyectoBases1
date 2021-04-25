Create table Area (
	id_area int primary key,
    name varchar(100),
    sueldo_base int,
    id_jefe int, 
    foreign key(id_jefe) references Jefe(id_jefe)
)