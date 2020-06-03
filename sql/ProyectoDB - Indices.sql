/*
* Laboratorio 1.1
* Grupo: DBJ
* Diseño físico - Índices
* Integrantes: Luisa Bermeo, Juan Gahona, David Paredes y Daniel Ulloa
* Fecha: 01-jun-2020
*/
CREATE INDEX usuario_nombres_idx ON
    usuario (
        nombres
    );

CREATE INDEX usuario_apellidos_idx ON
    usuario (
        apellidos
    );

CREATE INDEX usuario_telefono_idx ON
    usuario (
        telefono
    );

CREATE INDEX usuario_usuario_idx ON
    usuario (
        usuario
    );

CREATE INDEX establecimiento_nombre_idx ON
    establecimiento (
        nombre
    );

CREATE INDEX producto_nombre_idx ON
    producto (
        nombre
    );