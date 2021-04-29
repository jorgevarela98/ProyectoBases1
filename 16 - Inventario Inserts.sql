use proyectoBD1;

drop table Inventario;

Create table Inventario (
	id_inventario int primary key,
    fecha_registro date,
    cantidad int,
    id_producto int, 
    foreign key(id_producto) references Producto(id_producto)
);
Insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (200, "2017-01-01", 30,1001 );
Insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (243, "2017-02-15", 30,1001 );
Insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (244, "2017-03-10", 30,1001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (201, "2017-01-15", 25,1002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (202, "2017-01-20", 10,1003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (203, "2016-01-31", 40,1004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (204, "2016-02-01", 25,1005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (205, "2016-02-15", 14,2001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (206, "2016-02-20", 6,2002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (207, "2016-02-28", 50,2003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (208, "2017-03-01", 30,2004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (209, "2017-03-15", 15,2005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (210, "2017-03-20", 8,2006 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (211, "2017-03-30", 45,2007 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (212, "2017-04-01", 28, 3001);
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (213, "2016-04-15", 20,3002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (214, "2016-04-20", 10,3003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (215, "2016-04-30", 60,3004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (216, "2016-05-01", 40,3005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (217, "2017-05-15", 30, 4001);
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (218, "2017-05-20", 8,4002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (219, "2017-05-31", 50,4003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (220, "2017-06-01", 35,4004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (221, "2016-06-10", 15,4005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (222, "2016-06-20", 5,4006 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (223, "2016-06-30", 50,4007 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (224, "2016-06-10", 30,4008 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (225, "2016-07-15", 20,4009 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (226, "2016-07-20", 10,4010 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (227, "2016-07-31", 60,5001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (228, "2016-07-01", 30,5002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (229, "2017-08-15", 20,5003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (230, "2017-08-15", 6,5004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (231, "2017-08-15", 50,5005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (232, "2017-08-01", 25,6001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (233, "2017-08-15", 15,6002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (234, "2017-08-20", 3,6003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (235, "2017-09-15", 80,6004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (236, "2017-09-11", 40,6005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (237, "2017-09-11", 30,6006 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (238, "2017-09-11", 15,6007 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (239, "2016-12-24", 60,6008 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (240, "2016-12-24", 30,7001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (241, "2016-12-24", 25,7002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (242, "2016-12-24", 10,7003 );  

select * from Inventario;