DROP DATABASE IF EXISTS dio_ecommerce;
CREATE DATABASE dio_ecommerce;

USE dio_ecommerce;

CREATE TABLE produto (
id_produto INT AUTO_INCREMENT,
nome_produto VARCHAR(45),
PRIMARY KEY (id_produto)
);

CREATE TABLE cliente (
id_cliente INT AUTO_INCREMENT,
cpf VARCHAR(21),
data_compra DATE,
PRIMARY KEY (id_cliente)
);

CREATE TABLE entrega (
id_entrega INT AUTO_INCREMENT,
status BOOLEAN,
codigo CHar(10),
PRIMARY KEY (id_entrega)
);

CREATE TABLE pedido (
id_pedido INT AUTO_INCREMENT,
endereco VARCHAR(45),
cliente_id INT,
entrega_id INT,
PRIMARY KEY (id_pedido),
FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
FOREIGN KEY (entrega_id) REFERENCES entrega(id_entrega)
);

CREATE TABLE formaPagamento (
id_formaPagamento INT AUTO_INCREMENT,
pagamento VARCHAR(45),
PRIMARY KEY (id_formaPagamento)
);

CREATE TABLE fornecedor (
id_fornecedor INT AUTO_INCREMENT,
nome_fornecedor VARCHAR(45),
cnpj VARCHAR(21),
PRIMARY KEY (id_fornecedor)
);

CREATE TABLE estoque (
id_estoque INT AUTO_INCREMENT,
local VARCHAR(45),
PRIMARY KEY (id_estoque)
);

CREATE TABLE vendedor (
id_vendedor INT AUTO_INCREMENT,
nome_vendedor VARCHAR(45),
PRIMARY KEY (id_vendedor)
);

CREATE TABLE produto_fornecedor (
id INT AUTO_INCREMENT,
fornecedor_id INT,
produto_id INT,
PRIMARY KEY (id),
FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id_fornecedor),
FOREIGN KEY (produto_id) REFERENCES produto(id_produto)
);

CREATE TABLE produto_estoque (
id INT AUTO_INCREMENT,
quantidade INT,
produto_id INT,
estoque_id INT,
PRIMARY KEY (id),
FOREIGN KEY (produto_id) REFERENCES produto(id_produto),
FOREIGN KEY (estoque_id) REFERENCES estoque(id_estoque)
);

CREATE TABLE produto_pedido (
id INT AUTO_INCREMENT,
produto_id INT,
pedido_id INT,
PRIMARY KEY (id),
FOREIGN KEY (produto_id) REFERENCES produto(id_produto),
FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido)
);

CREATE TABLE produto_vendedor (
id INT AUTO_INCREMENT,
produto_id INT,
vendedor_id INT,
PRIMARY KEY (id),
FOREIGN KEY (produto_id) REFERENCES produto(id_produto),
FOREIGN KEY (vendedor_id) REFERENCES vendedor(id_vendedor)
);

CREATE TABLE pedido_formaPagamento (
id INT AUTO_INCREMENT,
pedido_id INT,
formaPagamento_id INT,
PRIMARY KEY (id),
FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido),
FOREIGN KEY (formaPagamento_id) REFERENCES formaPagamento(id_formaPagamento)
);