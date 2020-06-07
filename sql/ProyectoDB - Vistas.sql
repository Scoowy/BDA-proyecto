/*
* Laboratorio 1.1
* Grupo: DBJ
* Diseño físico - Vistas
* Integrantes: Luisa Bermeo, Juan Gahona, David Paredes y Daniel Ulloa
* Fecha: 07-jun-2020
*/

-- Creamos la vista de pedidos pendientes que veran los gerentes de los estableciminetos
CREATE OR REPLACE VIEW view_pedidos_pendientes_dia AS
    SELECT
        soli.id_solicitud,
        prod.nombre producto,
        tpro.tipo,
        mpro.marca,
        soli.fecha,
        soli.estado
    FROM
             solicitud soli
        JOIN producto        prod ON soli.producto = prod.id_producto
        JOIN tipo_producto   tpro ON prod.tipo = tpro.id_tipo
        JOIN marca_producto  mpro ON prod.marca = mpro.id_marca
    WHERE
            soli.estado = 'PENDIENTE'
        AND to_char(soli.fecha, 'YYYY-MM-DD') = current_date
    ORDER BY
        soli.fecha DESC;


-- Creamos la vista de productos promedio pedidos entre dos fechas

CREATE OR REPLACE VIEW view_productos_pedidos AS
    SELECT
        prod.nombre              producto,
        AVG(soli.cantidad)       promedio
    FROM
             solicitud soli
        JOIN producto prod ON soli.producto = prod.id_producto
    WHERE
            soli.fecha >= 'YYYY-MM-DD'
        AND soli.fecha < 'YYYY-MM-DD'
    GROUP BY
        prod.nombre
    ORDER BY
        prod.nombre;