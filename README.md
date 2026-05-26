# PRACTICA4-BDD

# API REST - Gestión de Biblioteca

## Descripción
Esta API REST permite la gestión de un catálogo de libros y el control de préstamos de una biblioteca. Está desarrollada con FastAPI y Python, y conectada a una base de datos MySQL desplegada mediante Docker. La API permite realizar operaciones CRUD completas sobre el inventario de libros y gestionar la lógica de préstamos y devoluciones de ejemplares.

---

## Documentación de Endpoints

A continuación, se detallan los endpoints disponibles, su funcionamiento y ejemplos de peticiones/respuestas.

### 1. Obtener todos los libros
* **Método y Ruta:** `GET /books`
* **Descripción:** Devuelve una lista de todos los libros registrados en el catálogo.
* **Ejemplo de Respuesta (200 OK):**
```json
[
  {
    "id": 1,
    "titulo": "El Quijote",
    "autor": "Miguel de Cervantes",
    "editorial": "Editorial A",
    "publicadoEn": 1605,
    "categoria": "Ficción"
  }
]
```

### 2. Obtener un libro por ID
* **Método y Ruta:** `GET /books/{id}`
* **Descripción:** Devuelve los datos de un libro específico mediante su identificador.
* **Ejemplo de Respuesta (200 OK):**
```json
{
  "id": 1,
  "titulo": "El Quijote",
  "autor": "Miguel de Cervantes",
  "editorial": "Editorial A",
  "publicadoEn": 1605,
  "categoria": "Ficción"
}
```

### 3. Crear un nuevo libro
* **Método y Ruta:** `POST /books`
* **Descripción:** Crea un nuevo libro en la base de datos.
* **Ejemplo de Petición:**
```json
{
  "title": "Cien años de soledad",
  "author": "Gabriel García Márquez",
  "publisher": "Editorial Sudamericana",
  "year": 1967,
  "category": "Ficción"
}
```
* **Ejemplo de Respuesta (201 Created):**
```json
{
  "id": 11,
  "titulo": "Cien años de soledad",
  "autor": "Gabriel García Márquez",
  "editorial": "Editorial Sudamericana",
  "publicadoEn": 1967,
  "categoria": "Ficción"
}
```

### 4. Actualizar un libro
* **Método y Ruta:** `PUT /books/{id}`
* **Descripción:** Actualiza los datos de un libro existente por su ID. Los campos son opcionales.
* **Ejemplo de Petición:**
```json
{
  "publisher": "Nueva Editorial",
  "year": 1970
}
```
* **Ejemplo de Respuesta (200 OK):**
```json
{
  "id": 11,
  "titulo": "Cien años de soledad",
  "autor": "Gabriel García Márquez",
  "editorial": "Nueva Editorial",
  "publicadoEn": 1970,
  "categoria": "Ficción"
}
```

### 5. Eliminar un libro
* **Método y Ruta:** `DELETE /books/{id}`
* **Descripción:** Elimina un libro de la base de datos mediante su ID.
* **Ejemplo de Respuesta (204 No Content):**
*(No devuelve contenido en el cuerpo de la respuesta, solo el código de estado HTTP 204).*

### 6. Registrar un préstamo
* **Método y Ruta:** `POST /loans`
* **Descripción:** Crea un nuevo préstamo de un ejemplar para un usuario.
* **Ejemplo de Petición:**
```json
{
  "userId": 1,
  "inventoryNumber": "EJ-001"
}
```
* **Ejemplo de Respuesta (200 OK):**
```json
{
  "message": "Préstamo registrado correctamente."
}
```

### 7. Devolver un préstamo
* **Método y Ruta:** `POST /loans/return`
* **Descripción:** Registra la devolución de un ejemplar prestado.
* **Ejemplo de Petición:**
```json
{
  "userId": 1,
  "inventoryNumber": "EJ-001"
}
```
* **Ejemplo de Respuesta (200 OK):**
```json
{
  "message": "Devolución registrada con éxito."
}
```
