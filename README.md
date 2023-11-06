# KariPic_Rails

Blog de fotos creado en Ruby on Rails para el Bootcamp 

## Descripción

Esta página funciona principalmente mediante el uso de un CRUD para el manejo de los post asi como comentarios dejados por otros usuarios y su gestión a través de una base de datos, en este caso PostgreSQL. ademas y su principal novedad es el uso de aws para poder trabajar con tanto fotos de perfil y fotos en los posts, entre sus características se encuentra:

- Subir un post con una foto, titulo y leyenda para que los usuarios lo vean (solo lo administradores podrán hacer post, los usuarios pueden comentar los post).
- Editar los post y comentarios creados con un solo clic.
- Borrar un post si no te gusta su contenido o piensas que no es lo mejor lo cual borrara también los comentarios que tuviera asi como las fotos.
- Mostrar en su índice todos los post creados, mostrando siempre los últimos al comienzo.
- Muestra los comentarios de cada post.
- Ingresa con tu cuenta o crea una propia.
- Los comentarios y publicaciones solo podrán ser borradas por administradores o el mismo usuario que creo la publicación y/o comentario.
- Visitantes podrán dejar sus comentarios en las publicaciones.
- Solo los administradores y los creadores de los comentarios podrán borrar o editar comentarios dejados por visitantes.


### Pre-requisitos 📋

- Sistema Operativo: Windows, Ubuntu o macOS
- Lenguaje de programación: Ruby 3.2.2
- Framework Rails: 7.0.6
- PostgreSQL: 14.8

### Instalación 🔧

Clona el repositorio con el siguiente comando:

```bash
git clone https://github.com/Ksavir/KariPic_rails
```

En la terminal, accede a la carpeta donde se encuentra el repositorio y ejecuta (recuerda que para que esto funcione, debes tener instalado Ruby y la gema bundle):

```bash
bundle install
```

Inicia la base de datos con el siguiente comando:

```bash
rails db:create db:migrate
```

Finalmente, ejecuta el proyecto con el siguiente comando y ve a la dirección IP que aparecerá en la consola:

```bash
rails s
```


## Construido Con 🛠️

- [Ruby](https://www.ruby-lang.org/es/) - El lenguaje utilizado
- [Ruby on Rails](https://rubyonrails.org) - El framework web utilizado
- [Ruby gems](https://rubygems.org) - Gestión de dependencias
- [Postgresql](https://www.postgresql.org) - Sistema de base de datos
- [Bootstrap](https://getbootstrap.com/) - Framework de CSS
- [Devise](https://github.com/heartcombo/devise) - Gema para autentificación y permisos.

