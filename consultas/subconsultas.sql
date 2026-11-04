SELECT 
    idcliente AS 'ID',
    nome AS 'Nome do Cliente'
FROM clientes
WHERE idcliente IN (
    SELECT id_cliente 
    FROM pedidos
);

SELECT 
    idprodutos AS 'ID',
    nomeprodutos AS 'Nome do Produto'
FROM produtos pr
WHERE EXISTS (
    SELECT 1 
    FROM ItensPedido ip 
    WHERE ip.id_produto = pr.idprodutos
);
SELECT 
    idcliente AS 'ID',
    nome AS 'Nome do Cliente'
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1 
    FROM pedidos pd 
    WHERE pd.id_cliente = c.idcliente
);
