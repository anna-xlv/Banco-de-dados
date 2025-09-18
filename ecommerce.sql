-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/09/2025 às 04:18
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
-- Banco de dados: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Senha` varchar(50) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  `Endereco` varchar(150) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  `DataCadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nome`, `Email`, `Senha`, `CPF`, `Endereco`, `Cidade`, `Estado`, `CEP`, `DataCadastro`) VALUES
(1, 'Alice Fernandes', 'alice.fernandes@email.com', 'senhaAlice1', '123.456.789-01', 'Rua das Flores, 12', 'São Paulo', 'SP', '01010-010', '2025-01-10 09:15:00'),
(2, 'Bruno Santos', 'bruno.santos@email.com', 'senhaBruno2', '987.654.321-02', 'Av. Brasil, 45', 'Rio de Janeiro', 'RJ', '20020-020', '2025-01-12 14:30:00'),
(3, 'Carla Almeida', 'carla.almeida@email.com', 'senhaCarla3', '111.222.333-03', 'Rua do Sol, 78', 'Belo Horizonte', 'MG', '30130-030', '2025-01-15 11:45:00'),
(4, 'Daniel Oliveira', 'daniel.oliveira@email.com', 'senhaDaniel4', '444.555.666-04', 'Av. Central, 90', 'Curitiba', 'PR', '80040-040', '2025-01-18 08:20:00'),
(5, 'Elisa Costa', 'elisa.costa@email.com', 'senhaElisa5', '777.888.999-05', 'Rua Primavera, 22', 'Porto Alegre', 'RS', '90050-050', '2025-01-20 10:00:00'),
(6, 'Fernando Lima', 'fernando.lima@email.com', 'senhaFernando6', '222.333.444-06', 'Av. das Nações, 33', 'Fortaleza', 'CE', '60060-060', '2025-01-22 16:15:00'),
(7, 'Gabriela Rocha', 'gabriela.rocha@email.com', 'senhaGabriela7', '555.666.777-07', 'Rua Nova, 44', 'Salvador', 'BA', '40070-070', '2025-01-25 12:10:00'),
(8, 'Hugo Martins', 'hugo.martins@email.com', 'senhaHugo8', '888.999.000-08', 'Av. Oceano, 55', 'Recife', 'PE', '50080-080', '2025-01-28 15:45:00'),
(9, 'Isabela Nunes', 'isabela.nunes@email.com', 'senhaIsabela9', '333.444.555-09', 'Rua das Acácias, 66', 'Florianópolis', 'SC', '88090-090', '2025-01-30 09:50:00'),
(10, 'João Viana', 'joao.viana@email.com', 'senhaJoao10', '666.777.888-10', 'Av. da Paz, 77', 'Manaus', 'AM', '69010-100', '2025-02-02 14:05:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `ID_ItemPedido` int(11) NOT NULL,
  `ID_Pedido` int(11) DEFAULT NULL,
  `ID_Produto` int(11) DEFAULT NULL,
  `Quantidade` int(11) DEFAULT NULL,
  `PrecoUnitario` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itenspedido`
--

INSERT INTO `itenspedido` (`ID_ItemPedido`, `ID_Pedido`, `ID_Produto`, `Quantidade`, `PrecoUnitario`) VALUES
(1, 1, 1, 2, 59.9),
(2, 1, 5, 1, 199.9),
(3, 2, 2, 1, 49.9),
(4, 2, 6, 2, 219.9),
(5, 3, 3, 1, 129.9),
(6, 3, 9, 1, 39.9),
(7, 4, 4, 2, 79.9),
(8, 4, 7, 1, 249.9),
(9, 5, 8, 1, 89.9),
(10, 5, 10, 1, 99.9),
(11, 6, 1, 1, 59.9),
(12, 6, 3, 1, 129.9),
(13, 7, 2, 2, 49.9),
(14, 7, 5, 1, 199.9),
(15, 8, 6, 1, 219.9),
(16, 8, 8, 2, 89.9),
(17, 9, 7, 1, 249.9),
(18, 9, 9, 1, 39.9),
(19, 10, 4, 1, 79.9),
(20, 10, 10, 1, 99.9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `DataPedido` datetime DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `ValorTotal` double DEFAULT 0,
  `EnderecoEntrega` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`ID_Pedido`, `ID_Cliente`, `DataPedido`, `Status`, `ValorTotal`, `EnderecoEntrega`) VALUES
(1, 1, '2025-02-05 10:00:00', 'Entregue', 0, 'Rua das Flores, 12, São Paulo, SP'),
(2, 2, '2025-02-06 11:30:00', 'A Caminho', 0, 'Av. Brasil, 45, Rio de Janeiro, RJ'),
(3, 3, '2025-02-07 12:45:00', 'Processando', 0, 'Rua do Sol, 78, Belo Horizonte, MG'),
(4, 4, '2025-02-08 14:00:00', 'Entregue', 0, 'Av. Central, 90, Curitiba, PR'),
(5, 5, '2025-02-09 15:10:00', 'Pendente', 0, 'Rua Primavera, 22, Porto Alegre, RS'),
(6, 6, '2025-02-10 16:25:00', 'A Caminho', 0, 'Av. das Nações, 33, Fortaleza, CE'),
(7, 7, '2025-02-11 17:40:00', 'Processando', 0, 'Rua Nova, 44, Salvador, BA'),
(8, 8, '2025-02-12 18:50:00', 'Entregue', 0, 'Av. Oceano, 55, Recife, PE'),
(9, 9, '2025-02-13 09:05:00', 'Pendente', 0, 'Rua das Acácias, 66, Florianópolis, SC'),
(10, 10, '2025-02-14 10:15:00', 'A Caminho', 0, 'Av. da Paz, 77, Manaus, AM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_Produto` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Descricao` text DEFAULT NULL,
  `Preco` double DEFAULT NULL,
  `SKU` varchar(20) DEFAULT NULL,
  `Estoque` int(11) DEFAULT NULL,
  `DataCriacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`ID_Produto`, `Nome`, `Descricao`, `Preco`, `SKU`, `Estoque`, `DataCriacao`) VALUES
(1, 'Camiseta Preta G', 'Camiseta de algodão preta, tamanho G', 59.9, 'CAM-PT-G-01', 50, '2025-01-05 10:00:00'),
(2, 'Camiseta Branca M', 'Camiseta de algodão branca, tamanho M', 49.9, 'CAM-BR-M-02', 40, '2025-01-06 11:30:00'),
(3, 'Calça Jeans 42', 'Calça jeans feminina, tamanho 42', 129.9, 'CAL-JE-42-03', 30, '2025-01-07 12:45:00'),
(4, 'Calça Legging P', 'Legging esportiva tamanho P', 79.9, 'CAL-LE-P-04', 60, '2025-01-08 14:00:00'),
(5, 'Tênis Casual 40', 'Tênis casual unissex, tamanho 40', 199.9, 'TEN-CA-40-05', 25, '2025-01-09 15:10:00'),
(6, 'Tênis Corrida 41', 'Tênis para corrida, tamanho 41', 219.9, 'TEN-CO-41-06', 20, '2025-01-10 16:25:00'),
(7, 'Jaqueta Jeans M', 'Jaqueta jeans feminina tamanho M', 249.9, 'JAC-JE-M-07', 15, '2025-01-11 17:40:00'),
(8, 'Moletom Preto G', 'Moletom confortável tamanho G', 89.9, 'MOL-PT-G-08', 35, '2025-01-12 18:50:00'),
(9, 'Boné Azul', 'Boné unissex azul', 39.9, 'BON-AZ-09', 80, '2025-01-13 09:05:00'),
(10, 'Óculos de Sol', 'Óculos de sol unissex', 99.9, 'OCU-SO-10', 50, '2025-01-14 10:15:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Índices de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`ID_ItemPedido`),
  ADD KEY `ID_Pedido` (`ID_Pedido`),
  ADD KEY `ID_Produto` (`ID_Produto`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID_Produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `ID_ItemPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID_Produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD CONSTRAINT `itenspedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`),
  ADD CONSTRAINT `itenspedido_ibfk_2` FOREIGN KEY (`ID_Produto`) REFERENCES `produtos` (`ID_Produto`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
