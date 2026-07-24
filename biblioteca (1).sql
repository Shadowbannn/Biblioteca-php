-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2026 a las 05:22:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `anio` smallint(6) NOT NULL,
  `paginas` int(11) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1,
  `genero` varchar(50) DEFAULT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 1,
  `portada` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `anio`, `paginas`, `disponible`, `genero`, `editorial`, `isbn`, `cantidad`, `portada`) VALUES
(1, 'La Divina Comedia', 'Dante Alighieri', 1320, 544, 1, 'Fantasia', NULL, NULL, 1, 'portada_6a5598a0b83479.28562987.jpg'),
(2, 'Metamorfosis', 'Franz Kafka', 1915, 120, 1, NULL, NULL, NULL, 1, 'portada_6a5412c2e19e66.91459552.jpg'),
(3, 'El Extranjero', 'Albert Camus', 1942, 124, 1, 'Filosofia', NULL, NULL, 1, 'portada_6a559928884ff3.65085973.jpg'),
(4, 'Crimen y Castigo', ' Fiódor dostoyevski', 1986, 653, 1, NULL, NULL, NULL, 1, 'portada_6a541812ac6968.58678455.jpeg'),
(5, 'Ready Player One', 'Ernest Cline', 2008, 325, 1, 'Ficcion', NULL, NULL, 1, 'portada_6a55970c42f875.30665934.jpg'),
(6, 'Historia de Peñarol', 'Luciano Alvarez', 2004, 564, 1, 'VAMO PEÑAROOOL', NULL, NULL, 1, 'portada_6a5427a75ea5c3.20312278.jpg'),
(7, 'West Side story', 'Irving Shulman', 1967, 124, 1, NULL, NULL, NULL, 1, 'portada_6a542849771035.44904304.jpg'),
(8, 'Ciudades de papel', 'John Green', 2014, 271, 1, 'Young Adult Fiction', NULL, NULL, 1, 'portada_6a55973242e547.68263443.jpg'),
(9, 'Violet y Finch', 'Jennifer Niven', 2015, 400, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a55977aea0dd4.89953524.jpg'),
(10, 'Secretos en la posada vieja', 'Helen Velando', 2012, 251, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a559b31e2d134.62911476.jpg'),
(11, 'El libro Troll', 'El Rubius', 2014, 192, 0, 'Troll', NULL, NULL, 1, 'portada_6a55983fa0e7e4.84550587.jpg'),
(12, 'En el bosque, bajo los cerezos en flor', 'Ango Sakaguchi', 2013, 152, 1, 'Juvenil,No ficcion', NULL, NULL, 1, 'portada_6a5588bcb86530.55429848.jpg'),
(13, 'Los habitantes del bosque', 'Thomas Hardy', 1887, 452, 1, 'Ficcion', NULL, NULL, 1, 'portada_6a558be317e153.52202247.jpg'),
(14, 'Misterio en el Cabo Polonio', 'Helen Velando', 2001, 203, 1, 'Childrens', NULL, NULL, 1, 'portada_6a558ebfa12904.97068898.jpg'),
(15, 'La barraca', 'Vicente Blasco Ibáñez', 1898, 232, 1, 'Ficcion', NULL, NULL, 1, 'portada_6a55963c93bac9.94423243.jpg'),
(16, 'Everything Is Tuberculosis: The History and Persistence of Our Deadliest Infection', 'John  Green', 2025, 198, 1, 'No ficcion', NULL, NULL, 1, 'portada_6a55998c841229.69164387.jpg'),
(17, 'Chainsaw Man, Vol. 1: Dog and Chainsaw', 'Tatsuki Fujimoto', 2019, 192, 1, 'Manga', NULL, NULL, 1, 'portada_6a559b7e8befc4.34270938.jpg'),
(18, 'Garden of Words', '新海誠', 2013, 190, 1, 'Manga', NULL, NULL, 1, 'portada_6a559bbf95fbf1.90192879.jpg'),
(19, 'La desaparición de Stephanie Mailer', 'Joël Dicker', 2018, 656, 1, 'Thriller', NULL, NULL, 1, 'portada_6a559beb734af0.69365148.jpg'),
(20, 'Solo Leveling 1', '추공', 2018, 313, 1, 'Manhwa', NULL, NULL, 1, 'portada_6a559c4fb089c4.95633438.jpg'),
(21, 'Diary of a Wimpy Kid (Diary of a Wimpy Kid #1)', 'Jeff Kinney', 2007, 218, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a559cba0cfb38.09379738.jpg'),
(22, 'Rodrick Rules (Diary of a Wimpy Kid #2)', 'Jeff Kinney', 2008, 228, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a559cf7ae8331.18975375.jpg'),
(23, 'The Last Straw (Diary of a Wimpy Kid #3)', 'Jeff Kinney', 2009, 218, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a559d28689711.23894404.jpg'),
(24, 'Dog Days (Diary of a Wimpy Kid #4)', 'Jeff Kinney', 2007, 218, 1, '', NULL, NULL, 1, 'portada_6a559d6754e717.43636481.jpg'),
(25, 'The Ugly Truth (Diary of a Wimpy Kid #5)', 'Jeff Kinney', 2010, 217, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a559ee7b19987.40858342.jpg'),
(26, 'Cabin Fever (Diary of a Wimpy Kid #6)', 'Jeff Kinney', 2011, 218, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a559f27509d30.78092610.jpg'),
(27, 'The Third Wheel (Diary of a Wimpy Kid #7)', 'Jeff Kinney', 2012, 224, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a559f446d8cb6.18905475.jpg'),
(28, 'Hard Luck (Diary of a Wimpy Kid #8)', 'Jeff Kinney', 2013, 217, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a559e274bd971.78007657.jpg'),
(29, 'Attack On Titan, Vol. 1', 'Hajime Isayama', 2010, 193, 1, 'Manga', NULL, NULL, 1, 'portada_6a55a6335f8392.03463302.jpg'),
(30, 'Detectives en el Cementerio Central', 'Helen Velando', 2002, 236, 1, 'Childrens', NULL, NULL, 1, 'portada_6a55a6a3ce6451.90999504.jpg'),
(31, 'La pareja de al lado', 'Shari Lapeña', 2016, 390, 1, 'Thriller', NULL, NULL, 1, 'portada_6a559448463074.08019943.jpg'),
(32, 'Berserk 1', 'Kentaro Miura', 1990, 224, 1, 'Manga', NULL, NULL, 1, 'portada_6a55a96306afa1.88660799.jpg'),
(33, 'Billie Eilish', 'Billie Eilish', 2021, 336, 1, 'Biografia', NULL, NULL, 1, 'portada_6a55a9ad722385.65689690.jpg'),
(34, 'My Broken Mariko', 'Waka Hirako', 2020, 194, 1, 'Manga', NULL, NULL, 1, 'portada_6a55a9130a92a5.16751180.jpg'),
(35, 'Cigarette Anthology', 'Inio Asano', 2015, 184, 1, 'Manga', NULL, NULL, 1, 'portada_6a55a83b2f92b0.86965612.jpg'),
(36, 'La chica a la orilla del mar 1-2', 'Inio Asano', 2016, 410, 1, 'Manga', NULL, NULL, 1, 'portada_6a55a879373ee1.19742164.jpg'),
(37, 'Oyasumi Punpun 1', 'INIO ASANO', 2007, 232, 1, 'Manga', NULL, NULL, 1, 'portada_6a55a80c4a6ca7.11448795.jpg'),
(38, 'El fin del mundo y antes del amanecer', 'Inio Asano', 2008, 264, 1, 'Manga', NULL, NULL, 1, 'portada_6a55a8b5870081.47531463.jpg'),
(40, 'Another', 'Yukito Ayatsuji', 2009, 677, 1, 'Manga', NULL, NULL, 1, 'portada_6a55aa6c5f6356.30878403.jpg'),
(41, 'Scott Pilgrim\'s Precious Little Life', 'Bryan Lee O\'Malley', 2004, 168, 1, 'Comic', NULL, NULL, 1, 'portada_6a55ab120a13a4.71910694.jpg'),
(43, 'Entre dos mundos (Las tejedoras de destinos, #2)', 'Gennifer Albin', 2013, 441, 1, 'usa', NULL, NULL, 1, 'portada_6a55771dcb4563.26448178.jpg'),
(44, 'Las tejedoras de destinos (Las tejedoras de destinos, #1)', 'Gennifer Albin', 2012, 432, 1, 'usa', NULL, NULL, 1, NULL),
(45, 'Diary of a Wimpy Kid (Diary of a Wimpy Kid, #1)', 'Jeff Kinney', 2007, 226, 1, 'fisico, usa', NULL, NULL, 1, NULL),
(47, 'Las ventajas de ser invisible', 'Stephen Chbosky', 1999, 264, 1, 'usa', NULL, NULL, 1, NULL),
(48, 'The Little Prince', 'Antoine de Saint-Exupéry', 1943, 96, 1, 'francia', NULL, NULL, 1, NULL),
(49, 'The Housemaid (The Housemaid, #1)', 'Freida McFadden', 2022, 329, 1, 'usa', NULL, NULL, 1, NULL),
(50, 'El tesoro de Cañada Seca', 'Julián Murguía', 1994, 159, 1, 'uruguay', NULL, NULL, 1, NULL),
(51, 'La llave emplumada', 'Germán Machado', 2012, 105, 1, 'uruguay', NULL, NULL, 1, NULL),
(52, 'Un día en Horrorlandia (Pesadillas, #1)', 'R.L. Stine', 1994, 114, 1, 'usa', NULL, NULL, 1, NULL),
(53, 'Last Stop on Market Street', 'Matt de la Peña', 2015, 32, 1, 'usa', NULL, NULL, 1, 'portada_6a55772e230404.38620695.jpg'),
(54, 'Volverás a Alaska', 'Kristin Hannah', 2018, 560, 1, 'usa', NULL, NULL, 1, NULL),
(55, 'Las aventuras de Tom Sawyer', 'Mark Twain', 0, 264, 1, 'fisico, favorites-all-time, usa', NULL, NULL, 1, 'portada_6a55773216c753.23954881.jpg'),
(56, 'El Color Púrpura', 'Alice Walker', 1982, 220, 1, 'Ficcion', NULL, NULL, 1, 'portada_6a55913ec9b460.95889597.jpg'),
(57, 'La Isla de los Vientos prohibidos', 'Helen Velando', 2015, 192, 1, 'favorites-all-time, fisico, uruguay', NULL, NULL, 1, NULL),
(58, 'Caja de secretos', 'Carmen Vazquez-Vigo', 1989, 112, 1, 'Young Adult', NULL, NULL, 1, 'portada_6a5594008fd3a3.61918759.jpg'),
(59, 'La historia de Ernesto', 'Mercè Company', 1986, 70, 1, 'espana', NULL, NULL, 1, 'portada_6a557737e61623.48388681.jpg'),
(60, 'El silencio de la ciudad blanca (La ciudad blanca, #1)', 'Eva García Sáenz de Urturi', 2016, 482, 1, 'espana', NULL, NULL, 1, NULL),
(61, '1930: El viaje', 'Ana Solari', 2023, 221, 1, 'fisico, uruguay', NULL, NULL, 1, NULL),
(62, 'Hidden Pictures', 'Jason Rekulak', 2022, 372, 1, 'usa', NULL, NULL, 1, 'portada_6a55773bcbb0c6.96048769.jpg'),
(63, 'Raices', 'Alex Haley', 1976, NULL, 1, 'usa', NULL, NULL, 1, NULL),
(64, 'The Kidnapping of the President', 'Charles Bradley Templeton', 1974, 284, 1, 'fisico, usa', NULL, NULL, 1, NULL),
(66, 'Matilda', 'Roald Dahl', 1988, 240, 1, 'inglaterra', NULL, NULL, 1, 'portada_6a5577451f7ec3.19172268.jpg'),
(67, 'The Innocent (Marshal Guarnaccia Mystery #13)', 'Magdalen Nabb', 2005, 290, 1, 'inglaterra', NULL, NULL, 1, NULL),
(68, 'El Caballero Del Terror', 'Connie Laux', 1996, NULL, 1, 'usa', NULL, NULL, 1, NULL),
(69, 'Un final de película (Spanish Edition)', 'Robyn Sisman', 2008, 348, 1, 'fisico, usa', NULL, NULL, 1, 'portada_6a55774a6f5c88.01604151.jpg'),
(70, 'Lili, Libertad/ Lili, Liberty', 'Gonzalo Maure', 2005, 112, 1, 'Ficcion', NULL, NULL, 1, 'portada_6a55939c402328.06891928.jpg'),
(71, 'El crucero del Snark', 'Jack London', 1907, 278, 1, 'fisico, usa', NULL, NULL, 1, NULL),
(72, 'Un amor en Bangkok', 'Napoleón Baccino Ponce de León', 1994, 258, 1, 'fisico, uruguay', NULL, NULL, 1, NULL),
(73, 'El paciente del doctor Parker', 'Jasper DeWitt', 2020, 169, 1, 'usa', NULL, NULL, 1, 'portada_6a55775079bbb9.85987013.jpg'),
(74, 'Un invierno en Mallorca', 'George Sand', 0, 206, 1, 'fisico, francia', NULL, NULL, 1, NULL),
(75, 'The Golden Goblet', 'Eloise Jarvis McGraw', 1961, 248, 1, 'fisico, usa', NULL, NULL, 1, NULL),
(76, 'En la cuerda floja', 'Philippe Petit', 2003, 280, 1, 'fisico, francia', NULL, NULL, 1, NULL),
(77, 'Hashish', 'Henry de Monfreid', 1933, 285, 1, 'fisico, francia', NULL, NULL, 1, NULL),
(78, 'The Hollow Places', 'T. Kingfisher', 2020, 341, 1, 'usa', NULL, NULL, 1, NULL),
(80, 'Canyon Passage', 'Ernest Haycox', 1945, 252, 1, 'fisico, usa', NULL, NULL, 1, NULL),
(81, 'Los trabajos nocturnos', 'Amalia Jamilis', 1971, 111, 1, 'fisico, argentina', NULL, NULL, 1, NULL),
(82, 'And Tango Makes Three', 'Justin Richardson', 2005, 32, 1, 'usa', NULL, NULL, 1, NULL),
(83, 'La larga marcha', 'Stephen  King', 1979, 352, 1, 'usa', NULL, NULL, 1, NULL),
(84, 'Friend or Foe', 'Michael Morpurgo', 1979, 122, 1, 'fisico, inglaterra', NULL, NULL, 1, NULL),
(85, 'El faro del fin del mundo', 'Jules Verne', 1905, 172, 1, 'fisico, francia', NULL, NULL, 1, NULL),
(86, 'On the Case (From the Files of Madison Finn, #17)', 'Laura Dower', 2004, 176, 1, 'fisico, usa', NULL, NULL, 1, NULL),
(88, 'The Way through the Woods (Inspector Morse, #10)', 'Colin Dexter', 1992, 320, 1, 'fisico, inglaterra', NULL, NULL, 1, NULL),
(89, 'Hotel', 'Arthur Hailey', 1965, 480, 1, 'fisico, usa', NULL, NULL, 1, NULL),
(90, 'Súper Pocha Contra la Niebla Tenebrosa (Súper Pocha, #4)', 'Helen Velando', 0, NULL, 1, 'uruguay', NULL, NULL, 1, NULL),
(92, 'Un capitán de quince años I (Un capitán de quince años, #1)', 'Jules Verne', 0, 208, 1, 'francia', NULL, NULL, 1, NULL),
(93, 'Mi insecto interesante (KF8) (Spanish Edition)', 'Mercedes Pérez Sabbi', 2014, 86, 1, 'fisico, argentina', NULL, NULL, 1, NULL),
(94, 'Coraline', 'P. Craig Russell', 2008, 186, 1, 'fisico, usa', NULL, NULL, 1, NULL),
(95, 'Demon Slayer: Kimetsu No Yaiba Volume 01 (Kimetsu no Yaiba, #1)', 'Koyoharu Gotouge', 2016, 192, 1, 'Manga', NULL, NULL, 1, NULL),
(97, 'El grito de la lechuza', 'Patricia Highsmith', 1962, 357, 1, 'favorites', NULL, NULL, 1, NULL),
(98, 'El Color Que Cayo del Cielo', 'H.P. Lovecraft', 1994, 35, 1, 'Horror', NULL, NULL, 1, 'portada_6a5594f72c9566.26092202.jpg'),
(99, 'Si te dicen que caí', 'Juan Marsé', 1973, 320, 1, 'fisico', NULL, NULL, 1, NULL),
(100, 'Ao Haru Ride Complete Magna Set Vol. 1-13 by Io Sakisaka', 'Io Sakisaka', 2012, 1300, 1, 'Manga', NULL, NULL, 1, NULL),
(101, 'Eleanor & Park', 'Rainbow Rowell', 2012, 432, 1, '', NULL, NULL, 1, 'portada_6a5577765d8dd5.71815105.jpg'),
(102, 'Uzumaki', 'Junji Ito', 1998, 653, 1, '', NULL, NULL, 1, NULL),
(104, 'El Instituto', 'Stephen  King', 2019, 624, 1, 'fisico', NULL, NULL, 1, NULL),
(105, 'Juegos de ingenio / State of Mind (Spanish Edition)', 'John Katzenbach', 1997, 544, 1, '', NULL, NULL, 1, 'portada_6a5577879bf812.69355316.jpg'),
(106, 'El círculo de mujeres de la doctora Tan', 'Lisa See', 2023, 453, 1, '', NULL, NULL, 1, 'portada_6a55778b384c11.87466864.jpg'),
(107, 'Picture Perfect', 'Jodi Picoult', 1995, 369, 1, 'fisico', NULL, NULL, 1, 'portada_6a55778e23b746.03199751.jpg'),
(108, 'El desorden que dejas', 'Carlos  Montero', 2016, 408, 1, 'fisico', NULL, NULL, 1, NULL),
(109, 'Disparen sobre el pianista', 'David Goodis', 1956, 208, 1, 'fisico', NULL, NULL, 1, 'portada_6a557790790067.33603810.jpg'),
(110, 'Purga', 'Sofi Oksanen', 2008, 381, 1, 'fisico', NULL, NULL, 1, NULL),
(111, 'El Conde de Montecristo', 'Alexandre Dumas', 0, NULL, 1, 'fisico', NULL, NULL, 1, NULL),
(112, 'El Diablo En La Botella', 'Robert Louis Stevenson', 0, NULL, 1, '', NULL, NULL, 1, NULL),
(113, 'Viaje al centro de la tierra', 'Equipo de Servilibro', 0, 192, 1, 'fisico', NULL, NULL, 1, NULL),
(114, 'El mastín de los Baskerville', 'Arthur Conan Doyle', 1902, 223, 1, 'fisico', NULL, NULL, 1, NULL),
(115, 'Todo esto te daré', 'Dolores Redondo', 2016, 626, 1, 'favorites-all-time, fisico', NULL, NULL, 1, NULL),
(116, 'El Despertar de la Serpiente', 'Claire Davis', 2006, 333, 1, 'fisico', NULL, NULL, 1, NULL),
(117, 'La esfinge', 'Robin Cook', 1979, 320, 1, 'fisico', NULL, NULL, 1, NULL),
(118, 'El poeta', 'Michael Connelly', 1996, 592, 1, 'fisico', NULL, NULL, 1, NULL),
(119, 'Las mejores historias insólitas: Antología del horror y el misterio', 'Edward Bulwer-Lytton', 1966, 556, 1, 'fisico', NULL, NULL, 1, NULL),
(120, 'Oh, the Places You\'ll Go!', 'Dr. Seuss', 1990, 44, 1, 'Childrens', NULL, NULL, 1, 'portada_6a5591091ef051.71337018.jpg'),
(121, 'El cuarto mono (4MK Thriller, #1)', 'J.D. Barker', 2017, 560, 1, '', NULL, NULL, 1, 'portada_6a5578132aa390.11084454.jpg'),
(122, 'Una casa junto al lago', 'Susan Wiggs', 2005, 384, 1, '', NULL, NULL, 1, NULL),
(123, 'El príncipe y la modista', 'Jen Wang', 2018, 276, 1, '', NULL, NULL, 1, 'portada_6a55781cc412f0.49084946.jpg'),
(124, 'El día que el cielo se caiga', 'Megan Maxwell', 2016, 464, 1, '', NULL, NULL, 1, NULL),
(126, 'Los motivos del lobo', 'Liliana Escliar', 2017, 255, 1, '', NULL, NULL, 1, NULL),
(127, 'La máquina de pensar en Gladys', 'Mario Levrero', 1970, 122, 1, '', NULL, NULL, 1, NULL),
(128, 'I Who Have Never Known Men', 'Jacqueline Harpman', 2019, 188, 1, 'Ciencia ficcion,Distopia', NULL, NULL, 1, 'portada_6a628f4f08a6f5.24658940.jpg'),
(129, 'The House Across the Lake', 'Riley Sager', 2022, 369, 1, 'Misterio,Thriller', NULL, NULL, 1, NULL),
(152, 'Almanaque da Mônica 30', 'Mauricio de Sousa', 0, 82, 1, 'Comic,Infantil', NULL, NULL, 1, NULL),
(153, 'Los Isleros', 'Ernesto L. Castro', 1984, 317, 1, 'Novela,Historico', NULL, NULL, 1, NULL),
(154, '¡Hola Doctor!', 'Willy Breinholst', 1988, 126, 1, 'Humor', NULL, NULL, 1, 'portada_6a62b3e46b44d7.64486289.jpg'),
(155, 'Cielos de barro', 'Dulce Chacón', 2001, 312, 1, 'Novela,Historico', NULL, NULL, 1, 'portada_6a6293f80deeb4.19912399.jpg'),
(157, 'La puerta', 'Manel Loureiro', 2020, 352, 1, 'Terror', NULL, NULL, 1, NULL),
(158, 'No Te Rias Pepe', 'Keiko Kasza', 1997, 0, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6293fb71b074.00602439.jpg'),
(160, 'Invisible Women: Data Bias in a World Designed for Men', 'Caroline Criado Pérez', 2019, 448, 1, 'No ficcion,Ensayo', NULL, NULL, 1, 'portada_6a6293fee3d599.47885731.jpg'),
(161, 'Gente En Su Sitio', 'Joaquin Salvador Lavado', 1986, 128, 1, 'Comic,Humor', NULL, NULL, 1, 'portada_6a62b42406dca5.14328750.jpg'),
(162, 'Lone Women', 'Victor LaValle', 2023, 275, 1, 'Terror, Ficcion, Historica', NULL, NULL, 1, 'portada_6a629402dd4801.65673479.jpg'),
(163, '¡Quita Esas Patas, Caraqueso!', 'Geronimo Stilton', 2007, 117, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294044d8e92.58482764.jpg'),
(164, 'Las dos nubes amigas', 'Enric Larreula', 1989, 0, 1, 'Infantil', NULL, NULL, 1, NULL),
(165, 'Cloudy with a Chance of Meatballs (Cloudy with a Chance of Meatballs, #1)', 'Judi Barrett', 1982, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294068887b8.24881564.jpg'),
(166, 'A la sombra del árbol violeta', 'Sahar Delijani', 2014, 288, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a629408d04fc4.22955622.jpg'),
(167, 'La amenaza del planeta Blurgo: Los Cosmorratones 1 (Spanish Edition)', 'Geronimo Stilton', 2014, 128, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62940acb3203.96421869.jpg'),
(169, 'El castillo de Zampachicha Miaumiau: Geronimo Stilton 14', 'Geronimo Stilton', 2013, 130, 1, 'Infantil', NULL, NULL, 1, NULL),
(170, 'Everything Dead & Dying', 'Tate Brombal', 2026, 176, 1, 'Comic,Terror', NULL, NULL, 1, 'portada_6a62940f9250e4.95148758.jpg'),
(171, 'EL SECRETO DE OSCAR (Spanish Edition)', 'Ricardo Alcántara Sgarbi', 2005, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294119dfc32.73566306.jpg'),
(172, 'Winnie En La Playa', 'Valerie Thomas', 0, 0, 1, 'Infantil', NULL, NULL, 1, NULL),
(173, 'Scooby-Doo! and the Haunted Castle (Scooby-Doo! Mysteries #1)', 'James Gelsey', 1998, 56, 1, 'Infantil,Misterio', NULL, NULL, 1, 'portada_6a6294150435c5.34666025.jpg'),
(174, 'Cuatro ratones en la selva negra', 'Geronimo Stilton', 2006, 128, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294171ead55.25567197.jpg'),
(175, 'Shitshow', 'Chris Panatier', 2025, 216, 1, 'Ciencia ficcion,Comedia', NULL, NULL, 1, 'portada_6a62941928a434.53849725.jpg'),
(176, '99 Ways to Die: And How to Avoid Them', 'Ashely Alker', 2026, 384, 1, 'No ficcion,Humor', NULL, NULL, 1, 'portada_6a62b446c3e6d6.08930858.jpg'),
(177, 'The Escape Game', 'Marissa Meyer', 2026, 403, 1, 'Thriller', NULL, NULL, 1, NULL),
(178, 'Every Little Kindness', 'Marta Bartolj', 2021, 72, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62941d518539.77839770.jpg'),
(179, 'La cabaña junto al lago', 'Rachel Caine', 2020, 351, 1, 'Terror, Thriller', NULL, NULL, 1, 'portada_6a62941f506b36.04498449.jpg'),
(181, 'Under Water', 'Tara Menon', 2026, 224, 1, 'Ficcion', NULL, NULL, 1, NULL),
(182, 'The Secret Garden', 'Frances Hodgson Burnett', 1995, 60, 1, 'Clasico,Infantil', NULL, NULL, 1, NULL),
(183, 'Anna Karenina', 'Leo Tolstoy', 2012, 964, 1, 'Clasico,Novela', NULL, NULL, 1, 'portada_6a6294248877b9.10670443.jpg'),
(184, 'Corazón: Diario de un niño', 'Edmondo de Amicis', 2015, 321, 1, 'Clasico,Infantil', NULL, NULL, 1, NULL),
(185, 'La hora veinticinco', 'Constantin Virgil Gheorghiu', 1977, 387, 1, 'Novela', NULL, NULL, 1, NULL),
(186, 'The King\'s General (Pocket Books #75055)', 'Daphne du Maurier', 1965, 0, 1, 'Novela,Historico', NULL, NULL, 1, NULL),
(187, 'A Theatre of Love', 'Barbara Cartland', 1991, 156, 1, 'Romance', NULL, NULL, 1, 'portada_6a6294282137b3.21583277.jpg'),
(188, 'La última princesa de Manchuria', 'Bihua Lee', 1995, 287, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(189, 'Bajo El Sol de Kenia (Spanish Edition)', 'Barbara Wood', 1992, 0, 1, 'Novela, Saga familiar', NULL, NULL, 1, NULL),
(190, 'The Curse of the Ruby Necklace (Sweet Valley Twins Super Chiller, #5)', 'Francine Pascal', 1993, 183, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a62942c9d2361.02635772.jpg'),
(191, 'Algo tan parecido al amor (rúst.)', 'Carmen Amoraga', 2007, 270, 1, 'Romance', NULL, NULL, 1, NULL),
(192, 'El gran Meaulnes', 'Alain-Fournier', 2005, 304, 1, 'Clasico', NULL, NULL, 1, 'portada_6a6294301fef71.04249206.jpg'),
(193, 'Dead Cold (Chief Inspector Armand Gamache #2)', 'Louise Penny', 2006, NULL, 1, 'Misterio', NULL, NULL, 1, 'portada_6a6294317652d9.96749833.jpg'),
(194, 'Happy Birthday, Danny and the Dinosaur! (Danny and the Dinosaur, #2)', 'Syd Hoff', 1997, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629433910b58.21971710.jpg'),
(195, 'MAGICO MUNDO DE LAS PRINCESAS, EL (Spanish Edition)', 'BALLESTEROS ADRIANA', 2008, 58, 1, 'Infantil', NULL, NULL, 1, NULL),
(196, 'Les bandits de londres', 'Paul Féval fils', 1951, 0, 1, 'Aventura,Clasico', NULL, NULL, 1, NULL),
(197, 'Road Dahl: opuestos', 'Roald Dahl', 2018, 18, 1, 'Infantil', NULL, NULL, 1, NULL),
(198, 'Winnie historias. Zumba-pumba Winnie (El mundo de Winnie) (Spanish Edition)', 'Korky Korky', 2014, 96, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294380bc309.73833811.jpg'),
(199, 'El misterio de la pirámide de queso', 'Geronimo Stilton', 2005, 120, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294395ae7b9.36259000.jpg'),
(200, 'El misterio del ojo de esmeralda: Geronimo Stilton 33', 'Geronimo Stilton', 2008, 128, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62943b686d43.27800731.jpg'),
(201, 'Tropesick', 'Lauren Okie', 2026, 416, 1, 'No ficcion,Memoria', NULL, NULL, 1, 'portada_6a62943d579829.37251962.jpg'),
(202, 'Tras La Pista Del Yeti', 'Geronimo Stilton', 2006, 128, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62943f7d4db0.83034047.jpg'),
(203, 'Owl at Home', 'Arnold Lobel', 1982, 64, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294417dff44.54214875.jpg'),
(204, 'Única mirando al mar', 'Fernando Contreras Castro', 1993, 109, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6294436ead33.56712330.jpg'),
(205, 'Tuanda do Quênia', 'Cristina Von', 2011, 0, 1, 'Infantil,Aventura', NULL, NULL, 1, NULL),
(206, 'La fuerza de papa', 'Evelyn Aixalá Pozas', 0, NULL, 1, 'Infantil', NULL, NULL, 1, NULL),
(207, 'Cabe na Mala - Coleção Mico Maneco (Em Portuguese do Brasil)', 'Ana Maria Machado', 2012, 0, 1, 'Infantil', NULL, NULL, 1, NULL),
(209, 'I Want My Hat Back', 'Jon Klassen', 2011, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629448d6f7b7.40592894.jpg'),
(210, 'O Outro Lado da Meia-Noite', 'Sidney Sheldon', 0, 390, 1, 'Thriller, Novela', NULL, NULL, 1, NULL),
(211, 'Médicos', 'Henry Denker', 1982, 350, 1, 'Novela', NULL, NULL, 1, NULL),
(212, 'Nosotras que nos queremos tanto', 'Marcela Serrano', 1996, 358, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62944cb9f2c2.34481261.jpg'),
(213, 'Every Day I Read: 53 Ways to Get Closer to Books', 'Hwang Bo-Reum', 2025, 240, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62944e284e05.81467890.jpg'),
(214, 'Wolfie the Bunny', 'Ame Dyckman', 2015, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294503c1d16.40370571.jpg'),
(215, 'That Which Feeds Us', 'Keala Kendall', 2026, 352, 1, 'Terror', NULL, NULL, 1, NULL),
(216, 'Rust-Colored Rain (Wrack and Ruin #1)', 'Otto Schafer', 2023, 238, 1, 'Terror', NULL, NULL, 1, NULL),
(217, 'Creepy Carrots! (Jasper Rabbit\'s Creepy Tales!)', 'Aaron Reynolds', 2012, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294524e64e8.77255237.jpg'),
(218, 'Sirga', 'René Guillot', 1993, 0, 1, 'Aventura,Infantil', NULL, NULL, 1, NULL),
(219, 'Almendra', 'Sohn Won-Pyung', 2020, 256, 1, 'Ficcion,Literaria', NULL, NULL, 1, NULL),
(220, 'Abandon', 'Blake Crouch', 2012, 437, 1, 'Thriller', NULL, NULL, 1, NULL),
(221, 'A Feather on the Breath of God', 'Sigrid Nunez', 2005, 193, 1, 'Ficcion,Literaria', NULL, NULL, 1, NULL),
(222, 'A Far-Flung Life', 'M.L. Stedman', 2026, 431, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6294575e12a2.53796219.jpg'),
(223, '1984', 'George Orwell', 2013, 350, 1, 'Clasico,Distopia', NULL, NULL, 1, 'portada_6a629458bc0ef4.92807667.jpg'),
(224, 'La vida de Pi', 'Yann Martel', 2012, 416, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62945a284eb2.89020865.jpg'),
(225, 'Harold and the Purple Crayon (Harold, #1)', 'Crockett Johnson', 1996, 64, 1, 'Infantil', NULL, NULL, 1, NULL),
(226, 'La flor púrpura', 'Chimamanda Ngozi Adichie', 2019, NULL, 1, 'Ficcion,Literaria', NULL, NULL, 1, NULL),
(227, 'Strong Poison (Lord Peter Wimsey, #6)', 'Dorothy L. Sayers', 1995, 261, 1, 'Misterio clasico', NULL, NULL, 1, 'portada_6a6294605db904.76737333.jpg'),
(228, 'Strange Pictures', 'Uketsu', 2025, 236, 1, 'Misterio,Terror', NULL, NULL, 1, 'portada_6a62946257ea60.60918263.jpg'),
(230, 'El misterio del perro secuestrado (Resuelve el misterio, #10)', 'M. Masters', 1986, 128, 1, 'Infantil,Misterio', NULL, NULL, 1, NULL),
(231, 'Widow\'s Point', 'Richard Chizmar', 2018, 156, 1, 'Terror', NULL, NULL, 1, NULL),
(232, 'La casa de Bernarda Alba', 'Federico García Lorca', 1945, 96, 1, 'Teatro, Clasico', NULL, NULL, 1, 'portada_6a6294680b9e05.80001010.jpg'),
(233, 'Familia', 'Ba Jin', 2016, 376, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62946a44bb17.91945415.jpg'),
(234, 'El Árabe', 'E.M. Hull', 1941, 253, 1, 'Romance, Clasico', NULL, NULL, 1, NULL),
(235, 'Yellow Is for Fear : And Other Stories', 'Dorothy Eden', 1976, 0, 1, 'Misterio,Relatos de terror', NULL, NULL, 1, NULL),
(236, 'Selecciones de la narrativa mundial del reader\'s d', 'Various', 1980, 0, 1, 'Antología', NULL, NULL, 1, NULL),
(238, 'The Games', 'Hugh Atkinson', 1968, 512, 1, 'Novela', NULL, NULL, 1, NULL),
(239, 'Through the Looking-Glass and What Alice Found There (Alice\'s Adventures in Wonderland, #2)', 'Lewis Carroll', 1993, 228, 1, 'Clasico, Infantil,Fantasia', NULL, NULL, 1, 'portada_6a629470747d92.30217015.jpg'),
(240, 'Everything Is Tuberculosis: The History and Persistence of Our Deadliest Infection', 'John Green', 2025, 198, 1, 'No ficcion', NULL, NULL, 1, 'portada_6a629473476820.69276086.jpg'),
(241, 'Relato de un náufrago', 'Gabriel García Márquez', 2014, 176, 1, 'No ficcion,Cronica', NULL, NULL, 1, 'portada_6a6294757f41a3.84348769.jpg'),
(242, 'La Voz Del Lago', 'Barbara Delinsky', 2001, 368, 1, 'Romance', NULL, NULL, 1, NULL),
(243, 'Hombrecitos (Mujercitas, #2)', 'Louisa May Alcott', 2012, 210, 1, 'Clasico', NULL, NULL, 1, NULL),
(244, 'El jardín de las mariposas', 'Dot Hutchison', 2018, 326, 1, 'Thriller,Terror,Psicologico', NULL, NULL, 1, 'portada_6a6294785132f3.02942784.jpg'),
(245, 'Konrad o el niño que salió de una lata de conservas', 'Christine Nöstlinger', 0, 144, 1, 'Infantil', NULL, NULL, 1, NULL),
(246, 'Nube de Noviembre', 'Hilary Ruben', 2008, 144, 1, 'Ficcion,Juvenil', NULL, NULL, 1, 'portada_6a62947bdc0ff4.59490061.jpg'),
(247, 'Los Cazaventura y el río escondido de la Amazonia (Cazaventura, #2)', 'Helen Velando', 2004, 437, 1, 'Infantil,Aventura', NULL, NULL, 1, NULL),
(248, 'Los Telepiratas', 'Roy Berocay', 1995, 104, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62947df370e3.92037114.jpg'),
(250, 'La decisión de Camila', 'Cecilia Curbelo', 2011, 157, 1, 'Romance, Ficcion', NULL, NULL, 1, NULL),
(251, '私たちの幸せな時間 [Watashitachi no Shiawase na Jikan]', 'Mizu Sahara', 2007, 252, 1, 'Manga,Drama', NULL, NULL, 1, NULL),
(252, 'La autopista del amor', 'Susanna Barranco', 2013, NULL, 1, 'Romance', NULL, NULL, 1, NULL),
(253, '#ChupaElPerro', 'Germán Garmendia', 2016, 184, 0, 'No ficcion,Humor', NULL, NULL, 1, 'portada_6a62b46c646311.36395855.jpg'),
(254, 'Maré de Azar (Diário de um Banana, #8)', 'Jeff Kinney', 2013, 225, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294860616e9.24132674.jpg'),
(255, 'Minha vida fora de série: 2ª temporada (Minha vida fora de série, #2)', 'Paula Pimenta', 2013, 424, 1, 'Juvenil', NULL, NULL, 1, NULL),
(256, 'Gyo, Vol. 2', 'Junji Ito', 2008, 208, 1, 'Manga,Terror', NULL, NULL, 1, 'portada_6a62948a1b7013.71677467.jpg'),
(257, 'Harry Potter and the Chamber of Secrets (Harry Potter, #2)', 'J.K. Rowling', 1999, 341, 1, 'Fantasia,Juvenil', NULL, NULL, 1, NULL),
(258, 'Um Dia de Cão (O Diário de Um Banana, #4)', 'Jeff Kinney', 2011, 224, 1, 'Infantil', NULL, NULL, 1, NULL),
(259, 'Fani na terra da rainha (Fazendo meu filme, #2)', 'Paula Pimenta', 2009, 327, 1, 'Juvenil', NULL, NULL, 1, NULL),
(260, 'Diario de Greg 5: La cruda realidad (Diario de Greg, #5)', 'Jeff Kinney', 2011, 217, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62948e7d3f71.18384649.jpg'),
(261, 'Efímera (El jardín químico, #1)', 'Lauren DeStefano', 2011, 379, 1, 'Distopia', NULL, NULL, 1, 'portada_6a629490797e85.46036272.jpg'),
(262, 'A estreia de Fani (Fazendo meu filme, #1)', 'Paula Pimenta', 2009, 331, 1, 'Juvenil', NULL, NULL, 1, NULL),
(263, 'O roteiro inesperado de Fani (Fazendo meu filme, #3)', 'Paula Pimenta', 2010, 419, 1, 'Juvenil', NULL, NULL, 1, NULL),
(264, 'Fever (The Chemical Garden, #2)', 'Lauren DeStefano', 2012, 341, 1, 'Distopia', NULL, NULL, 1, 'portada_6a6294956a3198.34234947.jpg'),
(265, 'Casa dos Horrores (Diário de um Banana, #6)', 'Jeff Kinney', 2013, 228, 1, 'Infantil', NULL, NULL, 1, NULL),
(266, 'Sever (The Chemical Garden, #3)', 'Lauren DeStefano', 2013, 371, 1, 'Distopia', NULL, NULL, 1, 'portada_6a629498d895c8.24974635.jpg'),
(267, 'Minha vida fora de série: 1ª temporada (Minha vida fora de série, #1)', 'Paula Pimenta', 2011, 408, 1, 'Juvenil', NULL, NULL, 1, NULL),
(269, 'La verdad sobre el caso Harry Quebert', 'Joël Dicker', 2013, 663, 1, 'Misterio,Thriller', NULL, NULL, 1, NULL),
(271, 'Caindo na Estrada (Diário de um Banana, #9)', 'Jeff Kinney', 2015, 224, 1, 'Infantil', NULL, NULL, 1, NULL),
(273, 'Emma al borde del abismo', 'Marcos Vázquez', 2014, 150, 1, 'Ficcion,Juvenil', NULL, NULL, 1, NULL),
(274, 'Bons Tempos (Diário de um Banana, #10)', 'Jeff Kinney', 2013, 225, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294a2c73443.92112285.jpg'),
(275, 'Malú: Diario íntimo de una perra', 'Ignacio Martínez', 2001, 66, 1, 'Humor,Ficcion', NULL, NULL, 1, NULL),
(276, 'La pareja de al lado', 'Shari Lapena', 2017, 390, 1, 'Thriller', NULL, NULL, 1, NULL),
(277, 'Agencia Matrimonial Para Ricos', 'Farahad Zama', 2009, 336, 1, 'Ficcion,Comedia', NULL, NULL, 1, 'portada_6a6294a7c1c6d8.15349440.jpg'),
(278, 'Harry Potter and the Sorcerer\'s Stone (Harry Potter, #1)', 'J.K. Rowling', 2003, 309, 1, 'Fantasia', NULL, NULL, 1, NULL),
(279, 'Diario', 'Ana Frank', 2003, 384, 1, 'Memoria,No ficcion historica', NULL, NULL, 1, 'portada_6a6294aa9dc838.41377812.jpg'),
(280, 'Carta a un niño que nunca nació', 'Oriana Fallaci', 1992, 123, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6294ac9ac688.44335689.jpg'),
(281, 'A Gota D\'Água (Diário de um Banana, #3)', 'Jeff Kinney', 2010, 217, 1, 'Infantil', NULL, NULL, 1, NULL),
(282, 'Diario de Greg: Monta tu propio diario', 'Jeff Kinney', 2013, 288, 1, 'Infantil', NULL, NULL, 1, NULL),
(283, 'La nostalgia de los átomos', 'Linus Reichlin', 2009, 352, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6294b1674176.45680654.jpg'),
(284, 'Uma professora muito maluquinha', 'Ziraldo', 1995, 116, 1, 'Infantil', NULL, NULL, 1, NULL),
(285, 'Rodrick é o Cara (Diário de um Banana, #2)', 'Jeff Kinney', 2009, 224, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294b540b1d2.52090173.jpg'),
(286, 'Harry Potter and the Prisoner of Azkaban (Harry Potter, #3)', 'J.K. Rowling', 2004, 547, 1, 'Fantasia', NULL, NULL, 1, 'portada_6a6294b73a6292.52779490.jpg'),
(287, 'Cianuro, Espumoso', 'Agatha Christie', 2015, 216, 1, 'Misterio clasico', NULL, NULL, 1, NULL),
(288, 'En Busca De LA Cuidad Sumergida/Search for the Sunken City (Puzzle Adventure Series)', 'Martin Oliver', 0, NULL, 1, 'Infantil,Aventura', NULL, NULL, 1, 'portada_6a6294bab217c2.29663391.jpg'),
(289, 'Sangre bajo cero (Alex McKnight, #1)', 'Steve Hamilton', 2007, 320, 1, 'Misterio,Thriller', NULL, NULL, 1, NULL),
(290, 'El Dia Del Chacal (Grandes Novelistas)', 'Frederick Forsyth', 1973, 0, 1, 'Terror', NULL, NULL, 1, NULL),
(291, 'Sour Candy', 'Kealan Patrick Burke', 2015, 84, 1, 'Terror', NULL, NULL, 1, NULL),
(292, 'I\'ll Meet You There', 'Heather Demetrios', 2015, 388, 1, 'YA,Romance', NULL, NULL, 1, 'portada_6a6294be640403.50714868.jpg'),
(293, 'The Staircase in the Woods', 'Chuck Wendig', 2025, 388, 1, 'Terror', NULL, NULL, 1, 'portada_6a6294c062a726.35348951.jpg'),
(295, 'Hyperbole and a Half: Unfortunate Situations, Flawed Coping Mechanisms, Mayhem, and Other Things That Happened', 'Allie Brosh', 2013, 371, 1, 'Memoria,Humor,Grafico', NULL, NULL, 1, 'portada_6a6294c48b4216.03450994.jpg'),
(296, 'Una mama para owen (Spanish Edition)', 'Marion Dane Bauer', 2007, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294c6a7b899.75912385.jpg'),
(297, 'Tumbas rotas (Andanzas) (Spanish Edition)', 'Liliana Escliar', 2020, 240, 1, 'Ficcion,Misterio', NULL, NULL, 1, 'portada_6a6294c8aaa513.13864140.jpg'),
(298, 'Susan Laughs', 'Jeanne Willis', 2000, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294cac185a6.38634031.jpg'),
(299, 'La Nueva California y otros cuentos', 'A.H. de Lima Barreto', 2008, 109, 1, 'Clasico,Relatos', NULL, NULL, 1, NULL),
(300, 'La dama de Urtubi', 'Pío Baroja', 1993, 64, 1, 'Clasico', NULL, NULL, 1, NULL),
(301, 'Las mujeres Weyward', 'Emilia Hart', 2023, 384, 1, 'Ficcion,Fantasia,Historico', NULL, NULL, 1, 'portada_6a6294d0b4bfc3.46895740.jpg'),
(302, 'El pacto del agua', 'Abraham Verghese', 2023, 874, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6294d2d4a314.58775761.jpg'),
(303, 'The Ballad of Black Tom', 'Victor LaValle', 2016, 149, 1, 'Terror, Fantasia', NULL, NULL, 1, 'portada_6a6294d4d928a9.93824875.jpg'),
(304, '¿Quién necesita amigos?', 'María Baranda', 2016, NULL, 1, 'Infantil', NULL, NULL, 1, NULL),
(305, 'Zoom', 'Istvan Banyai', 1998, 64, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294d6cfe3a7.84168646.jpg'),
(306, 'El cuento de la criada (El cuento de la criada, #1)', 'Margaret Atwood', 2017, 416, 1, 'Distopia', NULL, NULL, 1, NULL),
(307, 'Cigarette Anthology, シガレットアンソロジー', 'Inio Asano', 2015, 184, 1, 'Manga', NULL, NULL, 1, NULL),
(308, 'La chica a la orilla del mar (Umibe no Onnanoko, #1-2)', 'Inio Asano', 2021, 410, 1, 'Manga', NULL, NULL, 1, NULL),
(309, 'Oyasumi Punpun Obra Completa (Oyasumi Punpun, #1-13)', 'Inio Asano', 2019, 2960, 1, 'Manga', NULL, NULL, 1, NULL),
(312, 'Aluga-se para Temporada', 'Mary Kay Andrews', 2012, 368, 1, 'Romance, Ficcion', NULL, NULL, 1, NULL),
(313, 'Uno siempre cambia al amor de su vida', 'Amalia Andrade Arango', 2015, 189, 1, 'No ficcion,Humor', NULL, NULL, 1, NULL),
(314, 'Fangs', 'Sarah Andersen', 2020, 100, 1, 'Comic,Romance', NULL, NULL, 1, 'portada_6a6294e2776327.55538471.jpg'),
(315, 'Adulthood Is a Myth (Sarah\'s Scribbles, #1)', 'Sarah Andersen', 2016, 110, 1, 'Comic,Humor', NULL, NULL, 1, 'portada_6a6294e531f352.00592640.jpg'),
(316, 'ユメコイ [Yumekoi]', 'Anashin', 2012, 192, 1, 'Manga,Romance', NULL, NULL, 1, NULL),
(317, 'Juego de adultos', 'Manuel L. Alonso', 2002, 112, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a6294e7ed4f88.46816758.jpg'),
(318, 'La Puerta', 'Miguel Ángel Alonso Pulido', 2018, 20, 1, 'Ficcion', NULL, NULL, 1, NULL),
(319, 'The Five People You Meet in Heaven', 'Mitch Albom', 2003, 196, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6294ea1c3e08.04667102.jpg'),
(323, 'Chas Addams Happily Ever After: A Collection of Cartoons to Chill the Heart of Your Loved One', 'Charles Addams', 2006, 165, 1, 'Comic,Humor', NULL, NULL, 1, 'portada_6a6294f039e914.44756538.jpg'),
(324, 'Harry Potter and the Deathly Hallows (Harry Potter, #7)', 'J.K. Rowling', 2007, 759, 1, 'Fantasia', NULL, NULL, 1, NULL),
(325, 'Harry Potter and the Order of the Phoenix (Harry Potter, #5)', 'J.K. Rowling', 2004, 576, 1, 'Fantasia', NULL, NULL, 1, NULL),
(330, 'Historia de mi vida', 'George Sand', 1995, 439, 1, 'Memoria,Clasico', NULL, NULL, 1, NULL),
(335, 'The Cookie Fiasco (Elephant & Piggie Like Reading!, #1)', 'Dan Santat', 2016, 64, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294fd4104a9.91071670.jpg'),
(336, 'The Kissing Hand', 'Audrey Penn', 1998, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6294ff5d85e3.06411034.jpg'),
(337, 'Go, Dog. Go!', 'P.D. Eastman', 1961, 64, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62950170fa94.54391737.jpg'),
(341, 'Asfixia', 'Alex Mírez', 2016, 504, 1, 'Romance', NULL, NULL, 1, NULL),
(352, 'Agustina La Payasa', 'Otfried Preußler', 2002, 41, 1, 'Infantil', NULL, NULL, 1, NULL),
(357, 'Lili, Libertad', 'Gonzalo Moure Trenor', 2005, 112, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a62951e448594.93037636.jpg'),
(370, 'Milk and honey', 'Rupi Kaur', 2014, 204, 1, 'Poesia', NULL, NULL, 1, 'portada_6a62952fbf2028.40363979.jpg'),
(371, 'Las uvas de la ira', 'John Steinbeck', 2009, 637, 1, 'Clasico', NULL, NULL, 1, NULL),
(372, 'Stephanie\'s Ponytail (Munsch for Kids)', 'Robert Munsch', 1996, 24, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6295333a9bd9.47143655.jpg'),
(373, 'From My Window', 'Otávio Júnior', 2020, 40, 1, 'Infantil,Comic', NULL, NULL, 1, 'portada_6a6295348c7344.49792938.jpg'),
(374, 'La larga marcha', 'Stephen King', 2019, 352, 1, 'Ficcion,Distopia', NULL, NULL, 1, NULL),
(381, 'Café', 'Babi Cedillo', 0, NULL, 1, 'Ficcion,Romance', NULL, NULL, 1, NULL),
(384, 'Turma da Mônica Jovem (Segunda Série) #29 - O mundo de Maria Cebola', 'Mauricio de Sousa', 2019, 130, 1, 'Comic,Infantil', NULL, NULL, 1, NULL),
(388, '1,000 Books to Read Before You Die: A Life-Changing List', 'James Mustich', 2018, 948, 1, 'Referencia, No ficcion', NULL, NULL, 1, 'portada_6a62953dd67e30.84557858.jpg'),
(389, 'De la tierra a la luna/La vuelta al mundo en 80 días', 'Jules Verne', 2019, 416, 1, 'Clasico,Ciencia ficcion,Aventura', NULL, NULL, 1, NULL),
(392, 'The Housemaid\'s Secret (The Housemaid, #2)', 'Freida McFadden', 2023, 311, 1, 'Thriller', NULL, NULL, 1, NULL),
(393, 'Hotel: since 2079', 'Boichi', 0, 42, 1, 'Manga,Ciencia ficcion', NULL, NULL, 1, NULL),
(394, 'You Are in the Blue Summer', 'Nagisa Furuya', 2018, 186, 1, 'Manga', NULL, NULL, 1, NULL),
(398, 'Wild Dark Shore', 'Charlotte McConaghy', 2025, 298, 1, 'Ficcion,Literaria,Thriller', NULL, NULL, 1, NULL),
(399, 'Blown Away (Storm Front, #1)', 'Sharon Sala', 2010, 361, 1, 'Romance', NULL, NULL, 1, 'portada_6a62954b78cb18.31681953.jpg'),
(400, 'Japanese Gothic', 'Kylie Lee Baker', 2026, 344, 1, 'Terror', NULL, NULL, 1, 'portada_6a62954de24421.82700177.jpg'),
(401, 'Atlantis: The Antediluvian World', 'Ignatius L. Donnelly', 2011, 490, 1, 'No ficcion, Especulativa', NULL, NULL, 1, 'portada_6a62954fdbc649.28105052.jpg'),
(402, 'Junie B., First Grader Boo... and I Mean It!', 'Barbara Park', 2005, NULL, 1, 'Infantil', NULL, NULL, 1, NULL),
(403, 'The Doctor`s Challenge', 'Kerry Archer Mitchell', 1961, 0, 1, 'Romance', NULL, NULL, 1, NULL),
(404, 'The Cat Who Saved Books (The Cat Who..., #1)', 'Sōsuke Natsukawa', 2021, 199, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a629552636289.71237171.jpg'),
(405, 'Le viste la cara a Dios [Cuento]', 'Gabriela Cabezón Cámara', 2011, 24, 1, 'Ficcion,Literaria', NULL, NULL, 1, NULL),
(407, 'The Mystery of the Vanished Prince (Five Find-Outers, #9)', 'Enid Blyton', 1996, 180, 1, 'Infantil,Misterio', NULL, NULL, 1, NULL),
(408, 'Soy una mamá (Soy una mamá #1-3)', 'Megan Maxwell', 2020, 352, 1, 'Romance', NULL, NULL, 1, NULL),
(409, 'The Decameron', 'Giovanni Boccaccio', 2003, 909, 1, 'Clasico', NULL, NULL, 1, 'portada_6a6295598b0173.12435071.jpg'),
(410, 'El caso de la prometida celosa', 'Mason Perry', 1951, 221, 1, 'Misterio', NULL, NULL, 1, NULL),
(411, 'Una Estrella En La Ventana', 'Hugo Wast', 1942, 0, 1, 'Novela,Clasico', NULL, NULL, 1, NULL),
(412, 'The Good Earth (House of Earth, #1)', 'Pearl S. Buck', 2005, 418, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62955d147b51.93997708.jpg'),
(413, 'Moira', 'Julien Green', 2015, 270, 1, 'Ficcion,Literaria', NULL, NULL, 1, NULL),
(414, 'Cuatro Años en las Orcadas del Sur', 'José Manuela Moneta', 1949, 337, 1, 'No ficcion,Cronica,Exploracion', NULL, NULL, 1, NULL),
(415, 'El oasis condenado', 'Ralph Hammond Innes', 1961, 0, 1, 'Aventura,Thriller', NULL, NULL, 1, NULL),
(416, 'The Mean Ones', 'Tatiana Schlote-Bonne', 2025, NULL, 1, 'Terror', NULL, NULL, 1, NULL),
(417, 'El Premio Nobel (Title in English: The Prize) (Spanish Version) (Fontan Rustica)', 'Irving Wallace', 1962, 0, 1, 'Novela', NULL, NULL, 1, NULL),
(419, 'A 5th Portion of Chicken Soup for the Soul: 101 More Stories to Open the Heart and Rekindle the Spirit', 'Jack Canfield', 1998, 388, 1, 'Autoayuda,Inspiracional', NULL, NULL, 1, 'portada_6a629561e0fe52.37826262.jpg'),
(420, 'The Green Ember (The Green Ember, #1)', 'S.D. Smith', 2014, 365, 1, 'Fantasia,Infantil', NULL, NULL, 1, 'portada_6a629564389866.99041363.jpg'),
(421, 'Summer', 'Edith Wharton', 2019, 160, 1, 'Clasico', NULL, NULL, 1, 'portada_6a6295664059a5.26596747.jpg'),
(422, 'Hijacked (Alpha Books)', 'J.M. Marks', 1985, 96, 1, 'Thriller,Accion', NULL, NULL, 1, NULL),
(423, 'Prose and Poetry The Firelight Book', 'Barbara Henderson', 1953, 472, 1, 'Antología,Poesia', NULL, NULL, 1, NULL),
(424, 'NOCHE EN CAMP DAVID', 'Knebel Fletcher', 1973, 0, 1, 'Thriller, Politico', NULL, NULL, 1, NULL),
(425, 'Naves Oro Sueños', 'Hugo Wast', 1946, 0, 1, 'Novela,Clasico', NULL, NULL, 1, NULL),
(426, 'On the Beach (ELT Structural Reader Level 4 Intermediate)', 'G.C. Thornley', 1900, 122, 1, 'Ciencia ficcion,Post-apocaliptica', NULL, NULL, 1, 'portada_6a62a249708992.96264874.jpg'),
(427, 'THE RICH AND THE RIGHTEOUS', 'Helen Van Slyke', 2013, 358, 1, 'Novela,Drama', NULL, NULL, 1, NULL),
(428, 'Recuerdos de un jardinero inglés', 'Reginald Arkell', 2020, 224, 1, 'Memoria,Jardineria', NULL, NULL, 1, 'portada_6a62956cd3dd63.36438051.jpg'),
(430, 'The Day You Begin', 'Jacqueline Woodson', 2018, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62956ee68825.53828693.jpg'),
(431, 'The Wedding People', 'Alison Espach', 2024, 367, 1, 'Ficcion,Literaria', NULL, NULL, 1, NULL),
(432, 'Middlesex', 'Jeffrey Eugenides', 2002, 529, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a629570ed4355.72866929.jpg'),
(433, 'The Genius Bat: The Secret Life of the Only Flying Mammal', 'Yossi Yovel', 2025, 320, 1, 'No ficcion,Naturaleza', NULL, NULL, 1, 'portada_6a6295724ad115.09721675.jpg'),
(434, 'The Convenience Store by the Sea (Convenience Store by the Sea, #1)', 'Sonoko Machida', 2025, 282, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a629574408352.30533219.jpg'),
(435, 'Cuentos de buenas noches para niñas rebeldes', 'Elena Favilli', 2017, 224, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629577521ff4.15191345.jpg'),
(436, 'The Aleph and Other Stories', 'Jorge Luis Borges', 2004, 210, 1, 'Clasico,Relatos', NULL, NULL, 1, 'portada_6a62957963fa82.64781011.jpg'),
(437, 'How the Penguins Saved Veronica (Veronica McCreedy, #1)', 'Hazel Prior', 2020, 355, 1, 'Ficcion,Aventura', NULL, NULL, 1, 'portada_6a62957b70dd71.17749874.jpg'),
(438, 'Let the Great World Spin', 'Colum McCann', 2009, 351, 1, 'Ficcion,Literaria', NULL, NULL, 1, NULL),
(439, 'Firekeeper’s Daughter (Firekeeper\'s Daughter, #1)', 'Angeline Boulley', 2021, 496, 1, 'YA,Misterio', NULL, NULL, 1, NULL),
(441, 'Hacia la Edad de Oro', 'Marcelo I Fayard', 1940, 0, 1, 'No ficcion,Espiritualidad', NULL, NULL, 1, NULL),
(442, 'Cloud Atlas', 'David Mitchell', 2004, 509, 1, 'Ciencia ficcion,Ficcion,Literaria', NULL, NULL, 1, 'portada_6a629580d66e65.56478129.jpg'),
(443, 'Kaikeyi', 'Vaishnavi Patel', 2022, 478, 1, 'Fantasia,Mitologica', NULL, NULL, 1, 'portada_6a629582dfabb7.77885983.jpg'),
(444, 'Let Us Descend', 'Jesmyn Ward', 2023, 305, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a629585003f79.64203114.jpg'),
(445, 'Antiracist Baby', 'Ibram X. Kendi', 2020, 24, 1, 'Infantil,No ficcion', NULL, NULL, 1, 'portada_6a62958703e322.96583762.jpg'),
(446, 'Those People Next Door', 'Kia Abdullah', 2024, 160, 1, 'Thriller', NULL, NULL, 1, 'portada_6a629588ee7945.01832653.jpg'),
(447, 'The Women', 'Kristin Hannah', 2024, 471, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a62958b1496f6.61252389.jpg'),
(448, 'The Wild Robot (The Wild Robot, #1)', 'Peter Brown', 2016, 282, 1, 'Infantil,Ciencia ficcion', NULL, NULL, 1, 'portada_6a62958c5eb433.82358565.jpg'),
(449, 'The Watchers (The Watchers, #1)', 'A.M. Shine', 2021, 310, 1, 'Terror', NULL, NULL, 1, 'portada_6a62958dbc6383.92206319.jpg'),
(450, 'You\'re Mom: A Little Book for Mothers (and the People Who Love Them)', 'Liz Climo', 2020, 116, 1, 'Humor,Infantil', NULL, NULL, 1, 'portada_6a629590803b30.84579849.jpg'),
(451, 'Merry Christmas, Big Hungry Bear! (Child\'s Play Library)', 'Don Wood', 2004, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6295928174c4.71100332.jpg'),
(452, 'Adam & Evie\'s Matchmaking Tour', 'Nora Nguyen', 2024, 304, 1, 'Romance', NULL, NULL, 1, 'portada_6a629594897b06.74316007.jpg'),
(453, 'One of Our Own', 'Lucinda Berry', 2024, 4, 1, 'Thriller', NULL, NULL, 1, NULL),
(454, 'The Five-Star Weekend (Sommer in Nantucket, #1)', 'Elin Hilderbrand', 2023, 384, 1, 'Ficcion,Romance', NULL, NULL, 1, 'portada_6a6295968eed01.97033506.jpg'),
(455, 'How to Become the Dark Lord and Die Trying (Dark Lord Davi #1)', 'Django Wexler', 2024, 432, 1, 'Fantasia,Comedia', NULL, NULL, 1, NULL),
(459, 'The Wind Knows My Name', 'Isabel Allende', 2024, 304, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62959d727509.40567860.jpg'),
(460, 'Horrorstör', 'Grady Hendrix', 2014, 248, 1, 'Terror, Comedia', NULL, NULL, 1, NULL),
(461, 'Neil Patrick Harris: Choose Your Own Autobiography', 'Neil Patrick Harris', 2014, 291, 1, 'Memoria', NULL, NULL, 1, NULL),
(462, 'Chesapeake Cavalier', 'Don Tracy', 1950, 0, 1, 'Novela,Historico', NULL, NULL, 1, NULL),
(463, 'Annie Bot', 'Sierra Greer', 2024, 240, 1, 'Ciencia ficcion', NULL, NULL, 1, 'portada_6a6295a1a09736.94967073.jpg'),
(464, 'It\'s the First Day of School...Forever!', 'R.L. Stine', 2011, 192, 1, 'Infantil,Terror', NULL, NULL, 1, 'portada_6a6295a3c9dac0.79900927.jpg'),
(465, 'Mi madre es rara (Spanish Edition)', 'Gilmore - Jones', 1991, 24, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6295a63b29b2.42665888.jpg'),
(466, 'Project Hail Mary', 'Andy Weir', 2021, 476, 1, 'Ciencia ficcion', NULL, NULL, 1, 'portada_6a6295a8692e08.41702972.jpg'),
(467, 'A Psalm for the Wild-Built (Monk & Robot, #1)', 'Becky Chambers', 2021, 151, 1, 'Ciencia ficcion,Solarpunk', NULL, NULL, 1, 'portada_6a62a20e00e4c6.61975934.jpg'),
(468, 'The Adventures of Amina al-Sirafi (Amina al-Sirafi, #1)', 'Shannon Chakraborty', 2023, 483, 1, 'Fantasia', NULL, NULL, 1, NULL),
(469, 'Piratica: Being a Daring Tale of a Singular Girl\'s Adventure Upon the High Seas (Piratica, #1)', 'Tanith Lee', 2004, 288, 1, 'Aventura,Juvenil', NULL, NULL, 1, NULL),
(470, 'Divine Secrets of the Ya-Ya Sisterhood', 'Rebecca Wells', 2004, 383, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6295ac1b4cb4.92536792.jpg'),
(471, 'The Hunger', 'Alma Katsu', 2018, 376, 1, 'Terror, Historico', NULL, NULL, 1, 'portada_6a6295ae3835f2.01477813.jpg'),
(472, 'How to Sell a Haunted House', 'Grady Hendrix', 2023, 419, 1, 'Terror', NULL, NULL, 1, 'portada_6a6295af830fa7.67478927.jpg'),
(473, 'The Haunting of Hill House', 'Shirley Jackson', 2006, 182, 1, 'Terror, Clasico', NULL, NULL, 1, 'portada_6a6295b183d0a5.25273045.jpg'),
(474, 'Kittentits', 'Holly Wilson', 2024, 368, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6295b39d32e6.64235311.jpg'),
(475, 'Shelterwood', 'Lisa Wingate', 2024, 347, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a6295b5981bf5.39002076.jpg'),
(476, 'The Nanny Diaries (Nanny, #1)', 'Emma McLaughlin', 2003, 306, 1, 'Ficcion,Comedia', NULL, NULL, 1, 'portada_6a6295b78ff1c1.36869940.jpg'),
(477, 'Survival of the Fritters (Deputy Donut Mystery, #1)', 'Ginger Bolton', 2018, 296, 1, 'Misterio cozy', NULL, NULL, 1, 'portada_6a6295b9d82009.90271331.jpg'),
(478, 'The Devil All the Time', 'Donald Ray Pollock', 2011, 261, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6295bb45d4f7.45541845.jpg'),
(479, 'The Heaven & Earth Grocery Store', 'James McBride', 2023, 400, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6295bd4823e7.06771854.jpg'),
(480, 'The Notebook (The Notebook, #1)', 'Nicholas Sparks', 2016, 227, 1, 'Romance', NULL, NULL, 1, NULL),
(481, 'Parable of the Sower (Earthseed, #1)', 'Octavia E. Butler', 2000, 368, 1, 'Ficcion,Distopia', NULL, NULL, 1, 'portada_6a6295c02b9267.08103548.jpg'),
(482, 'El último adiós', 'Kate Morton', 2015, 574, 1, 'Ficcion,Misterio', NULL, NULL, 1, NULL),
(483, 'Los miserables', 'Victor Hugo', 2005, 1472, 1, 'Clasico', NULL, NULL, 1, 'portada_6a6295c3b03c18.75410276.jpg'),
(484, 'Heidi (Heidi, #1-2)', 'Johanna Spyri', 2002, 352, 1, 'Clasico,Infantil', NULL, NULL, 1, 'portada_6a6295c53662f6.64199542.jpg'),
(485, 'The God of the Woods', 'Liz Moore', 2024, 496, 1, 'Misterio,Thriller', NULL, NULL, 1, 'portada_6a6295c73342b0.76325539.jpg'),
(486, 'El Instituto', 'Stephen King', 2021, 624, 1, 'Terror', NULL, NULL, 1, NULL),
(487, 'The Women of the Copper Country', 'Mary Doria Russell', 2019, 352, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a6295c9681028.82119698.jpg'),
(488, 'Uninvited: Living Loved When You Feel Less Than, Left Out, and Lonely', 'Lysa TerKeurst', 2016, 275, 1, 'Autoayuda,Inspiracional', NULL, NULL, 1, 'portada_6a6295cae36d41.63317542.jpg'),
(489, 'The Dark', 'Emma Haughton', 2021, 375, 1, 'Thriller', NULL, NULL, 1, NULL),
(490, 'Hasta el verano que viene', 'Haugen. Tormod', 2000, 140, 1, 'Infantil', NULL, NULL, 1, NULL),
(492, 'Corduroy', 'Don Freeman', 1968, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6295d02852e5.99148445.jpg'),
(493, 'The Great Divide', 'Cristina Henríquez', 2024, 336, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a6295d253ea94.70416314.jpg'),
(494, 'The Heat Will Kill You First: Life and Death on a Scorched Planet', 'Jeff Goodell', 2023, 400, 1, 'No ficcion', NULL, NULL, 1, 'portada_6a6295d4591242.95714261.jpg'),
(495, 'Not Another Vampire Book (Not Another Vampire #1)', 'Cassandra Gannon', 2012, 305, 1, 'Romance ,Paranormal, Comedia', NULL, NULL, 1, NULL),
(496, 'Whale Fall', 'Elizabeth O\'Connor', 2024, 210, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6295d7678754.44563614.jpg'),
(497, 'The Ministry of Time', 'Kaliane Bradley', 2024, 339, 1, 'Ciencia ficcion,Romance', NULL, NULL, 1, 'portada_6a6295d95cd435.68558298.jpg'),
(498, 'Dungeon Crawler Carl (Dungeon Crawler Carl, #1)', 'Matt Dinniman', 2020, 464, 1, 'Ciencia ficcion,Fantasia', NULL, NULL, 1, NULL),
(499, 'Zoom at Sea', 'Tim Wynne-Jones', 1993, 30, 1, 'Infantil', NULL, NULL, 1, NULL),
(501, 'The Surviving Sky (Rages, #1)', 'Kritika H. Rao', 2023, 512, 1, 'Fantasia', NULL, NULL, 1, NULL),
(502, 'Ghost Station', 'S.A. Barnes', 2024, 377, 1, 'Ciencia ficcion,Terror', NULL, NULL, 1, 'portada_6a6295df10dd33.86806208.jpg'),
(503, 'Tallgrass', 'Sandra Dallas', 2007, 305, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a6295e0697b10.18362794.jpg'),
(504, 'The Day War Came', 'Nicola Davies', 2018, 32, 1, 'Infantil', NULL, NULL, 1, NULL),
(506, 'Las hijas de la criada', 'Sonsoles Ónega', 2023, 480, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(507, 'The Other Valley', 'Scott Alexander Howard', 2024, 290, 1, 'Ciencia ficcion,Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6295e6d1a650.33893379.jpg'),
(508, 'The Seven Year Slip', 'Ashley Poston', 2023, 336, 1, 'Romance, Fantasia', NULL, NULL, 1, NULL),
(509, 'El traje gris', 'Andrea Camilleri', 2011, 156, 1, 'Misterio', NULL, NULL, 1, 'portada_6a6295e8cdc042.92990541.jpg'),
(510, 'The Secret Keeper', 'Kate Morton', 2012, 484, 1, 'Ficcion,Misterio,Historico', NULL, NULL, 1, 'portada_6a6295eb3b7ce4.80150229.jpg'),
(512, 'El desorden que dejas', 'Carlos Montero', 2016, 408, 1, 'Thriller', NULL, NULL, 1, NULL),
(515, 'I\'m Thinking of Ending Things', 'Iain Reid', 2016, 241, 1, 'Terror, Psicologico', NULL, NULL, 1, NULL),
(516, 'Go as a River', 'Shelley Read', 2023, 320, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6295f2b58682.64534455.jpg'),
(517, 'The Resort', 'Sara Ochs', 2024, 384, 1, 'Thriller', NULL, NULL, 1, 'portada_6a6295f4ddc217.95645356.jpg'),
(518, 'Edenbrooke (Edenbrooke, #1)', 'Julianne Donaldson', 2012, 264, 1, 'Romance, Historico', NULL, NULL, 1, 'portada_6a6295f63d9898.05331340.jpg');
INSERT INTO `libros` (`id`, `titulo`, `autor`, `anio`, `paginas`, `disponible`, `genero`, `editorial`, `isbn`, `cantidad`, `portada`) VALUES
(519, 'Biblia Aventura, NVI, Tapa Dura / Spanish Adventure Bible, NVI, Hardcover (Spanish Edition)', 'Anonymous', 2018, 1472, 1, 'Religion', NULL, NULL, 1, 'portada_6a6295f8375054.76948445.jpg'),
(520, 'Grandma Gatewood\'s Walk: The Inspiring Story of the Woman Who Saved the Appalachian Trail', 'Ben Montgomery', 2014, 277, 1, 'No ficcion,Biografia', NULL, NULL, 1, 'portada_6a6295fa39e334.13670466.jpg'),
(521, 'The Christmas Escape', 'Sarah Morgan', 2021, 352, 1, 'Romance', NULL, NULL, 1, 'portada_6a6295fc39cea1.41812576.jpg'),
(522, 'Gender Queer: A Memoir', 'Maia Kobabe', 2019, 240, 1, 'Memoria grafica', NULL, NULL, 1, 'portada_6a6295fe54d2c0.06808771.jpg'),
(523, 'Rufus Goes to School', 'Kim T. Griswell', 2014, 39, 1, 'Infantil', NULL, NULL, 1, NULL),
(524, 'A Girl Called Samson', 'Amy Harmon', 2023, 405, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(525, 'The Bee Sting', 'Paul Murray', 2023, 645, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62960433cfb6.16852612.jpg'),
(526, 'Pachinko', 'Min Jin Lee', 2017, 496, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(527, 'La librera de Kentucky (Book Woman of Troublesome Creek, #1)', 'Kim Michele Richardson', 2023, 352, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a6296064973f4.51164669.jpg'),
(528, 'A Day Like This', 'Kelley McNeil', 2021, 287, 1, 'Ficcion,Romance', NULL, NULL, 1, 'portada_6a62960866ccc8.69963205.jpg'),
(529, 'The Secret Lives of Church Ladies', 'Deesha Philyaw', 2020, 179, 1, 'Relatos, Ficcion, Literario', NULL, NULL, 1, 'portada_6a62960a714cb9.91102256.jpg'),
(531, 'Click, Clack, Moo: Cows That Type', 'Doreen Cronin', 2000, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62960de7b2a6.73138119.jpg'),
(532, 'Gravedad', 'Tess Gerritsen', 2000, 374, 1, 'Thriller', NULL, NULL, 1, NULL),
(533, 'James y el melocotón gigante', 'Roald Dahl', 2000, 184, 1, 'Infantil,Fantasia', NULL, NULL, 1, NULL),
(534, 'La condesa sangrienta', 'Alejandra Pizarnik', 2009, 56, 1, 'Ensayo,Prosa poetica', NULL, NULL, 1, 'portada_6a629610cafc23.71259821.jpg'),
(535, 'La quinta víctima (4MK Thriller, #2)', 'J.D. Barker', 2019, 608, 1, 'Thriller', NULL, NULL, 1, NULL),
(536, 'Don\'t Let the Pigeon Drive the Bus! (Pigeon, #1)', 'Mo Willems', 2004, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629614955f57.51904087.jpg'),
(537, 'La mamá de la mamá de mi mamá', 'Alejandra Schmidt Urzua', 2014, 44, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296168d7945.66780119.jpg'),
(538, 'Brown Bear, Brown Bear, What Do You See?', 'Bill Martin Jr.', 1996, 24, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629617f153d7.69112099.jpg'),
(540, 'El corazón secuestrado', 'Gaston Leroux', 1950, 42, 1, 'Misterio clasico', NULL, NULL, 1, NULL),
(541, 'Ugly Love', 'Colleen Hoover', 2014, 322, 1, 'Romance', NULL, NULL, 1, 'portada_6a62961c3f2bd3.08750230.jpg'),
(542, 'North and South', 'Elizabeth Gaskell', 1994, 521, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62961e4a56d9.51411094.jpg'),
(543, 'North Woods', 'Daniel Mason', 2023, 372, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62962093f7a9.34758762.jpg'),
(544, 'Viven! La tragedia de los Andes', 'Piers Paul Read', 1974, 336, 1, 'No ficcion', NULL, NULL, 1, NULL),
(546, 'Bye Bye, Binary', 'Eric Geron', 2022, 24, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629623828ef5.25770726.jpg'),
(547, 'Eyes that Kiss in the Corners', 'Joanna Ho', 2021, 34, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296259306a4.30525133.jpg'),
(548, 'Surely You Can\'t Be Serious: The True Story of Airplane!', 'David Zucker', 2023, 352, 1, 'Memoria,Humor', NULL, NULL, 1, 'portada_6a629627c56ae3.94292129.jpg'),
(557, 'The Israeli-Palestinian Conflict: What Everyone Needs to Know', 'Dov Waxman', 2019, 283, 1, 'No ficcion, Politica', NULL, NULL, 1, 'portada_6a6296316f2762.31290974.jpg'),
(558, 'The Thursday Murder Club (Thursday Murder Club, #1)', 'Richard Osman', 2020, 382, 1, 'Misterio cozy', NULL, NULL, 1, NULL),
(559, 'Daughter of the Mountain', 'Sherry Parnell', 2023, 250, 1, 'Ficcion', NULL, NULL, 1, NULL),
(560, 'O Pioneers!', 'Willa Cather', 1992, 159, 1, 'Clasico', NULL, NULL, 1, 'portada_6a629635141968.99498943.jpg'),
(561, 'Uno se quedó atras', 'Marjorie Bowen', 2019, 31, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(562, 'The Drowning Kind', 'Jennifer McMahon', 2021, 319, 1, 'Terror, Misterio', NULL, NULL, 1, 'portada_6a629637274d75.80662273.jpg'),
(563, 'Mis whatsapp con Mamá', 'Alban Orsini', 2014, 384, 1, 'Humor', NULL, NULL, 1, 'portada_6a62963938de77.19565470.jpg'),
(564, 'Cinder (Las crónicas lunares, #1)', 'Marissa Meyer', 2012, 428, 1, 'Ciencia ficcion', NULL, NULL, 1, 'portada_6a62963b4f3b58.08186940.jpg'),
(565, 'This Is Not My Hat', 'Jon Klassen', 2012, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62963d4dbd56.86239640.jpg'),
(566, 'Black River Orchard', 'Chuck Wendig', 2023, 640, 1, 'Terror', NULL, NULL, 1, 'portada_6a62963eaca838.51336786.jpg'),
(567, 'Edenville', 'Sam Rebelein', 2023, 323, 1, 'Terror', NULL, NULL, 1, 'portada_6a629640d7bf46.03633796.jpg'),
(568, 'Dead Eleven', 'Jimmy Juliano', 2023, 439, 1, 'Terror', NULL, NULL, 1, 'portada_6a62964247cc25.58450276.jpg'),
(569, 'The Devil Takes You Home', 'Gabino Iglesias', 2022, 320, 1, 'Terror, Noir', NULL, NULL, 1, 'portada_6a629644661d77.83231057.jpg'),
(570, 'Vampires of El Norte', 'Isabel Cañas', 2023, 371, 1, 'Terror,Romance,Historico', NULL, NULL, 1, 'portada_6a6296473bf174.80647270.jpg'),
(571, 'Mexican Gothic', 'Silvia Moreno-Garcia', 2020, 320, 1, 'Terror, Gotico', NULL, NULL, 1, 'portada_6a629648922867.73136547.jpg'),
(572, 'Can You Forgive Her? (Palliser, #1)', 'Anthony Trollope', 1975, 847, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62964aa0e883.71734719.jpg'),
(573, 'The Last Tale of the Flower Bride', 'Roshani Chokshi', 2023, 301, 1, 'Fantasia', NULL, NULL, 1, NULL),
(574, 'All the Forgivenesses', 'Elizabeth Hardinger', 2019, 371, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a62964c0ead93.16316443.jpg'),
(575, 'You Made a Fool of Death with Your Beauty', 'Akwaeke Emezi', 2022, 288, 1, 'Romance, Ficcion, Literaria', NULL, NULL, 1, 'portada_6a62964e3425b9.34626308.jpg'),
(576, 'What Happened to Ruthy Ramirez', 'Claire Jiménez', 2023, 240, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6296504204e8.75954204.jpg'),
(577, 'Wash Day Diaries', 'Jamila Rowser', 2022, 192, 1, 'Comic', NULL, NULL, 1, 'portada_6a629651c50794.14776683.jpg'),
(578, 'You\'re All My Favorites', 'Sam McBratney', 2004, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629653d1ac00.30557599.jpg'),
(579, 'Lo Que Los Maestros No Pueden Hacer (Spanish Edition)', 'Scholastic Paperbacks', 0, 0, 1, 'No ficcion,Educacion', NULL, NULL, 1, NULL),
(580, 'The Beekeeper\'s Daughter', 'Santa Montefiore', 2015, 416, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a629657182f35.47961919.jpg'),
(581, 'Tom Lake', 'Ann Patchett', 2023, 320, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6296591b4dd5.35177183.jpg'),
(582, 'The Picture of Dorian Gray', 'Oscar Wilde', 2004, 272, 1, 'Clasico,Terror', NULL, NULL, 1, NULL),
(583, 'The Day the Crayons Quit', 'Drew Daywalt', 2013, 30, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62965b3a1559.93698014.jpg'),
(584, 'The Thank You Book (Elephant & Piggie, #25)', 'Mo Willems', 2016, 64, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62965da5cc39.94249149.jpg'),
(585, 'They All Saw a Cat', 'Brendan Wenzel', 2016, 44, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62965f91a298.39520095.jpg'),
(587, 'The Road', 'Cormac McCarthy', 2006, 241, 1, 'Ficcion,Post-apocaliptica', NULL, NULL, 1, 'portada_6a62966290cb57.90603755.jpg'),
(588, 'The Sun is a Compass: A 4,000-Mile Journey into the Alaskan Wilds', 'Caroline Van Hemert', 2019, 320, 1, 'No ficcion,Aventura', NULL, NULL, 1, NULL),
(589, 'Frank and Bert', 'Chris Naylor-Ballesteros', 2022, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629664b2c109.43541419.jpg'),
(591, 'Un ama de casa feliz', 'Heleen van Royen', 2008, 312, 1, 'Ficcion,Humor', NULL, NULL, 1, NULL),
(592, 'Gone with the Wind', 'Margaret Mitchell', 1993, 1037, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62966924ced7.92683937.jpg'),
(593, 'The Help', 'Kathryn Stockett', 2009, 451, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a62966b39e482.39666682.jpg'),
(594, 'The Last Ballad', 'Wiley Cash', 2017, 416, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a62966d5ec339.66639598.jpg'),
(595, 'After the Woods', 'Kim Savage', 2016, 304, 1, 'Thriller', NULL, NULL, 1, 'portada_6a62966eb4ed33.36234723.jpg'),
(596, 'If You Give a Mouse a Cookie (If You Give...)', 'Laura Joffe Numeroff', 1996, 40, 1, 'Infantil', NULL, NULL, 1, NULL),
(597, 'A Hole is to Dig', 'Ruth Krauss', 1989, 48, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629670c1f187.94343996.jpg'),
(598, 'Adivina cuánto te quiero', 'Sam McBratney', 1988, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629672edef61.02390291.jpg'),
(599, 'Las Aventuras de Juan El Zorro (Las Aventuras de Juan El Zorro, #1)', 'Renzo Vayra', 2005, 90, 1, 'Infantil', NULL, NULL, 1, NULL),
(600, 'Where the Wild Things Are', 'Maurice Sendak', 2000, 38, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296748c80d1.54228798.jpg'),
(601, 'Frog and Toad Are Friends (Frog and Toad, #1)', 'Arnold Lobel', 2003, 64, 1, 'Infantil', NULL, NULL, 1, NULL),
(602, 'Yo siempre te querré', 'Hans Wilhelm', 1989, 32, 1, 'Infantil', NULL, NULL, 1, NULL),
(603, 'Hair Love', 'Matthew A. Cherry', 2019, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629677ab1687.78087134.jpg'),
(604, 'Pocahontas (Clásicos Disney) (Spanish Edition)', 'Walt Disney Company', 1995, 112, 1, 'Infantil', NULL, NULL, 1, NULL),
(605, 'Cry, Heart, But Never Break', 'Glenn Ringtved', 2016, 30, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62967b2b49d2.03735483.jpg'),
(606, 'The Tea Dragon Tapestry (Tea Dragon, #3)', 'K. O\'Neill', 2021, 135, 1, 'Comic,Infantil,Fantasia', NULL, NULL, 1, 'portada_6a62967d37d266.16645763.jpg'),
(607, 'A Very Special House', 'Ruth Krauss', 2001, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62967f495413.58863603.jpg'),
(608, 'The Boy Who Tried to Shrink His Name: A Picture Book', 'Sandhya Parappukkaran', 2023, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629681725570.91672656.jpg'),
(609, 'La bruja Mon', 'Pilar Mateos', 1995, 64, 1, 'Infantil', NULL, NULL, 1, NULL),
(610, 'Bajo la misma estrella', 'John Green', 2012, 304, 1, 'YA,Romance', NULL, NULL, 1, 'portada_6a629684611a28.69855247.jpg'),
(611, 'I Will Judge You by Your Bookshelf', 'Grant Snider', 2020, 128, 1, 'Comic,Humor', NULL, NULL, 1, 'portada_6a6296868c4e88.03066963.jpg'),
(612, 'Into the Wild', 'Jon Krakauer', 1997, 207, 1, 'No ficcion,Aventura', NULL, NULL, 1, 'portada_6a6296889b2865.66865464.jpg'),
(613, 'Wild: From Lost to Found on the Pacific Crest Trail', 'Cheryl Strayed', 2012, 336, 1, 'Memoria,Aventura', NULL, NULL, 1, 'portada_6a62968ab85c78.23853383.jpg'),
(614, 'The Night Circus', 'Erin Morgenstern', 2011, 506, 1, 'Fantasia', NULL, NULL, 1, NULL),
(615, '28 Summers', 'Elin Hilderbrand', 2020, 432, 1, 'Romance', NULL, NULL, 1, 'portada_6a62968d5a9b50.77650204.jpg'),
(616, 'Foe', 'Iain Reid', 2018, 261, 1, 'Ciencia ficcion,Thriller,Psicologico', NULL, NULL, 1, 'portada_6a62968f6333e0.96738065.jpg'),
(617, 'The Vaster Wilds', 'Lauren Groff', 2023, 256, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a629690c1cf45.99811956.jpg'),
(618, 'The Martian', 'Andy Weir', 2014, 369, 1, 'Ciencia ficcion', NULL, NULL, 1, 'portada_6a629692be1275.21647667.jpg'),
(619, 'Tender Is the Flesh', 'Agustina Bazterrica', 2020, 209, 1, 'Distopia,Terror', NULL, NULL, 1, NULL),
(620, 'Just The Tip (The Pen Fifteen Club)', 'The Baben', 2021, 58, 1, 'Romance, Comedia', NULL, NULL, 1, NULL),
(621, 'Gone Girl', 'Gillian Flynn', 2014, 415, 1, 'Thriller', NULL, NULL, 1, 'portada_6a62969646f8e5.27587120.jpg'),
(622, 'Sidewalk Flowers', 'JonArno Lawson', 2015, 26, 1, 'Infantil', NULL, NULL, 1, 'portada_6a629697966dd8.06963479.jpg'),
(623, 'House of Salt and Sorrows (Sisters of the Salt, #1)', 'Erin A. Craig', 2019, 403, 1, 'Fantasia', NULL, NULL, 1, 'portada_6a6296990334d4.02338841.jpg'),
(624, 'Mr. Wuffles!', 'David Wiesner', 2013, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a62969b17bfe7.05181904.jpg'),
(625, 'Survivor Song', 'Paul Tremblay', 2020, 320, 1, 'Terror', NULL, NULL, 1, 'portada_6a62969d28b5d7.17786808.jpg'),
(626, 'Los dos amores de mi vida', 'Taylor Jenkins Reid', 2021, 320, 1, 'Romance', NULL, NULL, 1, 'portada_6a62969e81b891.43657910.jpg'),
(627, 'The Book of Eels: Our Enduring Fascination with the Most Mysterious Creature in the Natural World', 'Patrik Svensson', 2020, 256, 1, 'No ficcion,Naturaleza', NULL, NULL, 1, 'portada_6a62969fe7def7.10782569.jpg'),
(628, 'Who Ate the First Oyster?: The Extraordinary People Behind the Greatest Firsts in History', 'Cody Cassidy', 2020, 240, 1, 'No ficcion,Humor,Historico', NULL, NULL, 1, 'portada_6a6296a2199cc3.68810792.jpg'),
(629, 'One Flew Over the Cuckoo’s Nest', 'Ken Kesey', 1963, 325, 1, 'Clasico', NULL, NULL, 1, NULL),
(630, 'Sailing Alone around the World', 'Joshua Slocum', 1999, 273, 1, 'No ficcion,Aventura', NULL, NULL, 1, 'portada_6a6296a53bd192.67784086.jpg'),
(631, 'Adrift: Seventy-Six Days Lost at Sea', 'Steven Callahan', 2002, 344, 1, 'No ficcion, Supervivencia', NULL, NULL, 1, 'portada_6a6296a7441eb4.47887387.jpg'),
(632, 'The Bad Seed (The Food Group #1)', 'Jory John', 2018, 40, 1, 'Infantil', NULL, NULL, 1, NULL),
(633, 'That Flag: A Jane Addams Honor Book About Friendship and Racism for Children (Ages 6-10)', 'Tameka Fryer Brown', 2023, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296a88ec668.68781529.jpg'),
(634, 'Matar a Mónica', 'Candace Bushnell', 2018, 316, 1, 'Ficcion,Comedia', NULL, NULL, 1, 'portada_6a6296aa937ce7.32860979.jpg'),
(635, 'Phallacy: Life Lessons from the Animal Penis', 'Emily Willingham', 2020, 336, 1, 'No ficcion,Ciencia', NULL, NULL, 1, 'portada_6a6296acb24447.79215081.jpg'),
(636, 'A Fly Went By', 'Mike McClintock', 1958, 65, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296ae1dcd14.48581821.jpg'),
(637, 'Southern Spirits (Southern Ghost Hunter Mysteries, #1)', 'Angie Fox', 2025, 320, 1, 'Misterio cozy,Paranormal', NULL, NULL, 1, 'portada_6a6296af77dc48.05108122.jpg'),
(638, 'Aristotle and Dante Discover the Secrets of the Universe (Aristotle and Dante, #1)', 'Benjamin Alire Sáenz', 2012, 390, 1, 'YA,Romance', NULL, NULL, 1, 'portada_6a6296b1aec0c4.35334165.jpg'),
(639, 'Aristotle and Dante Dive into the Waters of the World (Aristotle and Dante, #2)', 'Benjamin Alire Sáenz', 2021, 516, 1, 'YA,Romance', NULL, NULL, 1, 'portada_6a6296b3be4bf2.78427862.jpg'),
(640, 'Cruzando el bosque', 'E.M. Carroll', 2015, 208, 1, 'Comic,Terror', NULL, NULL, 1, 'portada_6a6296b5bbdc71.12276883.jpg'),
(641, 'Fragments of Horror', 'Junji Ito', 2015, 224, 1, 'Manga,Terror', NULL, NULL, 1, 'portada_6a6296b71c09f4.52613629.jpg'),
(642, 'The Boy, the Mole, the Fox and the Horse', 'Charlie Mackesy', 2019, 128, 1, 'Infantil,Inspiracional', NULL, NULL, 1, 'portada_6a6296b91c5100.16212898.jpg'),
(643, 'Cheer Up: Love and Pompoms', 'Crystal Frasier', 2021, 128, 1, 'Comic', NULL, NULL, 1, 'portada_6a6296bb18a4a5.92344045.jpg'),
(644, '¿Cuánta tierra necesita un hombre?', 'Leo Tolstoy', 2011, 66, 1, 'Clasico,Relato', NULL, NULL, 1, 'portada_6a6296bd227c80.26475571.jpg'),
(645, 'La sexta trampa (4MK Thriller, #3)', 'J.D. Barker', 2020, 550, 1, 'Thriller', NULL, NULL, 1, NULL),
(646, 'Maus I: A Survivor\'s Tale: My Father Bleeds History (Maus, #1)', 'Art Spiegelman', 1991, 159, 1, 'Comic,Historico', NULL, NULL, 1, 'portada_6a6296c11862d3.16799145.jpg'),
(647, 'Anya\'s Ghost', 'Vera Brosgol', 2011, 224, 1, 'Comic', NULL, NULL, 1, 'portada_6a6296c318f9b5.70841583.jpg'),
(648, 'Garlic and the Vampire (Garlic, #1)', 'Bree Paulsen', 2021, 160, 1, 'Infantil,Comic', NULL, NULL, 1, 'portada_6a6296c54f90f0.09825656.jpg'),
(649, 'Mafalda: femenino singular', 'Quino', 2018, 144, 1, 'Comic,Humor', NULL, NULL, 1, 'portada_6a6296c77e4103.85863399.jpg'),
(650, 'House of Hollow', 'Krystal Sutherland', 2021, 292, 1, 'Fantasia', NULL, NULL, 1, 'portada_6a6296c90a9394.77961190.jpg'),
(651, 'Gato rojo, gato azul (Spanish Edition)', 'Jenni Desmond', 2020, 36, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296cb4fb331.52974414.jpg'),
(652, 'The Tea Dragon Festival (Tea Dragon, #2)', 'K. O\'Neill', 2019, 135, 1, 'Comic,Infantil,Fantasia', NULL, NULL, 1, 'portada_6a6296cca30722.98655077.jpg'),
(653, 'The Girl Who Never Made Mistakes', 'Mark Pett', 2011, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296ceb0f297.40354749.jpg'),
(654, 'El Palacio de Papel', 'José Zafra', 1998, 112, 1, 'Ficcion', NULL, NULL, 1, 'portada_6a6296d0d08e98.76598356.jpg'),
(655, 'Love You Forever', 'Robert Munsch', 1995, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296d3033964.32415648.jpg'),
(656, 'Leña menuda', 'Marta Barrio', 2021, 320, 1, 'Ficcion', NULL, NULL, 1, 'portada_6a6296d51b6fd1.36345605.jpg'),
(657, 'The Lorax', 'Dr. Seuss', 1998, 72, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296d71f99d5.55535073.jpg'),
(658, 'Comic Adventures of Boots', 'Satoshi Kitamura', 2002, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296d92d38b4.37678749.jpg'),
(659, 'Lost and Found (The Boy, #2)', 'Oliver Jeffers', 2005, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296db2f67b6.39700156.jpg'),
(660, 'The Story of Ferdinand', 'Munro Leaf', 1936, 72, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296dd9159f3.88575881.jpg'),
(661, 'Town Is by the Sea', 'Joanne Schwartz', 2017, 52, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296df9d1432.30165553.jpg'),
(662, 'Disculpe... ¿Es Usted Una Bruja?', 'Emily Horn', 2014, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296e1049893.10158477.jpg'),
(663, 'The Rainbow Fish', 'Marcus Pfister', 1992, 32, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296e297ada6.86865058.jpg'),
(664, 'The Wonky Donkey', 'Craig Smith', 2009, 24, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296e4d7cc29.92362626.jpg'),
(665, 'Sixto Seis Cenas (Pinata) (Spanish Edition)', 'Inga Moore', 2013, 40, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296e7015c39.77381946.jpg'),
(666, 'El gato que buscaba un nombre', 'Fumiko Takeshita', 2020, 32, 1, 'Infantil', NULL, NULL, 1, NULL),
(667, 'The Very Hungry Caterpillar', 'Eric Carle', 1994, 26, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296ea909128.48917309.jpg'),
(668, 'Green Eggs and Ham', 'Dr. Seuss', 1988, 64, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296ebe07fc9.59804276.jpg'),
(669, 'The Giving Tree', 'Shel Silverstein', 1964, 64, 1, 'Infantil', NULL, NULL, 1, 'portada_6a6296ed4d0cd4.85252561.jpg'),
(670, 'Hey, Water!', 'Antoinette Portis', 2019, 48, 1, 'Infantil,No ficcion', NULL, NULL, 1, 'portada_6a6296ef493525.98733833.jpg'),
(672, 'La catedral del mar (La catedral del mar, #1)', 'Ildefonso Falcones', 2006, 670, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(673, 'My Dog: The Paradox: A Lovable Discourse about Man\'s Best Friend (Volume 3) (The Oatmeal)', 'Matthew Inman', 2013, 32, 1, 'Humor,Comic', NULL, NULL, 1, 'portada_6a6296f38745c6.80752776.jpg'),
(674, 'The Ocean at the End of the Lane', 'Neil Gaiman', 2013, 181, 1, 'Fantasia', NULL, NULL, 1, NULL),
(675, 'The Tea Dragon Society (Tea Dragon, #1)', 'K. O\'Neill', 2017, 71, 1, 'Comic,Infantil,Fantasia', NULL, NULL, 1, 'portada_6a6296f8360e21.78133906.jpg'),
(676, 'Guía del club de lectura para matar vampiros', 'Grady Hendrix', 2021, 471, 1, 'Terror,Comedia', NULL, NULL, 1, NULL),
(677, 'Claude & Camille: A Novel of Monet', 'Stephanie Cowell', 2010, 338, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a6296fbb6a0f2.83237028.jpg'),
(678, 'Hoyos (Hoyos, #1)', 'Louis Sachar', 2002, 240, 1, 'Juvenil', NULL, NULL, 1, 'portada_6a6296fdb54052.95894294.jpg'),
(679, 'The Spoon Stealer', 'Lesley Crewe', 2020, 360, 1, 'Ficcion', NULL, NULL, 1, 'portada_6a6296ffb2b825.42814711.jpg'),
(681, 'The Known World', 'Edward P. Jones', 2006, 388, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a6297032c3bd8.44292123.jpg'),
(683, 'Hermanos de alma', 'David Diop', 2019, 156, 1, 'Ficcion,Historico', NULL, NULL, 1, 'portada_6a629707498b83.12541040.jpg'),
(684, 'Elsewhere', 'Alexis Schaitkin', 2022, 240, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a629709618624.96649927.jpg'),
(685, 'Snug: A Collection of Comics about Dating Your Best Friend', 'Catana Chetwynd', 2020, 136, 1, 'Comic,Romance', NULL, NULL, 1, 'portada_6a62970b632487.80895300.jpg'),
(686, 'The Candy House', 'Jennifer Egan', 2022, 352, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62970d6d3b09.36235020.jpg'),
(687, 'Instructions for a Heatwave', 'Maggie O\'Farrell', 2013, 352, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62970ec29bd9.37277357.jpg'),
(688, 'A Little Princess', 'Frances Hodgson Burnett', 2002, 242, 1, 'Clasico,Infantil', NULL, NULL, 1, 'portada_6a629710cfef29.97970522.jpg'),
(689, 'El día que dejó de nevar en Alaska', 'Alice Kellen', 2017, 352, 1, 'Romance', NULL, NULL, 1, 'portada_6a629712eaff10.06484245.jpg'),
(690, 'The Trick is to Keep Breathing', 'Janice Galloway', 2015, 236, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a629714843496.35503637.jpg'),
(691, 'Blackberry Summer (Hope\'s Crossing, #1)', 'RaeAnne Thayne', 2011, 384, 1, 'Romance', NULL, NULL, 1, 'portada_6a62971688e717.29911621.jpg'),
(694, 'Zac y Mia', 'A.J. Betts', 2015, 288, 1, 'YA', NULL, NULL, 1, 'portada_6a62971b884106.93557833.jpg'),
(695, 'Shiver (The Wolves of Mercy Falls, #1)', 'Maggie Stiefvater', 2009, 392, 1, 'Fantasia,Romance', NULL, NULL, 1, 'portada_6a62971d1c34d2.75133732.jpg'),
(696, '¿Y si quedamos como amigos?', 'Elizabeth Eulberg', 2014, 312, 1, 'YA,Romance', NULL, NULL, 1, NULL),
(697, 'What Alice Forgot', 'Liane Moriarty', 2018, 487, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62971f5b44c8.14907113.jpg'),
(698, 'Al final mueren los dos', 'Adam Silvera', 2018, 384, 1, 'YA', NULL, NULL, 1, 'portada_6a62972173fab1.76924997.jpg'),
(699, 'The Only Harmless Great Thing', 'Brooke Bolander', 2018, 93, 1, 'Ciencia ficcion,Fantasia', NULL, NULL, 1, 'portada_6a6297238eb158.77370556.jpg'),
(700, 'The Far Side Gallery', 'Gary Larson', 1984, 192, 1, 'Comic,Humor', NULL, NULL, 1, 'portada_6a629724f2a552.62774481.jpg'),
(701, 'Me casaré contigo', 'Corín Tellado', 1959, NULL, 1, 'Romance', NULL, NULL, 1, NULL),
(702, 'Death and What Comes Next (Discworld, #10.5; Death, #1.5)', 'Terry Pratchett', 2002, 1, 1, 'Fantasia,Humor', NULL, NULL, 1, NULL),
(703, 'A Tree Grows in Brooklyn', 'Betty Smith', 2006, 496, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62972712baf0.87321710.jpg'),
(704, 'The Paper Palace', 'Miranda Cowley Heller', 2021, 400, 1, 'Ficcion,Literaria', NULL, NULL, 1, NULL),
(705, 'Entre visillos', 'Carmen Martín Gaite', 2005, 256, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62972a2edf43.05988358.jpg'),
(706, 'When Never Comes', 'Barbara Davis', 2018, 369, 1, 'Ficcion,Romance', NULL, NULL, 1, NULL),
(707, 'The Brighter the Light', 'Mary Ellen Taylor', 2022, 360, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(708, 'Siren Queen', 'Nghi Vo', 2022, 281, 1, 'Fantasia', NULL, NULL, 1, 'portada_6a62972fe51b96.21839716.jpg'),
(709, 'Love and Other Words', 'Christina Lauren', 2018, 432, 1, 'Romance', NULL, NULL, 1, 'portada_6a62973219f218.88385865.jpg'),
(710, 'The Quarterback and the Ballerina (The Ballerina Academy, #1)', 'Anne-Marie Meyer', 2020, 230, 1, 'Romance, Juvenil', NULL, NULL, 1, NULL),
(711, 'A Painted House', 'John Grisham', 2004, 384, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a6297344a1854.24370544.jpg'),
(712, 'One for the Blackbird, One for the Crow', 'Olivia Hawker', 2019, 497, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(713, 'Delphine', 'Madame de Staël', 1995, 469, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62973c9f3f55.08279964.jpg'),
(714, 'El pagaré', 'F. Scott Fitzgerald', 2021, 60, 1, 'Relatos, Clasico', NULL, NULL, 1, 'portada_6a62973f9e0336.97853721.jpg'),
(715, 'The Wind in the Willows', 'Kenneth Grahame', 2005, 197, 1, 'Clasico,Infantil', NULL, NULL, 1, 'portada_6a629741ad06e4.22443182.jpg'),
(716, 'Quinoterapia', 'Quino', 1998, 60, 1, 'Comic,Humor', NULL, NULL, 1, 'portada_6a629743a72664.17811169.jpg'),
(717, 'Hombres de bolsillo', 'Quino', 1977, 78, 1, 'Comic,Humor', NULL, NULL, 1, NULL),
(718, 'Old English Tile Designs for Artists and Craftspeople (Dover Pictorial Archive Series)', 'Carol Belanger Grafton', 1984, 128, 1, 'Arte,Referencia', NULL, NULL, 1, 'portada_6a629745d8d953.43264823.jpg'),
(719, 'Baker City', 'C.J. Petit', 2017, 548, 1, 'Western', NULL, NULL, 1, NULL),
(720, 'From Lukov with Love', 'Mariana Zapata', 2018, 493, 1, 'Romance', NULL, NULL, 1, NULL),
(722, 'The Forgotten Garden', 'Kate Morton', 2008, 648, 1, 'Ficcion,Misterio,Historico', NULL, NULL, 1, 'portada_6a629748455462.92795284.jpg'),
(723, 'Pedro Páramo', 'Juan Rulfo', 1994, 128, 1, 'Clasico', NULL, NULL, 1, 'portada_6a62974a5039e9.45050696.jpg'),
(724, 'La lluvia amarilla', 'Julio Llamazares', 2001, 160, 1, 'Ficcion,Literaria', NULL, NULL, 1, 'portada_6a62974c6d9575.72677743.jpg'),
(725, 'El Alien (Inspector Brant, #2)', 'Ken Bruen', 2008, 190, 1, 'Misterio,Thriller', NULL, NULL, 1, NULL),
(727, 'Romancero de la Muerte', 'José Luis Vázquez', 2021, NULL, 1, 'Poesia', NULL, NULL, 1, NULL),
(728, 'La tumba maldita (Los misterios de Setna, #1)', 'Christian Jacq', 2015, 272, 1, 'Ficcion,Historico', NULL, NULL, 1, NULL),
(729, 'El misterio de la isla de Tökland', 'Joan Manuel Gisbert', 1998, 236, 1, 'Juvenil,Misterio', NULL, NULL, 1, 'portada_6a62974fd25fb6.97739196.jpg'),
(730, 'Turma da Mônica Jovem #49', 'Mauricio de Sousa', 2012, 130, 1, 'Comic,Infantil', NULL, NULL, 1, NULL),
(732, 'Mi amigo Hipojico', 'Magdalena Heiguera', 2015, 45, 1, 'Infantil', NULL, NULL, 1, NULL),
(733, 'Vandalia', 'Helen Velando', 2010, 279, 1, 'Ficcion,Aventura', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  `socio_id` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL DEFAULT curdate(),
  `fecha_devolucion_esperada` date NOT NULL,
  `fecha_devolucion_real` date DEFAULT NULL,
  `estado` enum('prestado','devuelto') NOT NULL DEFAULT 'prestado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id`, `libro_id`, `socio_id`, `fecha_prestamo`, `fecha_devolucion_esperada`, `fecha_devolucion_real`, `estado`) VALUES
(1, 253, 11, '2026-07-23', '2026-07-28', NULL, 'prestado'),
(3, 11, 12, '2026-07-24', '2026-07-30', NULL, 'prestado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id`, `nombre`, `email`, `apellido`, `cedula`, `telefono`, `fecha_registro`) VALUES
(1, 'Juan', 'juan.perez@email.com', 'Pérez', '51234567', '099123456', '2026-07-21'),
(2, 'María', 'maria.gomez@email.com', 'Gómez', '48765432', '098765432', '2026-07-21'),
(3, 'Carlos', 'carlos.rodriguez@email.com', 'Rodríguez', '45678901', '091234567', '2026-07-21'),
(4, 'Lucía', 'lucia.fernandez@email.com', 'Fernández', '53456789', '097654321', '2026-07-21'),
(5, 'Sofía', 'sofia.martinez@email.com', 'Martínez', '47890123', '094112233', '2026-07-21'),
(6, 'Mateo', 'mateo.silva@email.com', 'Silva', '50123456', '095223344', '2026-07-21'),
(7, 'Valentina', 'valentina.suarez@email.com', 'Suárez', '52345678', '092334455', '2026-07-21'),
(8, 'Nicolás', 'nicolas.lopez@email.com', 'López', '48901234', '096445566', '2026-07-21'),
(9, 'Camila', 'camila.torres@email.com', 'Torres', '54567890', '093556677', '2026-07-21'),
(10, 'Martín', 'martin.acosta@email.com', 'Acosta', '46789012', '099667788', '2026-07-21'),
(11, 'Anthony', 'antoniotoniosigma@gmail.com', 'Silva', '55118416', '094759451', '2026-07-21'),
(12, 'Ezequiel', 'tonisigma@gmail.com', 'Mello', '55118417', '095437435', '2026-07-21'),
(13, 'Jhon', 'porkjhon67@gmail.com', 'Pork', '67676776', '094759451', '2026-07-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`) VALUES
(1, 'Administrador', 'admin@utu.com', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `libro_id` (`libro_id`),
  ADD KEY `socio_id` (`socio_id`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=979;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`socio_id`) REFERENCES `socios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
