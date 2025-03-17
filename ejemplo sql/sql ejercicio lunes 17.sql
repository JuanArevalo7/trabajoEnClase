create database ejercicioEnClase;
use ejercicioEnClase;
create table Cliente(
	codigo int primary key auto_increment,
    nombre varchar(50) not null,
    domicilio varchar(50) not null,
    ciudad varchar(50) not null,
    provincia varchar(50) not null    
);
alter table cliente
add column telefono varchar(50);
insert into Cliente(nombre,domicilio,ciudad,provincia,telefono) 
values("juan","carreara 69 d 24 c 50","Bogota","cundinamarca","3053524931"),
("juan","carrera 1 23 a 51d 20","pasto","nariño","3108067326"),
("sebastian cuesta","carrera 125 z 24c 40","bogota","cundinamarca","3118481728"),
("william ramirez","carreara 74d 14 x 87","bogota","cundinamarca","3227830878"),
("santiago ulises","calle 19d 7y 21","ciudad de panama","ciudad de panama","3054724544");
update Cliente
set nombre="juan arevalo" where codigo=1;
update Cliente
set nombre="juan arroyo" where codigo=2;
select * from Cliente;
select codigo,nombre from cliente
where codigo<>1 and nombre<>"juan cuesta";
select codigo as id from Cliente;
select nombre as "nombre Cliente", domicilio as direccion, ciudad, provincia as departamento, telefono from Cliente;
select * from cliente order by nombre desc;
select ciudad from cliente group by ciudad;
-- como
select distinct ciudad from cliente;
select nombre from cliente where nombre like "juan%";