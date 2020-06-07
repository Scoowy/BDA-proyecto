/*
* Laboratorio 1.1
* Grupo: DBJ
* Diseño físico - Tablespace
* Integrantes: Luisa Bermeo, Juan Gahona, David Paredes y Daniel Ulloa
* Fecha: 03-jun-2020
*/

-- USUARIO: SYS

-- Crear tablespace para el proyecto
CREATE TABLESPACE tbs_findit DATAFILE
    'C:/ORACLEXE/APP/ORACLE/ORADATA/XE/PROYECTO_FIND_IT.DBF' SIZE 2048M
EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

-- Creamos el usuario gestor de la aplicación

CREATE USER admin_app IDENTIFIED BY "admin"
    DEFAULT TABLESPACE tbs_findit;

-- Creamos el usurio aplicacion

CREATE USER app_findit IDENTIFIED BY "app_findit"
    DEFAULT TABLESPACE tbs_findit;


-- Dar permisos de conexion y de recursos

GRANT connect, resource TO admin_app, app_findit;

GRANT
    CREATE VIEW
TO admin_app;



-- ADMIN_APP
-- Damos permisos de SELECT, INSERT, UPDATE sobre las tablas

GRANT SELECT, INSERT, UPDATE ON usuario TO app_findit;

GRANT SELECT, INSERT, UPDATE ON solicitud TO app_findit;

GRANT SELECT, INSERT, UPDATE ON producto TO app_findit;

GRANT SELECT, INSERT, UPDATE ON gerente TO app_findit;