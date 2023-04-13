
DROP TABLE Hospital ; 
DROP TABLE HospitalPropio ; 
DROP TABLE Poliza;
DROP TABLE Asegurados;
-- DROP TABLE HospitalConcesionado ;
-- DROP TABLE Zonas;
-- DROP TABLE Medico;


-- CREACION DE TABLAS DE LAS ENTIDADES
-- Tabla entidad Hospital: 
CREATE TABLE Hospital(
    id_hospt INT PRIMARY KEY NOT NULL,
    id_tipo INT NOT NULL,
    name_hospt VARCHAR(40) NOT NULL,
    tipo_serv VARCHAR(40) NOT NULL
);

-- Tabla entidad Propio:
CREATE TABLE HospitalPropio(
    presupuesto INT NOT NULL,
    servicio VARCHAR(40) NOT NULL,
    id_hospt INT PRIMARY KEY NOT NULL,
    FOREIGN KEY (id_hospt) REFERENCES Hospital(id_hospt) IF 
);
-- Tabla entidad Poliza: 
CREATE TABLE Poliza(
    id_poliza INT PRIMARY KEY NOT NULL,
    nombre_poli VARCHAR(40) NOT NULL,
    name VARCHAR(40) NOT NULL
    
);

CREATE TABLE Asegurados(
    id_poliza INT,
    tipo_categoria VARCHAR(40),
    FOREIGN KEY (id_poliza) REFERENCES Poliza(id_poliza)  
   

);

CREATE TABLE CAT_P(
    id_hospt INT NOT NULL,
    FOREIGN KEY (id_hospt) REFERENCES Hospital(id_hospt)


);

CREATE TABLE CAT_S(
    id_hospt int NOT NULL,
    FOREIGN KEY (id_hospt) REFERENCES HospitalPropio(id_hospt),

);


CREATE TABLE HospitalConcesionado();

CREATE TABLE Zonas();

CREATE TABLE Medico();

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



-- Analisis del Modelo Relacional de BD en Hospital Pregunta 1 Tarea 1.
-- Entidades: Hospital, 
--            Poliza, 
--            HospitalPropio, 
--            HospitalConcesionado, 
--            Asegurados, 
--            Zonas, 
--            Medico.  
--            Primera Categoria
--            Segunda Categoria
-- Relaciones: 
-- -Hospitales pueden ser Propios o Concesionados.
    -- 1:1, Un hospital puede ser propio o concesionado no nos dos al mismo tiempo
    
-- -Una poliza cubre varios asegurados,
    -- 1:N, ya que una poliza cubre a varios asegurados, pero los asegurados solo tienen una poliza

-- -Los asegurados cubiertos por una misma poliza pueden ser de distintas categorias.
    -- 
-- -Los de primera categoria pueden ser hospitalizados en cualquier hospital.
-- -Los de segunda categoria pueden ser solo hospitalizados en hospitales propios.
-- -Las otras categorias no tienen derecho a hospitalizacion, se requiere guardar todos los asegurados.
-- -Saber en que hospitales han estado hospitalizados los asegurados, el medico, fechas de inicio y fin de la misma.
-- -Los hospitales concesionados tienen que estas asegurados a una unica area.
-- -Los hospitales propios no estan asignados a areas.
-- -Los medicos tienen un unico jefe.

