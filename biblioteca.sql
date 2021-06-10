-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Jun-2021 às 22:50
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `Id` int(11) NOT NULL,
  `DataEmprestimo` datetime(6) NOT NULL,
  `DataDevolucao` datetime(6) NOT NULL,
  `NomeUsuario` longtext DEFAULT NULL,
  `Telefone` longtext DEFAULT NULL,
  `Devolvido` tinyint(1) NOT NULL,
  `LivroId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `emprestimos`
--

INSERT INTO `emprestimos` (`Id`, `DataEmprestimo`, `DataDevolucao`, `NomeUsuario`, `Telefone`, `Devolvido`, `LivroId`) VALUES
(2, '2021-06-08 00:00:00.000000', '2021-06-09 00:00:00.000000', 'Lucas', '999999999', 0, 1),
(3, '2021-06-03 00:00:00.000000', '2021-06-07 00:00:00.000000', 'Ana', '888888888888', 0, 3),
(5, '2021-06-07 00:00:00.000000', '2021-06-11 00:00:00.000000', 'Rafael', '7777777777', 0, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `Id` int(11) NOT NULL,
  `Titulo` longtext DEFAULT NULL,
  `Autor` longtext DEFAULT NULL,
  `Ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`Id`, `Titulo`, `Autor`, `Ano`) VALUES
(1, 'Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 1997),
(2, 'A revolução dos bichos', 'George Orwell', 1945),
(3, 'O Senhor dos Anéis', 'J. R. R. Tolkien', 1954),
(4, 'Percy Jackson: O ladrão de raios', 'Rick Riordan', 2005),
(5, 'Harry Potter 2', 'J. K. Rowling', 2000),
(6, 'Harry Potter 3', 'J. K. Rowling', 2001),
(7, 'Harry Potter 4', 'J. K. Rowling', 2003),
(8, 'Harry Potter 5', 'J. K. Rowling', 2004),
(9, 'Harry Potter 6', 'J. K. Rowling', 2005),
(12, 'Harry Potter 9', 'J. K. Rowling', 2010),
(13, 'Harry Potter 11', 'J. K. Rowling', 2011);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Nome` longtext DEFAULT NULL,
  `login` longtext DEFAULT NULL,
  `senha` longtext DEFAULT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nome`, `login`, `senha`, `tipo`) VALUES
(1, 'Administrador', 'admin', '202cb962ac59075b964b07152d234b70', 0),
(3, 'lucas', 'lucasc', '827ccb0eea8a706c4c34a16891f84e7b', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20210608163956_CreateDatabase', '3.0.0'),
('20210610190743_CreateDatabas', '3.0.0');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Emprestimos_LivroId` (`LivroId`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `FK_Emprestimos_Livros_LivroId` FOREIGN KEY (`LivroId`) REFERENCES `livros` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
