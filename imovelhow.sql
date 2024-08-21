-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 21-Ago-2024 às 17:56
-- Versão do servidor: 8.3.0
-- versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imovelhow`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

DROP TABLE IF EXISTS `imovel`;
CREATE TABLE IF NOT EXISTS `imovel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao_imovel` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tipo_imovel_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_imovel_id` (`tipo_imovel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`id`, `descricao_imovel`, `tipo_imovel_id`) VALUES
(1, 'Apartamento 100 m2', 1),
(2, 'Terreno 500 m2', 2),
(3, 'Sala Comercial 50 m2', 3),
(4, 'Studio 40 m2', 4),
(5, 'Apartamento 80 m2', 1),
(6, 'Terreno 700 m2', 2),
(7, 'Sala Comercial 70 m2', 3),
(8, 'Studio 15 m2', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
CREATE TABLE IF NOT EXISTS `pagamento` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `data_do_pagamento` date NOT NULL,
  `valor_do_pagamento` decimal(10,2) NOT NULL,
  `codigo_imovel` int DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `codigo_imovel` (`codigo_imovel`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id_venda`, `data_do_pagamento`, `valor_do_pagamento`, `codigo_imovel`) VALUES
(1, '2023-03-10', 5000.00, 1),
(2, '2023-03-15', 7000.00, 2),
(3, '2023-03-20', 8000.00, 3),
(4, '2023-03-25', 9000.00, 4),
(5, '2023-03-30', 10000.00, 5),
(6, '2023-04-10', 5500.00, 1),
(7, '2023-04-15', 7500.00, 2),
(8, '2023-04-20', 8500.00, 3),
(9, '2023-04-25', 9500.00, 4),
(10, '2023-04-30', 10500.00, 6),
(11, '2023-05-10', 6000.00, 1),
(12, '2023-05-15', 8000.00, 2),
(13, '2023-05-20', 9000.00, 3),
(14, '2023-05-25', 10000.00, 4),
(15, '2023-05-30', 11000.00, 7),
(16, '2023-06-10', 6500.00, 1),
(17, '2023-06-15', 8500.00, 2),
(18, '2023-06-20', 9500.00, 3),
(19, '2023-06-25', 10500.00, 4),
(20, '2023-06-30', 11500.00, 8),
(21, '2023-07-10', 7000.00, 1),
(22, '2023-07-15', 9000.00, 2),
(23, '2023-07-20', 10000.00, 3),
(24, '2023-07-25', 11000.00, 4),
(25, '2023-07-30', 12000.00, 5),
(26, '2023-08-10', 7500.00, 6),
(27, '2023-08-15', 9500.00, 7),
(28, '2023-08-20', 10500.00, 8),
(29, '2023-08-25', 11500.00, 1),
(30, '2023-08-30', 12500.00, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_imovel`
--

DROP TABLE IF EXISTS `tipo_imovel`;
CREATE TABLE IF NOT EXISTS `tipo_imovel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao_tipo` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Extraindo dados da tabela `tipo_imovel`
--

INSERT INTO `tipo_imovel` (`id`, `descricao_tipo`) VALUES
(1, 'Apartamento'),
(2, 'Terreno'),
(3, 'Sala Comercial'),
(4, 'Studio');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
