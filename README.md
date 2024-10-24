---
coverY: 0
---

# Documentación Biblioteca DB

## user\_types

Almacena los nombres de los roles que pueden tener las personas que interactúen con la aplicación.

Atributos:

* user\_type\_id: un entero auto incremental que representa el índice del registro dentro de la tabla.
* name: una cadena de caracteres que denota el rol que tiene este usuario en la aplicación. Sus posibles valores pueden ser "**Estudiante**" o "**Administrador**".

<figure><img src=".gitbook/assets/Pasted image 20241004021436.png" alt=""><figcaption><p>tabla user_types</p></figcaption></figure>

Relaciones:

* 1:1 con la tabla **users**.

## payments

En el caso que un estudiante pida un libro y éste lo devuelva con daños muy graves o lo pierda, los administradores pueden cobrar un monto adecuado a la situación. La tabla **payments** almacena toda la información relacionada a cada caso donde halla sido necesario aplicar un cobro.

Atributos:

* payment\_id: un entero auto incremental que representa el índice del registro dentro de la tabla.
* user\_id: llave foránea que hace referencia a la llave primaria de la tabla **users** ( para poder identificar a la persona responsable).
* amount: Monto total del cobro (valor de los daños o del libro).
* reason: Especifica el motivo del cobro al estudiante. Esta información debe ser proveída por l administrador a cargo. Por tanto, este campo no tiene valores posibles como el campo **user\_types**.
* admin\_id: llave foránea a la tabla **users**, representa el id del administrador que aprobó ese cobro.

<figure><img src=".gitbook/assets/Pasted image 20241004021936.png" alt=""><figcaption><p>tabla payments</p></figcaption></figure>

Relaciones:

* m : 1 con la tabla **users** (campo _user\_id_).
* m : 1 con la tabla **users** (campo _admin\_id_).

## authors

En esta tabla se almacena la información necesaria de cada autor de los libros almacenado en el sistema. Atributos:

* author\_id: un entero auto incremental que representa el índice del registro dentro de la tabla.
* first\_name: contiene ambos nombres del autor (o solo uno según sea el caso).
* last\_name: contiene ambos apellidos del autor (o solo uno según sea el caso).

<figure><img src=".gitbook/assets/Pasted image 20241004022059.png" alt=""><figcaption><p>tabla authors</p></figcaption></figure>

Relaciones:

* 1:m con **authors\_per\_book**.

## categories

En la aplicación, cada libro pertenece a una o varias categorías. Donde las categorías va desde las mas generales (como ser **matemática** o **física**) hasta las mas especificas como (**Ecuaciones Diferenciales** o **Análisis de atractores**). Donde las categorías mas generales son "padre" de categorías mas especificas y así mismo las categorías hijas pueden ser padre de otras mas especificas.

Atributos:

* category\_id: un entero auto incremental que representa el índice del registro dentro de la tabla.
* name: cadena de caracteres que almacena el nombre de la categoría.
* parent\_category\_id: referencia al id de la categoría padre (puede ser nulo para las categorías mas especificas como **física** o **matemática**).
* icon: almacena la ruta donde se ubica el icono de la categoría. Un valor de ejemplo puede ser "./catFisica.jpg" para un icono que se encuentra en el directorio public del frontEnd.
* enabled: un valor booleano que se usa para hacer un "Soft Delete" de todas las categorías de que ya no se encuentren en uso por algun motivo _(ver inciso 1 en la sección de Observaciones)_ .

<figure><img src=".gitbook/assets/Pasted image 20241004022511.png" alt=""><figcaption><p>tabla categories</p></figcaption></figure>

Relaciones:

* 1:1 con **categories**.
* 1:m con **categories\_per\_book**.

## reservations

En la aplicación la usuario puede generar una reserva, esto le permite pasar recogiendo un libro en la fecha estipulada. Existen situación durante la reserva que pueden afectar la reputación del usuario, para mayor información _ver el inciso 2 de la sección de_ \[\[#Observaciones]].

Atributos:

* reservation\_id: entero auto incremental que representa el índice del registro dentro de la tabla.
* user\_id: **llave foránea** a la tabla Usuarios que referencia al **id** del usuario que hizo la reserva (estudiante al que se le prestará el libro).
* ~~FechaReserva: fecha en la que el estudiante _debe_ pasar recogiendo el libro en las instalaciones de la biblioteca.~~
* status: indica el cual es el estado actual de la reserva (si ya se atendió, se encuentra pendiente, fue aceptada, etc.). Los posibles valores son:
  * **Rechazada**: un administrador no aprobó la solicitud de reserva de un libro.
  * **Aceptada**: un administrador aprobó la solicitud de reserva de un libro.
  * **Pendiente**: la solicitud de reserva aún no ha sido aprobada ni rechazada por un administrador.
* book\_id: **llave foránea** a la tabla **books**, indica el id del libro que se pide prestado.
* checkout: es la _fecha real_ en la que el estudiante se avocó a la biblioteca para recibir su libro.
* created\_at: fecha de creacion de la reserva.

<figure><img src=".gitbook/assets/Pasted image 20241004023633.png" alt=""><figcaption><p>tabla reservations</p></figcaption></figure>

Relaciones:

* m : 1 con **books**.
* m : 1 con **users**.
* 1 : 1 con **loans**.

## loans

Registra todos los prestamos que se han hecho a través del tiempo.

Atributos:

* loan\_id: entero auto incremental que representa el índice del registro dentro de la tabla.
* expires\_on: es la fecha _en que se espera_ que el estudiante _devuelva_ el libro que se le prestó.
* initial\_notes: en este campo el administrador puede dar una descripción de los daños mas relevantes que tiene el libro antes de ser prestado. De esa forma se puede verificar si el libro regresa con más daños.
* state: representa el estado actual del préstamo. Sus valores pueden ser:
  * **En Curso**: si la reserva del usuario fué aprobada y ya se le entregó el libro al usuario pero aun no llega el momento de regresarlo.
  * **Finalizada**: si la reserva del usuario fué aprobada y el usuario devolvió el libro en tiempo y forma.
  * **Sin Entregar**: si la reserva fué aprobada y el usuario no devolvió el libro dentro del tiempo definido o de plano no ha regresado aún.
* reception\_date: es la _fecha real_ en la que el usuario llega a biblioteca a _devolver_ el libro.
* final\_notes: en este campo el administrador puede escribir sobre daños adicionales (diferentes a los daños que ya tenía) que tenga el libro al ser recibido.
* loan\_admin\_id: es una **llave foránea** a la tabla **Usuarios** que hacer referencia al id del Administrador que le presta el libro al estudiante.
* ~~idReserva: **llave foránea** a la tabla **Reserva** que hace referencia al id de la Reserva a la que le corresponde este registro de historial de préstamo.~~
* reception\_admin\_id: **llave foránea** a la tabla **Usuarios** que hace referencia al id del administrador que recibe el libro de vuelta, una vez que se ha completado el tiempo de préstamo.
* loaned\_at: fecha y hora de la creacion de este registro (momento en que el usuario recibe el libro reservado).

<figure><img src=".gitbook/assets/Pasted image 20241004025029.png" alt=""><figcaption><p>tabla loans</p></figcaption></figure>

Relaciones:

* 1 : 1 con **users** _(IDAdministradorPrestamo)_.
* 1 : 1 con **users** _(idAdministradorRecepcion)_.
* 1 : 1 con **reservations**.

## users

Almacena la información de todos los usuarios de la aplicación (tanto de administradores como de estudiantes).

Atributos:

* user\_id: entero auto incremental que representa el índice del registro dentro de la tabla.
* first\_name: almacena el primer nombre del usuario.
* second\_name: almacena el segundo nombre del usuario.
* first\_sur\_name: almacena el primer apellido del usuario.
* second\_sur\_name: almacena el segundo apellido del usuario.
* account\_number: almacena el número de cuenta (ej. 20211009089 ) del usuario.
* phone\_number: almacena el número de teléfono _(sin guiones ni código de área)_ del usuario.
* email: cadena de caracteres que almacena el correo institucional del usuario.
* passord: cadena de caracteres que almacena la _contraseña encriptada_ del usuario.
* creation\_date: la fecha de creacion de esa cuneta de usuario dentro de la aplicación.
* user\_type\_id: llave foránea a la tabla **user\_types** que hace referencia al rol _(Estudiante o Administrador)_ que tiene el usuario dentro de la aplicación.
* enabled: campo booleano que sirve para hacer un _Soft Delete_ de las cuentas de Usuario. Cuando un usuario tiene la reputación minima su cuenta se deshabilita (se banea del sistema) y pierde derecho a reservar libros.
* reputation: campo entero que almacena la reputación del usuario (0-10) donde todo nuevo usuario inicia con una reputación de 10 (la mejor reputación). _Ver inciso 2 en la Sección de **Observaciones**._

<figure><img src=".gitbook/assets/Pasted image 20241004025356.png" alt=""><figcaption><p>tabla users</p></figcaption></figure>

Relaciones:

* 1 : 1 con **user\_types**.
* 1 : m con **payments**.
* 1 : m con **payments**.
* 1 : m con **reservations**.
* 1 : 1 con **loans**.
* 1 : 1 con **loans**.

Nota: Se sugiere ver la definición de las tablas **payments** e **loans** en caso de duda sobre por que estas relaciones aparecen dos veces.

## books

Almacena toda la información que define a un libro.

Atributos:

* book\_id: entero auto incremental que representa el índice del registro dentro de la tabla.
* title: almacena el titulo del libro.
* edition: un entero que representa el numero de edición del libro (ej. si es 6 se entiende que es la sexta edición del libro).
* year: año de publicación del libro.
* language: idioma del libro (puede ser "español" o "inglés").
* publisher: nombre de la editorial a cargo de la publicación del libro.
* location: país donde se ubica la editorial.
* description: una breve descripción sobre lo que trata el libo.
* isbn: _código Internacional normalizado para libros_ es un identificador único para libros.
* total\_amount: es el numero total de ejemplares en existencia de ese libro.
* enabled: campo booleano que sirve para hacer un _Soft Delete_ de los Libros que por algun motivo ya no estén disponibles para ser prestados.
* entry\_date: representa la fecha en que se ingresa un nuevo libro al sistema.
* units\_available: representa la cantidad de ejemplares que estan disponibles para sr reservados. Si se presta un ejemplar entonces este numero disminuye, cuando el ejemplar es regresado, este numero aumenta.

<figure><img src=".gitbook/assets/Pasted image 20241004030031.png" alt=""><figcaption><p>tabla books</p></figcaption></figure>

Relaciones:

* 1 : m con [reservations](./#reservations).
* 1 : 1 con categories\_per\_book.
* 1 : 1 con authors\_per\_book.

## categories\_per\_book

Tabla intermedia que relaciona a cada libro con sus respectivas categorías.

Atributos:

* book\_id: llave foránea a la tabla \[\[#books]].
* category\_id: llave foránea a la tabla \[\[#categories]].

<figure><img src=".gitbook/assets/Pasted image 20241004030155.png" alt=""><figcaption><p>tabla categories_per_book</p></figcaption></figure>

Relaciones:

* m : 1 con \[\[#books]].
* m : 1 con \[\[#categories]].

## authors\_per\_book

Tabla intermedia que relaciona los Libros con los Autores

Atributos:

* book\_id: llave foránea a la tabla \[\[#books]].
* author\_id: llave foránea a la tabla \[\[#authors]].

<figure><img src=".gitbook/assets/Pasted image 20241004030310.png" alt=""><figcaption><p>tabla authors_per_book</p></figcaption></figure>

Relaciones:

* m : 1 con \[\[#books]].
* m : 1 con \[\[#authors]].

## actions

Contiene los nombre de las posibles acciones dentro del sistema. Atributos:

* action\_id: entero auto incremental que representa el índice del registro dentro de la tabla.
*   name: almacena el nombre de la acción para mejor orden los posibles valores se han agrupado según la entidad principal a la que afectan (los posibles valores están en **negrita**).

    * acciones sobre libros
      * **editar Libro**
      * **crear Libro**
      * **eliminar Libro**
    * acciones sobre usuarios (estudiantes y administradores)
      * **crear Usuario**
      * **eliminar Usuario**
      * **cambiar reputación**
      * **editar usuario**
    * acciones sobre prestamos
      * **prestar libro**
      * **recibir libro**
    * acciones sobre reservas
      * **aceptar reserva de libro**
      * **rechazar reserva de libro**
    * acciones sobre categorías
      * **crear categoría**
      * **editar categoría**
      * **eliminar categoría**
    *   acciones sobre autores

        * **crear autor**
        * **editar autor**
        * **eliminar autor**



    <figure><img src=".gitbook/assets/Pasted image 20241004033028.png" alt=""><figcaption><p>tabla actions</p></figcaption></figure>



    Relaciones:

    * 1 : m con \[\[#actions\_history]]



## parameters

Almacena las caracteristicas de distinguen a una biblioteca. Atributos:

* idLibraries: entero auto incremental que representa el índice del registro dentro de la tabla.
* major: carrera a la que pertenece la biblioteca
* image: ruta a la imagen del logo de la carrera.
* loanLimitDays: entero que representa el limite de días que se puede prestar un libro.
* creationDate: almacena la fecha y hora de creación del registro de la biblioteca.

<figure><img src=".gitbook/assets/Pasted image 20241004033103.png" alt=""><figcaption><p>tabla parameters</p></figcaption></figure>

Relaciones: **Ninguna**

## permissions

Almacena todos los permisos que puede tener un usuario. Atributos:

* permission\_id: entero auto incremental que representa el índice del registro dentro de la tabla.
* name: nombre del permiso. Sus posibles valores son:
  * **gestión de libros** (creacion, edición, borrado de autores y categorías)
  * **gestión de usuarios** (creacion, edición, borrado de reputación)

<figure><img src=".gitbook/assets/Pasted image 20241004033139.png" alt=""><figcaption><p>tabla permissions</p></figcaption></figure>

Relaciones:

* 1 : m con \[\[#users\_permissions]]

## users\_permissions

Tabla intermedia entre la tabla \[\[#users]] y la tabla \[\[#permissions]]. Atributos:

* user\_id: llave foranea a la tabla \[\[#users]].
* permission\_id: llave foranea a la tabla \[\[#permissions]].

<figure><img src=".gitbook/assets/Pasted image 20241003214433.png" alt=""><figcaption><p>tabla users_permissions</p></figcaption></figure>

Relaciones:

* m : 1 con \[\[#permissions]]
* m : 1 con \[\[#users]]

## actions\_history

Tabla intermedia entre la tabla \[\[#actions]] y \[\[#users]]. Atributos:

* actions\_history\_id: entero auto incremental que representa el índice del registro dentro de la tabla.
* dateTime: timestamp (fecha y hora) en la que se ejecutó la acción.
* admin\_id: llave foránea a la tabla \[\[#users]] que indica el usuario que ejecutó la acción.
* action\_id: llave foránea a la tabla \[\[#actions]] que indica la acción ejecutada.

<figure><img src=".gitbook/assets/Pasted image 20241003214505.png" alt=""><figcaption><p>tabla actions_history</p></figcaption></figure>

Relaciones:

* m : 1 con \[\[#users]]
* m : 1 con \[\[#actions]]

