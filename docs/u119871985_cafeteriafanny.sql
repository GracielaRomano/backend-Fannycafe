-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 28, 2026 at 08:38 PM
-- Server version: 11.8.6-MariaDB-log
-- PHP Version: 7.2.34

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u119871985_cafeteriafanny`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `full_description` text NOT NULL,
  `event_date` varchar(100) NOT NULL,
  `event_yyyymm` int(6) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `attendees` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `subtitle`, `description`, `full_description`, `event_date`, `event_yyyymm`, `location`, `attendees`, `image`, `banner_image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Evento La Rural', 'Congreso Argentino de Cardiología (SAC)', 'Servicio de café premium para el prestigioso Congreso Argentino de Cardiología, uno de los eventos médicos más importantes del año.', 'El Congreso Argentino de Cardiología (SAC) reunió a más de 500 profesionales de la salud en La Rural, donde tuvimos el honor de brindar nuestro servicio de café premium durante los tres días del evento.\n\nInstalamos múltiples estaciones de café estratégicamente ubicadas en diferentes áreas del predio, incluyendo el hall principal, las salas de conferencias y las zonas de networking. Cada estación contó con máquinas de última generación y un barista profesional dedicado a preparar café de especialidad para los asistentes.\n\nOfrecimos una amplia variedad de opciones, desde espressos intensos hasta capuchinos suaves, además de alternativas sin lactosa y descafeinadas. La presentación fue impecable, con vajilla elegante y un servicio personalizado que recibió excelentes comentarios de los organizadores y participantes.', '15 al 17 de Octubre, 2025', 202510, 'La Rural - Predio Ferial, Buenos Aires', '500+ profesionales', '/assets/images/laRural/caratula.jpg', '/assets/images/laRural/caratula.jpg', 1, '2025-10-23 14:14:02', '2026-04-28 18:57:07'),
(2, 'Brubank en ECI 2022', 'Ciudad Universitaria UBA', 'Evento académico de referencia en informática con alta convocatoria de estudiantes y profesionales IT. Aroma a Café acompañó con estaciones de café premium, generando espacios de networking y pausa durante toda la jornada.', 'Evento destacado en el ámbito académico y tecnológico, la 35.ª edición de la Escuela de Ciencias Informáticas (ECI) reunió a estudiantes, profesionales, investigadores y referentes de la industria IT en un entorno de aprendizaje, networking e innovación. Desarrollado del 25 al 29 de julio de 2022 en el moderno Pabellón Cero + Infinito de Ciudad Universitaria (UBA), el evento ofreció una agenda intensiva con conferencias, workshops y espacios de intercambio sobre tendencias en informática, desarrollo de software, inteligencia artificial y nuevas tecnologías.\r\nEn este contexto de alta participación y dinamismo, Brubank se posicionó como uno de los patrocinadores principales en la categoría Diamond, aportando visibilidad, propuestas de valor y experiencias para los asistentes. Como parte de la experiencia integral del evento, se dispusieron servicios de coffee break de alta calidad, diseñados para acompañar los momentos de pausa, fomentar el networking y mejorar la experiencia general de los participantes.\r\nAroma a  Café se integró perfectamente a la dinámica del evento, ofreciendo café premium de manera continua, rápida y eficiente durante toda la jornada. Las estaciones de café se convirtieron en puntos de encuentro clave, donde asistentes y expositores pudieron disfrutar de bebidas de especialidad en un entorno cómodo y profesional, elevando el estándar del servicio y aportando un valor diferencial a la experiencia del evento.\r\n', '25 al 29 de Julio, 2022', 202207, 'Pabellón Cero + Infinito de Ciudad Universitaria (UBA)', '150 invitados', '/assets/images/brubank/portada.jpg', '/assets/images/brubank/portada.jpg', 1, '2026-04-28 14:14:02', '2026-04-28 18:57:07'),
(3, 'Congreso Argentino de Oftalmología 2026', 'Laboratorio Roche', 'Encuentro médico-científico de primer nivel con participación de especialistas y referentes del sector salud. Aroma a Café brindó un servicio continuo y de alta calidad, elevando la experiencia de los asistentes. ', 'Evento de gran relevancia dentro del ámbito médico-científico, el Congreso Argentino de Oftalmología 2026 reunió a especialistas, investigadores, profesionales de la salud y referentes de la industria farmacéutica en un espacio dedicado a la actualización, la innovación y el intercambio de conocimientos en salud visual.\r\nOrganizado en las instalaciones del Hotel Hilton Buenos Aires, en el exclusivo barrio de Puerto Madero, el evento se desarrolló durante los días 15, 16 y 17 de abril de 2026, ofreciendo un entorno moderno, confortable y altamente profesional para la realización de conferencias, simposios y actividades de networking.\r\nLaboratorios Roche participó como uno de los protagonistas del congreso, presentando avances, soluciones terapéuticas y propuestas innovadoras en el campo de la oftalmología, fortaleciendo su posicionamiento dentro del sector y generando vínculos estratégicos con la comunidad médica.\r\nEn este contexto, Aroma a Café acompañó el desarrollo del evento, brindando una experiencia premium a lo largo de toda la jornada. Se instalaron estaciones de café estratégicamente ubicadas, pensadas para facilitar el acceso de los asistentes durante los intervalos entre actividades, promoviendo espacios de encuentro, conversación y networking.\r\nLas máquinas, de última tecnología, garantizaron un servicio ágil, continuo y de alta calidad, ofreciendo una variedad de bebidas que se adaptaron a las preferencias de los participantes. De esta manera, contribuimos a elevar la experiencia general del evento, aportando comodidad, eficiencia y un valor diferencial en cada pausa.\r\n', '15, 16 y 17 de abril de 2026', 202604, 'Hotel Hilton, Puerto Madero', '200 ejecutivos', '/assets/images/roche/portada.jpg', '/assets/images/roche/portada.jpg', 1, '2025-10-23 14:14:02', '2026-04-28 18:57:07'),
(4, 'NotCo – La Rural 2022', 'Presentacion de la linea NotMenu', 'Evento gastronómico innovador enfocado en propuestas plant-based. Aroma a Café complementó la experiencia del stand con café premium, acompañando degustaciones y momentos de interacción.', 'Evento orientado a la innovación en gastronomía y consumo consciente, realizado los días 4 y 5 de mayo de 2022 en el predio de La Rural, uno de los espacios feriales más emblemáticos de la ciudad. La propuesta reunió a marcas, emprendedores y profesionales del sector alimenticio interesados en las nuevas tendencias, especialmente en el crecimiento de alternativas basadas en plantas y experiencias gastronómicas sustentables.\r\nDentro de este marco, el stand de NotCo se destacó por su enfoque innovador y su gran convocatoria. La marca presentó su línea “NotMenu”, orientada a cafeterías y espacios gastronómicos que buscan incorporar opciones plant-based sin resignar sabor ni calidad. Entre los productos protagonistas se encontraron el NotLatte —una alternativa vegetal al café con leche tradicional— junto con una variedad de pastelería elaborada a base de plantas, como cookies, brownies y budines, que generaron gran interés entre los asistentes.\r\nEl stand fue diseñado como un espacio dinámico y atractivo, donde los visitantes pudieron degustar los productos, conocer más sobre la propuesta de la marca y experimentar de primera mano la calidad de estas alternativas. La combinación de innovación, sabor y una estética moderna posicionó a NotCo como uno de los puntos más concurridos del evento.\r\nAcompañando esta experiencia, Aroma a Café estuvo presente, garantizando un flujo constante de bebidas calientes de alta calidad. La estación de café no solo complementó la propuesta gastronómica del stand, sino que también se convirtió en un punto clave de encuentro, favoreciendo la interacción entre los asistentes y potenciando la experiencia general del evento. La eficiencia del servicio, sumada a la calidad del café ofrecido, aportó un valor diferencial que elevó aún más la percepción del espacio.\r\n', '4 y 5 de Mayo,2022', 202205, 'Predio La Rural', '100 ejecutivos', '/assets/images/notco/portada.jpg', '/assets/images/notco/portada.jpg', 1, '2025-10-23 14:14:02', '2026-04-28 18:57:07'),
(5, 'Intersec Buenos Aires 2022\r\n', 'Stand de la Empresa Dahua Technology', 'Feria líder en seguridad y tecnología con demostraciones en vivo y alto tráfico de visitantes. Aroma a Café aportó un punto de encuentro clave dentro del stand, optimizando la experiencia del público.', 'Evento de referencia en la industria de la seguridad integral, Intersec Buenos Aires 2022 reunió a empresas, profesionales y especialistas en tecnologías de protección, videovigilancia, control de accesos y soluciones inteligentes. Desarrollado del 24 al 26 de agosto de 2022 en La Rural, el encuentro se consolidó como un espacio clave para la presentación de innovaciones, generación de negocios y actualización profesional dentro del sector.\r\nEntre los expositores más destacados se encontró Dahua Technology, uno de los líderes globales en soluciones de seguridad electrónica. Su stand captó gran atención por la demostración en vivo de tecnologías avanzadas, incluyendo sistemas de videovigilancia con inteligencia artificial, reconocimiento facial, monitoreo en tiempo real y soluciones integrales para ciudades inteligentes y entornos corporativos.\r\nEl espacio de Dahua fue concebido como una experiencia interactiva, donde los asistentes pudieron conocer en profundidad el funcionamiento de sus productos, participar de demostraciones técnicas y recibir asesoramiento personalizado por parte de especialistas. Este enfoque permitió generar un alto nivel de engagement, posicionando a la marca como uno de los puntos más visitados de la exposición.\r\nEn este contexto dinámico y de alta circulación, Aroma a Café aportó un valor diferencial dentro del stand, acompañando la experiencia de los visitantes. Nuestro servicio de café ofreció bebidas de calidad premium de forma continua, facilitando momentos de pausa y networking en un entorno profesional. La combinación de tecnología, atención y servicio eficiente contribuyó a mejorar la experiencia general del espacio, transformándolo en un punto de encuentro cómodo y atractivo para clientes y potenciales socios.\r\n', '24 al 26 de Agosto, 2022', 202208, 'Predio de La Rural', '1000+ visitantes', '/assets/images/intersec/portada.jpg', '/assets/images/intersec/portada.jpg', 1, '2025-10-23 14:14:02', '2026-04-28 18:57:07'),
(6, 'Raza Pampa 2022 ', 'Evento en La Rural', 'Evento corporativo de gran escala que reunió a destacadas empresas de diversos sectores, cada una con su propio stand para presentar servicios, generar contactos y fortalecer vínculos comerciales. Aroma a Café acompañó a Raza Pampa brindando servicio de café premium, creando espacios ideales para reuniones y networking. \r\n', 'Evento corporativo de gran escala realizado en noviembre de 2022 en La Rural, que reunió a importantes empresas de diversos sectores en un entorno diseñado para la exposición, el networking y la generación de oportunidades comerciales. Lejos de un enfoque tradicional, el evento se consolidó como una plataforma multisectorial donde cada compañía contó con su propio stand, presentando sus servicios, soluciones y propuestas de valor ante un público profesional y altamente segmentado.\r\nLa dinámica del evento estuvo centrada en la interacción directa entre marcas y asistentes, favoreciendo reuniones, demostraciones y espacios de intercambio que impulsaron vínculos estratégicos y संभावidades de negocio. La diversidad de rubros presentes —desde tecnología y servicios hasta consumo masivo y soluciones corporativas— aportó riqueza y dinamismo, convirtiendo al evento en un punto de encuentro clave para profesionales, empresarios y tomadores de decisión.\r\nLos stands, cuidadosamente diseñados, ofrecieron experiencias personalizadas, con presentaciones en vivo, asesoramiento comercial y propuestas innovadoras que captaron la atención del público. Este enfoque permitió maximizar la visibilidad de cada empresa y potenciar su posicionamiento dentro de un entorno altamente competitivo.\r\nEn este contexto de alto flujo y constante interacción, Aroma a Café formó parte del evento brindando su servicio  de café en el stand de  Raza Pampa. La estacion de café premium se convirtió en punto clave para reuniones informales, pausas activas y momentos de networking, acompañando la dinámica del evento de forma natural.\r\nGracias a un servicio ágil, continuo y de alta calidad, Aroma a Café aportó un valor diferencial, mejorando la experiencia general de expositores y visitantes. El café no solo funcionó como un complemento, sino como un facilitador de encuentros, contribuyendo a generar un ambiente más cómodo, profesional y propicio para el desarrollo de relaciones comerciales.\r\n', 'Noviembre, 2022', 202211, 'Predio La Rural', '+500 participantes', '/assets/images/raza/portada.jpg', '/assets/images/raza/portada.jpg', 1, '2025-10-23 14:14:02', '2026-04-28 18:57:07'),
(7, 'Camino Federal hacia la Cumbre ', 'Jornada en Legislatura CABA', 'Evento institucional previo a la Cumbre de Alcaldes C40, con foco en sostenibilidad y políticas urbanas. Aroma a Café aportó un servicio elegante y eficiente, acorde al nivel del encuentro. \r\n', 'Evento institucional de gran relevancia en la agenda climática y de gestión urbana, “Camino Federal hacia la Cumbre” se desarrolló en el imponente Palacio de la Legislatura de la Ciudad de Buenos Aires, específicamente en su elegante Hall de Honor, un espacio emblemático que aportó un marco solemne y representativo para el encuentro.\r\nEsta jornada formó parte de las actividades previas a la Cumbre Mundial de Alcaldes de C40 2022, realizada en Buenos Aires en octubre de 2022, y tuvo como objetivo reunir a referentes de distintas provincias, funcionarios, especialistas y actores clave para debatir y construir una agenda federal en torno al cambio climático, el desarrollo sostenible y las políticas públicas urbanas.\r\nEl evento se caracterizó por un alto nivel de participación institucional y técnica, con paneles de discusión, presentaciones y espacios de intercambio orientados a alinear estrategias entre gobiernos locales y potenciar el rol de las ciudades en la acción climática global. La diversidad de voces y la calidad de los contenidos posicionaron a esta jornada como un punto de partida fundamental hacia la cumbre internacional.\r\nEn este entorno formal y de gran convocatoria, el servicio de Aroma a Café se integró de manera armónica, aportando una experiencia de coffee break acorde al nivel del evento acompañando los momentos de pausa entre actividades, facilitando el networking y la interacción entre los asistentes.\r\nLa calidad del café, junto con un servicio ágil y discreto, permitió ofrecer una experiencia premium que complementó el carácter institucional del encuentro. De esta manera, Aroma a Café contribuyó a generar un ambiente más confortable y propicio para el diálogo, sumando un valor diferencial en un evento de alto perfil político y social. \r\n', 'Octubre, 2022', 202210, 'Legislatura de la Ciudad de Buenos Aires', '250 invitados', '/assets/images/legislatura/mesa1.jpg', '/assets/images/legislatura/mesa1.jpg', 1, '2025-10-23 14:14:02', '2026-04-28 18:57:07'),
(8, 'Casamiento – San Miguel del Monte \r\n', 'Evento Social', 'Celebración privada de la comunidad judía en un entorno natural y exclusivo. Aroma a Café acompañó con estaciones de café premium, sumando calidez y calidad a un momento especial. \r\n', 'Evento social de carácter privado, realizado el 30 de abril de 2022 en San Miguel del Monte, en el marco de la celebración de un casamiento perteneciente a la comunidad judía. La jornada se desarrolló en un entorno natural y exclusivo, ideal para este tipo de encuentros, donde la combinación de tradición, emoción y celebración dio lugar a una experiencia única para los novios y sus invitados.\r\nLa ceremonia y posterior festejo estuvieron marcados por los valores y costumbres propias de la cultura judía, integrando momentos simbólicos, música y una propuesta gastronómica especialmente cuidada. La ambientación del evento acompañó este espíritu, con detalles elegantes y una organización pensada para garantizar comodidad, fluidez y disfrute a lo largo de toda la jornada.\r\nEn este contexto, donde cada detalle resulta clave para lograr una experiencia memorable, Aroma a Café formó parte del evento brindando su servicio  de café. La estación fue instalada de manera estratégica para acompañar tanto la recepción como los momentos posteriores a la cena, ofreciendo a los invitados una propuesta de bebidas calientes de calidad premium.\r\nEl servicio se adaptó a la dinámica del evento, asegurando rapidez, eficiencia y una presentación acorde al nivel de la celebración. De esta manera, Aroma a Café aportó un valor diferencial, generando espacios de encuentro y distensión donde los invitados pudieron disfrutar de un excelente café, complementando una experiencia ya de por sí especial y significativa.\r\n', '30 de Abril, 2022', 202204, 'Salón de Gala', '200 invitados', '/assets/images/casamiento/portada.jpg', '/assets/images/casamiento/portada.jpg', 1, '2025-10-23 14:14:02', '2026-04-28 18:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `event_gallery`
--

DROP TABLE IF EXISTS `event_gallery`;
CREATE TABLE `event_gallery` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_gallery`
--

INSERT INTO `event_gallery` (`id`, `event_id`, `image_url`, `display_order`, `created_at`) VALUES
(1, 1, '/assets/images/laRural/caratula.jpg', 1, '2025-10-23 14:14:02'),
(2, 1, '/assets/images/laRural/larural.jpg', 2, '2025-10-23 14:14:02'),
(3, 1, '/assets/images/laRural/larural1.jpg', 3, '2025-10-23 14:14:02'),
(4, 1, '/assets/images/laRural/larural2.jpg', 4, '2025-10-23 14:14:02'),
(5, 2, '/assets/images/brubank/portada.jpg', 1, '2025-10-23 14:14:02'),
(6, 2, '/assets/images/brubank/cuadricula.jpg', 2, '2025-10-23 14:14:02'),
(7, 2, '/assets/images/brubank/ara.jpg', 3, '2025-10-23 14:14:02'),
(8, 2, '/assets/images/brubank/portada.jpg', 1, '2025-10-23 14:14:02'),
(9, 3, '/assets/images/roche/stand.jpg', 2, '2026-04-28 14:14:02'),
(10, 3, '/assets/images/roche/Marcemaquina.jpg', 3, '2026-04-28 14:14:02'),
(11, 3, '/assets/images/roche/fanny.jpg', 3, '2026-04-28 14:14:02'),
(12, 3, '/assets/images/roche/marcemaquina1.jpg', 2, '2026-04-28 14:14:02'),
(13, 4, '/assets/images/notco/portada.jpg', 3, '2026-04-28 14:14:02'),
(14, 4, '/assets/images/notco/chicas.jpg', 1, '2026-04-28 14:14:02'),
(15, 4, '/assets/images/notco/portada.jpg', 4, '2026-04-28 14:14:02'),
(16, 4, '/assets/images/notco/ara.jpg', 3, '2026-04-28 14:14:02'),
(17, 5, '/assets/images/intersec/portada.jpg', 1, '2026-04-28 14:14:02'),
(18, 5, '/assets/images/intersec/maquina1.jpg', 2, '2026-04-28 14:14:02'),
(19, 5, '/assets/images/intersec/fanny.jpg', 3, '2026-04-28 14:14:02'),
(20, 5, '/assets/images/intersec/maquina.jpg', 4, '2026-04-28 14:14:02'),
(21, 6, '/assets/images/raza/satnd.jpg', 1, '2026-04-28 14:14:02'),
(22, 6, '/assets/images/raza/satand1.jpg', 2, '2026-04-28 14:14:02'),
(23, 6, '/assets/images/raza/maquina.jpg', 3, '2026-04-28 14:14:02'),
(24, 6, '/assets/images/raza/maquina1.jpg', 4, '2026-04-28 14:14:02'),
(25, 7, '/assets/images/legislatura/mesa2.jpg', 1, '2026-04-28 14:14:02'),
(26, 7, '/assets/images/legislatura/mesa.jpg', 2, '2026-04-28 17:26:59'),
(27, 7, '/assets/images/legislatura/maquinas.jpg', 3, '2026-04-28 14:28:27'),
(28, 7, '/assets/images/legislatura/sirviendo.jpg', 4, '2026-04-28 17:30:38'),
(29, 8, '/assets/images/casamiento/preparando.jpg', 1, '2026-04-28 17:47:27'),
(30, 8, '/assets/images/casamiento/todolisto.jpg', 2, '2026-04-28 17:48:16'),
(31, 8, '/assets/images/casamiento/mesa.jpg', 3, '2026-04-28 17:48:56'),
(32, 8, '/assets/images/casamiento/fiesta.jpg', 4, '2026-04-28 17:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `event_services`
--

DROP TABLE IF EXISTS `event_services`;
CREATE TABLE `event_services` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_services`
--

INSERT INTO `event_services` (`id`, `event_id`, `service_name`, `display_order`, `created_at`) VALUES
(1, 1, 'Máquinas de café profesionales', 1, '2025-10-23 14:14:02'),
(2, 1, 'Baristas especializados', 2, '2025-10-23 14:14:02'),
(3, 1, 'Variedad de cápsulas premium', 3, '2025-10-23 14:14:02'),
(4, 1, 'Vajilla elegante', 4, '2025-10-23 14:14:02'),
(5, 1, 'Servicio personalizado', 5, '2025-10-23 14:14:02'),
(6, 1, 'Opciones sin lactosa', 6, '2025-10-23 14:14:02'),
(7, 1, 'Café descafeinado', 7, '2025-10-23 14:14:02'),
(8, 1, 'Atención durante 3 días completos', 8, '2025-10-23 14:14:02'),
(9, 2, 'Maquina de cafe profesionales', 1, '2025-10-23 14:14:02'),
(10, 2, 'Personal del Servicio', 2, '2025-10-23 14:14:02'),
(11, 2, 'Atención personalizada', 3, '2025-10-23 14:14:02'),
(12, 2, 'Múltiples opciones de café', 4, '2025-10-23 14:14:02'),
(13, 2, 'Vajilla de porcelana', 5, '2025-10-23 14:14:02'),
(14, 2, 'Atención durante 5 dias.', 6, '2025-10-23 14:14:02'),
(15, 5, 'Servicio de 3 dias completos', 7, '2026-04-28 14:14:02'),
(16, 3, 'Servicio exclusivo', 1, '2025-10-23 14:14:02'),
(17, 3, 'Café de especialidad', 2, '2025-10-23 14:14:02'),
(18, 3, 'Servicio con Personal', 3, '2026-04-28 14:14:02'),
(19, 3, 'Variedad de cápsulas premiun', 4, '2026-04-28 14:14:02'),
(20, 3, 'Vajilla descartable', 5, '2026-04-28 14:14:02'),
(21, 3, 'Atención durante 3 dias.', 6, '2026-04-28 14:14:02'),
(22, 4, 'Servicio discreto', 1, '2025-10-23 14:14:02'),
(23, 4, 'Café premium constante', 2, '2025-10-23 14:14:02'),
(24, 4, 'Atención personalizada', 3, '2025-10-23 14:14:02'),
(25, 4, 'Vajilla incluida', 4, '2026-04-28 14:14:02'),
(26, 4, 'Opciones variadas', 5, '2025-10-23 14:14:02'),
(27, 4, 'Servicio de 2 día completos', 6, '2026-04-28 14:14:02'),
(28, 5, 'Stand personalizado', 1, '2025-10-23 14:14:02'),
(29, 5, 'Vajilla de porcelana', 2, '2026-04-28 14:14:02'),
(30, 5, 'Multiples opciones de cafe', 3, '2026-04-28 14:14:02'),
(31, 5, 'Atención personalizada', 4, '2026-04-28 14:14:02'),
(32, 5, 'Máquinas profesionales', 5, '2026-04-28 14:14:02'),
(33, 5, 'Cápsulas premiun', 6, '2026-04-28 14:14:02'),
(34, 6, 'Servicio continuo', 1, '2025-10-23 14:14:02'),
(35, 6, 'Servicio con Personal', 2, '2026-04-28 14:14:02'),
(36, 6, 'Reabastecimiento constante', 3, '2025-10-23 14:14:02'),
(37, 6, 'Variedad de opciones', 4, '2025-10-23 14:14:02'),
(38, 6, 'Snacks complementarios', 5, '2025-10-23 14:14:02'),
(39, 6, 'Servicio de 3 días', 6, '2025-10-23 14:14:02'),
(40, 7, 'Máquinas profesionales', 1, '2026-04-28 14:14:02'),
(41, 7, 'Opciones saludables', 2, '2025-10-23 14:14:02'),
(42, 7, 'Vajillas de porcelana', 3, '2026-04-28 14:14:02'),
(43, 7, 'Atención personalizada', 4, '2026-04-28 14:14:02'),
(44, 7, 'Variedad premium', 5, '2025-10-23 14:14:02'),
(45, 7, 'Atención profesional', 6, '2025-10-23 14:14:02'),
(46, 8, 'Servicio Personalizado', 1, '2025-10-23 14:14:02'),
(47, 8, 'Café gourmet', 2, '2025-10-23 14:14:02'),
(48, 8, 'Multiples opciones de cafe', 3, '2026-04-28 14:14:02'),
(49, 8, 'Vajilla fina', 4, '2025-10-23 14:14:02'),
(50, 8, 'Presentación elegante', 5, '2025-10-23 14:14:02'),
(51, 8, 'Servicio durante todo el evento', 6, '2026-04-28 14:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `event_testimonials`
--

DROP TABLE IF EXISTS `event_testimonials`;
CREATE TABLE `event_testimonials` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `testimonial_text` text NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `author_position` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_testimonials`
--

INSERT INTO `event_testimonials` (`id`, `event_id`, `testimonial_text`, `author_name`, `author_position`, `created_at`) VALUES
(1, 1, 'El servicio de café fue excepcional. Los asistentes quedaron encantados con la calidad y la presentación. Definitivamente volveremos a trabajar con ellos en futuros eventos.', 'Dr. Carlos Mendoza', 'Director del Congreso SAC', '2025-10-23 14:14:02'),
(2, 8, 'Nuestros invitados no pararon de hablar del coffee bar. Fue un detalle que marcó la diferencia en nuestra boda.', 'María y Juan', 'Novios', '2025-10-23 14:14:02'),
(3, 3, 'El servicio de café elevó la experiencia del evento a otro nivel. Perfecto para nuestro lanzamiento.', 'Ana Rodríguez', 'Directora de Marketing', '2025-10-23 14:14:02'),
(4, 2, 'Profesionalismo impecable. El servicio fue exactamente lo que necesitábamos.', 'Roberto Sánchez', 'CEO', '2025-10-23 14:14:02'),
(5, 4, 'El stand de café fue uno de los más exitosos del evento. Gran calidad y excelente atención.', 'Laura Martínez', 'Organizadora de Eventos', '2026-04-28 14:14:02'),
(6, 7, 'Profesionalismo impecable. El servicio fue exactamente lo que necesitábamos. Excelente servicio.', 'Patricia González', 'Gerente de Recursos Humanos', '2025-10-23 14:14:02'),
(7, 5, 'El servicio de café añadió un toque especial a nuestro stand. Muy profesional.', 'Diego Fernández', 'Director de Operaciones', '2026-04-28 14:14:02'),
(8, 6, 'Un servicio impecable que complementó perfectamente nuestro stand. Muchas gracias por su apoyo.', 'Sofía Ramírez', 'Coordinadora de eventos de la empresa', '2025-10-23 14:14:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_is_active` (`is_active`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_event_yyyymm` (`event_yyyymm`);

--
-- Indexes for table `event_gallery`
--
ALTER TABLE `event_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_event_id` (`event_id`);

--
-- Indexes for table `event_services`
--
ALTER TABLE `event_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_event_id` (`event_id`);

--
-- Indexes for table `event_testimonials`
--
ALTER TABLE `event_testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_gallery`
--
ALTER TABLE `event_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `event_services`
--
ALTER TABLE `event_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `event_testimonials`
--
ALTER TABLE `event_testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_gallery`
--
ALTER TABLE `event_gallery`
  ADD CONSTRAINT `event_gallery_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_services`
--
ALTER TABLE `event_services`
  ADD CONSTRAINT `event_services_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_testimonials`
--
ALTER TABLE `event_testimonials`
  ADD CONSTRAINT `event_testimonials_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
