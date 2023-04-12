-- INSERT INTO user(id,name) 
--     VALUES(1,"Valentin"),
--             (2,"Cesar");
-- DELETE INTO user(id,name)
--     VALUES(1,"Valentin);            

-- CREATE TABLE SELECT id,name FROM user WHERE id == 1 ;

-- DELETE FROM user WHERE id == 1;

-- INSERT INTO user(id,name) VALUES (3, "Wena compañero") ;

-- CREATE TABLE Hospital(
--     id_hospt INT PRIMARY KEY,
--     id_tipo INT,
--     name VARCHAR(40),
--     n_camas INT
-- );

-- CREATE TABLE Propio(
--     id_tipo INT,
--     presupuesto INT,
--     servicio VARCHAR(40),
--     FOREIGN KEY (id_tipo) REFERENCES Hospital(id_tipo)
-- );
-- Analisis del Modelo Relacional de BD en Hospital Pregunta 1 Tarea 1.
-- Entidades: Hospital, Poliza, Propio, Concesionado, Asegurados, Zonas, Medico.  
-- Relaciones: 
-- -Hospitales pueden ser Propios o Concesionados.
-- -Una poliza cubre varios asegurados,
-- -Los asegurados cubiertos por una misma poliza pueden ser de distintas categorias.
-- -Los de primera categoria pueden ser hospitalizados en cualquier hospital.
-- -Los de segunda categoria pueden ser solo hospitalizados en hospitales propios.
-- -Las otras categorias no tienen derecho a hospitalizacion, se requiere guardar todos los asegurados.
-- -Saber en que hospitales han estado hospitalizados los asegurados, el medico, fechas de inicio y fin de la misma.
-- -Los hospitales concesionados tienen que estas asegurados a una unica area.
-- -Los hospitales propios no estan asignados a areas.
-- -Los medicos tienen un unico jefe.

