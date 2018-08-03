
CREATE TABLE produto (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codigo varchar(5),
	descricao varchar(100),
	preco_custo float,
	preco_venda float,
	garantia date,
	quantidade int,
	imagem varchar(100)
);

CREATE TABLE categoria_produto (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codigo varchar(5),
	descricao varchar(100)
);


ALTER TABLE produto ADD COLUMN categoria_id int;

ALTER TABLE produto ADD CONSTRAINT fk_categoria_produto FOREIGN KEY (categoria_id) REFERENCES categoria_produto(id);

CREATE TABLE usuario (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome varchar(100),
	email varchar(100),
	login varchar(100),
	senha varchar(100)
);

CREATE TABLE venda (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dt_venda date,
	valor_total float
);

CREATE TABLE item_venda (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_venda int,
	id_produto int
);

ALTER TABLE item_venda ADD CONSTRAINT fk_venda_item_venda FOREIGN KEY (id_venda) REFERENCES venda(id);
ALTER TABLE item_venda ADD CONSTRAINT fk_produto_item_venda FOREIGN KEY (id_produto) REFERENCES produto(id);


