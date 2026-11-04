
-- ============================================
-- PROJETO: TECHSTORE
-- BANCO DE DADOS: MySQL
-- AUTOR: João Pedro
-- ============================================

CREATE DATABASE IF NOT EXISTS techstore;
USE techstore;

-- ============================================
-- 1. TABELA: CLIENTES
-- ============================================

CREATE TABLE Clientes (
    idcliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100)
);

-- ============================================
-- 2. TABELA: CATEGORIAS
-- ============================================

CREATE TABLE Categorias (
    idcategoria INT PRIMARY KEY,
    nomecategoria VARCHAR(100),
    descricao VARCHAR(100)
);

-- ============================================
-- 3. TABELA: PRODUTOS
-- ============================================

CREATE TABLE Produtos (
    idprodutos INT PRIMARY KEY,
    nomeprodutos VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
    idcategoria INT,
    FOREIGN KEY (idcategoria)
        REFERENCES Categorias(idcategoria)
);

-- ============================================
-- 4. TABELA: PEDIDOS
-- ============================================

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    status VARCHAR(50),
    FOREIGN KEY (id_cliente)
        REFERENCES Clientes(idcliente)
);

-- ============================================
-- 5. TABELA: ITENS DO PEDIDO
-- ============================================

CREATE TABLE ItensPedido (
    id_item INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido)
        REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto)
        REFERENCES Produtos(idprodutos)
);

-- ============================================
-- INSERTS: CLIENTES
-- ============================================

INSERT INTO Clientes VALUES
(1, 'Ana Souza', 'ana@email.com', 'São Paulo', 'SP'),
(2, 'Bruno Lima', 'bruno@email.com', 'Rio de Janeiro', 'RJ'),
(3, 'Carlos Dias', 'carlos@email.com', 'Belo Horizonte', 'MG'),
(4, 'Daniela Silva', 'daniela@email.com', 'Curitiba', 'PR'),
(5, 'Eduardo Costa', 'eduardo@email.com', 'Porto Alegre', 'RS'),
(6, 'Fernanda Alves', 'fernanda@email.com', 'Salvador', 'BA'),
(7, 'Gustavo Mendes', 'gustavo@email.com', 'Recife', 'PE'),
(8, 'Helena Rocha', 'helena@email.com', 'Fortaleza', 'CE'),
(9, 'Igor Santos', 'igor@email.com', 'Manaus', 'AM'),
(10, 'Julia Pires', 'julia@email.com', 'Brasília', 'DF');

-- ============================================
-- INSERTS: CATEGORIAS
-- ============================================

INSERT INTO Categorias VALUES
(1, 'Smartphones', 'Celulares e acessórios'),
(2, 'Informática', 'Computadores e periféricos'),
(3, 'Áudio e Vídeo', 'TVs, caixas de som e fones'),
(4, 'Eletrodomésticos', 'Itens para casa e cozinha');

-- ============================================
-- INSERTS: PRODUTOS
-- ============================================

INSERT INTO Produtos VALUES
(1, 'iPhone 13', 4500.00, 50, 1),
(2, 'Galaxy S22', 3800.50, 40, 1),
(3, 'Moto G52', 1200.00, 100, 1),
(4, 'Xiaomi Redmi Note 11', 1450.99, 80, 1),
(5, 'Notebook Dell Inspiron', 3500.00, 30, 2),
(6, 'MacBook Air M1', 7500.00, 20, 2),
(7, 'Mouse Sem Fio Logitech', 120.50, 150, 2),
(8, 'Teclado Mecânico', 350.75, 60, 2),
(9, 'Monitor LG 27"', 1100.00, 40, 2),
(10, 'Smart TV Samsung 55"', 2800.00, 25, 3),
(11, 'Fone de Ouvido JBL', 250.00, 200, 3),
(12, 'Soundbar Philips', 850.90, 35, 3),
(13, 'Micro-ondas Electrolux', 650.00, 45, 4),
(14, 'Geladeira Brastemp', 3200.10, 15, 4),
(15, 'Air Fryer Mondial', 450.30, 90, 4);

-- ============================================
-- INSERTS: PEDIDOS
-- ============================================

INSERT INTO Pedidos VALUES
(1, 1, '2023-10-01', 'Entregue'),
(2, 2, '2023-10-02', 'Enviado'),
(3, 3, '2023-10-03', 'Pendente'),
(4, 4, '2023-10-04', 'Entregue'),
(5, 5, '2023-10-05', 'Cancelado'),
(6, 6, '2023-10-06', 'Enviado'),
(7, 7, '2023-10-07', 'Pendente'),
(8, 8, '2023-10-08', 'Entregue'),
(9, 9, '2023-10-09', 'Em Processamento'),
(10, 10, '2023-10-10', 'Entregue');

-- ============================================
-- INSERTS: ITENS DOS PEDIDOS
-- ============================================

INSERT INTO ItensPedido VALUES
(1, 1, 1, 1, 4500.00),
(2, 1, 11, 2, 250.00),

(3, 2, 2, 1, 3800.50),
(4, 2, 7, 1, 120.50),

(5, 3, 5, 1, 3500.00),
(6, 3, 8, 1, 350.75),

(7, 4, 10, 1, 2800.00),
(8, 4, 12, 1, 850.90),
(9, 4, 3, 3, 1200.00),

(10, 5, 14, 1, 3200.10),
(11, 5, 13, 1, 650.00),

(12, 6, 6, 1, 7500.00),
(13, 6, 9, 2, 1100.00),

(14, 7, 4, 2, 1450.99),

(15, 8, 15, 1, 450.30),
(16, 8, 11, 3, 250.00),

(17, 9, 1, 1, 4500.00),
(18, 9, 7, 5, 120.50),

(19, 10, 5, 2, 3500.00);

-- ============================================
-- CONSULTAS DE TESTE
-- ============================================

-- Visualizar todos os clientes
SELECT * FROM Clientes;

-- Visualizar todos os produtos
SELECT * FROM Produtos;

-- Produtos com preço acima de R$ 500
SELECT * FROM Produtos
WHERE preco > 500;

-- Pedidos com seus respectivos clientes
SELECT
    Pedidos.id_pedido,
    Clientes.nome,
    Pedidos.data_pedido,
    Pedidos.status
FROM Pedidos
INNER JOIN Clientes
ON Pedidos.id_cliente = Clientes.idcliente;
