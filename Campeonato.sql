-- SQL

create database campeonato;
use campeonato;

create table tblEquipos(
	IdEquipo smallint(2) unsigned,
    primary key(IdEquipo),
    Equipo varchar(50),
    Tecnico varchar(50),
    Fundacion varchar(50),
    Ciudad set('Madrid', 'Barcelona', 'Manchester', 'Múnich', 'Turín'),
    Direccion varchar(50),
    Telefonos varchar(50)
);

create table tblJugadores(
	IdJugador bigint(10) unsigned,
    primary key(IdJugador),
    Nombre varchar(25),
    Apellidos varchar(25),
    Nacimiento date,
    TipoSangre varchar(3),
    CodEquipo smallint(2) unsigned,
    foreign key (CodEquipo) references tblEquipos (IdEquipo)
);

INSERT INTO tblEquipos (IdEquipo, Equipo, Tecnico, Fundacion, Ciudad, Direccion, Telefonos) VALUES 
(1, 'Real Madrid', 'Carlo Ancelotti', '1902-03-06', 'Madrid', 'Avenida de Concha Espina, 1', '34913984300'),
(2, 'FC Barcelona', 'Xavi Hernández', '1899-11-29', 'Barcelona', 'Carrer Aristides Maillol', '34902189900'),
(3, 'Manchester United', 'Ralf Rangnick', '1878-12-01', 'Manchester', 'Sir Matt Busby Way, Old Trafford', '441618688000'),
(4, 'Bayern de Múnich', 'Julian Nagelsmann', '1900-02-27', 'Múnich', 'Säbener Strabe 51–57', '4989699310'),
(5, 'Juventus', 'Massimiliano Allegri', '1897-11-01', 'Turín', 'Corso Gaetano Scirea, 50', '390116563111');

INSERT INTO tblJugadores (IdJugador, Nombre, Apellidos, Nacimiento, TipoSangre, CodEquipo) VALUES 
(0, 'Sergio', 'Ramos García', '1986-03-30', 'A+', 1),
(1, 'Lionel', 'Messi', '1987-06-24', 'O-', 2),
(2, 'Cristiano', 'Ronaldo dos Santos Aveiro', '1985-02-05', 'B+', 3),
(3, 'Robert', 'Lewandowski', '1988-08-21', 'AB-', 4),
(4, 'Paulo', 'Dybala', '1993-11-15', 'A-', 5);

alter table tblJugadores add cedula bigint(20);

replace into tblEquipos (IdEquipo, Equipo, Tecnico, Fundacion, Ciudad, Direccion, Telefonos) VALUES 
(6, 'Liverpool FC', 'Jürgen Klopp', '1892-06-03', 'Madrid', 'Anfield Road', '441512632361');
replace into tblEquipos (IdEquipo, Equipo, Tecnico, Fundacion, Ciudad, Direccion, Telefonos) VALUES 
(6, 'Liverpool Futbol Club', 'Jürgen Klopp', '1892-06-03', 'Madrid', 'Anfield Road', '441512632361');

replace into tblJugadores (IdJugador, Nombre, Apellidos, Nacimiento, TipoSangre, CodEquipo, cedula) VALUES 
(5, 'Andrés', 'Iniesta', '1984-05-11', 'A+', 2, 1000230045);
replace into tblJugadores (IdJugador, Nombre, Apellidos, Nacimiento, TipoSangre, CodEquipo, cedula) VALUES 
(5, 'Andrés David', 'Iniesta', '1984-05-11', 'A+', 2, 1000230045);

alter table tblEquipos add Barrio varchar(40);
alter table tblEquipos modify Direccion varchar(70);
alter table tblJugadores modify Apellidos varchar(50);
alter table tblEquipos change Equipo Nombequipo varchar(50);
alter table tblJugadores change Nacimiento Fechanacimiento date;

alter table tblJugadores drop primary key;
update tblJugadores set cedula = 1000230046 where IdJugador = 0;
update tblJugadores set cedula = 1000230047 where IdJugador = 1;
update tblJugadores set cedula = 1000230048 where IdJugador = 2;
update tblJugadores set cedula = 1000230049 where IdJugador = 3;
update tblJugadores set cedula = 1000230040 where IdJugador = 4;
alter table tblJugadores add primary key (cedula);

rename table tblJugadores to tablaDeJugadores, tblEquipos to tablaDeEquipos;
alter table tablaDeEquipos drop Fundacion;
alter table tablaDeJugadores drop TipoSangre;

select * from tablaDeJugadores order by rand() limit 3;

select * from tablaDeEquipos where find_in_set('Madrid', Ciudad)>0;
