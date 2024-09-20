# Usamos la imagen oficial de PostgreSQL
FROM postgres:latest

# Configuramos la contraseña y el usuario
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Copiamos el script SQL para crear la tabla al contenedor
COPY init.sql /docker-entrypoint-initdb.d/

# Exponemos el puerto 5432 para conexiones externas
EXPOSE 5432
