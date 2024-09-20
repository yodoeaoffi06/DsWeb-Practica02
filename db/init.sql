-- Crear la base de datos si no existe
CREATE DATABASE test_db;

-- Cambiar al esquema de la base de datos usuarios_db
\c test_db;

-- Crear la tabla de usuarios con restricciones
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY, 
    nombre VARCHAR(100) NOT NULL, 
    telefono VARCHAR(15) UNIQUE, 
    direccion TEXT, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);