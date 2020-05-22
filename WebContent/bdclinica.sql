-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Maio-2020 às 03:38
-- Versão do servidor: 10.3.15-MariaDB
-- versão do PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdclinica`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbagendamento`
--

CREATE TABLE `tbagendamento` (
  `idAgendamento` int(11) NOT NULL,
  `data` date NOT NULL,
  `medico` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `horario` varchar(10) NOT NULL,
  `diagnostico` varchar(300) DEFAULT NULL,
  `prescricao` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbagendamento`
--

INSERT INTO `tbagendamento` (`idAgendamento`, `data`, `medico`, `paciente`, `status`, `horario`, `diagnostico`, `prescricao`) VALUES
(1, '2020-05-20', 3, 1, 'A', '11:00', NULL, NULL),
(2, '2020-05-21', 2, 1, 'A', '12:00', NULL, NULL),
(3, '2020-05-22', 0, 15, 'A', '1', '', ''),
(4, '2020-05-22', 0, 15, 'A', '1', '', ''),
(5, '2020-05-23', 1, 15, 'A', '14:30', '', ''),
(6, '2020-05-23', 1, 15, 'A', '10:00', '', ''),
(7, '2020-05-24', 1, 15, 'A', '18:00', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbatendente`
--

CREATE TABLE `tbatendente` (
  `idAtendente` int(11) NOT NULL,
  `idPessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbconsulta`
--

CREATE TABLE `tbconsulta` (
  `idConsulta` int(11) NOT NULL,
  `idAgendamento` int(11) NOT NULL,
  `diagnostico` text NOT NULL,
  `prescricao` text NOT NULL,
  `diasAtestado` int(11) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbespecialidade`
--

CREATE TABLE `tbespecialidade` (
  `idEspecialidade` int(11) NOT NULL,
  `nomeEspecialidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbespecialidade`
--

INSERT INTO `tbespecialidade` (`idEspecialidade`, `nomeEspecialidade`) VALUES
(1, 'Dermatologista'),
(2, 'ClÃ­nica Geral'),
(3, 'Nutricionista'),
(4, 'Urologista'),
(5, 'Oftalmologista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbhorario`
--

CREATE TABLE `tbhorario` (
  `idHorario` int(11) NOT NULL,
  `horario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbhorario`
--

INSERT INTO `tbhorario` (`idHorario`, `horario`) VALUES
(1, '10:00'),
(2, '10:30'),
(3, '11:00'),
(4, '11:30'),
(5, '12:00'),
(6, '12:30'),
(7, '13:00'),
(8, '13:30'),
(9, '14:00'),
(10, '14:30'),
(11, '15:00'),
(12, '15:30'),
(13, '16:00'),
(14, '16:30'),
(15, '17:00'),
(16, '17:30'),
(17, '18:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmedico`
--

CREATE TABLE `tbmedico` (
  `idMedico` int(11) NOT NULL,
  `nomeMedico` varchar(200) NOT NULL,
  `crm` int(11) NOT NULL,
  `idEspecialidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbmedico`
--

INSERT INTO `tbmedico` (`idMedico`, `nomeMedico`, `crm`, `idEspecialidade`) VALUES
(1, 'DrÂª Sarah Carvalho', 15626, 1),
(2, 'DrÂª Matheus Zelli', 13695, 2),
(3, 'DrÂª Paulo Viana', 84656, 3),
(4, 'DrÂª Sabrina Sato', 65426, 4),
(5, 'DrÂª Marcos Abreu', 84123, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpaciente`
--

CREATE TABLE `tbpaciente` (
  `idPaciente` int(11) NOT NULL,
  `telContato` varchar(30) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `dataNasc` date NOT NULL,
  `senha` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbpaciente`
--

INSERT INTO `tbpaciente` (`idPaciente`, `telContato`, `nome`, `cpf`, `dataNasc`, `senha`, `email`) VALUES
(1, '11930129704', 'Paulo Henrique Alves Viana', '488.647.198-65', '2000-10-18', '12345', 'paulohenrique.viana@hotmail.com'),
(14, '11930129704', 'Matheus', '179.565.828-22', '2000-02-18', '111', 'paulohenrique.viana@hotmail.com'),
(15, '11966003501', 'Sarah Cardoso', '483.562.918-36', '2000-10-17', '171000', 'sarahccardoso@hotmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbagendamento`
--
ALTER TABLE `tbagendamento`
  ADD PRIMARY KEY (`idAgendamento`);

--
-- Índices para tabela `tbatendente`
--
ALTER TABLE `tbatendente`
  ADD PRIMARY KEY (`idAtendente`),
  ADD KEY `idPessoa` (`idPessoa`);

--
-- Índices para tabela `tbconsulta`
--
ALTER TABLE `tbconsulta`
  ADD PRIMARY KEY (`idConsulta`),
  ADD KEY `idAgendamento` (`idAgendamento`);

--
-- Índices para tabela `tbespecialidade`
--
ALTER TABLE `tbespecialidade`
  ADD PRIMARY KEY (`idEspecialidade`);

--
-- Índices para tabela `tbhorario`
--
ALTER TABLE `tbhorario`
  ADD PRIMARY KEY (`idHorario`);

--
-- Índices para tabela `tbmedico`
--
ALTER TABLE `tbmedico`
  ADD PRIMARY KEY (`idMedico`),
  ADD KEY `idPessoa` (`nomeMedico`);

--
-- Índices para tabela `tbpaciente`
--
ALTER TABLE `tbpaciente`
  ADD PRIMARY KEY (`idPaciente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbagendamento`
--
ALTER TABLE `tbagendamento`
  MODIFY `idAgendamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tbatendente`
--
ALTER TABLE `tbatendente`
  MODIFY `idAtendente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbconsulta`
--
ALTER TABLE `tbconsulta`
  MODIFY `idConsulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbespecialidade`
--
ALTER TABLE `tbespecialidade`
  MODIFY `idEspecialidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbhorario`
--
ALTER TABLE `tbhorario`
  MODIFY `idHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `tbmedico`
--
ALTER TABLE `tbmedico`
  MODIFY `idMedico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbpaciente`
--
ALTER TABLE `tbpaciente`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
