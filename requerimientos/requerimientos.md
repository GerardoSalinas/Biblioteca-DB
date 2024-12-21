# Requerimientos

## Requerimientos: Proyecto Biblioteca

El objetivo es brindar una biblioteca virtual a cualquier carrera que lo necesite. Sin embargo, cada usuario perteneciente a una carrera solo podrá pedir prestados los libros de dicha carrera (recordar que hay estudiantes que llevan carreras simultaneas).

Dicho lo anterior los administradores solo pueden pertenecer a la biblioteca de una carrera, mientras que los estudiantes (usuarios) pueden pertenecer a las bibliotecas de las carreras que está cursando.

### Administradores

1. Login
   1. Va a pertenecer a una biblioteca
   2. Va a poder editar, ver, eliminar y actualizar solo las cosas que tengan relación con su carrera
2. CRUD de usuarios
   1. Crear usuarios (incluir correo institucional y número de teléfono)
   2. Elegir si es un administrador o un usuario normal
   3. Modificar o actualizar los usuarios
   4. Desactivar usuarios (no se van a poder eliminar usuarios)
   5. Visualizar la información de cualquier usuario
3. CRUD de libros
   1. Ya abra una lista de libros, el administrador podrá escoger el libro de esa lista o crear uno nuevo. Si el libro ya existe, simplemente tendrá que poner la cantidad que tiene en existencia (stock). Crear uno nuevo implica:
      1. Poner información del (los) autor (es)
      2. Categorías del libro
      3. ISBN
      4. Imagen del libro
      5. Cualquier otra información importante sobre el libro
   2. Editar solo la cantidad de libros que tienen en existencia
   3. Eliminar un libro de existencia
   4. Visualizar la información de cada libro
4. Crear una reserva
   1. Guardar que administrador entrego el libro
   2. Ver información relevante del usuario (grado de confianza, teléfono, correo)
   3. Definir la fecha de retorno
   4. Observación inicial sobre el libro
5. Aceptar o rechazar peticiones
   1. Ver información relevante del usuario (grado de confianza, teléfono, correo)
   2. Aceptar una petición implica:
      1. Notificación
      2. Enviar información al usuario de cuándo podrá ir a traer el libro
   3. Rechazar una reserva implica:
      1. Notificación
      2. Enviar información al usuario del por qué se rechazó su solicitud
6. Evaluar y finalizar reserva
   1. El administrador podrá calificar la reserva
   2. Podrá poner un comentario sobre el estado del libro al momento del retorno
   3. Guardar que administrador recibió el libro
7. Estado de las reservas
   1. El administrador podrá llevar un control de todas las reservas
   2. Priorizar las reservas que se deberían entregar ese día y las pendientes por revisar
   3. Podrá ver un historial de todas las reservas
8. Reestablecer contraseña mediante el correo electrónico

### Usuarios

1. Login
   1. Puede pertenecer a una o más bibliotecas
   2. Podrá ver y reservar libros solo de su carrera
2. Reservas
   1. El usuario podrá hacer una petición de reserva
   2. Podrá tomar prestados solo un libro
   3. Seguimiento de su (s) reserva (s)
   4. Si tiene una entrega pendiente, no se pueden realizar más reservas
3. Notificaciones
   1. Cuando se acepta o rechaza una reserva
   2. Cerca de cuando le toca devolver el libro
   3. Si se pasó la fecha de entrega de alguna reserva
4. Gestionar perfil
   1. Actualizar su información
   2. Ver su grado de confianza
5. Restablecer contraseña mediante correo electrónico
