
DROP TABLE IF EXISTS Hospital;
DROP TABLE IF EXISTS HospitalPropio ;
DROP TABLE IF EXISTS Poliza;
DROP TABLE IF EXISTS Asegurados;
DROP TABLE IF EXISTS HospitalConcesionado ;
DROP TABLE IF EXISTS Zonas;
DROP TABLE IF EXISTS CAT_P;
DROP TABLE IF EXISTS CAT_S;
DROP TABLE IF EXISTS Medico;


-- CREACION DE TABLAS DE LAS ENTIDADES
-- Tabla entidad Hospital: listo
CREATE TABLE Hospital(
    codigo_hospt INT PRIMARY KEY NOT NULL,
    name_hospt VARCHAR(40),
    numero_camas INT NOT NULL,
    tipo_hospital TEXT NOT NULL -- (si es propio o concesionado)

);

-- Tabla entidad Hospital Propio:
CREATE TABLE HospitalPropio(
    presupuesto INT NOT NULL,
    servicio VARCHAR(40) NOT NULL,
    codigo_hospt INT PRIMARY KEY NOT NULL,    
    FOREIGN KEY (codigo_hospt) REFERENCES Hospital(codigo_hospt)
    
);

-- Tabla Hospital Concesionado
CREATE TABLE HospitalConcesionado(
    codigo_zona INT PRIMARY KEY NOT NULL,
    codigo_hospt INT NOT NULL,
    FOREIGN KEY (codigo_hospt) REFERENCES Hospital(codigo_hospt),
    FOREIGN KEY (codigo_zona) REFERENCES Zonas(codigo_zona)
    

);

-- Tabla entidad Poliza: 
CREATE TABLE Poliza(
    id_poliza INT PRIMARY KEY NOT NULL,
    nombre_poliza VARCHAR(40) NOT NULL,
    name_poliza VARCHAR(40) NOT NULL
    
);

-- Tabla Asegurados
CREATE TABLE Asegurados(
    id_asegurado INT PRIMARY KEY NOT NULL,
    id_poliza INT,
    nombre VARCHAR(40),
    fecha_nacimiento VARCHAR(40),
    categoria VARCHAR(40),
    FOREIGN KEY (id_poliza) REFERENCES Poliza(id_poliza)  
   
);
-- Tabla categoria primaria
CREATE TABLE CAT_P(
    codigo_hospt INT NOT NULL,
    FOREIGN KEY (codigo_hospt) REFERENCES Hospital(id_hospt)

);
-- Tabla categoria secundaria
CREATE TABLE CAT_S(
    id_hospt int NOT NULL,
    codigo_zona INT NOT NULL,
    FOREIGN KEY (codigo_zona) REFERENCES Zonas(codigo_zona),
    FOREIGN KEY (id_hospt) REFERENCES HospitalPropio(id_hospt)

);
-- Tabla zonas
CREATE TABLE Zonas(
    codigo_zona INT PRIMARY KEY NOT NULL,
    superficie INT NOT NULL,
    num_habitantes INT NOT NULL

);
-- Tabla Medico
CREATE TABLE Medico(
    id_medico INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    telefono_contacto INT NOT NULL,
    id_jefe INT NOT NULL,
    FOREIGN KEY (id_jefe) REFERENCES Medico(id_medico) ON DELETE SET NULL
);

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

