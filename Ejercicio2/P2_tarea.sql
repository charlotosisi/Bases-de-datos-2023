DROP TABLE IF EXISTS Sucursal;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Proveedor;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Inventario;
DROP TABLE IF EXISTS Compra;


-- Entidad Sucursal
CREATE TABLE Sucursal (
    id_sucursal INT PRIMARY KEY NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono INT NOT NULL

);

-- Entidad Empleado
CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono INT NOT NULL,
    id_sucursal INT ,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)

);

-- Entidad Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono INT NOT NULL

);

-- Entidad Proveedor
CREATE TABLE Proveedor(
    id_proveedor INT PRIMARY KEY NOT NULL    

);

-- Entidad Categoria
CREATE TABLE Categoria(
    id_categoria INT PRIMARY KEY NOT NULL,
    descripcion TEXT NOT NULL

);


-- Entidad Producto
CREATE TABLE Producto (
    id_proveedor INT,
    id_producto INT PRIMARY KEY NOT NULL,
    id_categoria INT,
    precio INT NOT NULL,    
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);


-- Entidad Inventario
CREATE TABLE Inventario(
    id_sucursal INT,
    id_proveedor INT,
    id_producto INT,
    id_categoria INT,
    cantidad_producto INT NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria) 
    

);

-- Entidad Compra
CREATE TABLE Compra (
    id_compra INT PRIMARY KEY NOT NULL,
    id_producto INT,
    id_cliente INT,
    id_empleado INT,
    id_sucursal INT,
    fecha DATE NOT NULL,
    cantidad_producto INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)


);








