-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Maio-2020 às 04:03
-- Versão do servidor: 10.4.10-MariaDB
-- versão do PHP: 7.1.33

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
  `atendente` int(11) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(2, 'Clínica Geral'),
(3, 'Nutricionista'),
(4, 'Urologista'),
(5, 'Oftalmologista');

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
(1, 'Drª Sarah Carvalho', 15626, 1),
(2, 'Drª Matheus Zelli', 13695, 2),
(3, 'Drª Paulo Viana', 84656, 3),
(4, 'Drª Sabrina Sato', 65426, 4),
(5, 'Drª Marcos Abreu', 84123, 5);

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
(14, '11930129704', 'Matheus', '179.565.828-22', '2000-02-18', '111', 'paulohenrique.viana@hotmail.com');

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
  MODIFY `idAgendamento` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de tabela `tbmedico`
--
ALTER TABLE `tbmedico`
  MODIFY `idMedico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbpaciente`
--
ALTER TABLE `tbpaciente`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
