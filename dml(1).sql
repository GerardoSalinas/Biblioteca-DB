USE biblioteca;

-- Tabla language
INSERT INTO language (language) VALUES
('Inglés'),
('Español'),
('Francés');

-- Tabla author
INSERT INTO author (name) VALUES
('Robert Eisbert'),
('Robert Resnick'),
('Claude Cohen-Tannoudji'),
('Bernard Diu'),
('Franck Laloë'),
('Albert Messiah'),
('Virgilio Beltrán'),
('Eliezer Braun'),
('David Halliday'),
('F. Marin Alonso'),
('Martin Lipschutz');

-- Tabla category
INSERT INTO category (name, parent_category_id, icon, enabled) VALUES
('Matemáticas', NULL, 'math_icon.png', 1),
('Física', NULL, 'physics_icon.png', 1),
('Ecuaciones Diferenciales', 1, 'diff_eq_icon.png', 1),
('Geometria', 1, 'trig_icon.png', 1),
('Física Cuántica', 2, 'quantum_icon.png', 1),
('Física Lineal', 2, 'linear_physics_icon.png', 1),
('Ingeniería en Sistemas', NULL, 'systems_engineering_icon.png', 1),
('Ciencia de Datos', 7, 'data_science_icon.png', 1),
('Inteligencia Artificial', 7, 'ai_icon.png', 1);

-- Tabla book
INSERT INTO book (language_id, title, isbn, edition, publication_date, publisher, description, amount_pages) VALUES
(1, 'Física Cuántica de Átomos, Moléculas, Sólidos, Núcleos y Partículas', '9780471873730', 'vol.1', '2007-06-26', 'Wiley', 'Cuántica elemental explica claramente las propiedades de los sistemas cuánticos más importantes.', 713),
(2, 'Quantum Mechanics', '9783527345533', 'vol.1', '2019-12-26', 'Wiley', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Fugit optio a esse quidem temporibus ratione autem ea tempora quo, incidunt delectus, architecto mollitia similique exercitationem, culpa perspiciatis atque officiis porro.', 713),
(2, 'Quantum Mechanics', '9780471873730', 'vol.2', '2013-06-26', 'Wiley', 'Una revisión de un texto exitoso de nivel junior/senior, esta introducción a la mecánica cuántica elemental explica claramente las propiedades de los sistemas cuánticos más importantes. Hace hincapié en las aplicaciones.', 713),
(1, 'Mecanica Cuantica', '9783527345533', 'vol. 1', '2016-07-25', 'Wiley', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Fugit optio a esse quidem temporibus ratione autem ea tempora quo, incidunt delectus, architecto mollitia similique exercitationem, culpa perspiciatis atque officiis porro.', 713),
(1, 'Principios de física', '9780471873730', 'vol.1', '2007-06-26', 'Wiley', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Fugit optio a esse quidem temporibus ratione autem ea tempora quo, incidunt delectus, architecto mollitia similique exercitationem, culpa perspiciatis atque officiis porro.', 713),
(1, 'Fundamentos de Física', '9783527345533', 'vol.1', '2007-06-26', 'Wiley', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Fugit optio a esse quidem temporibus ratione autem ea tempora quo, incidunt delectus, architecto mollitia similique exercitationem, culpa perspiciatis atque officiis porro.', 713),
(1, 'Problemas de Física', '9780471873730', 'vol.1', '2007-06-26', 'Wiley', 'Incluye nuevos apéndices sobre temas como la cristalografía, la Descripción Integral de Fourier de un Grupo de Ondas y la Tiempo.', 713),
(1, 'Geometria Diferencial', '9780471873730', 'vol.1', '2007-06-26', 'Wiley', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Fugit optio a esse quidem temporibus ratione autem ea tempora quo, incidunt delectus, architecto mollitia similique exercitationem, culpa perspiciatis atque officiis porro.', 713),
(1, 'Curso de analisis matemático', '9780471873730', 'vol.1', '2007-06-26', 'Wiley', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Fugit optio a esse quidem temporibus ratione autem ea tempora quo, incidunt delectus, architecto mollitia similique exercitationem, culpa perspiciatis atque officiis porro.', 713),
(1, 'Introducción a la Ciencia de Datos', '9781491912058', '1ra', '2015-10-20', 'O /Reilly Media', 'Un enfoque práctico y accesible para aprender los fundamentos de la ciencia de datos.', 400),
(1, 'Aprendizaje Profundo', '9780262035613', '1ra', '2016-11-18', 'MIT Press', 'Un libro completo sobre las técnicas y aplicaciones del aprendizaje profundo.', 800),
(2, 'Artificial Intelligence: A Modern Approach', '9780136042594', '3ra', '2009-12-11', 'Pearson', 'Un libro de referencia estándar en inteligencia artificial, cubriendo desde los fundamentos hasta los temas avanzados.', 1152),
(1, 'Ingeniería de Software', '9780133943030', '9na', '2014-03-10', 'Pearson', 'Fundamentos de la ingeniería de software para construir y gestionar proyectos exitosos.', 800),
(2, 'Data Science for Business', '9781449361327', '1ra', '2013-08-19', 'O\Reilly Media', 'Una guía para comprender los conceptos básicos de la ciencia de datos aplicada en el ámbito empresarial.', 432);

-- Tabla authors_per_book
INSERT INTO authors_per_book (book_id, author_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 3),
(4, 6),
(5, 7),
(5, 8),
(6, 9),
(6, 2),
(7, 10),
(8, 11),
(9, 3),
(10, 3),
(10, 5),
(11, 3),
(12, 4),
(12, 5),
(13, 8),
(14, 6);

-- Tabla categories_per_book
INSERT INTO categories_per_book (book_id, category_id) VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 2),
(6, 2),
(7, 6),
(8, 4),
(9, 1),
(10, 8),
(11, 9),
(12, 9),
(13, 7),
(14, 8);

-- Tabla library
INSERT INTO library (library_id, career, name, password, email, enabled, theme, logo) VALUES 
('IS', 'Ingeniería en Sistemas', 'Biblioteca IS', 'password123', 'ac.ingsistemas.cu@unah.edu.hn', 1, 'Light', 'IS.png'),
('FS', 'Física', 'Biblioteca de Física', 'password123', 'ac.ingsistemas.cu@unah.edu.hn', 1, 'Light', 'physic-icon.png'),
('MM', 'Matemáticas', 'Biblioteca de Matemáticas', 'password123', 'ac.ingsistemas.cu@unah.edu.hn', 1, 'Light', 'categoriesIcon/matematicas_4.png');

-- Tabla stock
INSERT INTO stock (book_id, library_id, enabled, total_amount, location, units_available, description) VALUES 
( 1, 'FS', 1, 3, 'Algun lugar', 3,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 2, 'FS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 3, 'FS', 1, 3, 'Algun lugar', 3,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 4, 'FS', 0, 1, 'Algun lugar', 1,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 5, 'FS', 1, 3, 'Algun lugar', 3,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 6, 'FS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 7, 'FS', 0, 1, 'Algun lugar', 1,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 8, 'FS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 8, 'MM', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 9, 'MM', 0, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 1, 'MM', 1, 3, 'Algun lugar', 3,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 2, 'MM', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 9, 'IS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 10, 'IS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 11, 'IS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 12, 'IS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 13, 'IS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.'),
( 14, 'IS', 1, 2, 'Algun lugar', 2,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est architecto temporibus obcaecati ratione unde adipisci officia quisquam.');

-- Table person
INSERT INTO person ( email, password, names, last_names, phone_number, account_number) VALUES 
('admin1@unah.hn', '1234', 'Maria Jose', 'Gomez Pineda', '9856-9856', '20201001514'),
('admin2@unah.hn', '12345', 'Ana Paola', 'Quiroz Pineda', '9856-9857', '20191025896'),
('admin3@unah.hn', '12346', 'Jose Manuel', 'Juarez Pineda', '9856-9858', '20181036985'),
('user1@unah.hn', '12347', 'Karla Patricia', 'Gomez Villeda', '9856-9859', '20211003698'),
('user2@unah.hn', '1238', 'Juana', 'Peña Villeda', '9856-9850', '20231003268'),
('user3@unah.hn', '12349', 'Jorge', 'Corea Peña', '9856-9851', '20241028542'),
('user4@unah.hn', '123410', 'Sebastian', 'Gomez Ordoñez', '9856-9852', '20211008523'),
('user5@unah.hn', '123411', 'Pablo Andre', 'Flores Cuello', '9856-9853', '20221035268');

-- Table administrator
INSERT INTO administrator (administrator_id, library_id) VALUES
('admin1@unah.hn', 'IS'),
('admin2@unah.hn', 'FS'),
('admin3@unah.hn', 'MM');

-- Table user
INSERT INTO user (user_id, reputation) VALUES
('user1@unah.hn', 5),
('user2@unah.hn', 7),
('user3@unah.hn', 9),
('user4@unah.hn', 10),
('user5@unah.hn', 10);

-- Table libraries_per_user
INSERT INTO libraries_per_user (library_id, user_id) VALUES
('IS', 'user1@unah.hn'),
('IS', 'user3@unah.hn'),
('FS', 'user1@unah.hn'),
('FS', 'user2@unah.hn'),
('MM', 'user4@unah.hn'),
('MM', 'user5@unah.hn'),
('FS', 'user5@unah.hn');


-- Table state
INSERT INTO state (state) VALUES
('En curso'),
('Finalizada'),
('Atrasada'),
('Cancelada');