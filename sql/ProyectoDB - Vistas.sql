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
CREATE USER admin_app IDENTIFIED BY "admin" DEFAULT TABLESPACE tbs_findit;

-- Creamos el usurio aplicacion
CREATE USER app_findit IDENTIFIED BY "app_findit" DEFAULT TABLESPACE tbs_findit;


-- Dar permisos de conexion y de recursos
GRANT connect, resource TO admin_app, app_findit;
GRANT CREATE VIEW TO admin_app;




-- ADMIN_APP
-- Damos permisos de SELECT, INSERT, UPDATE sobre las tablas
GRANT SELECT, INSERT, UPDATE ON usuario TO app_findit;

GRANT SELECT, INSERT, UPDATE ON solicitud TO app_findit;

GRANT SELECT, INSERT, UPDATE ON producto TO app_findit;

GRANT SELECT, INSERT, UPDATE ON gerente TO app_findit;

-- Creamos la vista de pedidos pendientes que veran los gerentes de los estableciminetos

CREATE OR REPLACE VIEW view_pedidos_pendientes AS
    SELECT
        s.id_solicitud,
        s.cantidad,
        s.fecha,
        p.nombre,
        m.marca
    FROM
             solicitudes ss
        JOIN solicitud  s ON ss.solicitud = s.id_solicitud
        JOIN producto   p ON s.producto = p.id_producto
        JOIN marcaprod  m ON p.marca = m.id_marca
    WHERE
            to_char(s.fecha, 'YYYY-MM-DD') = current_date
        AND s.estado = 'PENDIENTE'
    ORDER BY
        s.fecha ASC;
        
-- Le doy permiso de lectura a al usuario app_findit a la vista

GRANT SELECT ON view_pedidos_pendientes TO app_findit;

CREATE OR REPLACE VIEW view_establecimientos_respuesta AS
    SELECT
        *
    FROM
             solicitudes ss
        JOIN solicitud        s ON ss.solicitud = s.id_solicitud
        JOIN estadosol        e ON s.estado = e.id_estado
        JOIN establecimiento  eb ON s.establecimientos = eb.id_estab
        JOIN direccion        d ON eb.direccion = d.id_direccion
    WHERE
            e.estado = 'ACEPTADO'
        AND eb.id_estab IN (
            SELECT
                *
            FROM
                TABLE ( split(s.establecimientos, ',') )
        );

CREATE OR REPLACE VIEW view_establecimientos_respuesta AS
    SELECT
        *
    FROM
             solicitudes ss
        JOIN solicitud        s ON ss.solicitud = s.id_solicitud
        JOIN estadosol        e ON s.estado = e.id_estado
        JOIN establecimiento  eb ON s.
        JOIN direccion        d ON eb.direccion = d.id_direccion
    WHERE
        e.estado = 'ACEPTADO';
        
SELECT es.nombre FROM establecimiento es JOIN TABLE(split('0,4,5', ',')) ON es.id_estab = column_value; 
        
-- ORACLE no tine SPLIT y creamos un funcion que la remplaza
-- https://livesql.oracle.com/apex/livesql/file/content_CAW2063JL0BJZLV392N4I2Q6Y.html

CREATE OR REPLACE FUNCTION split (
    i_str        IN  VARCHAR2,
    i_delimiter  IN  VARCHAR2 DEFAULT ','
) RETURN sys.odcivarchar2list
    PIPELINED
AS
    l_current_string  VARCHAR2(4000) := i_str;
    l_pos             BINARY_INTEGER;
BEGIN
    IF i_str IS NULL THEN
        return;
    END IF;
    LOOP
        l_pos := nullif(instr(l_current_string, i_delimiter), 0);
        PIPE ROW ( substr(l_current_string, 1, nvl(l_pos - 1, length(l_current_string))) );

        EXIT WHEN l_pos IS NULL;
        l_current_string := substr(l_current_string, l_pos + length(i_delimiter));
    END LOOP;

END split;