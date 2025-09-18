-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/09/2025 às 03:51
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
-- Banco de dados: `locadora`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `carro_id` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `status_disponibilidade` enum('Disponível','Alugado') DEFAULT 'Disponível'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`carro_id`, `modelo`, `marca`, `placa`, `ano`, `status_disponibilidade`) VALUES
(1, 'Fiesta', 'Ford', 'ABC1234', 2018, 'Disponível'),
(2, 'Civic', 'Honda', 'XYZ5678', 2020, 'Disponível'),
(3, 'Corolla', 'Toyota', 'DEF2345', 2019, 'Disponível'),
(4, 'Uno', 'Fiat', 'GHI3456', 2017, 'Disponível'),
(5, 'Sandero', 'Renault', 'JKL4567', 2021, 'Disponível'),
(6, 'Gol', 'Volkswagen', 'MNO5678', 2016, 'Disponível'),
(7, 'Palio', 'Fiat', 'PQR6789', 2015, 'Disponível'),
(8, 'HB20', 'Hyundai', 'STU7890', 2022, 'Disponível'),
(9, 'Creta', 'Hyundai', 'VWX8901', 2020, 'Disponível'),
(10, 'Tracker', 'Chevrolet', 'YZA9012', 2021, 'Disponível');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `nome`, `cpf`, `telefone`, `email`, `endereco`) VALUES
(1, 'Ana Silva', '123.456.789-00', '11999999999', 'ana@email.com', 'Rua A, 123'),
(2, 'João Souza', '987.654.321-00', '11988888888', 'joao@email.com', 'Rua B, 456'),
(3, 'Maria Oliveira', '111.222.333-44', '11977777777', 'maria@email.com', 'Rua C, 789'),
(4, 'Carlos Pereira', '555.666.777-88', '11966666666', 'carlos@email.com', 'Rua D, 321'),
(5, 'Fernanda Lima', '999.888.777-66', '11955555555', 'fernanda@email.com', 'Rua E, 654'),
(6, 'Paulo Santos', '444.555.666-77', '11944444444', 'paulo@email.com', 'Rua F, 987'),
(7, 'Juliana Costa', '222.333.444-55', '11933333333', 'juliana@email.com', 'Rua G, 159'),
(8, 'Rafael Mendes', '777.888.999-00', '11922222222', 'rafael@email.com', 'Rua H, 753'),
(9, 'Beatriz Rocha', '333.444.555-66', '11911111111', 'beatriz@email.com', 'Rua I, 852'),
(10, 'Thiago Alves', '666.777.888-99', '11900000000', 'thiago@email.com', 'Rua J, 951');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `reserva_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `carro_id` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `data_devolucao` date NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reserva`
--

INSERT INTO `reserva` (`reserva_id`, `cliente_id`, `carro_id`, `data_reserva`, `data_devolucao`, `valor_total`) VALUES
(1, 1, 1, '2025-09-20', '2025-09-25', 500.00),
(2, 2, 2, '2025-09-22', '2025-09-28', 700.00),
(3, 3, 3, '2025-09-21', '2025-09-23', 400.00),
(4, 4, 4, '2025-09-24', '2025-09-26', 350.00),
(5, 5, 5, '2025-09-25', '2025-09-30', 600.00),
(6, 6, 6, '2025-09-27', '2025-10-01', 450.00),
(7, 7, 7, '2025-09-28', '2025-10-03', 500.00),
(8, 8, 8, '2025-09-29', '2025-10-04', 550.00),
(9, 9, 9, '2025-10-01', '2025-10-05', 650.00),
(10, 10, 10, '2025-10-02', '2025-10-06', 700.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`carro_id`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`reserva_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `carro_id` (`carro_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `carro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `reserva_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`carro_id`) REFERENCES `carro` (`carro_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
