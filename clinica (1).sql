-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/09/2025 às 18:48
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `id_paciente`, `id_medico`, `data_hora`, `observacoes`) VALUES
(1, 1, 1, '2025-10-21 09:00:00', 'Consulta urológica para investigação de sintomas urinários'),
(2, 2, 4, '2025-10-22 10:30:00', 'Consulta cardiológica para acompanhamento de hipertensão arterial'),
(3, 3, 5, '2025-10-23 11:15:00', 'Consulta endocrinológica para controle de tireoidite de Hashimoto'),
(4, 4, 6, '2025-10-24 14:00:00', 'Consulta pediátrica para avaliação do crescimento e desenvolvimento infantil'),
(5, 5, 8, '2025-10-25 15:45:00', 'Consulta gastroenterológica para investigação de gastrite'),
(6, 6, 9, '2025-10-26 16:30:00', 'Consulta reumatológica para tratamento de artrite reumatoide'),
(7, 7, 10, '2025-10-27 08:15:00', 'Consulta urológica para acompanhamento de hiperplasia prostática benigna'),
(8, 8, 11, '2025-10-28 09:45:00', 'Consulta otorrinolaringológica para tratamento de sinusite crônica'),
(9, 9, 12, '2025-10-29 10:00:00', 'Consulta hematológica para acompanhamento de anemia ferropriva'),
(10, 10, 13, '2025-10-30 11:30:00', 'Consulta psiquiátrica para tratamento de depressão'),
(11, 3, 1, '2025-11-01 13:00:00', 'Consulta para tratamento de incontinência urinária'),
(12, 5, 4, '2025-11-02 14:30:00', 'Consulta para avaliação de arritmia cardíaca'),
(13, 7, 5, '2025-11-03 15:00:00', 'Consulta para ajuste de insulina em paciente diabético');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `crm` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`id`, `nome`, `especialidade`, `telefone`, `crm`) VALUES
(1, 'Dr. Jacinto pinto', 'Urologista', '0800-7790', 'CRM3666'),
(4, 'Dra. Deide Costa', 'Cardiologista', '0800-0069', 'CRM0000'),
(5, 'Dra. Paula Tegando', 'Endocrinologista', '0800-0090', 'CRM3999'),
(6, 'Dr. Alan Bido', 'Pediatra', '0800-9999', 'CRM6969'),
(8, 'Dr. Roberto Carlos', 'Gastroenterologista', '0800-701234', 'CRM7012'),
(9, 'Dra. Patrícia Souza', 'Reumatologista', '0800-805678', 'CRM8056'),
(10, 'Dr. André Luiz', 'Urologista', '0800-909101', 'CRM9091'),
(11, 'Dra. Mariana Rocha', 'Otorrinolaringologista', '0800-102345', 'CRM1023'),
(12, 'Dr. Lucas Almeida', 'Hematologista', '0800-203456', 'CRM2034'),
(13, 'Dra. Camila Oliveira', 'Psiquiatra', '0800-304567', 'CRM3045');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `data_nascimento`, `telefone`, `endereco`, `cep`, `email`) VALUES
(1, 'João Silva', '1990-05-12', '9990- 9090', 'Rua das Monções, 34', '12345-250', 'joao@gmail.com'),
(2, 'Maria Fernanda', '1985-09-22', '9876-5678', 'Avenida Paulista, 1000', '01310-100', 'maria.fernanda@yahoo.com'),
(3, 'Carlos Eduardo', '1978-12-04', '9789-1234', 'Rua da Consolação, 543', '01301-000', 'carloseduardo@gmail.com'),
(4, 'Ana Beatriz', '1992-03-15', '9654-3210', 'Rua Oscar Freire, 1234', '05409-011', 'ana.beatriz@hotmail.com'),
(5, 'Fernando Lima', '1980-07-30', '9531-8642', 'Rua Augusta, 789', '01305-000', 'fernando.lima@outlook.com'),
(6, 'Gabriel Rocha', '1995-01-18', '9420-7531', 'Rua Xavier de Toledo, 234', '01018-010', 'gabriel.rocha@gmail.com'),
(7, 'Isabela Marques', '1987-11-25', '9312-6453', 'Rua Pamplona, 1456', '01405-001', 'isabela.marques@yahoo.com'),
(8, 'Rafael Alves', '1976-06-08', '9210-4321', 'Rua Bela Cintra, 765', '01415-000', 'rafael.alves@hotmail.com'),
(9, 'Juliana Barbosa', '1983-04-27', '9123-9876', 'Rua Oscar Freire, 2345', '05409-012', 'juliana.barbosa@gmail.com'),
(10, 'Pedro Henrique', '1998-02-14', '9012-3456', 'Rua Augusta, 1234', '01305-001', 'pedro.henrique@outlook.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
