Create table Inventario (
	id_inventario int primary key,
    fecha_registro date,
    cantidad int,
    id_producto int, 
    foreign key(id_producto) references Producto(id_producto)
)