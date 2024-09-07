# README

## Website: [EcoDigital](https://eco-digital-b6c15cceaf89.herokuapp.com/)
## Objetivo

Esta aplicación demuestra la capacidad de trabajar con Ruby on Rails tanto en el backend como en el frontend. El objetivo es evaluar habilidades en desarrollo full-stack, incluyendo el diseño de API, la gestión de bases de datos y el desarrollo de interfaces de usuario.

## Requisitos

-  Ruby 3.1.2 o superior
-  Bundler (para gestionar dependencias)

## Descripción de la Tarea

La aplicación de blog permite a los usuarios crear una cuenta, iniciar sesión y gestionar sus publicaciones. A continuación se describen las funcionalidades implementadas y la estructura del código:

### Autenticación de Usuarios

- **Registro y Autenticación**: Implementa el registro, inicio de sesión y cierre de sesión de usuarios utilizando la gema [Devise](https://github.com/heartcombo/devise). Devise maneja las operaciones de autenticación, incluyendo la encriptación segura de contraseñas.
- **Configuración de Devise**: Se ha configurado Devise en el archivo `config/initializers/devise.rb` y se han generado los modelos necesarios para el registro de usuarios.

### Operaciones CRUD

- **Modelo de Publicaciones**: El modelo `Post` tiene los atributos `title` (título), `body` (cuerpo) y las marcas de tiempo (`created_at` y `updated_at`). Se ha creado el modelo con el comando:
  ```bash
  rails generate model Post title:string body:text
- **Controladores**: Los controladores PostsController manejan las operaciones CRUD. Cada acción del controlador está asociada a una vista que permite crear, leer, actualizar y eliminar publicaciones.
- **Autorización**: Solo los usuarios autenticados pueden gestionar sus propias publicaciones. Esto se asegura mediante un before_action en el controlador PostsController que verifica la autenticación del usuario.

### Diseño API

La aplicación incluye una API JSON para gestionar las publicaciones del blog. Los endpoints implementados son:
- **GET** /api/posts: Listar todas las publicaciones.
- **POST** /api/posts: Crear una nueva publicación.
- **GET** /api/posts/: Obtener una publicación específica.
- **PATCH** /api/posts/: Actualizar una publicación.
- **DELETE** /api/posts/: Eliminar una publicación.
Cada endpoint está manejado por un controlador `Api::PostsController` y utiliza serializers para convertir los objetos Ruby en JSON.

### Interfaz De Usuario

-Páginas de la Aplicación:

  -  Página Principal: Muestra una lista de todas las publicaciones de blog. Los usuarios pueden hacer clic en una publicación para verla en detalle.
  -  Página de Inicio de Sesión: Formulario para iniciar sesión en la aplicación.
  -  Página de Registro: Formulario para registrar un nuevo usuario.
  -  Página de Gestión de Publicaciones: Permite a los usuarios autenticados crear, actualizar y eliminar publicaciones.
-  Integración Frontend-Backend: La interfaz de usuario se comunica con la API de Rails utilizando JavaScript para manejar las solicitudes de datos y actualizar la interfaz sin recargar la página. Se han implementado manejadores de errores para asegurar una experiencia de usuario fluida.

## Cómo Ejecutar la Aplicación

- Clona el repositorio:
  ```
  git clone <URL del repositorio>

- Navega al directorio del proyecto:
  ```
  cd blog-application
- Instala las gemas necesarias:
  ```
  bundle install
- Configura la base de datos:
  ```
  rails db:create
- Inicia el servidor Rails:
  ```
  rails server
- Abre tu navegador y visita `http://localhost:3000` para ver la aplicación en acción.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request para sugerir mejoras.

## Contacto 
-  Email: `g.gutierrez@lainter.edu.mx`
-  Tel: `+52 241-140-0184`
