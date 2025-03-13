create table compañia(
	idCompañia int primary key auto_increment,
	NIT int not null,
    nombre varchar(50) not null,
    fechaFundacion timestamp not null default current_timestamp,
    repLegal varchar(50) not null
);
create table automovil(
	idautomovil int primary key auto_increment,
	marca varchar(50) not null,
    modelo varchar(50) not null default "N/a",
    placa varchar(6) not null,
    tipo varchar(50) not null,
    añoFabricacion timestamp not null default current_timestamp,
    serialChasis varchar(50) not null,
    pasajeros int not null default 1,
    cilindraje varchar(50) not null    
);
create table accidente(
	idAccidente int primary key auto_increment,
	automotores varchar(50) not null,
    fatalidades varchar(50) not null,
    heridos int not null default 0,
    lugar varchar(50) not null
);