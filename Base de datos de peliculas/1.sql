===================================================================================
===================================================================================
===================================================================================
1
drop table PeliculasRentadas;
drop table Pelicula;

CREATE TABLE PeliculasRentadas(
   IdRentada int not null primary key,
   idPelicula VARCHAR(45) not null,
   IdCliente int not null,
   Fecha_de_renta VARCHAR(45)
);

CREATE TABLE Pelicula(
   IdPelicula int not null primary key,
   Nombre VARCHAR(45) not null
);

INSERT INTO PeliculasRentadas VALUES (1,'Vengadores',1,'2020-10-01');
INSERT INTO PeliculasRentadas VALUES (2,'Terminator',1,'2020-01-11');
INSERT INTO PeliculasRentadas VALUES (3,'Transportador',2,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (4,'Terminator',2,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (5,'Terminator',2,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (6,'Titanic',3,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (7,'RapidoFurioso',3,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (8,'Deadpool',3,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (9,'Deadpool',4,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (10,'Deadpool',5,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (11,'Deadpool',5,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (12,'Deadpool',5,'2020-03-12');
INSERT INTO PeliculasRentadas VALUES (13,'Vengadores',1,'2020-10-01');
INSERT INTO PeliculasRentadas VALUES (14,'Vengadores',1,'2020-10-01');
INSERT INTO PeliculasRentadas VALUES (15,'Vengadores',1,'2020-10-01');
INSERT INTO PeliculasRentadas VALUES (16,'Vengadores',1,'2020-10-01');
INSERT INTO PeliculasRentadas VALUES (17,'Vengadores',1,'2020-10-01');

INSERT INTO pelicula VALUES (6,'Vengadores');

SELECT p.idPelicula, MAX(b.mayor) Mayor FROM PeliculasRentadas p INNER JOIN (
SELECT idPelicula, COUNT(*) as mayor FROM PeliculasRentadas
GROUP BY idPelicula) b ON (p.idPelicula = b.idPelicula)
WHERE b.mayor = (SELECT MAX(Cantidad) as mayor FROM (
SELECT idPelicula, COUNT(*) as Cantidad FROM PeliculasRentadas
GROUP BY idPelicula) a)
GROUP BY P.idPelicula;
===================================================================================
===================================================================================
===================================================================================
2
drop table Peliculas;
drop table Actores;
drop table PeliculasPorActor;

CREATE TABLE Peliculas(
  idPelicula int not null primary key,
  nombre VARCHAR(45) not null,
  calificacion int not null,
  idGenero int not null,
  idTipoAlquiler VARCHAR(45) not null,
  cantPeliculas int not null,
  peliculasRentadas int not null,
  IdActor int not null   
);

CREATE TABLE Actores(
  nombreActor VARCHAR(45) not null,
  idActor int not null primary key
);

CREATE TABLE PeliculasPorActor(
  idPelicula int not null primary key,
  idActor int not null 
);


INSERT INTO Peliculas VALUES ('00', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('01', 'Titanic', '4', '2', 'cinco dias', '200', '123','0001');
INSERT INTO Peliculas VALUES ('02', 'Deadpool', '3', '1', 'dos semanas', '80', '27','0002');
INSERT INTO Peliculas VALUES ('03', 'Piratas del caribe', '5', '3', 'tres dias', '70', '50','0003');
INSERT INTO Peliculas VALUES ('04', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('05', 'Titanic', '4', '2', 'cinco dias', '200', '123','0001');
INSERT INTO Peliculas VALUES ('06', 'Deadpool', '3', '1', 'dos semanas', '80', '27','0002');
INSERT INTO Peliculas VALUES ('07', 'Piratas del caribe', '5', '3', 'tres dias', '70', '50','0003');
INSERT INTO Peliculas VALUES ('08', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('09', 'Titanic', '4', '2', 'cinco dias', '200', '123','0001');
INSERT INTO Peliculas VALUES ('10', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('11', 'Deadpool', '3', '1', 'dos semanas', '80', '27','0002');
INSERT INTO Peliculas VALUES ('12', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('13', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('14', 'Titanic', '4', '2', 'cinco dias', '200', '123','0001');


INSERT INTO Actores VALUES ('Will Smith', '0000');
INSERT INTO Actores VALUES ('Leonardo Dicaprio', '0001');
INSERT INTO Actores VALUES ('ryan reynolds', '0002');
INSERT INTO Actores VALUES ('Johnny Deep', '0003');

INSERT INTO PeliculasPorActor VALUES ('00', '0000');
INSERT INTO PeliculasPorActor VALUES ('01', '0001');
INSERT INTO PeliculasPorActor VALUES ('02', '0002');
INSERT INTO PeliculasPorActor VALUES ('03', '0003');


SELECT a.nombreActor Actor, (
SELECT COUNT(*) FROM Peliculas p WHERE a.IdActor = p.IdActor) Cantidad
FROM Actores a;


En este caso, la subconsulta se ejecuta en primer lugar, obteniendo el valor de la máxima apariciones del actor, y posteriormente se obtienen los datos de la consulta principal.
=============================================================================================================================================================================================================================================================================================================================================
3

drop table Peliculas;
drop table Actores;
drop table PeliculasPorActor;

CREATE TABLE Peliculas(
  idPelicula int not null,
  nombre VARCHAR(45) not null,
  calificacion int not null,
  idGenero int not null,
  idTipoAlquiler VARCHAR(45) not null,
  cantPeliculas int not null,
  peliculasRentadas int not null,
  IdActor int not null   
);

CREATE TABLE Actores(
  nombreActor VARCHAR(45) not null,
  idActor int not null primary key
);

CREATE TABLE PeliculasPorActor(
  idPelicula int not null primary key,
  idActor int not null 
);


INSERT INTO Peliculas VALUES ('00', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('01', 'Titanic', '4', '2', 'cinco dias', '200', '123','0001');
INSERT INTO Peliculas VALUES ('02', 'Deadpool', '3', '1', 'dos semanas', '80', '27','0002');
INSERT INTO Peliculas VALUES ('03', 'Piratas del caribe', '5', '3', 'tres dias', '70', '50','0003');
INSERT INTO Peliculas VALUES ('00', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('01', 'Titanic', '4', '2', 'cinco dias', '200', '123','0001');
INSERT INTO Peliculas VALUES ('02', 'Deadpool', '3', '1', 'dos semanas', '80', '27','0002');
INSERT INTO Peliculas VALUES ('03', 'Piratas del caribe', '5', '3', 'tres dias', '70', '50','0003');
INSERT INTO Peliculas VALUES ('00', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('01', 'Titanic', '4', '2', 'cinco dias', '200', '123','0001');
INSERT INTO Peliculas VALUES ('00', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('00', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('00', 'Soy Leyenda', '4', '1', 'una semana', '100', '53','0000');
INSERT INTO Peliculas VALUES ('01', 'Titanic', '4', '2', 'cinco dias', '200', '123','0001');
INSERT INTO Peliculas VALUES ('02', 'Deadpool', '3', '1', 'dos semanas', '80', '27','0002');
INSERT INTO Peliculas VALUES ('02', 'Deadpool', '3', '1', 'dos semanas', '80', '27','0002');
INSERT INTO Peliculas VALUES ('02', 'Deadpool', '3', '1', 'dos semanas', '80', '27','0002');

INSERT INTO Actores VALUES ('Will Smith', '0000');
INSERT INTO Actores VALUES ('Leonardo Dicaprio', '0001');
INSERT INTO Actores VALUES ('ryan reynolds', '0002');
INSERT INTO Actores VALUES ('Johnny Deep', '0003');

INSERT INTO PeliculasPorActor VALUES ('00', '0000');
INSERT INTO PeliculasPorActor VALUES ('01', '0001');
INSERT INTO PeliculasPorActor VALUES ('02', '0002');
INSERT INTO PeliculasPorActor VALUES ('03', '0003');


SELECT a.nombreActor Actor, (
SELECT COUNT(*) FROM Peliculas p WHERE a.IdActor = p.IdActor) Cantidad
FROM Actores a;

SELECT j.IdPelicula Idpelicula, (
SELECT COUNT(*) FROM Peliculas p WHERE j.IdPelicula = p.IdPelicula) Cantidad
FROM PeliculasPorActor j;

================================================================================================================================================================================================
SELECT a.nombreActor Actor, (
SELECT COUNT(*) FROM Peliculas p WHERE a.IdActor = p.IdActor) Cantidad
FROM Actores a ORDER BY Cantidad desc;

SELECT j.IdPelicula Idpelicula, (
SELECT COUNT(*) FROM Peliculas p WHERE j.IdPelicula = p.IdPelicula) Cantidad
FROM PeliculasPorActor j ORDER BY Cantidad desc;