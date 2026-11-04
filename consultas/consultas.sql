SELECT 
    pd.id_pedido AS 'Número do Pedido',
    c.nome AS 'Nome do Cliente',
    pd.data_pedido AS 'Data do Pedido',
    pr.nomeprodutos AS 'Nome do Produto',
    ip.quantidade AS 'Quantidade Comprada',
    ip.preco_unitario AS 'Preço Unitário',
    (ip.quantidade * ip.preco_unitario) AS 'Valor Total do Item'
FROM pedidos pd
INNER JOIN clientes c 
    ON pd.id_cliente = c.idcliente
INNER JOIN ItensPedido ip 
    ON pd.id_pedido = ip.id_pedido
INNER JOIN produtos pr 
    ON ip.id_produto = pr.idprodutos;

SELECT 
    c.nome AS 'Nome do Cliente',
    COUNT(DISTINCT pd.id_pedido) AS 'Quantidade de Pedidos',
    SUM(ip.quantidade * ip.preco_unitario) AS 'Valor Total Gasto'
FROM clientes c
INNER JOIN pedidos pd 
    ON c.idcliente = pd.id_cliente
INNER JOIN ItensPedido ip 
    ON pd.id_pedido = ip.id_pedido
GROUP BY c.idcliente, c.nome;

SELECT 
    ->     pr.nomeprodutos AS 'Nome do Produto',
    ->     SUM(ip.quantidade) AS 'Quantidade Total Vendida'
    -> FROM produtos pr
    -> INNER JOIN ItensPedido ip 
    ->     ON pr.idprodutos = ip.id_produto
    -> GROUP BY pr.idprodutos, pr.nomeprodutos
    -> ORDER BY SUM(ip.quantidade) DESC;

SELECT 
    c.nome AS 'Nome do Cliente',
    SUM(ip.quantidade * ip.preco_unitario) AS 'Valor Total Gasto'
FROM clientes c
INNER JOIN pedidos pd 
    ON c.idcliente = pd.id_cliente
INNER JOIN ItensPedido ip 
    ON pd.id_pedido = ip.id_pedido
GROUP BY c.idcliente, c.nome
HAVING SUM(ip.quantidade * ip.preco_unitario) > 1000.00
ORDER BY 'Valor Total Gasto' DESC;

SELECT 
    nomeprodutos AS 'Nome do Produto',
    preco AS 'Preço do Produto'
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos)
ORDER BY preco DESC;
