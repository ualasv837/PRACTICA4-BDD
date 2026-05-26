USE `PrestamosBiblioteca`;

-- Datos para la tabla Categoria
INSERT INTO `Categoria` (`categoria`) VALUES
('Ficción'), ('No Ficción'), ('Ciencia'), ('Historia'), ('Biografía'),
('Fantasía'), ('Misterio'), ('Romance'), ('Terror'), ('Aventura'),
('Infantil'), ('Juvenil'), ('Educación'), ('Arte'), ('Cómics'),
('Cocina'), ('Deportes'), ('Tecnología'), ('Salud'), ('Viajes');

-- Datos adicionales para la tabla Categoria
INSERT INTO `Categoria` (`categoria`) VALUES
('Psicología'), ('Negocios'), ('Autoayuda'), ('Religión'), ('Filosofía');

-- Datos para la tabla Estado
INSERT INTO `Estado` (`estado`) VALUES
('Disponible'), ('Prestado'), ('Reservado'), ('Dañado'), ('Extraviado'),
('En reparación'), ('Nuevo'), ('Usado'), ('En espera'), ('Retirado'),
('En tránsito'), ('En revisión'), ('En inventario'), ('En cuarentena'), ('En limpieza'),
('En restauración'), ('En proceso'), ('En evaluación'), ('En archivo'), ('En reserva');

-- Datos adicionales para la tabla Estado
INSERT INTO `Estado` (`estado`) VALUES
('En exhibición'), ('En préstamo interbibliotecario'), ('En digitalización'), ('En almacenamiento'), ('En conservación');

-- Datos para la tabla Libro
INSERT INTO `Libro` (`titulo`, `autor`, `editorial`, `publicadoEn`, `categoria`) VALUES
('El Quijote', 'Miguel de Cervantes', 'Editorial A', 1605, 'Ficción'),
('Cien años de soledad', 'Gabriel García Márquez', 'Editorial B', 1967, 'Ficción'),
('1984', 'George Orwell', 'Editorial C', 1949, 'Ciencia'),
('La Odisea', 'Homero', 'Editorial D', -800, 'Historia'),
('El Principito', 'Antoine de Saint-Exupéry', 'Editorial E', 1943, 'Infantil'),
('La sombra del viento', 'Carlos Ruiz Zafón', 'Editorial F', 2001, 'Misterio'),
('El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Editorial G', 1985, 'Romance'),
('Brave New World', 'Aldous Huxley', 'Editorial H', 1932, 'Ciencia'),
('La Ilíada', 'Homero', 'Editorial I', -750, 'Historia'),
('Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Editorial J', 1997, 'Fantasía');

-- Datos para la tabla Ejemplar
INSERT INTO `Ejemplar` (`numeroInventario`, `estado`, `idLibro`) VALUES
('INV001', 'Disponible', 1),
('INV002', 'Prestado', 2),
('INV003', 'Reservado', 3),
('INV004', 'Dañado', 4),
('INV005', 'Disponible', 5),
('INV006', 'Disponible', 6),
('INV007', 'Prestado', 7),
('INV008', 'Reservado', 8),
('INV009', null, 8),
('INV010', null, 8);

-- Datos para la tabla TipoUsuario
INSERT INTO `TipoUsuario` (`tipoUsuario`) VALUES
('Estudiante'), ('Profesor'), ('Investigador'), ('Administrativo'), ('Visitante'),
('Externo'), ('Alumno'), ('Docente'), ('Bibliotecario'), ('Invitado'),
('Socio'), ('Miembro'), ('Colaborador'), ('Asistente'), ('Voluntario'),
('Supervisor'), ('Director'), ('Coordinador'), ('Consultor'), ('Editor'),
('Investigador Senior'), ('Estudiante de Posgrado'), ('Profesor Visitante'), ('Bibliotecario Jefe'), ('Voluntario Externo');

-- Datos para la tabla Usuario
INSERT INTO `Usuario` (`nombre`, `apellidos`, `email`, `telefono`, `sancionadoHasta`, `tipoUsuario`) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '123456789', NULL, 'Estudiante'),
('María', 'Gómez', 'maria.gomez@example.com', '987654321', NULL, 'Profesor'),
('Luis', 'Martínez', 'luis.martinez@example.com', '456123789', NULL, 'Investigador'),
('Ana', 'López', 'ana.lopez@example.com', '789456123', NULL, 'Administrativo'),
('Carlos', 'Hernández', 'carlos.hernandez@example.com', '321654987', NULL, 'Visitante'),
('Sofía', 'Ramírez', 'sofia.ramirez@example.com', '654987321', NULL, 'Investigador Senior'),
('Diego', 'Torres', 'diego.torres@example.com', '789123456', NULL, 'Estudiante de Posgrado'),
('Laura', 'Morales', 'laura.morales@example.com', '321789654', NULL, 'Profesor Visitante'),
('Jorge', 'Vargas', 'jorge.vargas@example.com', '987321654', NULL, 'Bibliotecario Jefe'),
('Elena', 'Castro', 'elena.castro@example.com', '123789456', NULL, 'Voluntario Externo');

-- Datos para la tabla HistorialPrestamos
INSERT INTO `HistorialPrestamos` (`numeroInventario`, `idUsuario`, `fechaPrestamo`, `fechaDevolucion`) VALUES
('INV001', 1, '2023-01-01 10:00:00', '2023-01-15 10:00:00'),
('INV002', 2, '2023-01-01 11:00:00', '2023-01-12 11:00:00'),
('INV003', 3, '2023-01-01 12:00:00', '2023-01-09 12:00:00'),
('INV004', 4, '2023-04-01 13:00:00', '2023-04-15 13:00:00'),
('INV005', 5, '2023-05-01 14:00:00', '2023-05-15 14:00:00'),
('INV006', 6, '2023-06-01 10:00:00', '2023-06-15 10:00:00'),
('INV007', 2, '2023-07-01 11:00:00', '2023-07-15 11:00:00'),
('INV001', 8, '2023-08-01 12:00:00', '2023-08-15 12:00:00'),
('INV002', 9, '2023-09-01 13:00:00', '2023-09-15 13:00:00'),
('INV003', 10, '2023-10-01 14:00:00', '2023-10-15 14:00:00');

-- Datos para la tabla Prestamo
INSERT INTO `Prestamo` (`numeroInventario`, `idUsuario`, `fechaPrestamo`, `fechaLimite`, `fechaDevolucion`) VALUES
('INV001', 1, '2023-06-01 10:00:00', '2023-06-15 10:00:00', NULL),
('INV002', 2, '2023-07-01 11:00:00', '2023-07-15 11:00:00', NULL),
('INV003', 3, '2023-08-01 12:00:00', '2023-08-15 12:00:00', NULL),
('INV007', 7, '2023-12-01 11:00:00', '2023-12-15 11:00:00', NULL),
('INV008', 8, '2024-01-01 12:00:00', '2024-01-15 12:00:00', NULL),
('INV009', 9, '2024-02-01 13:00:00', '2024-02-15 13:00:00', NULL),
('INV010', 10, '2024-03-01 14:00:00', '2024-03-15 14:00:00', NULL);

-- Datos para la tabla Reseña
INSERT INTO `Reseña` (`idUsuario`, `idLibro`, `valoracion`, `opinion`) VALUES
(1, 1, 5, 'Excelente libro'),
(2, 2, 4, 'Muy interesante'),
(3, 3, 3, 'Regular'),
(4, 4, 2, 'No me gustó'),
(5, 5, 1, 'Pésimo'),
(6, 6, 5, 'Obra maestra'),
(7, 7, 4, 'Muy bueno'),
(8, 8, 3, 'Interesante'),
(9, 9, 2, 'Podría mejorar'),
(10, 10, 1, 'No me gustó');

-- Datos para la tabla Reserva
INSERT INTO `Reserva` (`idUsuario`, `idLibro`, `fechaReserva`) VALUES
(1, 1, '2023-11-01 10:00:00'),
(2, 2, '2023-11-02 11:00:00'),
(3, 3, '2023-11-03 12:00:00'),
(4, 4, '2023-11-04 13:00:00'),
(5, 5, '2023-11-05 14:00:00'),
(6, 6, '2024-04-01 10:00:00'),
(7, 7, '2024-04-02 11:00:00'),
(8, 8, '2024-04-03 12:00:00'),
(9, 9, '2024-04-04 13:00:00'),
(10, 10, '2024-04-05 14:00:00');

-- Datos para la tabla Sancion
INSERT INTO `Sancion` (`fechaInicio`, `fechaFin`, `numeroInventario`, `idUsuario`) VALUES
('2023-12-01 10:00:00', '2023-12-15 10:00:00', 'INV001', 1),
('2023-12-02 11:00:00', '2023-12-16 11:00:00', 'INV002', 2),
('2023-12-03 12:00:00', '2023-12-17 12:00:00', 'INV003', 3),
('2023-12-04 13:00:00', '2023-12-18 13:00:00', 'INV004', 4),
('2023-12-05 14:00:00', '2023-12-19 14:00:00', 'INV005', 5),
('2024-05-01 10:00:00', '2024-05-15 10:00:00', 'INV006', 6),
('2024-05-02 11:00:00', '2024-05-16 11:00:00', 'INV007', 7),
('2024-05-06 10:00:00', '2024-05-20 10:00:00', 'INV001', 1),
('2024-05-07 11:00:00', '2024-05-21 11:00:00', 'INV002', 2),
('2024-05-08 12:00:00', '2024-05-22 12:00:00', 'INV003', 3),
('2024-05-09 13:00:00', '2024-05-23 13:00:00', 'INV004', 4),
('2024-05-10 14:00:00', '2024-05-24 14:00:00', 'INV005', 5);
