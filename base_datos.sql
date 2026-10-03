-- =====================================================
-- BASE DE DATOS SIMULADA - PROYECTO EcoMedellín ♻️
-- Ingeniería de Software I - Politécnico Grancolombiano
-- Equipo EcoMedellín – Proyecto Ingeniería de Software I
-- Fecha: Octubre 2025
-- =====================================================

-- CREACIÓN DE BASE DE DATOS
CREATE DATABASE eco_medellin;
USE eco_medellin;

-- =====================================================
-- TABLA: usuarios
-- =====================================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    tipo ENUM('usuario','recolector','admin') DEFAULT 'usuario',
    localidad VARCHAR(100),
    puntos INT DEFAULT 0
);

-- =====================================================
-- TABLA: solicitudes
-- =====================================================
CREATE TABLE solicitudes (
    id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    tipo_residuo ENUM('Reciclable','Organico','Peligroso') NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    fecha DATE NOT NULL,
    estado ENUM('Pendiente','Recolectado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- =====================================================
-- TABLA: historial_recolecciones
-- =====================================================
CREATE TABLE historial_recolecciones (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    tipo_residuo ENUM('Reciclable','Organico','Peligroso'),
    direccion VARCHAR(150),
    fecha DATE,
    peso_kg DECIMAL(5,2),
    puntos_generados INT,
    estado ENUM('Pendiente','Recolectado'),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- =====================================================
-- TABLA: canjes
-- =====================================================
CREATE TABLE canjes (
    id_canje INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    producto VARCHAR(100),
    puntos_requeridos INT,
    fecha_canje DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- =====================================================
-- VISTA: resumen_recolecciones
-- =====================================================
CREATE VIEW resumen_recolecciones AS
SELECT 
    u.nombre AS usuario,
    s.tipo_residuo,
    COUNT(s.id_solicitud) AS total_solicitudes,
    SUM(h.peso_kg) AS total_kg,
    SUM(h.puntos_generados) AS puntos_acumulados
FROM usuarios u
LEFT JOIN solicitudes s ON u.id_usuario = s.id_usuario
LEFT JOIN historial_recolecciones h ON u.id_usuario = h.id_usuario
GROUP BY u.nombre, s.tipo_residuo;

-- =====================================================
-- DATOS DE PRUEBA
-- =====================================================
INSERT INTO usuarios (nombre, correo, contrasena, tipo, localidad, puntos) VALUES
('Administrador', 'admin@eco.com', '1234', 'admin', 'Sede Medellín', 0),
('Recolector Medellín', 'recolector@eco.com', '1234', 'recolector', 'Centro', 0),
('Usuario Demo', 'demo@eco.com', 'demo', 'usuario', 'Laureles', 20);

INSERT INTO solicitudes (id_usuario, tipo_residuo, direccion, fecha, estado) VALUES
(3, 'Reciclable', 'Calle 45 #80-23', '2025-10-12', 'Pendiente'),
(3, 'Organico', 'Carrera 78 #12-90', '2025-10-14', 'Pendiente');

INSERT INTO historial_recolecciones (id_usuario, tipo_residuo, direccion, fecha, peso_kg, puntos_generados, estado) VALUES
(3, 'Reciclable', 'Calle 45 #80-23', '2025-09-25', 5.0, 10, 'Recolectado'),
(3, 'Organico', 'Carrera 78 #12-90', '2025-09-28', 3.0, 5, 'Recolectado');
