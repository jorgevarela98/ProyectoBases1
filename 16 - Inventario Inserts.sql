use proyectoBD1;

drop table Inventario;

Create table Inventario (
	id_inventario int primary key,
    fecha_registro date,
    cantidad int,
    id_producto int, 
    foreign key(id_producto) references Producto(id_producto)
);

Insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (200, "2015-01-01", 30,1001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (201, "2016-01-15", 25,1002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (202, "2017-01-20", 10,1003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (203, "2017-01-31", 40,1004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (204, "2016-02-01", 25,1005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (205, "2018-02-15", 14,2001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (206, "2016-02-20", 6,2002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (207, "2015-02-28", 50,2003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (208, "2014-03-01", 30,2004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (209, "2017-03-15", 15,2005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (210, "2016-03-20", 8,2006 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (211, "2019-03-30", 45,2007 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (212, "2018-04-01", 28, 3001);
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (213, "2018-04-15", 20,3002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (214, "2017-04-20", 10,3003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (215, "2015-04-30", 60,3004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (216, "2014-05-01", 40,3005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (217, "2014-05-15", 30, 4001);
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (218, "2015-05-20", 8,4002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (219, "2016-05-31", 50,4003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (220, "2017-06-01", 35,4004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (221, "2016-06-10", 15,4005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (222, "2016-06-20", 5,4006 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (223, "2014-06-30", 50,4007 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (224, "2018-07-01", 30,4008 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (225, "2019-07-15", 20,4009 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (226, "2019-07-20", 10,4010 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (227, "2018-07-31", 60,5001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (228, "2017-08-01", 30,5002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (229, "2016-08-15", 20,5003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (230, "2015-08-20", 6,5004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (231, "2014-08-30", 50,5005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (232, "2016-09-01", 25,6001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (233, "2016-09-15", 15,6002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (234, "2019-09-20", 3,6003 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (235, "2016-09-30", 80,6004 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (236, "2018-10-01", 40,6005 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (237, "2017-10-15", 30,6006 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (238, "2016-10-20", 15,6007 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (239, "2014-10-31", 60,6008 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (240, "2015-11-01", 30,7001 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (241, "2014-11-15", 25,7002 );
insert into Inventario (id_inventario, fecha_registro, cantidad, id_producto) values (242, "2018-11-20", 10,7003 );

select * from Inventario;