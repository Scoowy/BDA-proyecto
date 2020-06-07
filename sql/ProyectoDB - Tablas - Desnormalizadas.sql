/*
* Laboratorio 1.1
* Grupo: DBJ
* Diseño físico - Creacion de tablas desnormalizadas
* Integrantes: Luisa Bermeo, Juan Gahona, David Paredes y Daniel Ulloa
* Fecha: 06-jun-2020
*/

-- Creacion de las tablas
CREATE TABLE tipo_producto (
    id_tipo  NUMBER(4) PRIMARY KEY,
    tipo     VARCHAR2(80 CHAR) NOT NULL
);

CREATE TABLE marca_producto (
    id_marca  NUMBER(4) PRIMARY KEY,
    marca     VARCHAR2(120 CHAR) NOT NULL
);

CREATE TABLE producto (
    id_producto  NUMBER(4) PRIMARY KEY,
    nombre       VARCHAR2(120 CHAR) NOT NULL,
    tipo         NUMBER(4),
    marca        NUMBER(4),
    CONSTRAINT fk_prod_tipo FOREIGN KEY ( tipo )
        REFERENCES tipo_producto ( id_tipo )
            ON DELETE SET NULL,
    CONSTRAINT fk_prod_marc FOREIGN KEY ( marca )
        REFERENCES marca_producto ( id_marca )
            ON DELETE SET NULL
);

CREATE TABLE usuario (
    dni        VARCHAR2(10 CHAR) PRIMARY KEY,
    nombres    VARCHAR2(80 CHAR) NOT NULL,
    apellidos  VARCHAR2(80 CHAR) NOT NULL,
    telefono   VARCHAR2(10 CHAR) NOT NULL,
    usuario    VARCHAR2(25 CHAR) NOT NULL,
    password   VARCHAR2(25 CHAR) NOT NULL,
    fecha_nac  DATE NOT NULL
);

CREATE TABLE solicitud (
    id_solicitud  NUMBER(5) PRIMARY KEY,
    cantidad      NUMBER(3) NOT NULL,
    fecha         DATE NOT NULL,
    cliente       VARCHAR2(10 CHAR) NOT NULL,
    producto      NUMBER(4) NOT NULL,
    estado        VARCHAR2(15) NOT NULL,
    CONSTRAINT fk_soli_usua FOREIGN KEY ( cliente )
        REFERENCES usuario ( dni )
            ON DELETE CASCADE,
    CONSTRAINT fk_soli_prod FOREIGN KEY ( producto )
        REFERENCES producto ( id_producto )
            ON DELETE CASCADE
);

CREATE TABLE direccion (
    id_direccion  NUMBER(4) PRIMARY KEY,
    calle_p       VARCHAR2(150 CHAR) NOT NULL,
    calle_s       VARCHAR2(150 CHAR) NOT NULL,
    referencia    VARCHAR2(150 CHAR) NOT NULL,
    ciudad        VARCHAR2(150 CHAR) NOT NULL
);

CREATE TABLE establecimiento (
    id_estab    NUMBER(4) PRIMARY KEY,
    nombre      VARCHAR2(150 CHAR) NOT NULL,
    estado      NUMBER(1) NOT NULL,
    url_img     VARCHAR2(255 CHAR) NULL,
    tipo_local  VARCHAR2(50 CHAR) NOT NULL,
    direccion   NUMBER(4) NOT NULL,
    CONSTRAINT fk_estab_dire FOREIGN KEY ( direccion )
        REFERENCES direccion ( id_direccion )
            ON DELETE CASCADE
);

CREATE TABLE gerente (
    dni              VARCHAR2(10 CHAR) PRIMARY KEY,
    ruc              VARCHAR2(13 CHAR) NOT NULL,
    establecimiento  NUMBER(4),
    CONSTRAINT fk_gere_usua FOREIGN KEY ( dni )
        REFERENCES usuario ( dni )
            ON DELETE CASCADE,
    CONSTRAINT fk_gere_estab FOREIGN KEY ( establecimiento )
        REFERENCES establecimiento ( id_estab )
            ON DELETE SET NULL
);

CREATE TABLE respuesta (
    establecimiento  NUMBER(4) NOT NULL,
    solicitud        NUMBER(5) NOT NULL,
    CONSTRAINT fk_resp_estab FOREIGN KEY ( establecimiento )
        REFERENCES establecimiento ( id_estab )
            ON DELETE CASCADE,
    CONSTRAINT fk_gere_soli FOREIGN KEY ( solicitud )
        REFERENCES solicitud ( id_solicitud )
            ON DELETE CASCADE
);

-- Eliminar tablas
DROP TABLE respuesta;

DROP TABLE gerente;

DROP TABLE establecimiento;

DROP TABLE direccion;

DROP TABLE solicitud;

DROP TABLE producto;

DROP TABLE tipo_producto;

DROP TABLE marca_producto;

DROP TABLE usuario;