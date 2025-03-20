create database techCorp;
use techCorp;
/* creacion de la base de datos y de la tabla*/
create table empleados(
	id int primary key auto_increment,
    nombreEmp varchar(20) not null,
    edad int not null,
    salario double(8,2) not null,
    fechaContratacion timestamp default current_timestamp,
	departamentoEmp int not null ,
    cargoEmp varchar(30) not null,
    foreign key(departamentoEmp) references departamento(id),
    foreign key(cargoEmp) references cargo(idCargo)
);
create table departamento(
	id int primary key auto_increment,
    nombreDep varchar(20) not null
);
create table cargo(
idCargo varchar(30) primary key ,
nombreCargo varchar(30),
rangoCargo int,
descripcionCargo varchar(60)
); 
insert into departamento values(null,"IT"),(null,"ventas"),(null,"administracion"),(null,"seguridad");
insert into departamento values(null,"administracion");
insert into departamento values(null,"recursos humanos");
select * from departamento;
insert into cargo values("1","gerente de proyectos",3,"el empleado se encarga de gestionar los proyectos de la empresa"),
("2","pasante",1,"el empleado es un pasante que realiza pequeñas partes de los proyectos"),
("3","publicidad","2", "el empleado se encarga de salir a la calle a publicitar los trabajos de la empresa"),
("4","inversor","3","el empleado se encarga de analizar las ganancias de la empresa para decidir en que y cuanto invertir"),
("5","celador",1,"el emplado vela por la seguridad de los emplleados");
insert into cargo values("6","jefe de seguridad",5,"el emplado que organiza todos los celadores y se encarga de gestionar posibles amenazas");
select * from cargo;
insert into empleados(nombreEMp,edad,salario,fechaContratacion,departamentoEmp,cargoEmp)
values("juan arevalo",22,7000,"2020-05-20",1,"1"),
("juan arroyo",40,2000,"2025-01-14",1,"2"),
("sebastian cuesta",25,4000,"2015-04-18",2,"3"),
("william ramirez",30,5000,"1999-04-18",3,"4"),
("camilo rojas",56,2000,"2007-04-08",4,"5")
;
/* se confirma que las insercion se hayan realizado correctamente*/
select * from empleados;
/* cargos en un rango especifico*/
select * from cargo where idCargo in("1","3");
/* empleados con un cargo especifico*/
select * from empleados 
where cargoEmp="1";
/* mostrar nombre, salario, antiguedad, nombreDepto, cargo de un emp con mas de 3 años de antiguedad*/
select nombreEmp as nombre,salario,timestampdiff(year, fechaContratacion,curdate()) as "antiguedad", 
nombreDep as "nombre departamento",nombreCargo as "cargo" from empleados inner join 
departamento on empleados.departamentoEmp=departamento.id 
inner join cargo on empleados.cargoEmp=cargo.idCargo
where timestampdiff(year, fechaContratacion,curdate())>3;
/*todo la info de un empleado*/
select *,timestampdiff(year, fechaContratacion,curdate()) as "antiguedad", 
nombreDep as "nombre departamento",nombreCargo as "cargo",rangoCargo  from empleados inner join 
departamento on empleados.departamentoEmp=departamento.id 
inner join cargo on empleados.cargoEmp=cargo.idCargo
where timestampdiff(year, fechaContratacion,curdate())>3;
/*	cargos sin empleado	 */

select idCargo,nombreCargo from empleados 
right join cargo on empleados.cargoEmp=cargo.idCargo
where empleados.cargoEmp is null;
select departamento.nombreDep,departamento.id from empleados 
right join departamento on empleados.departamentoEmp=departamento.id
where empleados.departamentoEmp is null;
select * from cargo;
select * from empleados;
/* join inner join: solo las filas que son comunes en ambos
left join: todo lo de la izq+ inner join
right join: todo lo de la der + inner join
full join: toda la vuelta
*/
/* nombres de los emp y los nombres de los deptos a los que pertenecen 
inner join: select nombreCampo1Tabla1, nombreCampo1Tabla2 from tabla 1 inner join tabla2 
on tabla1.nombrecolumna=tabla2.nombreColumna
*/ 
