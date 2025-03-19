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