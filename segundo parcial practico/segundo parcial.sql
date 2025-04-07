create database BDDataVerse;
use BDDataVerse;
/* creacion de la tabla sensores */
CREATE TABLE sensores(
id_sensor INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(20),
ubicacion VARCHAR(20) NOT NULL,
fecha_instalacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);
/* crecion de la tabla registro snrores */
DESCRIBE SENSORES;

CREATE TABLE registro_sensores(
id_registro INT PRIMARY KEY AUTO_INCREMENT,
id_sensor INT,
valor double(5,3), 
fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
CONSTRAINT id_sensorFK FOREIGN KEY(id_sensor) REFERENCES sensores(id_sensor) ON DELETE SET NULL 
/* si borramos el registro del sensor no queremos borrar el sensor en si, por lo que usamos set null y no on cascade*/
);
/* creacion tabla transporte */
DESCRIBE registro_sensores;
CREATE TABLE transporte(
id_transporte INT PRIMARY KEY AUTO_INCREMENT,
tipo_transporte VARCHAR(20),
capacidad_transporte INT 
);
/* creacion de la tabla usuarios */
DESCRIBE transporte;
CREATE TABLE USUARIOS(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(40),
email VARCHAR(30)
);
/* CREACION DE LA TABLA CONSUMO ENERGETCO */
DESCRIBE USUARIOS;
CREATE TABLE consumo_eneretico(
id_registro INT PRIMARY KEY AUTO_INCREMENT,
zona VARCHAR(20),
comsumo_kw INT,
fecha TIMESTAMP DEFAULT current_timestamp()
);
/* CREACION DE LA TABLA SEGURIDAD */
DESCRIBE consumo_eneretico;
CREATE TABLE seguridad(
id_evento INT PRIMARY KEY AUTO_INCREMENT,
tipo_evento VARCHAR(20),
descripcion VARCHAR(40),
fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
ubicacion VARCHAR(20)
);
/* MODIFICAR TABLA USUARIO Y CREAR TELEFONO */
DESCRIBE seguridad;
/* esta tabla relaciona los usuarios junto a su consumo energetico y eventos de seguridad*/
CREATE TABLE REPORTE_USUARIO(
idReport INT PRIMARY KEY AUTO_INCREMENT,
id_usuarioFK int,
idTransporteFK int,
idConsumoFK int,
idSeguridadFK INT,
FOREIGN KEY(id_usuarioFK) REFERENCES USUARIOS(id_usuario) ON DELETE SET NULL,
FOREIGN KEY(idTransporteFK) REFERENCES transporte(id_transporte) ON DELETE SET NULL,
FOREIGN KEY(idConsumoFK) REFERENCES consumo_eneretico(id_registro) ON DELETE SET NULL,
FOREIGN KEY(idSeguridadFK) REFERENCES seguridad(id_evento) ON DELETE SET NULL
);
ALTER TABLE usuarios
ADD COLUMN telefono int;
SELECT * FROM USUARIOS;
/* insertarr 5 valores por tabla */ 
INSERT INTO sensores(tipo,ubicacion) VALUES ("velocidad","av 57"), ("humedad","jardin botanico"), ("velocidad", "rotonda principal"), 
											("temperatura","alcaldia"), ("temperatura","mirador en el centro");
SELECT * FROM SENSORES;


INSERT INTO REGISTRO_SENSORES(id_sensor,valor) VALUES (1,60.25), (2,12.25), (3,20.14);
INSERT INTO REGISTRO_SENSORES(id_sensor,valor) VALUES (4,60.25);
INSERT INTO REGISTRO_SENSORES(id_sensor,valor,fechaRegistro) VALUES(4,22,"2025-04-20 12:22:10"),(5,25,"2025-07-20 12:22:10");
SELECT * FROM REGISTRO_SENSORES;

INSERT INTO TRANSPORTE(tipo_transporte,capacidad_transporte) VALUES("tren",200),("alimentador",60),("taxi",4),("metro",300),("flota",70);
SELECT * FROM TRANSPORTE;


INSERT INTO usuarios(NOMBRE,EMAIL,TELEFONO) VALUES("juan arevalo","juanarevalo@gmail.com",3053524931),("william ramirez","williamramirez@gmail.com",3258448181),
													("sebastian arroyo","sebastianarroyo@gmail.com",NULL),("sebastian cuesta","sebastiancuesta@gmail,com",3053527831),
                                                    ("juan amaya","juanamaya@gmail.com",NULL);
SELECT * FROM USUARIOS;


INSERT INTO consumo_eneretico(zona,comsumo_kw) VALUES("zona alcaldia",5000),("barrio salitre",500),("barrio salitre",120),("zona alcaldia",4555),("centro de la ciudad",456);
/* se cambia el nombre de la tabla por un error en la creacion */
ALTER TABLE consumo_eneretico RENAME TO consumo_energetico;
SELECT * FROM consumo_energetico;


INSERT INTO SEGURIDAD(tipo_evento,descripcion,ubicacion) VALUES("robo","atraco en barrio salitre","barrio salitre"),
("accidente de transito","accidente de transito por semaforo en rojo","centro de la ciudad");
INSERT INTO SEGURIDAD(tipo_evento,descripcion,ubicacion,fecha_hora) VALUES("robo","atraco en centro de la ciudad","centro de la ciudad","2000-04-07 14:38:25");
SELECT * FROM SEGURIDAD;
INSERT INTO  REPORTE_USUARIO VALUES();
/*3 ELIMINAR REGISTROS DE SEGURIDAD MAYORES A UN AÑO*/
delete from seguridad where fecha_hora<"2024-04-07 00:00:00";

/* 4. Encuentra todos los registros de sensores donde el valor sea mayor a 50 y el tipo de sensor sea
'temperatura'. Excluye valores NULL en valor.*/
SELECT * FROM registro_sensores rs
inner join sensores s ON rs.id_sensor=s.id_sensor
WHERE TIPO="temperatura" AND valor>50;

/* 5 Muestra el consumo energético promedio por zona, redondeado a 2 decimales y con alias
Promedio_Consumo. */
SELECT zona,avg(comsumo_kw) as "promedio consumo" from consumo_energetico group by zona;
/*  8. Encuentra las zonas donde el consumo energético promedio es mayor a 2000 kW.
 */
 SELECT zona,avg(comsumo_kw) as "promedio consumo"  from consumo_energetico WHERE comsumo_kw>2000 group by zona;
 /*9. Muestra los usuarios que han usado transporte en zonas donde el consumo energético ha sido
mayor a 5000 kW en la última semana. Incluye el tipo de transporte que usaron. */ 
/* Crea una vista Vista_Consumo_Promedio que muestre el consumo energético promedio por
zona.
*/
CREATE VIEW Vista_Consumo_Promedio as
SELECT zona,avg(comsumo_kw) as "promedio consumo" from consumo_energetico group by zona;
SELECT * FROM Vista_Consumo_Promedio;
DROP DATABASE BDDataVerse;
/* Muestra la cantidad de eventos de seguridad agrupados por tipo de evento y ubicación. */
SELECT tipo_evento,COUNT(*) AS "cantidad eventos" from seguridad group by tipo_evento /* esta fue hasta la ultima que me dijiste que hiciera :)*/