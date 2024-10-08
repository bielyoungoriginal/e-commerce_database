USE dio_ecommerce;

START TRANSACTION;

SELECT P.nome_produto AS produto, F.nome_fornecedor AS fornecedor, E.quantidade
FROM produto AS P 
INNER JOIN produto_fornecedor AS pf ON pf.produto_id = P.id_produto
INNER JOIN fornecedor AS F ON F.id_fornecedor = pf.fornecedor_id
INNER JOIN produto_estoque AS pe ON pe.produto_id = P.id_produto
INNER JOIN estoque AS E ON E.id_estoque = pe.estoque_id
ORDER BY quantidade DESC;

rollback;
commit;

DELIMITER $$
CREATE PROCEDURE option_menu (opcao INT)
BEGIN
IF opcao = 1 THEN 
start transaction;
select P.nome_produto as produto, F.nome_fornecedor as fornecedor
from produto as P
inner join produto_fornecedor as pf on pf.produto_id=P.id_produto
inner join fornecedor as F on F.id_fornecedor=pf.fornecedor_id;
rollback;
commit;
ELSE IF opcao = 2 THEN 
start transaction;
select p.nome_produto as produto, v.nome_vendedor as vendedor
from produto as p
inner join produto_vendedor as pv on pv.produto_id=p.id_produto
inner join vendedor as v on v.id_vendedor=pv.vendedor_id;
ELSE select 'não compreendido pelo sistema';
END IF;
END $$ 
