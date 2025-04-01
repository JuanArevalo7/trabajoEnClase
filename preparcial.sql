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
INSERT INTO curso(nomCurso,estadocu) values (901,"true"),(902,"true"),(1001,"true"),(1002,"true"),(1003,"false"),(1101,"true"),(1102,"true"),(1003,"false");
SELECT * FROM curso;
CREATE TABLE concejo(
idConcejo int primary key auto_increment,
nomConcejo varchar(20),
estadoCo varchar(20) DEFAULT "true"
);
INSERT into concejo(nomConcejo) VALUES("concejo academico"),("concejo directivo"),("concejo convivencia");
select * from concejo;
/* creacion tabla cargo*/
CREATE TABLE cargo(
idCargo int primary key auto_increment,
nomCargo varchar(20) NOT NULL,
idConcejoFK int,
estadoC varchar(10),
CONSTRAINT fkConcejo FOREIGN KEY(idConcejoFK) REFERENCES concejo(idConcejo)
);
INSERT INTO cargo VALUES(1,"Personero",1,"true"),(2,"contralor",1,"true"),(3,"cabildante",1,"true");
select * from cargo;
/* probar que la relacion se estableciera correctamente*/
select * from cargo inner join concejo on 
cargo.idConcejoFK=idConcejo;
/* creacion tabla eleccion*/
CREATE TABLE eleccion(
idEleccion int primary key auto_increment,
fechaEleccion date,
añoEleccion year,
estadoEl varchar(10)
);
INSERT INTO eleccion VALUES(1,"2024-04-20","2020","true"),(2,"2019-04-15","2019","true"),
							(3,"2019-03-12","2019","false"),(4,"2018-04-14","2018","true"),(5,"2017-04-12","2017","true");
SELECT * from eleccion;
        /* CREACION TABLA USUARIO*/
CREATE TABLE usuario(
	idUsuario INT primary key auto_increment,
	noDocUsuario INT NOT NULL,
	idTipoDocFK int,
	nombreUsuario varchar(20),
	apellidoUsuario varchar(20),
	idGeneroFK int,
	fechaNacUsuario date,
	emailUsuario varchar(40),
	passwordUsuario varchar(20),
	fotoUsuario blob,
	idJornadaFK int,        
	idTipoMiembroFK int,
	idCursoFK int,
	estadoU varchar(10),
    constraint tipoDocFK FOREIGN KEY(idTipoDocFK) REFERENCES tipoDocumento(idTipodoc),
    constraint idGeneroFK FOREIGN KEY(idGeneroFK) REFERENCES genero(idGenero),
    constraint jornadaFK FOREIGN KEY(idJornadaFK) REFERENCES jornada(idJornada),
    constraint tipoMiembroFK FOREIGN KEY(idTipoMiembroFK) REFERENCES tipoMiembro(idtipoMiembro),
    constraint cursoFK FOREIGN KEY(idCUrsoFK) REFERENCES curso(idCurso)
    );
SELECT * FROM USUARIO;
INSERT INTO USUARIO VALUES
	(2,1010123456,1,"david santiago","lopez mora",2,"2004-10-11","davidLopez456@hotmail.com","david2004",NULL,1,1,3,"true"),
	(3,1010123789,1,"laura milena","gomez bonilla",1,"2004-03-17","lauragomez@gmail.com","Gomez2004",NULL,1,1,1,"true"),
	(4,1010123741,1,"diego fernando","cañon vargaz",2,"2003-05-20","diegocanon@hotmail.com","Diego2003",NULL,1,1,1,"true"),
	(5,1010123852,1,"tatiana","vargas cabrera",1,"2003-11-28","tatacabrera@gmail.com","Cabrera2003",NULL,1,1,3,"true"),
	(6,1010123963,1,"leydy katherine","fernandez rodriguez",1,"2004-06-28","leydy2004@gmail.com","Leydy2004",NULL,1,1,4,"true");
/* FALTABAN LAS INSERCIONES DE LA 7 A LA 10 */
INSERT INTO USUARIO VALUES
(7,1010123654,2,"mauricio","bermudez amaya",2,"2002-01-26","maobermudez@gmail.com","Amaya2002",NULL,1,1,4,"true"),
(8,1010741258,1,"andres felipe","rodriguez perez",2,"2004-03-23","andyrodriguez@gmail.com","Arodriguez2004",NULL,1,1,3,"true"),
(9,1010236859,1,"maria angelica","triviño latorre",1,"2002-02-4","angelicatri@gmail.com","Trivino2002",NULL,1,1,3,"true"),
(10,1010236963,1,"genaro","VASQUEZ RODRIGUEZ",2,"2002-11-14","gevasquez@gmail.com","Vasquez123",NULL,1,1,3,"false");
/* creacion de la tabla postulacion_candidato*/
CREATE TABLE postulacion_candidato(
idPostCandidato int primary key auto_increment,
idUsuarioFK int,
idEleccionFK int,
idCargoFK int,
propuesta varchar(50),
totalVotos int,
estadoCan varchar(10),
FOREIGN KEY (idUsuarioFK) REFERENCES usuario(idUsuario),
FOREIGN KEY (idEleccionFK) REFERENCES eleccion(idEleccion),
FOREIGN KEY (idCargoFK) REFERENCES cargo(idCargo)
);
DROP TABLE postulacion_candidato;
SELECT * FROM postulacion_candidato;
INSERT INTO postulacion_candidato VALUES
(1,2,1,1,"Mejorar entrega refrigerios, Alargar descansos",0,"true"),
(2,5,1,1,"Mejorar entrega refrigerios, Alargar descansos",0,"true"),
(3,7,1,1,"Mejorar sala de informática, Construir piscina",0,"true");
select * FROM postulacion_candidato;
/*CREACION DE LA TABLA VOTACION*/
CREATE TABLE VOTACION(
idVotacion int primary key auto_increment,
horaVotacion time,
idUsuarioVotanteFK int,
idPostCandidatoFK int,
estadoV varchar(20),
CONSTRAINT FOREIGN KEY(idUsuarioVotanteFK) REFERENCES usuario(idUsuario),
CONSTRAINT  FOREIGN KEY(idPostCandidatoFK) REFERENCES postulacion_candidato(idPostCandidato)
);
INSERT INTO VOTACION VALUES
(1,"12:08:15",2,1,"true"),
(2,"12:12:35",2,3,"true"),
(3,"12:14:18",3,2,"true"),
(4,"12:15:58",4,2,"true"),
(5,"12:18:02",5,3,"true"),
(6,"12:24:22",6,3,"true"),
(7,"12:28:02",7,3,"true"),
(8,"12:30:14",8,2,"true"),
(9,"12:40:20",9,2,"true"),
(10,"12:45:20",10,2,"true");
SELECT * FROM VOTACION