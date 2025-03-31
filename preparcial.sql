create database votaciones2503816;
use votaciones2503816;
create table genero(
idGenero int primary key auto_increment,
nomgenero varchar(20) NOT NULL, 
estadoGen varchar(10) NOT NULL);
insert into genero(nomGenero,estadoGen) values("femenino","true"),("masculino","true");
select  * from genero;
/* creacion tabla jornada*/
create table jornada (
idJornada int primary key auto_increment,
nomJornada varchar(10) NOT NULL,
estadoJ varchar(10) NOT NULL);
insert into jornada(nomJornada,estadoJ) values("mañana","true"),("tarde","true"),("noche","true");
select * from jornada;
/* creacion tabla tipo documento*/
create table tipoDocumento(
idTipodoc int primary key auto_increment,
nomTipoDoc varchar(20) NOT NULL ,
estadoID VARCHAR(10)  DEFAULT "true"
);
INSERT INTO tipoDocumento(nomTipoDoc,estadoID) 
VALUES("tarjeta identidad","true"),("cedula ciudadania","true"),("cedula extranjeria","true"),("pasaporte","true"),("NUIP","false");
select * from tipoDocumento;
/* creacion tabla tipoMiembro*/
create table tipoMiembro(
idTIpoMiembro int primary key auto_increment, 
nomTipoMiembro varchar(20) NOT NULL,
estadoTM varchar(10) DEFAULT "true"
);
insert into tipoMiembro(nomTipoMiembro) values("estudiante"),("profesor"),("acudiente");
select * from tipoMiembro;
/* creacion tabla curso*/
CREATE TABLE curso(
idCurso int primary key auto_increment,
nomCurso int NOT NULL,
estadocu varchar(10) 
);
DROP TABLE curso;
INSERT INTO curso(nomCurso,estadocu) values (901,"true"),(902,"true"),(1001,"true"),(1002,"true"),(1003,"false"),(1101,"true"),(1102,"true"),(1003,"false");
SELECT * FROM curso;
CREATE TABLE concejo(
idConcejo int primary key auto_increment,
nomConcejo varchar(20),
estadoCo varchar(20) DEFAULT "true"
);
INSERT INTO()
CREATE TABLE eleccion 
