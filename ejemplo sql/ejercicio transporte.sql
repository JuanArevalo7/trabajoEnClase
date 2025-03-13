create table Camionero(
	idCamionero int primary key auto_increment,
    nombre varchar(50) not null,
    telefono int not null,
	direccionCam varchar(50)    
);
create table Camion(
	placa varchar(6) primary key,
    modelo varchar(50) not null,
    potencia varchar(60) not null,
	tipo varchar(50)   not null
);
create table Paquete(
	codigoPaquete int primary key auto_increment,
    descripcion varchar(50) not null,
    destinatario varchar(50) not null,
	direccionP varchar(50)
);
create table Ciudad(
	codigoCiu int primary key auto_increment,
    nomCiudad varchar(50) not null
);
describe table Camionero;
describe table Camion;
describe table Paquete;
describe table Ciudad;
alter table paquete 
add column idCamionFK int;
alter table paquete
add constraint FKpaquete foreign key(idCamionFK) references Camionero (idCamionero);