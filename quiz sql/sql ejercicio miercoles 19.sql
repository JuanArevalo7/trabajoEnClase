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
    foreign key(departamentoEmp) references departamento(id)
);
create table departamento(
	id int primary key auto_increment,
    nombreDep varchar(20) not null
);
insert into departamento values(null,"IT"),(null,"ventas"),(null,"administracion"),(null,"seguridad");
/* insercion de valores en la bd*/
insert into empleados(nombreEMp,edad,salario,fechaContratacion,departamentoEmp)
values("juan arevalo",22,2000,"2020-05-20",1);
insert into empleados(nombreEMp,edad,salario,fechaContratacion,departamentoEmp)
values("juan arroyo",40,4500,"2010-10-14",2),
("sebastian cuesta",70,8000,"2000-04-18",3);
insert into empleados(nombreEMp,edad,salario,departamentoEmp)
values("william ramirez",25,1200,1),("camilo rojas",56,2000,4);
/* se confirma que las insercion se hayan realizado correctamente*/
select * from empleados;
/*se obtienen los nombres, edades y salarios de todos los empleados */
select nombreEmp as nombre,edad,salario from empleados;
/* se obtiene el nombre de los empleados que ganan mas de 4000*/
select nombreEmp as nombre, salario from empleados
where salario>4000;
/* se obtienen los empleados que pertenecen al departamento de ventas*/
select nombreEmp as nombre, departamentoEmp as departamento from empleados
where departamentoEmp=2;
/*se obtienen los empleados entre los 30 y 40 años*/
select nombreEmp as nombre, edad from empleados
where edad between 30 and 40;
/* se obtienen los empleados que hayan sido contratados despues de 2020*/
select nombreEmp as nombre, fechaContratacion from empleados
where fechaContratacion>="2021-01-01";
/* se obtienen cuantos empleados hay por departamento*/ 
select departamentoEmp, count(*) from empleados
group by departamentoEmp;
/* salario promedio de la empresa*/
select avg(salario) as salarioPromedio from empleados;
/* empleados cuyo nombre comienza por a o c*/ 
select nombreEmp as nombre from empleados
where nombreEmp like "a%" or nombreEmp like "c%";
/* empleados que no pertecenen a IT*/
select nombreEmp as nombre, departamentoEmp as departamento from empleados 
where departamentoEmp<>"IT";
/* mayor salario */
select max(salario) from empleados;
/* --------------------------------------------------------------------------*/
select nombreEmp,salario from empleados where salario=(select max(salario) from empleados);
select * from empleados;
select * from empleados where id between 1 and 8;
select * from empleados where id in (1,3,5,10);
/*agregate */
select salario from empleados
order by salario desc;
select count(*) from empleados where departamentoEmp=null;
select fechaContratacion from empleados;
select *, timestampdiff(year, fechaContratacion,curdate()) from empleados;
select * from empleados order by salario desc limit 3;
select nombreEmp,salario,salario*0.1 as bono, timestampdiff(year, fechaContratacion,curdate()) as "tiempo trabajando"
from empleados where timestampdiff(year, fechaContratacion,curdate())>5;
select count(*) from empleados where salario>(select avg(salario) from empleados);
select * from empleados ;
select departamentoEmp,count(*) from empleados group by departamentoEmp 
order by count(*) desc;


select *,timestampdiff(year, fechaContratacion,curdate()) as "tiempo trabajando" from empleados 
where salario=(select max(salario) from empleados) and 
(fechaContratacion=(select min(fechaContratacion) from empleados)) 
order by salario desc, fechaContratacion desc;
select departamentoEmp, count(*) as "total empleados" from empleados group by departamentoEmp 
having count(*)>=0;
/*modificacion */
update empleados 
set id= 5 where id=11;
select * from empleados;
select max(fechaContratacion) from empleados;
drop database techCorp;
/* de aca en adelante estan los ejercicios del quiz, lo de antes era lo de la clase del miercoles 19*/
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
