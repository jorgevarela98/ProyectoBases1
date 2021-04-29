Create table Inventario (
	id_inventario int primary key,
    fecha_registro date,
    cantidad int,
    id_Producto_Proveedor int, 
    foreign key(id_producto_proveedor) references Producto_Proveedor(id_producto_proveedor)
);