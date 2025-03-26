/*Sentencias de DDL*/
/*Creacion de base de datos*/
create database TiendaMascota;
/*Habilitar la base de datos*/
use TiendaMascota;
/*Creacion de tablas*/
create table Mascota(
idMascota int primary key,
nombreMascota varchar (15),
generoMascota varchar (15),
razaMascota varchar (15),
cantidad int (10)
);
create table Cliente(
cedulaCliente int primary key,
nombreCliente varchar (15),
apellidoCliente varchar (15),
direccionCliente varchar (10),
telefono int (10),
idMascotaFK int
);
create table Producto(
codigoProducto int primary key,
nombreProducto varchar (15),
marca varchar (15),
precio float,
cedulaClienteFK int
);
create table Vacuna(
codigoVacuna int primary key,
nombreVacuna varchar (15),
dosisVacuna int (10),
enfermedad varchar (15)
);
create table Mascota_Vacuna(
codigoVacunaFK int,
idMascotaFK int,
enfermedad varchar (15)
);
/*crear las relaciones*/
alter table Cliente
add constraint FClienteMascota
foreign key (idMascotaFK)
references Mascota(idMascota);

alter table Producto
add constraint FKProductoCliente
foreign key (cedulaClienteFK)
references Cliente(cedulaCliente);

alter table Mascota_Vacuna
add constraint FKMV
foreign key (idMascotaFK)
references Mascota(idMascota );

alter table Mascota_Vacuna
add constraint FKVM
foreign key (codigoVacunaFK)
references Vacuna(codigoVacuna);
insert into Mascota
values(1,"max","M","pomerania",1),(2,"dante","M","pastor aleman",1);
insert into vacuna values(1,"moquillo",2,"moquillo"),(2,"desparasitante",3,"garrapatas");
insert into mascota_vacuna values(2,1,"desparasitante"),(1,"2","moquillo");
insert into cliente values(23496352,"juan","arevalo","carrera 69d 24 c 50",3118481,1),
(1141515962,"william","ramirez","calle 22 #12 a 21",3053524,2);
insert into producto values(1,"collar","calier",20.000,1141515962),(2,"zapatos","life",15.000,23496352);
select * from cliente;
select m.*, c.nombreCliente,p.nombreProducto
from mascota m
join cliente c on m.Idmascota=c.idMascotaFK
join producto p on p.cedulaclienteFK=c.cedulacliente;
/* stored procedura */
DELIMITER //
CREATE PROCEDURE InsertarMascota(in idMascota int,  nombreMascota varchar(15),
 generoMascota varchar(15), cantidad int)
begin 
	insert into mascota (idMascota,nombreMascota,generoMascota,cantidad)
    VALUES (idMascota,nombreMascota,generoMascota,cantidad);
    END  //
    DELIMITER ; 
CALL insertarMascota(5,"firlai","F",1);
select * from mascota;
DELIMITER // 
CREATE PROCEDURE consultarPrecio(in precio float, out total float)
begin 
select count(*) into precio from producto;
END // 
DELIMITER ;
call consultarPrecio(@resultado);
select @resultado;
DELIMITER //
CREATE PROCEDURE InsertarVacuna(in codigoVacuna int,nombreVacuna varchar(15),  dosisVacuna int,
 enfermedad varchar(15))
begin 
	insert into vacuna (codigoVacuna,nombreVacuna,dosisVacuna,enfermedad)
    VALUES (codigoVacuna,nombreVacuna,dosisVacuna,enfermedad);
    END  //
    DELIMITER ; 
call InsertarVacuna(3,"sarna",1,"sarna");
/* insertar las vacunas de una mascota*/
DELIMITER //
CREATE PROCEDURE insertMV(in codigoVacunaFK int,idMascotaFK int ,enfermedad varchar(15))
begin 
insert into mascota_vacuna(codigoVacunaFK,idMascotaFK,enermedad)
values(codigoVacunaFK,idMascotaFK,enermedad);
END //
DELIMITER ;
DELIMITER // 
drop procedure consultarVM;
CREATE PROCEDURE consultarVM(in mascotaSelect int)
begin 
select m.nombreMascota,mv.enfermedad as "vacuna contra la enfermedad" from  mascota m inner join Mascota_Vacuna mv on m.idMascota=mv.idMascotaFK
where 
mascotaSelect=m.idMascota; 
END // 
DELIMITER ;
call consultarVM(1);
select @resultado;
select m.nombreMascota,mv.enfermedad as "enfermedad que trata la vacuna" from mascota m inner join Mascota_Vacuna mv on m.idMascota=mv.idMascotaFK