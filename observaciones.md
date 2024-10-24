---
coverY: 0
---

# Observaciones

#### Observaciones

A continuación se presentan explicaciones a mas detalladas sobre casos especiales en la base de datos.

1. Explicación de _soft delete_ El Soft Delete permite _"borrar registros"_ sin borrarlos necesariamente. Todos los registros con el campo Habilitado en 0 serán los registro borrados. Por lo que en todas las operaciones solo se consideraran aquellos registros con el campo Habilitado en 1. Se hace de esta manera con la intención de que quede registro de la información dentro de la base de datos, a demás esto es útil en caso de auditorias a la base de datos.
2. Explicación de _sistema de reputación_ La reputación es un valor entero entre el rango de 0-10 donde cero es la peor reputación y 10 la mejor. Inicialmente todo usuario tendrá una reputación de 10. Sin embargo, existen situaciones que reducen su reputación:
   * **Entrega Tarde**: Al usuario que ha reservado un libro y lo recibió en tiempo y forma se le establece una fecha de entrega del libro. Si el usuario entrega el libro despues de la fecha indicada su reputación se verá disminuida.
   * **Daño al libro**: Si el usuario regresa el libro con daños considerables su reputación también se vera disminuida.
   * **Reserva no completada**: Si el usuario reserva un libro pero no se avoca a las instalaciones de la biblioteca para recibir el libro, su reputación disminuye.
   * **No entrega el libro**: Si el usuario no entrega el libro, disminuye su reputación considerablemente
