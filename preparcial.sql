CREATE DATABASE PREPARCIAL;
USE PREPARCIAL;
-- 1. Crear tabla de Categorías
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- 2. Crear tabla de Productos
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2),
    stock INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

-- 3. Crear tabla de Clientes
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(20)
);

-- 4. Crear tabla de Pedidos
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);
-- Insertar categorías
INSERT INTO Categoria (nombre) VALUES 
('Electrónica'), ('Hogar'), ('Juguetería'), ('Ropa'), ('Deportes');

-- Insertar productos
INSERT INTO Producto (nombre, precio, stock, id_categoria) VALUES 
('Televisor', 500.00, 10, 1),
('Licuadora', 80.50, 20, 2),
('Bicicleta', 300.99, 5, 5),
('Camiseta', 15.00, 50, 4),
('Muñeca', 25.00, 30, 3);

-- Insertar clientes
INSERT INTO Cliente (nombre, correo, telefono) VALUES 
('Ana Pérez', 'ana@gmail.com', '1234567890'),
('Luis Gómez', 'luis@gmail.com', '2345678901'),
('Sofía Luna', 'sofia@gmail.com', '3456789012'),
('Carlos Díaz', 'carlos@gmail.com', '4567890123'),
('Laura Rey', 'laura@gmail.com', '5678901234');

-- Insertar pedidos
INSERT INTO Pedido (id_cliente, id_producto, cantidad, fecha) VALUES 
(1, 1, 1, '2025-04-01'),
(2, 3, 2, '2025-04-02'),
(3, 2, 1, '2025-04-03'),
(4, 4, 3, '2025-04-04'),
(5, 5, 2, '2025-04-05');
DELIMITER $$
CREATE TRIGGER temu AFTER INSERT ON PEDIDO FOR EACH ROW
BEGIN 
UPDATE PRODUCTO
SET STOCK=STOCK-NEW.CANTIDAD
WHERE ID_PRODUCTO=NEW.ID_PRODUCTO;
END $$
DELIMITER ;
SELECT * FROM PRODUCTO;
INSERT INTO Pedido (id_cliente, id_producto, cantidad, fecha) VALUES 
(1, 1, 1, '2025-04-01');
SELECT * FROM pedido;
select producto.nombre,count(cantidad) from pedido 
inner join producto
group by producto.nombre