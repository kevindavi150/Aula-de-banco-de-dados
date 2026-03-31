CREATE TABLE [consumidores] (
	[cpf_consumidores] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome_consumidor] nvarchar(100) NOT NULL,
	[data_nascimento] date NOT NULL,
	[celular] decimal(15) NOT NULL,
	[email] nvarchar(50) NOT NULL,
	PRIMARY KEY ([cpf_consumidores])
);

CREATE TABLE [produtos] (
	[code_produto] int IDENTITY(1,1) NOT NULL UNIQUE,
	[descricao] nvarchar(50) NOT NULL,
	[unidade] nvarchar(10) NOT NULL,
	[ncm] decimal(12) NOT NULL,
	[produtos_falta] int NOT NULL DEFAULT '5',
	[quantidades_produtos] int NOT NULL DEFAULT '5',
	PRIMARY KEY ([code_produto])
);

CREATE TABLE [pedidos] (
	[id_pedido] int IDENTITY(1,1) NOT NULL UNIQUE,
	[data_pedido] date NOT NULL,
	[hora_pedido] time(7) NOT NULL,
	[valor_pedido] decimal(10) NOT NULL DEFAULT '2',
	[cpf] decimal(18,0) NOT NULL DEFAULT '11',
	[codigo_produto] int NOT NULL DEFAULT '6',
	[vendeu_produtos] int NOT NULL DEFAULT '5',
	[devolucao_produtos] int NOT NULL DEFAULT '5',
	[faltou_produtos] int NOT NULL DEFAULT '5',
	PRIMARY KEY ([id_pedido])
);

CREATE TABLE [fornecedor] (
	[produtos] int IDENTITY(1,1) NOT NULL UNIQUE DEFAULT '50',
	[quantidades] decimal(18,0) NOT NULL DEFAULT '5',
	PRIMARY KEY ([produtos])
);

CREATE TABLE [vendas] (
	[vendeu] int IDENTITY(1,1) NOT NULL UNIQUE DEFAULT '5',
	[devolucao] int NOT NULL DEFAULT '5',
	[faltou] int NOT NULL DEFAULT '5',
	PRIMARY KEY ([vendeu])
);


ALTER TABLE [produtos] ADD CONSTRAINT [produtos_fk4] FOREIGN KEY ([produtos_falta]) REFERENCES [fornecedor]([produtos]);

ALTER TABLE [produtos] ADD CONSTRAINT [produtos_fk5] FOREIGN KEY ([quantidades_produtos]) REFERENCES [fornecedor]([quantidades]);
ALTER TABLE [pedidos] ADD CONSTRAINT [pedidos_fk4] FOREIGN KEY ([cpf]) REFERENCES [consumidores]([cpf_consumidores]);

ALTER TABLE [pedidos] ADD CONSTRAINT [pedidos_fk5] FOREIGN KEY ([codigo_produto]) REFERENCES [produtos]([code_produto]);

ALTER TABLE [pedidos] ADD CONSTRAINT [pedidos_fk6] FOREIGN KEY ([vendeu_produtos]) REFERENCES [vendas]([vendeu]);

ALTER TABLE [pedidos] ADD CONSTRAINT [pedidos_fk7] FOREIGN KEY ([devolucao_produtos]) REFERENCES [vendas]([devolucao]);

ALTER TABLE [pedidos] ADD CONSTRAINT [pedidos_fk8] FOREIGN KEY ([faltou_produtos]) REFERENCES [vendas]([faltou]);

