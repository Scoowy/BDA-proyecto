/*
* Laboratorio 1.1
* Grupo: DBJ
* Diseño físico - Creacion de tablas
* Integrantes: Luisa Bermeo, Juan Gahona, David Paredes y Daniel Ulloa
* Fecha: 01-jun-2020
*/

-- Creacion de las tablas
CREATE TABLE tipoprod (
    id_tipo  NUMBER(4),
    tipo     VARCHAR2(80) NOT NULL,
    CONSTRAINT pk_tipoprod PRIMARY KEY ( id_tipo )
);

CREATE TABLE marcaprod (
    id_marca  NUMBER(4),
    marca     VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_marcaprod PRIMARY KEY ( id_marca )
);

CREATE TABLE estadosol (
    id_estado  NUMBER(1),
    estado     VARCHAR2(15),
    CONSTRAINT pk_estadosol PRIMARY KEY ( id_estado )
);

CREATE TABLE producto (
    id_producto  NUMBER(4),
    nombre       VARCHAR2(120) NOT NULL,
    tipo         NUMBER(4) NOT NULL,
    marca        NUMBER(4) NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY ( id_producto ),
    CONSTRAINT fk_prod_tipo FOREIGN KEY ( tipo )
        REFERENCES tipoprod ( id_tipo ),
    CONSTRAINT fk_prod_marc FOREIGN KEY ( marca )
        REFERENCES marcaprod ( id_marca )
);

CREATE TABLE solicitud (
    id_solicitud      NUMBER(4),
    cantidad          NUMBER(3),
    producto          NUMBER(4),
    estado            NUMBER(1),
    establecimientos  VARCHAR2(255),
    CONSTRAINT pk_solicitud PRIMARY KEY ( id_solicitud ),
    CONSTRAINT fk_soli_prod FOREIGN KEY ( producto )
        REFERENCES producto ( id_producto ),
    CONSTRAINT fk_soli_esta FOREIGN KEY ( estado )
        REFERENCES estadosol ( id_estado )
);

CREATE TABLE usuario (
    dni        VARCHAR2(13),
    nombres    VARCHAR2(80) NOT NULL,
    apellidos  VARCHAR2(80) NOT NULL,
    fechanac   DATE NOT NULL,
    telefono   VARCHAR2(10) NOT NULL,
    usuario    VARCHAR2(25) NOT NULL,
    password   VARCHAR2(25) NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY ( dni )
);

CREATE TABLE solicitudes (
    cliente    VARCHAR2(13),
    solicitud  NUMBER(4),
    CONSTRAINT pk_soliitudes PRIMARY KEY ( cliente,
                                           solicitud ),
    CONSTRAINT fk_soli_cli FOREIGN KEY ( cliente )
        REFERENCES usuario ( dni ),
    CONSTRAINT fk_sols_soli FOREIGN KEY ( solicitud )
        REFERENCES solicitud ( id_solicitud )
);

CREATE TABLE direccion (
    id_direccion  NUMBER(4),
    calle_p       VARCHAR2(150) NOT NULL,
    calle_s       VARCHAR2(150) NOT NULL,
    referencia    VARCHAR2(150),
    ciudad        VARCHAR(150) NOT NULL,
    CONSTRAINT pk_direccion PRIMARY KEY ( id_direccion )
);

CREATE TABLE establecimiento (
    id_estab    NUMBER(4),
    nombre      VARCHAR2(150) NOT NULL,
    tipo_local  VARCHAR2(50) NOT NULL,
    url_imagen  VARCHAR2(255),
    direccion   NUMBER(4) NOT NULL,
    CONSTRAINT pk_local PRIMARY KEY ( id_estab ),
    CONSTRAINT fk_loca_dire FOREIGN KEY ( direccion )
        REFERENCES direccion ( id_direccion )
);

CREATE TABLE gerente (
    ruc              VARCHAR2(13),
    establecimiento  NUMBER(4) NOT NULL,
    CONSTRAINT pk_gerente PRIMARY KEY ( ruc ),
    CONSTRAINT fk_gere_user FOREIGN KEY ( ruc )
        REFERENCES usuario ( dni ),
    CONSTRAINT fk_gere_loca FOREIGN KEY ( establecimiento )
        REFERENCES establecimiento ( id_estab )
);