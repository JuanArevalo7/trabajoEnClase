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

select * from vacuna;
select * from Mascota_vacuna;
select * from cliente;
insert into vacuna values(1,"vacuna contra rabia",2,"rabia");
insert into vacuna values(2,"desparasitante",4,"piojos");
insert into vacuna values(3,"vacuna contra moquillo",2,"moquillo");
insert into vacuna values(4,"vacuna contra herpes",2,"herpes");
insert into Mascota_Vacuna values(1,1,"rabia");
insert into Mascota_Vacuna values(1,2,"parasitos");
insert into Mascota_Vacuna values(2,4,"herpes");
insert into Mascota_Vacuna values(2,3,"moquillo");
insert into Mascota_Vacuna values(3,3,"moquillo");
insert into Cliente values(1,"juan",NULL,NULL,20,1);
insert into Cliente values(2,"tomas","carrera 89 d 24 c 50",NULL,20,1);
insert into Cliente values(2,"william","carrera 50 f 212 c 2",NULL,1,3);