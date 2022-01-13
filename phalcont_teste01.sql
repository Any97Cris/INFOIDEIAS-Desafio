-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13-Jan-2022 às 13:34
-- Versão do servidor: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phalcont_teste01`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `titulo`) VALUES
(1, 'Esporte'),
(2, 'Entretenimento '),
(3, 'Fofoca'),
(4, 'Cinema');

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) DEFAULT NULL,
  `texto` text,
  `data_ultima_atualizacao` datetime DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `publicado` tinyint(4) DEFAULT NULL,
  `data_publicacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `noticia`
--

INSERT INTO `noticia` (`id`, `titulo`, `texto`, `data_ultima_atualizacao`, `data_cadastro`, `categoria_id`, `publicado`, `data_publicacao`) VALUES
(32, 'Ginastica Artística', 'Apresentação Inédita', '2022-01-12 22:18:05', '2022-01-12 22:05:03', 2, NULL, NULL),
(33, 'Homem Aranha Sutado', 'Em breve', '2022-01-12 22:05:54', '2022-01-12 22:05:54', 4, NULL, NULL),
(34, 'Doutor Estranho', 'asdfghj', '2022-01-12 23:41:06', '2022-01-12 22:58:45', 4, 1, '2022-01-29'),
(35, 'Teste', '', '2022-01-12 23:10:34', '2022-01-12 23:10:34', 1, 1, '0000-00-00'),
(36, 'Teste10', '', '2022-01-12 23:11:04', '2022-01-12 23:11:04', 1, 0, '0000-00-00'),
(37, 'Teste11', '', '2022-01-12 23:12:12', '2022-01-12 23:12:12', 1, 1, NULL),
(38, 'Teste12', 'ghjklçpoi', '2022-01-12 23:14:44', '2022-01-12 23:14:44', 1, 1, '2022-01-13'),
(39, 'Teste30', 'ghnbbgtt', '2022-01-12 23:44:37', '2022-01-12 23:44:37', 1, 0, '0000-00-00'),
(40, 'Teste31', 'tbvfd', '2022-01-12 23:45:21', '2022-01-12 23:44:58', 1, 0, '2022-01-14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Teste', 'teste1@brasilbigdata.com.br', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
