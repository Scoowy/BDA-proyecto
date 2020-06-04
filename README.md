# Proyecto 1er Bimestre
Proyecto IB de la materia de Base de Datos Avanzadas
## Información del proyecto
### Grupo:
JDB
### Integrantes:
  - Luisa Bermeo
  - Juan Gahona
  - David Paredes
  - Daniel Ulloa

### Título
Gestión de tiendas comerciales. 

# Laboratorio 1.1
## Descripción del problema 
A causa de la pandemia mundial nos hemos visto obligados a entrar en confinamiento, evitando salir para cumplir con las disposiciones gubernamentales ante esta amenaza sanitaria; pero población necesita diversos productos que con el paso de los días se van agotando y el salir en búsqueda de los mismos es un riesgo tanto para el representante del hogar como para la familia.
Ante esta situación pretendemos crear una plataforma donde los usuarios puedan buscar los productos que necesiten, una vez ingresado el nombre del producto se enlistan los diferentes locales comerciales que tengan dicho producto para que el usuario no malgaste tiempo buscando y de esa manera evitar un posible contagio y pueda abastecerse de manera eficiente.

## Detalle de requisitos de datos
Para la desarrollo de este proyecto se requiere diferente tipo de datos, almacenar información de clientes y gerentes de las empresas; la información básica requerida contaría de nombre, apellido, fecha de nacimiento, teléfono, un usuario y contraseña para poder acceder al sistema. Un medio de diferenciación entre cliente y gerente sería que el gerente consta en un establecimiento y el usuario genera una solicitud de producto.

El establecimiento debe pertenecer a un gerente, además de tener información como el nombre, el tipo de local, dirección y un URL donde conste la imagen del lugar. En cuanto la dirección deberá constar el nombre de la calle principal y secundaria, la ciudad y una referencia para ubicar al local de manera eficiente.

Para un correcto manejo de los productos y para facilitar la búsqueda de los mismos se pide un nombre, marca y tipo; de esta manera el cliente al buscar, podrá catalogar los productos según sus preferencias.

Finalmente para asegurar la integridad de la información y la existencia del producto, se necesita acceder al aplicativo primero y luego hacer una solicitud donde conste la cantidad que el cliente desea adquirir, además del estado de la misma. 

## Diseño conceptual
### Diagrama Entidad-Relación
![Modelo Entidad-Relación](https://github.com/Scoowy/BDA-proyecto/blob/master/images/Proyecto%20IB%20BDA%20-%20Modelo%20EntidadRelaci%C3%B3n.png)

### Diccionario de datos
| NOMBRE   TABLA  | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                    |
|-----------------|-----------------|--------|--------------|--------------|-------------------------------------------------------------------|---------------------------------------------|
| TipoProducto    | idProducto      | 4      | integer      | PK           | Llave   primaria para identificar el tipo de producto             | Producto                                    |
|                 | tipo            | 80     | varchar      |              | Nombre   del tipo de producto                                     |                                             |
| NOMBRE   TABLA  | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                    |
| MarcaProducto   | idMarca         | 4      | integer      | PK           | Llave   primaria que establece el id de la marca                  | Producto                                    |
|                 | marca           | 120    | varchar      |              | Nombre   de la marca                                              |                                             |
| NOMBRE   TABLA  | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON TABLA(S)…                      |
| EstadoSolicitud | idEstado        | 1      | integer      | PK           | Llave   primaria que identifica el estado de la solicitud         | Solicitud                                   |
|                 | estado          | 15     | varchar      |              | Hace   referencia al estado de la solicitud                       |                                             |
| NOMBRE   TABLA  | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                    |
| Producto        | idProducto      | 4      | integer      | PK           | Llave   primaria para identificar los productos                   | Solicitud,   Marca producto, Tipo Producto  |
|                 | nombre          | 150    | varchar      |              | Nombre   del producto                                             |                                             |
| NOMBRE   TABLA  | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON TABLA(S)…                      |
| Solicitud       | idSolicitud     | 4      | integer      | PK           | Llave   primaria de la solicit                                    | Cliente,   EstadoSolicitud, Establecimiento |
|                 | cantidad        | 3      | integer      |              | Hace   refencia a la cantidad de productos que el usuario desee   |                                             |
|                 | fecha           |        | date         |              | Hace   refencia a la fecha que se realiza la solicitud el usuario |                                             |
| NOMBRE   TABLA  | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                    |
| Usuario         | dni             | 13     | integer      | PK           | Hace   referencia a la cédula del usuario                         | Cliente,   Gerente                          |
|                 | nombres         | 50     | varchar      |              | Detalla   el nombre del usuario                                   |                                             |
|                 | apellidos       | 50     | varchar      |              | Detalla   el apellido del usuario                                 |                                             |
|                 | fechaNac        |        | date         |              | Hace   referencia ha la fecha de naciento del usuario             |                                             |
|                 | telefono        | 25     | varchar      |              | Hace   refencia al numero de contacto del usuario                 |                                             |
|                 | usuario         | 25     | varchar      |              | Hace   referencia al user name para el login                      |                                             |
|                 | password        | 25     | varchar      |              | Hace   referancia a la clave del username                         |                                             |
| NOMBRE   TABLA  | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                    |
| Dirección       | idDirección     | 4      | integer      | PK           | Llave   primaria que identificar la direccion de cada local       | Establecimietno                             |
|                 | callePrincipal  | 150    | varchar      |              | Hace   referencia a la calle principal de la ubicación del local  |                                             |
|                 | calleSecundaria | 150    | varchar      |              | Hace   refencia a la calle secundaria de la ubicación del local   |                                             |
|                 | referencia      | 150    | varchar      |              | Establece   una referencia de la ubicación del local              |                                             |
|                 | ciudad          | 150    | varchar      |              | Hace   referncia a la ciudad donde se encuantra el local          |                                             |
| NOMBRE   TABLA  | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON TABLA(S)…                      |
| Gerente         |                 |        |              |              |                                                                   | Usuario,   Establecimiento                  |
| NOMBRE TABLA    | CAMPO           | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN   CON TABLA(S)…                    |
| Cliente         |                 |        |              |              |                                                                   | Usuario,   Solicitud                        |

## Diseño lógico
### Diagrama Relacional
![Modelo Relaciona](https://github.com/Scoowy/BDA-proyecto/blob/master/images/Proyecto%20IB%20BDA%20-%20Modelo%20Relacional.png)

### Diccionario de datos
| NOMBRE   TABLA  | CAMPO             | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                         |
|-----------------|-------------------|--------|--------------|--------------|-------------------------------------------------------------------|--------------------------------------------------|
| TipoProducto    | idTipo            | 4      | integer      | PK           | Llave   primaria para identificar el tipo de producto             | Producto                                         |
|                 | tipo              | 80     | varchar      |              | Nombre   del tipo de producto                                     |                                                  |
| NOMBRE   TABLA  | CAMPO             | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                         |
| MarcaProducto   | idMarca           | 4      | integer      | PK           | Llave   primaria que establece el id de la marca                  | Producto                                         |
|                 | marca             | 80     | varchar      |              | Nombre   de la marca                                              |                                                  |
| NOMBRE   TABLA  | CAMPO             | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN   CON TABLA(S)…                         |
| EstadoSolicitud | idEstado          | 1      | integer      | PK           | Llave   primaria que identifica el estado de la solicitud         | Solicitud                                        |
|                 | estado            | 15     | varchar      |              | Hace   referencia al estado de la solicitud                       |                                                  |
| NOMBRE   TABLA  | CAMPO             | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                         |
| Producto        | idProducto        | 4      | integer      | PK           | Llave   primaria para identificar los productos                   | Solicitud, Marca   Producto, Tipo Producto       |
|                 | nombre            | 150    | varchar      |              | Nombre   del producto                                             |                                                  |
|                 | tipo              | 120    | varchar      | FK           | Hace   referencia al tipo de producto                             |                                                  |
|                 | marca             | 80     | varchar      | FK           | Establece   la marca del producto                                 |                                                  |
| NOMBRE   TABLA  | CAMPO             | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                         |
| Solicitud       | idSolicitud       | 4      | integer      | PK           | Llave   primaria de la solicitud                                  | Solicitudes, Estado   Solicitud, Establecimiento |
|                 | cantidad          | 3      | integer      |              | Hace   refencia a la cantidad de productos que el usuario desee   |                                                  |
|                 | producto          | 4      | integer      | FK           | Hace   referencia a la informacion del producto                   |                                                  |
|                 | estado            | 4      | integer      | FK           | Hace referencia a   la informacion del estado                     |                                                  |
|                 | fecha             |        | date         | FK           | Hace   refencia a la fecha que se realiza la solicitud el usuario |                                                  |
|                 | establecimientos  | 255    | varchar      |              | Hace   referencia a la solicitud de un establecimiento            |                                                  |
| NOMBRE   TABLA  | CAMPO             | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                         |
| Usuario         | dni               | 13     | varchar      | PK           | Hace   refencia a la cedula del usuario                           | Gerente,   Solicitudes                           |
|                 | nombre            | 50     | varchar      |              | Hace   referencia al nombre del usuario                           |                                                  |
|                 | apellidos         | 50     | varchar      |              | Hace   refencia al apellido del usuario                           |                                                  |
|                 | fechaNac          |        | date         |              | Hace   referencia ha la fecha de naciento del usuario             |                                                  |
|                 | telefono          | 9      | integer      |              | Hace   refencia al numero de contacto del usuario                 |                                                  |
|                 | usuario           | 25     | varchar      |              | Hace   referencia al user name para el login                      |                                                  |
|                 | password          | 25     | varchar      |              | Hace   referancia a la clave del username                         |                                                  |
| NOMBRE   TABLA  | CAMPO             | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                         |
| Direccion       | idDireccion       | 4      | integer      | PK           | Llave   primaria que identificar la direccion de cada local       | Establecimiento                                  |
|                 | callePrincipal    | 150    | varchar      |              | Hace   referencia a la calle principal de la ubicación del local  |                                                  |
|                 | calleSecundaria   | 150    | varchar      |              | Hace   refencia a la calle secundaria de la ubicación del local   |                                                  |
|                 | referencia        | 150    | varchar      |              | Establece   una referencia de la ubicación del local              |                                                  |
|                 | ciudad            | 150    | varchar      |              | Hace   referencia a la ciudad donde se encuantra el local         |                                                  |
| NOMBRE   TABLA  | CAMPO             | TAMAÑO | TIPO DE DATO | ORGANIZACIÓN | DESCRIPCIÓN                                                       | RELACIÓN CON   TABLA(S)…                         |
| Gerente         | ruc               | 13     | integer      | PK           | Llave   primaria de la tabla para identificar el gerente          | Usuario,   Establecimiento                       |
|                 | local             | 4      | integer      | FK           | Hace   referencia al identificativo del Local                     |                                                  |

## Diseño físico
### Traducción modelo lógico a SGBD (DDL)
#### Tabla TipoProducto
```sql
CREATE TABLE tipoprod (
    id_tipo  NUMBER(4),
    tipo     VARCHAR2(80) NOT NULL,
    CONSTRAINT pk_tipoprod PRIMARY KEY ( id_tipo )
);
```

#### Tabla MarcaProducto
```sql
CREATE TABLE marcaprod (
    id_marca  NUMBER(4),
    marca     VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_marcaprod PRIMARY KEY ( id_marca )
);
```

#### Tabla EstadoSolicitud
```sql
CREATE TABLE estadosol (
    id_estado  NUMBER(1),
    estado     VARCHAR2(15),
    CONSTRAINT pk_estadosol PRIMARY KEY ( id_estado )
);
```

#### Tabla Producto
```sql
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
```

#### Tabla Solicitud
```sql
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
```

#### Tabla Usuario
```sql
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
```

#### Tabla Solicitudes
```sql
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
```

#### Tabla Direccion
```sql
CREATE TABLE direccion (
    id_direccion  NUMBER(4),
    calle_p       VARCHAR2(150) NOT NULL,
    calle_s       VARCHAR2(150) NOT NULL,
    referencia    VARCHAR2(150),
    ciudad        VARCHAR(150) NOT NULL,
    CONSTRAINT pk_direccion PRIMARY KEY ( id_direccion )
);
```

#### Tabla Establecimiento
```sql
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
```

#### Tabla Gerente
```sql
CREATE TABLE gerente (
    ruc              VARCHAR2(13),
    establecimiento  NUMBER(4) NOT NULL,
    CONSTRAINT pk_gerente PRIMARY KEY ( ruc ),
    CONSTRAINT fk_gere_user FOREIGN KEY ( ruc )
        REFERENCES usuario ( dni ),
    CONSTRAINT fk_gere_loca FOREIGN KEY ( establecimiento )
        REFERENCES establecimiento ( id_estab )
);
```
### Análisis transaccional
#### Transacciones

| ID | Transacción                                                                                           | Tipo          |
|----|-------------------------------------------------------------------------------------------------------|---------------|
| A  | Administrar usuarios                                                                                  | Actualización |
| B  | Administrar gerentes                                                                                  | Actualización |
| C  | Administrar establecimientos                                                                          | Actualización |
| D  | Administrar productos                                                                                 | Actualización |
| E  | Actualizar estado del pedido                                                                          | Actualización |
| F  | Registrar nuevo gerente                                                                               | Actualización |
| G  | Registrar nuevo producto                                                                              | Actualización |
| H  | Realizar nuevo pedido con producto existente                                                          | Actualización |
| I  | Realizar nuevo pedido con producto nuevo                                                              | Actualización |
| J  | Registrar nuevo usuario                                                                               | Actualización |
| K  | Listar establecimientos abiertos                                                                      | Consulta      |
| L  | Listar los establecimientos ubicados en una calle en particular                                       | Consulta      |
| M  | Listar los pedidos realizados por un usuario                                                          | Consulta      |
| N  | Listar los pedidos pendientes                                                                         | Consulta      |
| O  | Listar los pedidos completos                                                                          | Consulta      |
| P  | Listar los pedidos no atendidos                                                                       | Consulta      |
| Q  | Mostrar información del producto clasificado por tipo                                                 | Consulta      |
| R  | Mostrar productos según preferencia de marca                                                          | Consulta      |
| S  | Realizar un seguimiento mensual a la cantidad de pedidos ordenados   cronológicamente                 | Consulta      |
| T  | Obtener los productos más solicitados por usuarios dentro de un rango de   edad ordenado por cantidad | Consulta      |
| U  | Obtener información de los establecimientos que han aceptado un pedido.                               | Consulta      |

_Ordenado por el tipo de transacción_

#### Matriz cruzada transacciones/relaciones

|      Tran.      | Gerente | Establecimiento | Dirección | Solicitudes | Solicitud | Estado Solicitud | Usuario | Producto | Marca Producto | Tipo Producto | # tablas x tran. |
|:---------------:|:-------:|:---------------:|:---------:|:-----------:|:---------:|:----------------:|:-------:|:--------:|:--------------:|:-------------:|:----------------:|
|        A        |         |                 |           |             |           |                  |    X    |          |                |               |         1        |
|        B        |    X    |                 |           |             |           |                  |    X    |          |                |               |         2        |
|        C        |         |        X        |     X     |             |           |                  |         |          |                |               |         2        |
|        D        |         |                 |           |             |           |                  |         |     X    |        X       |       X       |         3        |
|        E        |         |                 |           |      X      |     X     |         X        |         |          |                |               |         3        |
|        F        |    X    |        X        |     X     |             |           |                  |    X    |          |                |               |         4        |
|        G        |         |                 |           |             |           |                  |         |     X    |        X       |       X       |         3        |
|        H        |         |                 |           |      X      |     X     |         X        |    X    |          |                |               |         4        |
|        I        |         |                 |           |      X      |     X     |         X        |    X    |     X    |                |               |       **5**      |
|        J        |         |                 |           |             |           |                  |    X    |          |                |               |         1        |
|        K        |         |        X        |           |             |           |                  |         |          |                |               |         1        |
|        L        |         |        X        |     X     |             |           |                  |         |          |                |               |         2        |
|        M        |         |                 |           |      X      |     X     |         X        |    X    |          |                |               |         4        |
|        N        |         |                 |           |      X      |     X     |         X        |         |          |                |               |         3        |
|        O        |         |                 |           |      X      |     X     |         X        |         |          |                |               |         3        |
|        P        |         |                 |           |      X      |     X     |         X        |         |          |                |               |         3        |
|        Q        |         |                 |           |             |           |                  |         |     X    |        X       |       X       |         3        |
|        R        |         |                 |           |             |           |                  |         |     X    |        X       |       X       |         3        |
|        S        |         |                 |           |      X      |     X     |         X        |    X    |     X    |                |               |       **5**      |
|        T        |         |                 |           |      X      |     X     |         X        |    X    |     X    |                |               |       **5**      |
|        U        |    X    |        x        |     X     |      X      |     X     |         X        |         |          |                |               |       **6**      |
|**# tran. x tabla**|    3    |        5        |     4     |    **10**   |   **10**  |      **10**      |  **9**  |     7    |        4       |       4       |                  |

_Los valores más altos están marcados en negrita_

##### Tablas críticas
Gracias a la matriz cruzada se determina que las tablas críticas son:
* Estado solicitud
* Solicitud
* Solicitudes
* Usuario

### Índices requeridos
```sql
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
```

### Espacio en disco requerido
#### Nro de discos usados
6 discos

#### Distribución de discos
| Nro discos | Tablas |
| ---------- | ------ |
| 1 | `Usuario`  |
| 1 | `Gerente` `Establecimiento` `Direccion` |
| 1 | `Solicitud` `Solicitudes` |
| 1 | `Producto` `EstadoSolicitud` `MarcaProducto` `TipoProducto` |
| 1 | _Índices_ |
| 1 | _Respaldo_ |

## Justificación
_Distribución tomando en cuenta el [Análisis transaccional](https://github.com/Scoowy/BDA-proyecto#an%C3%A1lisis-transaccional)_

La razón por la cual usamos 6 discos para guardar la información es que nuestro sistema debe garantizar un buen seguimiento de todos sus clientes, debemos ser capaces de guardar una gran cantidad de información de los clientes y de las solicitudes que ello genera cada vez que utilizan nuestra aplicación y de la misma manera guardar toda la información de las tiendas que tendremos disponibles para visualizar los productos.

### Definición de tablespaces
Aqui sql de los tablespaces
