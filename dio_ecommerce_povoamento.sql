USE dio_ecommerce;

INSERT INTO cliente (cpf, data_compra) VALUES ("355.756.815-64", "2005/02/02"), ("929.204.292-05", "2005/09/02"), ("261.633.463-19", 
"2008/01/02"), ("150.309.328-01", "2005/03/01"), ("297.778.702-05", "2009/01/27");

INSERT INTO entrega (status, codigo) VALUES (1, "2767016651"), (1, "1616239792"), (0, "1494490703"), (1, "2027443464"), 
(0, "1908509290");

INSERT INTO estoque (local) VALUES ("Rua Henrique Marques, SP"), ("Rua Manoel Domingues, PI"), ("Rua Tupi, SP"), ("Rua Dois, SE"), 
("Rua aniceto varejão, PE");

INSERT INTO formapagamento (pagamento) VALUES ("débito"), ("boleto"), ("pix"), ("crédito");

INSERT INTO fornecedor (nome_fornecedor, cnpj) VALUES ("Benedito e João Vidros Ltda", "62.998.586/0001-82"), ("Márcia e Priscila Informática Ltda",
"86.079.332/0001-29"), ("Aparecida e Daniela Marketing Ltda", "70.071.590/0001-29");

INSERT INTO pedido (endereco, cliente_id, entrega_id) VALUES ("Passagem Josefa Banha, AP", 1, 1), ("Rua Um, PA", 2, 4), 
("Rua Manoel Joaquim Ribeiro, PE", 3, 2), ("Rua Deão Farias, PE", 4, 5), ("Rua da Laranjeira, MA", 5, 3);

INSERT INTO vendedor (nome_vendedor) VALUES ("Carlos Eduardo da Silva"), ("Luis Felipe Carneiro"); 

INSERT INTO pedido_formapagamento (pedido_id, formaPagamento_id) VALUES (1, 4), (2, 1), (3, 3), (4, 2), (5, 4);

INSERT INTO produto (nome_produto) VALUES ("mesa-centro"), ("janela"), ("computador"), ("camiseta"), ("telefone/celular");

INSERT INTO produto_estoque (quantidade, produto_id, estoque_id) VALUES (10, 1, 5), (7, 4, 2), (6, 5, 4), (3, 3, 1), 
(4, 2, 1);

INSERT INTO produto_fornecedor (fornecedor_id, produto_id) VALUES (1, 1), (2, 3), (3, 4), (1, 2), (2, 5);

INSERT INTO produto_pedido (produto_id, pedido_id) VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

INSERT INTO produto_vendedor (produto_id, vendedor_id) VALUES (1, 1), (2, 1), (3, 2), (4, 1), (5, 2);

SELECT*FROM cliente;

SELECT*FROM pedido WHERE endereco LIKE "%PE";

SELECT*FROM cliente ORDER BY data_compra;

SELECT p.nome_produto, f.nome_fornecedor FROM produto AS p 
INNER JOIN produto_fornecedor AS pf ON p.id_produto = pf.produto_id
INNER JOIN fornecedor AS f ON pf.fornecedor_id = f.id_fornecedor 
GROUP BY nome_produto 
HAVING COUNT(nome_fornecedor) > 1;

SELECT c.cpf AS Cliente, p.endereco AS Endereço FROM cliente AS c
INNER JOIN pedido AS p ON c.id_cliente = p.cliente_id; 