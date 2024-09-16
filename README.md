# Biblioteca-DB
### TipoUsuario
Almacena los nombres de los roles que pueden tener las personas que interactúen con la aplicación.

Atributos:
- idTipoUsuario:  un entero  auto incremental que representa el índice del registro dentro de la tabla.
- TipoUsuario: una cadena de caracteres que denota el rol que tiene este usuario en la aplicación. Sus posibles valores pueden ser "**Estudiante**" o "**Administrador**".

<!-- ![alt text](Pasted\ image 20240914165820.png) -->
![alt text](./Pasted%20image%2020240914165820.png)

Relaciones:
- 1:1 con la tabla **Usuarios**.

### HistorialCobros
En el caso que un estudiante pida un libro y éste lo devuelva con daños muy graves o lo pierda, los administradores pueden cobrar un monto adecuado a la situación. La tabla **HistorialCobros** almacena toda la información relacionada a cada caso donde halla sido necesario aplicar un cobro.

Atributos:
- idCobro:  un entero  auto incremental que representa el índice del registro dentro de la tabla.
- UsuariosACobrar: llave foránea que hace referencia a la llave primaria de la tabla Usuarios ( para poder identificar a la persona responsable).
- AdministradorACargo:
- Cantidad: Monto total del cobro (valor de los daños o del libro).
- Motivo: Especifica el motivo del cobro al estudiante. Esta información debe ser proveída por l administrador a cargo. Por tanto, este campo no tiene valores posibles como el campo **TipoUsuario**.
- idAdministradorACargo: id del administrador que aprobó ese cobro.

![](./Pasted%20image%2020240914171539.png)

Relaciones:
- m : 1 con la tabla **Usuarios** (campo *UsuarioACobrar*).
- m : 1 con la tabla **Usuarios** (campo *idAdministradorACargo*).


### Autores
En esta tabla se almacena la información necesaria de cada autor de los libros almacenado en el sistema.
Atributos:
- idAutor: un entero  auto incremental que representa el índice del registro dentro de la tabla.
- Nombres: contiene ambos nombres del autor (o solo uno según sea el caso).
- Apellido: contiene ambos apellidos del autor (o solo uno según sea el caso).

![](./Pasted%20image%2020240914183940.png)

Relaciones:
- 1:m con **LibrosAutores**.



### Categorías
En la aplicación, cada libro pertenece a una o varias categorías. Donde las categorías va desde las mas generales (como ser **matemática** o **física**) hasta las mas especificas como (**Ecuaciones Diferenciales** o **Análisis del atractores**). Donde las categorías mas generales son "padre" de categorías mas especificas y así mismo las categorías hijas pueden ser padre de otras mas especificas.

Atributos:
- idCategoria: un entero  auto incremental que representa el índice del registro dentro de la tabla.
- Categoria: cadena de caracteres que almacena el nombre de la categoría.
- idCategoriaPadre: referencia al id de la categoría padre (puede ser nulo para las categorías mas especificas como **física** o **matemática**).
- icono: almacena la ruta donde se ubica el icono de la categoría. Un valor de ejemplo puede ser "./catFisica.jpg" para un icono que se encuentra en el directorio public del frontEnd.
- Habilitado: un valor booleano que se usa para hacer un "Soft Delete" de todas las categorías de que ya no se encuentren en uso por algun motivo *(ver inciso 1 en la sección de Observaciones)* . 

![](./Pasted%20image%2020240914184726.png)

Relaciones:
- 1:1 con **Categorias**.
- 1:m con **LibrosCategorias**.


### Reservas
En la aplicación la usuario puede generar una reserva, esto le permite pasar recogiendo un libro en la fecha estipulada. Existen situación durante la reserva que pueden afectar la reputación del usuario, para mayor información *ver el inciso 2 de la sección de* **Observaciones**.

Atributos:
- idReserva: entero  auto incremental que representa el índice del registro dentro de la tabla.
- UsuarioAReservar: **llave foránea** a la tabla Usuarios que referencia al **id** del usuario que hizo la reserva (estudiante al que se le prestará el libro).
- FechaReserva: fecha en la que el estudiante *debe* pasar recogiendo el libro en las instalaciones de la biblioteca.
- Estado: indica el cual es el estado actual de la reserva (si ya se atendió, se encuentra pendiente, fue aceptada, etc.). Los posibles valores son:
	- **Rechazada**: un administrador no aprobó la solicitud de reserva de un libro.
	- **En Curso**: un administrador aprobó la solicitud de reserva del libro.
	- **Pendiente**: la solicitud de reserva aún no ha sido aprobada ni rechazada por un administrador.
- idLibro: **llave foránea** a la tabla **Libros**, indica el id del libro que se pide prestado.
- Checkout: es la *fecha real* en la que el estudiante se avocó a la biblioteca para recibir su libro.

![](./Pasted%20image%2020240915093257.png)


Relaciones:
- m : 1 con **Libros**.
- m : 1 con **Usuarios**.
- 1 : 1 con **HistorialPrestamo**.



### HistorialPrestamos
Registra todos los prestamos que se han hecho a través del tiempo.

Atributos:
- idPrestamo:  entero  auto incremental que representa el índice del registro dentro de la tabla.
- FechaADevolver: es la fecha *en que se espera* que el estudiante *devuelva* el libro que se le prestó.
- ObservacionInicial: en este campo el administrador puede dar una descripción de los daños mas relevantes que tiene el libro antes de ser prestado. De esa forma se puede verificar si el libro regresa con más daños.
- Estado: representa el estado actual del préstamo. Sus valores pueden ser:
	-  **Pendiente**: por ejemplo si la reserva del usuario fué aprobada pero aún no ha llegado a recoger el libro.
	- **En Curso**: si la reserva del usuario fué aprobada y ya se le entregó el libro al usuario pero aun o llega el momento en que lo regrese.
	- **Finalizada**: si la reserva del usuario fué aprobada y el usuario devolvió el libro en tiempo y forma.
	- **Finalización Incorrecta**: si la reserva fué aprobada y el usuario no devolvió el libro dentro del tiempo definido o de plano no ha regresado aún. 
- FechaDevolucion: es la *fecha real* en la que el usuario llega a biblioteca a *devolver* el libro.
- ObservacionFinal: en este campo el administrador puede escribir sobre daños adicionales (diferentes a los daños que ya tenía) que tenga el libro al ser recibido.
- IDAdministradorPrestamo: es una **llave foránea** a la tabla **Usuarios** que hacer referencia al id del Administrador que le presta el libro al estudiante.
- idReserva: **llave foránea** a la tabla **Reserva** que hace referencia al id de la Reserva a la que le corresponde este registro de historial de préstamo.
- idAdministradorRecepcion: **llave foránea** a la tabla **Usuarios** que hace referencia al id del administrador que recibe el libro de vuelta,  una vez que se ha completado el tiempo de préstamo.



![](./Pasted%20image%2020240915095550.png)


Relaciones:
- 1 : 1 con **Usuarios** *(IDAdministradorPrestamo)*.
- 1 : 1 con **Usuarios** *(idAdministradorRecepcion)*.
- 1 : 1 con **Reservas**.



### Usuarios
Almacena la información de todos los usuarios de la aplicación (tanto de administradores como de estudiantes).

Atributos:
- IDUsuario:  entero  auto incremental que representa el índice del registro dentro de la tabla.
- PrimerNombre: almacena el primer nombre del usuario.
- SegundoNombre: almacena el segundo nombre del usuario.
- PrimerApellido: almacena el primer apellido del usuario.
- SegundoApellido: almacena el segundo apellido del usuario.
- NumeroCuenta: almacena el número de cuenta (ej. 20211009089 ) del usuario.
- NumeroTelefono: almacena el número de teléfono *(sin guiones ni código de área)* del usuario.
- CorreoInstitucional: cadena de caracteres que almacena el correo institucional del usuario.
- Contraseña: cadena de caracteres que almacena la *contraseña encriptada* del usuario.
- FechaCreacion: la fecha de creacion de esa cuneta de usuario dentro de la aplicación.
- TipoUsuario: llave foránea a la tabla **TipoUsuario** que hace referencia al rol *(Estudiante o Administrador)* que tiene el usuario dentro de la aplicación.
- Habilitado: campo booleano que sirve para hacer un *Soft Delete* de las cuentas de Usuario. Cuando un usuario tiene la reputación minima su cuenta se deshabilita (se banea del sistema) y pierde derecho a reservar libros.
- Reputacion: campo entero que almacena la reputación del usuario (0-10) donde todo nuevo usuario inicia con una reputación de 10 (la mejor reputación). *Ver inciso 2 en la Sección de Observaciones* 


![](./Pasted%20image%2020240915104107.png)


Relaciones:
- 1 : 1 con **TipoUsuario**.
- 1 : m con **HistorialCobros**.
- 1 : m con **HistorialCobros**.
- 1 : m con **Reservas**.
- 1 : 1 con **HistorialPrestamos**.
- 1 : 1 con **HistorialPrestamos**.

Nota: Se sugiere ver la definición de las tablas **HistorialCobros** e **HistorialPrestamos** en caso de duda sobre por que estas relaciones aparecen dos veces.



### Libros
Almacena toda la información que define a un libro.

Atributos:
- idLibro:  entero  auto incremental que representa el índice del registro dentro de la tabla.
- Titulo: almacena el titulo del libro.
- Edicion: un entero que representa el numero de edición del libro (ej. si es 6 se entiende que es la sexta edición del libro).
- Año: año de publicación del libro.
- Idioma: idioma del libro (puede ser "español" o "inglés").
- Editorial: nombre de la editorial a cargo de la publicación del libro.
- Localización: país donde se ubica la editorial.
- Descripción: una breve descripción sobre lo que trata el libo.
- ISBN: *código Internacional normalizado para libros* es un identificador único para libros.
- Cantidad: es el numero total de ejemplares en existencia de ese libro.
- Habilitado: campo booleano que sirve para hacer un *Soft Delete* de los Libros que por algun motivo ya no estén disponibles para ser prestados.
- Fecha_Ingreso: representa la fecha en que se ingresa un nuevo libro al sistema.
- UnidadesDisponibles: representa la cantidad de ejemplares que estan disponibles para sr reservados. Si se presta un ejemplar entonces este numero disminuye, cuando el ejemplar es regresado, este numero aumenta.

![](./Pasted%20image%2020240915115118.png)

Relaciones:
- 1 : m con **Reservas**.
- 1 : 1 con **LibrosCategorias**.
- 1 : 1 con **LibrosAutores**.



### LibrosCategorias
Tabla intermedia que relaciona a cada libro con sus respectivas categorías.

Atributos:
- idLibro: llave foránea a la tabla **Libros**.
- idCategoria: llave foránea a la tabla **Categorias**.


![](./Pasted%20image%2020240915121423.png)

Relaciones:
- m : 1 con **Libros**.
- m : 1 con **Categorias**.



### LibrosAutores
Tabla intermedia que relaciona los Libros con los Autores
Atributos:
- idLibro: llave foránea a la tabla **Libros**.
- idAutor: llave foránea a la tabla **Autores**.

![](./Pasted%20image%2020240915122031.png)

Relaciones:
- m : 1 con **Libros**.
- m : 1 con **Autores**.



---

### Observaciones
A continuación se presentan explicaciones a mas detalladas sobre casos especiales en la base de datos. 
1. Explicación de *soft delete*
	El Soft Delete permite *"borrar registros"* sin borrarlos necesariamente. Todos los registros con el campo Habilitado en 0 serán los registro borrados. Por lo que en todas las operaciones solo se consideraran aquellos registros con el campo Habilitado en 1. Se hace de esta manera con la intención de que quede registro de la información dentro de la base de datos, a demás esto es útil en caso de auditorias a la base de datos.    
2. Explicación de *sistema de reputación*
	 La reputación es un valor entero entre el rango de 0-10 donde cero es la peor reputación y 10 la mejor. Inicialmente todo usuario tendrá una reputación de 10. Sin embargo, existen situaciones que reducen su reputación:
	 - **Entrega Tarde**: Al usuario que ha reservado un libro y lo recibió en tiempo y forma se le establece una fecha de entrega del libro. Si el usuario entrega el libro despues de la fecha indicada su reputación se verá disminuida.
	 - **Daño al libro**: Si el usuario regresa el libro con daños considerables su reputación también se vera disminuida.
	 - **Reserva no completada**: Si el usuario reserva un libro pero no se avoca a las instalaciones de la biblioteca para recibir el libro, su reputación disminuye.
	 - **No entrega el libro**: Si el usuario no entrega el libro, disminuye su reputación considerablemente