USE dio_ecommerce;

START TRANSACTION;

SELECT P.nome_produto AS produto, F.nome_fornecedor AS fornecedor, E.quantidade
FROM produto AS P 
INNER JOIN produto_fornecedor AS pf ON pf.produto_id = P.id_produto
INNER JOIN fornecedor AS F ON F.id_fornecedor = pf.fornecedor_id
INNER JOIN produto_estoque AS pe ON pe.produto_id = P.id_produto
INNER JOIN estoque AS E ON E.id_estoque = pe.estoque_id
ORDER BY quantidade DESC;