Create table Producto_Proveedor(
	id_producto int, 
    id_proveedor int,
	primary key (id_producto, id_proveedor),
	foreign key (id_producto) references Producto(id_producto),
	foreign key (id_proveedor) references Proveedor(id_proveedor)
)    