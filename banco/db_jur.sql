-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 09-Abr-2019 às 18:15
-- Versão do servidor: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_jur`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscaContrato` (IN `numero_contrato` INT)  BEGIN
SELECT * FROM CONTRATO WHERE NUMERO_CONTRATO = numero_contrato;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscaDescSetor` (IN `id_setor` INT)  BEGIN
	SELECT DESC_SETOR FROM SETOR WHERE ID_SETOR = id_setor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscaLog` (IN `id_log` INT(11))  BEGIN
 SELECT * FROM TIPO_LOG WHERE ID_TIPO_LOG = id_log;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscaTipoAcesso` (IN `id_tipo_acesso` INT)  BEGIN
 SELECT DESC_TIPO_ACESSO FROM TIPO_ACESSO WHERE ID_TIPO_ACESSO = id_tipo_acesso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarLogin` (IN `login` VARCHAR(20))  BEGIN
SELECT * FROM LOGIN WHERE USUARIO_LOGIN = login;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aditamentos`
--

CREATE TABLE `aditamentos` (
  `ID_ADITAMENTO` int(11) NOT NULL,
  `ID_ATUAL_CONTRATO_ADITAMENTO` int(11) DEFAULT NULL,
  `DATA_ADITAMENTO` date DEFAULT NULL,
  `NUMERO_ADITAMENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aviso_contrato`
--

CREATE TABLE `aviso_contrato` (
  `ID_AVISO` int(11) NOT NULL,
  `DESC_AVISO` varchar(45) NOT NULL,
  `DATA_AVISO` date NOT NULL,
  `ID_CONTRATO_AVISO` int(11) NOT NULL,
  `ID_TIPO_AVISO` int(11) NOT NULL,
  `ID_STATUS_AVISO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE `contrato` (
  `ID_CONTRATO` int(11) NOT NULL,
  `NUMERO_CONTRATO` int(11) NOT NULL,
  `CONTRATANTE_CONTRATO` varchar(80) DEFAULT NULL,
  `CONTRATADO_CONTRATO` varchar(80) DEFAULT NULL,
  `CONCORRENCIA_CONTRATO` varchar(45) DEFAULT NULL,
  `ID_OBJETO_CONTRATO` int(11) DEFAULT NULL,
  `VALOR_CONTRATO` varchar(100) DEFAULT NULL,
  `QUANTIDADE_PARCELAS_CONTRATO` int(11) DEFAULT NULL,
  `VALOR_DAS_PARCELAS_CONTRATO` int(11) DEFAULT NULL,
  `QUANTIDADE_PARCELAS_PAGAS_CONTRATO` int(11) DEFAULT NULL,
  `DATA_PAGAMENTO_DAS_PARCELAS_CONTRATO` date DEFAULT NULL,
  `VALOR_TOTAL_PAGO_CONTRATO` int(11) DEFAULT NULL,
  `INICIO_VIGENCIA_CONTRATO` date DEFAULT NULL,
  `FINAL_VIGENCIA_CONTRATO` date DEFAULT NULL,
  `VENCIMENTO_CONTRATO` date DEFAULT NULL,
  `ID_GARANTIA_CONTRATO` int(11) DEFAULT NULL,
  `ID_ADITAMENTO_CONTRATO` int(11) DEFAULT NULL,
  `ID_LOGIN_CONTRATO` int(11) DEFAULT NULL,
  `ID_FINALIZACAO_CONTRATO` int(11) DEFAULT NULL,
  `ID_TIPO_CONTRATO` int(11) DEFAULT NULL,
  `ID_STATUS_GARANTIA_CONTRATO` int(11) DEFAULT NULL,
  `ID_OBSERVACOES_EXIGENCIAS_CONTRATO` int(11) DEFAULT NULL,
  `URL_IMAGEM_CONTRATO` varchar(100) DEFAULT NULL,
  `ID_EMPRESA_CONTRATO` int(11) DEFAULT NULL,
  `ID_POSSUI_PARCELA_CONTRATO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contrato`
--

INSERT INTO `contrato` (`ID_CONTRATO`, `NUMERO_CONTRATO`, `CONTRATANTE_CONTRATO`, `CONTRATADO_CONTRATO`, `CONCORRENCIA_CONTRATO`, `ID_OBJETO_CONTRATO`, `VALOR_CONTRATO`, `QUANTIDADE_PARCELAS_CONTRATO`, `VALOR_DAS_PARCELAS_CONTRATO`, `QUANTIDADE_PARCELAS_PAGAS_CONTRATO`, `DATA_PAGAMENTO_DAS_PARCELAS_CONTRATO`, `VALOR_TOTAL_PAGO_CONTRATO`, `INICIO_VIGENCIA_CONTRATO`, `FINAL_VIGENCIA_CONTRATO`, `VENCIMENTO_CONTRATO`, `ID_GARANTIA_CONTRATO`, `ID_ADITAMENTO_CONTRATO`, `ID_LOGIN_CONTRATO`, `ID_FINALIZACAO_CONTRATO`, `ID_TIPO_CONTRATO`, `ID_STATUS_GARANTIA_CONTRATO`, `ID_OBSERVACOES_EXIGENCIAS_CONTRATO`, `URL_IMAGEM_CONTRATO`, `ID_EMPRESA_CONTRATO`, `ID_POSSUI_PARCELA_CONTRATO`) VALUES
(96, 123, 'BENFICA BARUERI TRANSPORTE LTDA', 'RALIP TRANSPORTE E TURISMO LTD', 'Contrato Privado BENFICA BBTT', 8, '680.000,00', NULL, NULL, NULL, NULL, NULL, '1990-06-05', '1990-06-05', '1990-06-05', 15, NULL, 1, NULL, 2, 1, 6, '4243f94d135c4eee03d2e7c4135b43caadc9d629', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa_contrato`
--

CREATE TABLE `empresa_contrato` (
  `ID_EMPRESA_CONTRATO` int(11) NOT NULL,
  `DESC_EMPRESA_CONTRATO` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `empresa_contrato`
--

INSERT INTO `empresa_contrato` (`ID_EMPRESA_CONTRATO`, `DESC_EMPRESA_CONTRATO`) VALUES
(1, 'BENFICA BARUERI TRANSPORTE E TURISMO LTDA'),
(2, 'RALIP TRANSPORTE E TURISMO LTDA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `finalizacao_contrato`
--

CREATE TABLE `finalizacao_contrato` (
  `ID_FINALIZACAO_CONTRATO` int(11) NOT NULL,
  `DESC_FINALIZACAO_CONTRATO` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `finalizacao_contrato`
--

INSERT INTO `finalizacao_contrato` (`ID_FINALIZACAO_CONTRATO`, `DESC_FINALIZACAO_CONTRATO`) VALUES
(1, 'SIM'),
(2, 'NAO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `garantia`
--

CREATE TABLE `garantia` (
  `ID_GARANTIA` int(11) NOT NULL,
  `DESC_GARANTIA` varchar(2000) NOT NULL,
  `ID_CONTRATO_GARANTIA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `garantia`
--

INSERT INTO `garantia` (`ID_GARANTIA`, `DESC_GARANTIA`, `ID_CONTRATO_GARANTIA`) VALUES
(15, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 96);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `ID_LOG` int(11) NOT NULL,
  `ID_TIPO_LOG` int(11) NOT NULL,
  `DATA_LOG` date NOT NULL,
  `HORA_LOG` time NOT NULL,
  `ID_LOGIN_LOG` int(11) NOT NULL,
  `IP_LOG` varchar(45) NOT NULL,
  `MAC_ADDRESS_LOG` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `ID_LOGIN` int(11) NOT NULL,
  `ID_USUARIO_LOGIN` int(11) NOT NULL,
  `USUARIO_LOGIN` varchar(20) NOT NULL,
  `SENHA_LOGIN` varchar(60) NOT NULL,
  `ID_TIPO_ACESSO_LOGIN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`ID_LOGIN`, `ID_USUARIO_LOGIN`, `USUARIO_LOGIN`, `SENHA_LOGIN`, `ID_TIPO_ACESSO_LOGIN`) VALUES
(1, 1, 'jrubens', '123', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `objeto`
--

CREATE TABLE `objeto` (
  `ID_OBJETO` int(11) NOT NULL,
  `DESC_OBJETO` varchar(2000) NOT NULL,
  `ID_CONTRATO_OBJETO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `objeto`
--

INSERT INTO `objeto` (`ID_OBJETO`, `DESC_OBJETO`, `ID_CONTRATO_OBJETO`) VALUES
(8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 96),
(9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 96);

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes_exigencias`
--

CREATE TABLE `observacoes_exigencias` (
  `ID_OBSERVACOES_EXIGENCIAS` int(11) NOT NULL,
  `DESC_OBSER_EXIGEN` varchar(2000) NOT NULL,
  `ID_CONTRATO_OBSERVACOES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `observacoes_exigencias`
--

INSERT INTO `observacoes_exigencias` (`ID_OBSERVACOES_EXIGENCIAS`, `DESC_OBSER_EXIGEN`, `ID_CONTRATO_OBSERVACOES`) VALUES
(6, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 96),
(7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 96),
(8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 96),
(9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 96);

-- --------------------------------------------------------

--
-- Estrutura da tabela `possui_parcela`
--

CREATE TABLE `possui_parcela` (
  `ID_POSSUI_PARCELA` int(11) NOT NULL,
  `DESC_POSSUI PARCELA` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `possui_parcela`
--

INSERT INTO `possui_parcela` (`ID_POSSUI_PARCELA`, `DESC_POSSUI PARCELA`) VALUES
(1, 'SIM'),
(2, 'NÃO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `setor`
--

CREATE TABLE `setor` (
  `ID_SETOR` int(11) NOT NULL,
  `DESC_SETOR` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `setor`
--

INSERT INTO `setor` (`ID_SETOR`, `DESC_SETOR`) VALUES
(1, 'JURIDICO'),
(2, 'DIRETORIA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_aditamento`
--

CREATE TABLE `status_aditamento` (
  `ID_STATUS_ADITAMENTO` int(11) NOT NULL,
  `DESC_STATUS_ADITAMENTO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `status_aditamento`
--

INSERT INTO `status_aditamento` (`ID_STATUS_ADITAMENTO`, `DESC_STATUS_ADITAMENTO`) VALUES
(1, 'SIM'),
(2, 'NAO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_aviso`
--

CREATE TABLE `status_aviso` (
  `ID_STATUS_AVISO` int(11) NOT NULL,
  `DESC_STATUS_AVISO` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `status_aviso`
--

INSERT INTO `status_aviso` (`ID_STATUS_AVISO`, `DESC_STATUS_AVISO`) VALUES
(1, 'ABERTO'),
(2, 'FECHADO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_garantia`
--

CREATE TABLE `status_garantia` (
  `ID_STATUS_GARANTIA` int(11) NOT NULL,
  `DESC_STATUS_GARANTIA` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `status_garantia`
--

INSERT INTO `status_garantia` (`ID_STATUS_GARANTIA`, `DESC_STATUS_GARANTIA`) VALUES
(1, 'SIM'),
(2, 'NAO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_acesso`
--

CREATE TABLE `tipo_acesso` (
  `ID_TIPO_ACESSO` int(11) NOT NULL,
  `DESC_TIPO_ACESSO` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_acesso`
--

INSERT INTO `tipo_acesso` (`ID_TIPO_ACESSO`, `DESC_TIPO_ACESSO`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'MODERADOR'),
(3, 'COMUM'),
(4, 'INATIVO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_aviso`
--

CREATE TABLE `tipo_aviso` (
  `ID_TIPO_AVISO` int(11) NOT NULL,
  `DESC_TIPO_AVISO` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_aviso`
--

INSERT INTO `tipo_aviso` (`ID_TIPO_AVISO`, `DESC_TIPO_AVISO`) VALUES
(1, 'CONTRATO A VENCER'),
(2, 'CONTRATO VENCIDO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_contrato`
--

CREATE TABLE `tipo_contrato` (
  `ID_TIPO_CONTRATO` int(11) NOT NULL,
  `DESC_TIPO_CONTRATO` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_contrato`
--

INSERT INTO `tipo_contrato` (`ID_TIPO_CONTRATO`, `DESC_TIPO_CONTRATO`) VALUES
(1, 'PUBLICO'),
(2, 'PRIVADO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_log`
--

CREATE TABLE `tipo_log` (
  `ID_TIPO_LOG` int(11) NOT NULL,
  `DESC_TIPO_LOG` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_log`
--

INSERT INTO `tipo_log` (`ID_TIPO_LOG`, `DESC_TIPO_LOG`) VALUES
(1, 'CADASTRO USUÁRIO'),
(2, 'CADASTRO CONTRATO'),
(3, 'REDEFINIR SENHA'),
(4, 'ALTERAR USUÁRIO'),
(5, 'ALTERAR CONTRATO'),
(6, 'INATIVAR USUÁRIO'),
(7, 'CONSULTAR USUÁRIO'),
(8, 'CONSULTAR CONTRATO'),
(9, 'GERAR RELATÓRIO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOME_USUARIO` varchar(45) NOT NULL,
  `EMAIL_USUARIO` varchar(120) NOT NULL,
  `ID_SETOR_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `NOME_USUARIO`, `EMAIL_USUARIO`, `ID_SETOR_USUARIO`) VALUES
(1, 'Rubens', 'jose.rubens@benficabbtt.com.br', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aditamentos`
--
ALTER TABLE `aditamentos`
  ADD PRIMARY KEY (`ID_ADITAMENTO`),
  ADD KEY `KEY_ATUALCONTRATO_ADITAMENTO_idx` (`ID_ATUAL_CONTRATO_ADITAMENTO`);

--
-- Indexes for table `aviso_contrato`
--
ALTER TABLE `aviso_contrato`
  ADD PRIMARY KEY (`ID_AVISO`),
  ADD KEY `KEY_CONTRATO_AVISO_idx` (`ID_CONTRATO_AVISO`),
  ADD KEY `KEY_TIPOAVISO_AVISO_idx` (`ID_TIPO_AVISO`),
  ADD KEY `KEY_STATUSAVISO_AVISO_idx` (`ID_STATUS_AVISO`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`ID_CONTRATO`),
  ADD KEY `KEY_ID_STATUS_GARANTIA_idx` (`ID_STATUS_GARANTIA_CONTRATO`),
  ADD KEY `KEY_ID_GARANTIA_idx` (`ID_GARANTIA_CONTRATO`),
  ADD KEY `KEY_ID_ADITAMENTO_idx` (`ID_ADITAMENTO_CONTRATO`),
  ADD KEY `KEY_ID_LOGIN_idx` (`ID_LOGIN_CONTRATO`),
  ADD KEY `KEY_ID_FINALIZACAO_CONTRATO_idx` (`ID_FINALIZACAO_CONTRATO`),
  ADD KEY `ID_TIPO_CONTRATO_idx` (`ID_TIPO_CONTRATO`),
  ADD KEY `KEY_ID_OBSERVACOES_EXIGENCIAS_idx` (`ID_OBSERVACOES_EXIGENCIAS_CONTRATO`),
  ADD KEY `KEY_OBJETO_CONTRATO_idx` (`ID_OBJETO_CONTRATO`),
  ADD KEY `KEY_ID_EMPRESA_CONTRATO_idx` (`ID_EMPRESA_CONTRATO`),
  ADD KEY `KEY_ID_POSSUI_PARCELA_CONTRATO_idx` (`ID_POSSUI_PARCELA_CONTRATO`);

--
-- Indexes for table `empresa_contrato`
--
ALTER TABLE `empresa_contrato`
  ADD PRIMARY KEY (`ID_EMPRESA_CONTRATO`);

--
-- Indexes for table `finalizacao_contrato`
--
ALTER TABLE `finalizacao_contrato`
  ADD PRIMARY KEY (`ID_FINALIZACAO_CONTRATO`);

--
-- Indexes for table `garantia`
--
ALTER TABLE `garantia`
  ADD PRIMARY KEY (`ID_GARANTIA`),
  ADD KEY `KEY_CONTRATO_GARANTIA_idx` (`ID_CONTRATO_GARANTIA`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`ID_LOG`),
  ADD KEY `ID_LOGIN_LOG_idx` (`ID_LOGIN_LOG`),
  ADD KEY `KEY_TIPOLOG_LOG_idx` (`ID_TIPO_LOG`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID_LOGIN`),
  ADD KEY `KEY_USUARIO_LOGIN_idx` (`ID_USUARIO_LOGIN`),
  ADD KEY `KEY_TIPO_ACESSO_LOGIN_idx` (`ID_TIPO_ACESSO_LOGIN`);

--
-- Indexes for table `objeto`
--
ALTER TABLE `objeto`
  ADD PRIMARY KEY (`ID_OBJETO`),
  ADD KEY `KEY_CONTRATO_OBJETO_idx` (`ID_CONTRATO_OBJETO`);

--
-- Indexes for table `observacoes_exigencias`
--
ALTER TABLE `observacoes_exigencias`
  ADD PRIMARY KEY (`ID_OBSERVACOES_EXIGENCIAS`),
  ADD KEY `KEY_CONTRATO_OBSERVACOES_idx` (`ID_CONTRATO_OBSERVACOES`);

--
-- Indexes for table `possui_parcela`
--
ALTER TABLE `possui_parcela`
  ADD PRIMARY KEY (`ID_POSSUI_PARCELA`);

--
-- Indexes for table `setor`
--
ALTER TABLE `setor`
  ADD PRIMARY KEY (`ID_SETOR`);

--
-- Indexes for table `status_aditamento`
--
ALTER TABLE `status_aditamento`
  ADD PRIMARY KEY (`ID_STATUS_ADITAMENTO`);

--
-- Indexes for table `status_aviso`
--
ALTER TABLE `status_aviso`
  ADD PRIMARY KEY (`ID_STATUS_AVISO`);

--
-- Indexes for table `status_garantia`
--
ALTER TABLE `status_garantia`
  ADD PRIMARY KEY (`ID_STATUS_GARANTIA`);

--
-- Indexes for table `tipo_acesso`
--
ALTER TABLE `tipo_acesso`
  ADD PRIMARY KEY (`ID_TIPO_ACESSO`);

--
-- Indexes for table `tipo_aviso`
--
ALTER TABLE `tipo_aviso`
  ADD PRIMARY KEY (`ID_TIPO_AVISO`);

--
-- Indexes for table `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  ADD PRIMARY KEY (`ID_TIPO_CONTRATO`);

--
-- Indexes for table `tipo_log`
--
ALTER TABLE `tipo_log`
  ADD PRIMARY KEY (`ID_TIPO_LOG`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `KEY_SETOR_USUARIO_idx` (`ID_SETOR_USUARIO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aditamentos`
--
ALTER TABLE `aditamentos`
  MODIFY `ID_ADITAMENTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aviso_contrato`
--
ALTER TABLE `aviso_contrato`
  MODIFY `ID_AVISO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `ID_CONTRATO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `empresa_contrato`
--
ALTER TABLE `empresa_contrato`
  MODIFY `ID_EMPRESA_CONTRATO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `finalizacao_contrato`
--
ALTER TABLE `finalizacao_contrato`
  MODIFY `ID_FINALIZACAO_CONTRATO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `garantia`
--
ALTER TABLE `garantia`
  MODIFY `ID_GARANTIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `ID_LOG` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `ID_LOGIN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `objeto`
--
ALTER TABLE `objeto`
  MODIFY `ID_OBJETO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `observacoes_exigencias`
--
ALTER TABLE `observacoes_exigencias`
  MODIFY `ID_OBSERVACOES_EXIGENCIAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `possui_parcela`
--
ALTER TABLE `possui_parcela`
  MODIFY `ID_POSSUI_PARCELA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `setor`
--
ALTER TABLE `setor`
  MODIFY `ID_SETOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_aditamento`
--
ALTER TABLE `status_aditamento`
  MODIFY `ID_STATUS_ADITAMENTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_aviso`
--
ALTER TABLE `status_aviso`
  MODIFY `ID_STATUS_AVISO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_garantia`
--
ALTER TABLE `status_garantia`
  MODIFY `ID_STATUS_GARANTIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipo_acesso`
--
ALTER TABLE `tipo_acesso`
  MODIFY `ID_TIPO_ACESSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipo_aviso`
--
ALTER TABLE `tipo_aviso`
  MODIFY `ID_TIPO_AVISO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  MODIFY `ID_TIPO_CONTRATO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipo_log`
--
ALTER TABLE `tipo_log`
  MODIFY `ID_TIPO_LOG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aditamentos`
--
ALTER TABLE `aditamentos`
  ADD CONSTRAINT `KEY_ATUALCONTRATO_ADITAMENTO` FOREIGN KEY (`ID_ATUAL_CONTRATO_ADITAMENTO`) REFERENCES `contrato` (`ID_CONTRATO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `aviso_contrato`
--
ALTER TABLE `aviso_contrato`
  ADD CONSTRAINT `KEY_CONTRATO_AVISO` FOREIGN KEY (`ID_CONTRATO_AVISO`) REFERENCES `contrato` (`ID_CONTRATO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_STATUSAVISO_AVISO` FOREIGN KEY (`ID_STATUS_AVISO`) REFERENCES `status_aviso` (`ID_STATUS_AVISO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_TIPOAVISO_AVISO` FOREIGN KEY (`ID_TIPO_AVISO`) REFERENCES `tipo_aviso` (`ID_TIPO_AVISO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `KEY_ID_ADITAMENTO` FOREIGN KEY (`ID_ADITAMENTO_CONTRATO`) REFERENCES `aditamentos` (`ID_ADITAMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_ID_EMPRESA_CONTRATO` FOREIGN KEY (`ID_EMPRESA_CONTRATO`) REFERENCES `empresa_contrato` (`ID_EMPRESA_CONTRATO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_ID_FINALIZACAO_CONTRATO` FOREIGN KEY (`ID_FINALIZACAO_CONTRATO`) REFERENCES `finalizacao_contrato` (`ID_FINALIZACAO_CONTRATO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_ID_GARANTIA` FOREIGN KEY (`ID_GARANTIA_CONTRATO`) REFERENCES `garantia` (`ID_GARANTIA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_ID_LOGIN` FOREIGN KEY (`ID_LOGIN_CONTRATO`) REFERENCES `login` (`ID_LOGIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_ID_OBSERVACOES_EXIGENCIAS` FOREIGN KEY (`ID_OBSERVACOES_EXIGENCIAS_CONTRATO`) REFERENCES `observacoes_exigencias` (`ID_OBSERVACOES_EXIGENCIAS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_ID_POSSUI_PARCELA_CONTRATO` FOREIGN KEY (`ID_POSSUI_PARCELA_CONTRATO`) REFERENCES `possui_parcela` (`ID_POSSUI_PARCELA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_ID_STATUS_GARANTIA` FOREIGN KEY (`ID_STATUS_GARANTIA_CONTRATO`) REFERENCES `status_garantia` (`ID_STATUS_GARANTIA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_ID_TIPO_CONTRATO` FOREIGN KEY (`ID_TIPO_CONTRATO`) REFERENCES `tipo_contrato` (`ID_TIPO_CONTRATO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_OBJETO_CONTRATO` FOREIGN KEY (`ID_OBJETO_CONTRATO`) REFERENCES `objeto` (`ID_OBJETO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `garantia`
--
ALTER TABLE `garantia`
  ADD CONSTRAINT `KEY_CONTRATO_GARANTIA` FOREIGN KEY (`ID_CONTRATO_GARANTIA`) REFERENCES `contrato` (`ID_CONTRATO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `KEY_LOGIN_LOG` FOREIGN KEY (`ID_LOGIN_LOG`) REFERENCES `login` (`ID_LOGIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_TIPOLOG_LOG` FOREIGN KEY (`ID_TIPO_LOG`) REFERENCES `tipo_log` (`ID_TIPO_LOG`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `KEY_TIPO_ACESSO_LOGIN` FOREIGN KEY (`ID_TIPO_ACESSO_LOGIN`) REFERENCES `tipo_acesso` (`ID_TIPO_ACESSO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `KEY_USUARIO_LOGIN` FOREIGN KEY (`ID_USUARIO_LOGIN`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `objeto`
--
ALTER TABLE `objeto`
  ADD CONSTRAINT `KEY_CONTRATO_OBJETO` FOREIGN KEY (`ID_CONTRATO_OBJETO`) REFERENCES `contrato` (`ID_CONTRATO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `observacoes_exigencias`
--
ALTER TABLE `observacoes_exigencias`
  ADD CONSTRAINT `KEY_CONTRATO_OBSERVACOES` FOREIGN KEY (`ID_CONTRATO_OBSERVACOES`) REFERENCES `contrato` (`ID_CONTRATO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `KEY_SETOR_USUARIO` FOREIGN KEY (`ID_SETOR_USUARIO`) REFERENCES `setor` (`ID_SETOR`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
