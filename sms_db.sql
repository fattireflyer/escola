-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2022 at 01:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `usuario` varchar(127) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `primeiro_nome` varchar(127) NOT NULL,
  `ultimo_nome` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `usuario`, `senha`, `primeiro_nome`, `ultimo_nome`) VALUES
(1, 'elias', '$2y$10$H7obJEdmLzqqcPy7wQWhsOLUvrgzC8f1Y1or2Gxaza5z1PT0tvLy6', 'Elias', 'Abdurrahman');

-- --------------------------------------------------------

--
-- Table structure for table `notas`
--

CREATE TABLE `notas` (
  `nota_id` int(11) NOT NULL,
  `nota` varchar(31) NOT NULL,
  `nota_codigo` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notas`
--

INSERT INTO `notas` (`nota_id`, `nota`, `nota_codigo`) VALUES
(1, '1', 'G'),
(2, '2', 'G'),
(3, '1', 'KG'),
(4, '2', 'KG');

-- --------------------------------------------------------

--
-- Table structure for table `alunos`
--

CREATE TABLE `alunos` (
  `aluno_id` int(11) NOT NULL,
  `usuario` varchar(127) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `primeiro_nome` varchar(127) NOT NULL,
  `ultimo_nome` varchar(255) NOT NULL,
  `nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alunos`
--

INSERT INTO `alunos` (`aluno_id`, `usuario`, `senha`, `primeiro_nome`, `ultimo_nome`, `nota`) VALUES
(1, 'john', '$2y$10$H1kAwLWHZx8LvsXAHvLV2eVyE0yeKMlckyd.p8j1Zu5TQjReP7r4i', 'John', 'Doe', 2),
(3, 'abas', '$2y$10$KLFheMWgpLfoiqMuW2LQxOPficlBiSIJ9.wE2qr5yJUbAQ.5VURoO', 'Abas', 'A.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `disciplinas`
--

CREATE TABLE `disciplinas` (
  `disciplina_id` int(11) NOT NULL,
  `disciplina` varchar(31) NOT NULL,
  `disciplina_codigo` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disciplinas`
--

INSERT INTO `disciplinas` (`disciplina_id`, `disciplina`, `disciplina_codigo`) VALUES
(1, 'English', 'En'),
(2, 'Physics', 'Phy');

-- --------------------------------------------------------

--
-- Table structure for table `professores`
--

CREATE TABLE `professores` (
  `professor_id` int(11) NOT NULL,
  `usuario` varchar(127) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `primeiro_nome` varchar(127) NOT NULL,
  `ultimo_nome` varchar(127) NOT NULL,
  `disciplinas` varchar(31) NOT NULL,
  `notas` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professores`
--

INSERT INTO `professores` (`professor_id`, `usuario`, `senha`, `primeiro_nome`, `ultimo_nome`, `disciplinas`, `notas`) VALUES
(1, 'oliver', '$2y$10$FNAmnGXSWGIvRwW1j9iaDeomnHhku8a1LKlcO46I.6K/mEzQ2/Xi.', 'Oliver', 'Noah', '12', '12'),
(3, 'elias', '$2y$10$0jm9PjYYMixif6dEzG0waOm91jV8bwW8eeHpHehAHVYEIZnfPgzNO', 'Elias', 'A.', '12', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`nota_id`);

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`aluno_id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indexes for table `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`disciplina_id`);

--
-- Indexes for table `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`professor_id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `nota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `alunos`
--
ALTER TABLE `alunos`
  MODIFY `aluno_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `disciplina_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `professores`
--
ALTER TABLE `professores`
  MODIFY `professor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
