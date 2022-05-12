drop table sanciones;

CREATE TABLE sanciones(
  sancion VARCHAR(45),
  sancionMonetaria int,
  idCliente int not null, 
  diasSancion int
);

INSERT INTO sanciones VALUES ('no', 3000, 1234, '1');
INSERT INTO sanciones VALUES ('no', 4000, 5478, '3');
INSERT INTO sanciones VALUES ('si', 2000, 9101, '1');
INSERT INTO sanciones VALUES ('no', 3000, 1213, '1');
INSERT INTO sanciones VALUES ('si', 5000, 1314, '7');
INSERT INTO sanciones VALUES ('si', 1000, 1516, '0');

//////////////////////////////////MINUS//////////////////////////////////////////////
select idCliente, sancionMonetaria from sanciones where sancionMonetaria > 2000
minus
select idCliente,sancionMonetaria from sanciones where sancionMonetaria >= 5000 ORDER BY sancionMonetaria desc;

//////////////////////////////////MINUS A INTERSECT//////////////////////////////////////////////

select idCliente, sancionMonetaria from sanciones where sancionMonetaria > 2000
intersect
select idCliente,sancionMonetaria from sanciones where sancionMonetaria < 5000 ORDER BY sancionMonetaria desc;

//////////////////////////////////INTERSECT//////////////////////////////////////////
select idCliente, sancionMonetaria from sanciones
intersect
select idCliente, sancionMonetaria from sanciones where diasSancion in(1,7);

//////////////////////////////////UNION//////////////////////////////////////////
select idCliente, diasSancion  from sanciones
union
select idCliente,  sancionMonetaria from sanciones order by 2;
/////////////////////////////////////Con order by/////////////////////////////////////////

select idCliente, sancionMonetaria from sanciones where sancionMonetaria > 2000
minus
select idCliente,sancionMonetaria from sanciones where sancionMonetaria >= 5000 ORDER BY sancionMonetaria desc;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

select idCliente, sancionMonetaria from sanciones
intersect
select idCliente, sancionMonetaria from sanciones where diasSancion in(1,7) ORDER BY sancionMonetaria desc;


