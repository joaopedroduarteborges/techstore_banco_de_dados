CREATE VIEW vw_relatorio_vendas AS
SELECT 
    pd.id_pedido AS 'Número do Pedido',
    c.nome AS 'Nome do Cliente',
    pr.nomeprodutos AS 'Nome do Produto',
    ip.quantidade AS 'Quantidade',
    ip.preco_unitario AS 'Preço Unitário',
    (ip.quantidade * ip.preco_unitario) AS 'Valor Total do Item'
FROM pedidos pd
INNER JOIN clientes c 
    ON pd.id_cliente = c.idcliente
INNER JOIN ItensPedido ip 
    ON pd.id_pedido = ip.id_pedido
INNER JOIN produtos pr 
    ON ip.id_produto = pr.idprodutos;
    
--consultas da view
SELECT * FROM vw_relatorio_vendas;

SELECT * 
FROM vw_relatorio_vendas
WHERE `Valor Total do Item` > 500.00;
