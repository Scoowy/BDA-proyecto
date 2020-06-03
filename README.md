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

## Modelo Entidad-Relación
![Modelo Entidad-Relación](https://github.com/Scoowy/BDA-proyecto/blob/master/images/Proyecto%20IB%20BDA%20-%20Modelo%20EntidadRelaci%C3%B3n.png)
## Modelo Relacional
![Modelo Relaciona](https://github.com/Scoowy/BDA-proyecto/blob/master/images/Proyecto%20IB%20BDA%20-%20Modelo%20Relacional.png)

## Análisis transaccional
### Transacciones

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

### Matriz cruzada transacciones/relaciones

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

#### Tablas críticas
Gracias a la matriz cruzada se determina que las tablas críticas son:
* Estado solicitud
* Solicitud
* Solicitudes
* Usuario
