-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/11/2025 às 18:08
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

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
-- Estrutura para tabela `acervo`
--

CREATE TABLE `acervo` (
  `id_acervo` int(11) NOT NULL,
  `titulo1` varchar(100) DEFAULT NULL,
  `titulo2` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `outros` varchar(100) DEFAULT NULL,
  `edicao` varchar(50) DEFAULT NULL,
  `tipoAcervo` varchar(50) DEFAULT NULL,
  `anoEdicao` varchar(50) DEFAULT NULL,
  `origem` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `numTombo` int(10) DEFAULT NULL,
  `id_clientes` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_editora` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `acervo`
--

INSERT INTO `acervo` (`id_acervo`, `titulo1`, `titulo2`, `autor`, `outros`, `edicao`, `tipoAcervo`, `anoEdicao`, `origem`, `categoria`, `numTombo`, `id_clientes`, `id_categoria`, `id_editora`) VALUES
(1, 'O Mundo de Sofia', 'Romance da história da filosofia', 'Jostein Gaarder', 'Não há', '5ª', 'Acadêmico', '1995', 'Companhia das Letras', 'Filsofia', 120076101, 1, 1, 1),
(2, 'A Noite das Bruxas', 'Não há', 'Agatha Christie', 'Não há', '3ª', 'Entreterimento', '2014', 'L&PM', 'Suspense', 120076102, 2, 2, 2),
(3, 'A Hipótese do Amor', 'Não há', 'Ali Hazelwood', 'Não há', '1ª', 'Entreterimento', '2022', 'Editora arqueiro', 'Romance', 120076103, 3, 3, 3),
(4, 'Colapso', 'Não há', 'Roberto Denser', 'Não há', '1ª', 'Entreterimento', '2023', 'Darkside books', 'Terror', 120076104, 4, 4, 4),
(5, 'Física 1: Mecânica', 'Não há', 'Gref - Grupo de Reelaboração do Ensino de Física', 'Não há', '7ª', 'Acadêmico', '2024', 'Edusp', 'Ciência', 120076105, 5, 5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `acervoautor`
--

CREATE TABLE `acervoautor` (
  `id_acervoAutor` int(11) NOT NULL,
  `id_acervo` int(11) DEFAULT NULL,
  `id_autor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `acervoautor`
--

INSERT INTO `acervoautor` (`id_acervoAutor`, `id_acervo`, `id_autor`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `numAutor` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autor`
--

INSERT INTO `autor` (`id_autor`, `nome`, `numAutor`) VALUES
(1, 'Agatha Christie', 11),
(2, 'José de Alencar', 12),
(3, 'Machado de Assis', 13),
(4, 'Conceição Evaristo', 14),
(5, 'Clarice Lispector', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `bibi`
--

CREATE TABLE `bibi` (
  `id_bibi` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `CEP` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `multa` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `descricao`) VALUES
(1, 'Romance'),
(2, 'Suspense'),
(3, 'Terror psicológico'),
(4, 'Ação'),
(5, 'Ficção científica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  `situacao` varchar(100) DEFAULT NULL,
  `codCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `nome`, `endereco`, `cidade`, `telefone`, `observacao`, `situacao`, `codCliente`) VALUES
(1, 'Giulia Domingues', 'Rua do Girasol, 134', 'Votorantim-SP', '(15) 9991-4527', 'Não há', 'Não há atrasos, devolutivas em bom estado e cliente assídua', 4018),
(2, 'Gabriela Prado', 'Rua das vinheiras, 862', 'Sorocaba-SP', '(15) 98223-761', 'Não há', 'Não há atrasos, devolutivas em bom estado e cliente assídua', 4007),
(3, 'Anna Lara Guido', 'Rua das Mariposas, 303', 'Sorocaba-SP', '(15) 99023-711', 'Cuidado com os bilhetes da caixinha', 'Não há atrasos e devolutivas em bom estado', 4023),
(4, 'Beatrice Williams', 'Rua Oliva, 015', 'Votorantim-SP', '(15) 99167-329', 'Não deixar levar nenhuma namorada para os fundos da biblioteca', 'Apenas 1 atraso, sem rasura e cliente assídua', 4001),
(5, 'Ethan Kaneko', 'Rua Lima, 129', 'Sorocaba-SP', '(15) 91023-232', 'Não há', 'Não há atrasos, devolutivas em bom estado e cliente assíduo', 4033);

-- --------------------------------------------------------

--
-- Estrutura para tabela `editora`
--

CREATE TABLE `editora` (
  `id_editora` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `editora`
--

INSERT INTO `editora` (`id_editora`, `descricao`, `telefone`) VALUES
(1, 'Grande editora caracterizada pela versatilidade de gêneros publicados', '(11) 99997-222'),
(2, 'Editora híbrida caracterizada pela alta qualidade do marketing', '(22) 22133-545'),
(3, 'Editora acadêmica', '(92) 98808-424'),
(4, 'Editora especializada em praparação de texto, gestão de direitos autorais e produção', '(64) 24808-755'),
(5, 'Editora média que está começando a ganhar destaque no mercado', '(45) 43450-998');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `id_emprestimo` int(11) NOT NULL,
  `dataEmp` date DEFAULT NULL,
  `dataEnt` date DEFAULT NULL,
  `numTombo` int(10) DEFAULT NULL,
  `id_clientes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimo`
--

INSERT INTO `emprestimo` (`id_emprestimo`, `dataEmp`, `dataEnt`, `numTombo`, `id_clientes`) VALUES
(1, '2025-03-17', '2025-03-24', 120076101, 1),
(2, '2025-06-02', '2025-06-09', 120076102, 2),
(3, '2025-01-29', '2025-02-05', 120076103, 3),
(4, '2025-08-11', '2025-08-18', 120076104, 4),
(5, '2025-09-10', '2025-09-17', 120076105, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `codigo` int(7) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `codigo`, `nome`, `tipo`, `telefone`, `login`, `senha`) VALUES
(1, 1, 'Giulia Domingues', 'Aparece com frequência e prefere livros de romance', '(15) 54350-554', 'GiuGiu', 'senha123'),
(2, 2, 'Gabriela Prado', 'Aparece com frequência e prefere livros de suspens', '(15) 32405-341', 'BagAyu', 'GAb!34@'),
(3, 3, 'Anna Lara Guido', 'Aparece com pouca frequência', '(11) 42443-568', 'AnnaLara', 'pAQ231'),
(4, 4, 'Beatrice Williams', 'Aparece todo dia', '(78) 54234-335', 'Bea.M.Williams', 'Sqc@567!!'),
(5, 5, 'Ethan Kaneko', 'Aparece com de vez em quando', '(93) 12313-123', 'KanekoEthan', 'AfD21J');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acervo`
--
ALTER TABLE `acervo`
  ADD PRIMARY KEY (`id_acervo`),
  ADD KEY `id_clientes` (`id_clientes`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_editora` (`id_editora`);

--
-- Índices de tabela `acervoautor`
--
ALTER TABLE `acervoautor`
  ADD PRIMARY KEY (`id_acervoAutor`),
  ADD KEY `id_acervo` (`id_acervo`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices de tabela `bibi`
--
ALTER TABLE `bibi`
  ADD PRIMARY KEY (`id_bibi`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`);

--
-- Índices de tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id_editora`);

--
-- Índices de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`id_emprestimo`),
  ADD KEY `id_clientes` (`id_clientes`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `acervo`
--
ALTER TABLE `acervo`
  ADD CONSTRAINT `acervo_ibfk_1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`),
  ADD CONSTRAINT `acervo_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `acervo_ibfk_3` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id_editora`);

--
-- Restrições para tabelas `acervoautor`
--
ALTER TABLE `acervoautor`
  ADD CONSTRAINT `acervoautor_ibfk_1` FOREIGN KEY (`id_acervo`) REFERENCES `acervo` (`id_acervo`),
  ADD CONSTRAINT `acervoautor_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`);

--
-- Restrições para tabelas `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
