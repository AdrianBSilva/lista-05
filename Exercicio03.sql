DROP TABLE celulares
DROP TABLE a_pagar
DROP TABLE emails
DROP TABLE a_receber
DROP TABLE clientes

CREATE TABLE clientes(
	id		INT IDENTITY(1,1),
	nome	VARCHAR(100)NOT NULL,
	sexo	CHAR(1)NOT NULL
	PRIMARY KEY (id)
);

CREATE TABLE celulares(
	id			INT IDENTITY(1,1) NOT NULL,
	id_cliente  INT  NOT NULL,
	numero		TEXT,
	ativo		BIT DEFAULT 1
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE emails(
	id			INT IDENTITY(1,1) NOT NULL,
	id_cliente  INT  NOT NULL,
	email		VARCHAR(100),
	ativo		BIT DEFAULT 1
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE a_pagar(
	id			INT IDENTITY(1,1) NOT NULL,
	id_cliente  INT  NOT NULL,
	valor		DECIMAL(8,2),
	vencimento	DATE,
	valor_pago	DECIMAL(8,2) DEFAULT 0,
	stts		TEXT DEFAULT 'Pagar',
	ativo		BIT DEFAULT 1
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)

);

CREATE TABLE a_receber(
	id					INT IDENTITY(1,1) NOT NULL,
	id_cliente			INT  NOT NULL,
	valor_receber		DECIMAL(8,2),
	data_pagamento		DATE,
	valor_recebido		DECIMAL(8,2) DEFAULT 0,
	data_recebimento	DATE,
	stts				TEXT DEFAULT 'Receber',
	ativo				BIT DEFAULT 1
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)

);

INSERT INTO clientes(nome, sexo) VALUES
('Germana','F'),
('Salvador','M'),
('Úrsula','F'),
('Aluísio','M')

INSERT INTO celulares(id_cliente, numero) VALUES
(1,'(79) 99973-5114'),
(2,'(27) 98390-6475'),
(1,'(55) 98587-4266'),
(4,'(14) 98387-5333'),
(3,'(92) 98983-2809'),
(4,'(55) 98616-2303')

INSERT INTO emails(id_cliente, email) VALUES
(2,'bernardodiegoalves-77@vianetfone.com.br'),
(1,'a68341ef3b@emailna.life'),
(3,'zpgkmkem@boximail.com'),
(1,'ger@bol.com'),
(2,'gabrieldiegofernandodarocha_@uoul.com'),
(3,'iancauearaujo_@10clic.com.br'),
(1,'germana@gmail.com'),
(2,'salvador@hotmail.com')

INSERT INTO pagar(id_cliente,vencimento,valor) VALUES
((SELECT id FROM clientes WHERE nome = 'Germana'),  '2018-06-15',  '500.00'),
((SELECT id FROM clientes WHERE nome = 'Salvador'),  '2018-06-29',  '320.50'),
((SELECT id FROM clientes WHERE nome = 'Úrsula'),  '2018-06-07',  '450.00'),
((SELECT id FROM clientes WHERE nome = 'Aluísio') , '2018-08-27',  '1300.00'),
((SELECT id FROM clientes WHERE nome = 'Aluísio'),  '2018-10-10',  '777.00'),
((SELECT id FROM clientes WHERE nome = 'Úrsula'), '2018-10-14', '8001.00'),
((SELECT id FROM clientes WHERE nome = 'Salvador'),  '2018-11-25',  '232.12'),
((SELECT id FROM clientes WHERE nome = 'Úrsula'),  '2018-09-13',  '104.23'),
((SELECT id FROM clientes WHERE nome = 'Germana'), ' 2018-07-17', ' 65.00'),
((SELECT id FROM clientes WHERE nome = 'Aluísio'), ' 2018-10-06', ' 98.83'),
((SELECT id FROM clientes WHERE nome = 'Salvador'), '2018-12-12', ' 12.17'),
((SELECT id FROM clientes WHERE nome = 'Salvador'),' 2018-12-23', ' 6.25')

INSERT INTO receber(id_cliente,data_pagamento,valor_receber) VALUES
((SELECT id FROM clientes WHERE nome = 'Úrsula'),    '2018-12-08',  '78.97'),
((SELECT id FROM clientes WHERE nome = 'Salvador'),  '2018-11-24',  '700.00'),
((SELECT id FROM clientes WHERE nome = 'Germana'),   '2018-10-09',  '45.87'),
((SELECT id FROM clientes WHERE nome = 'Germana'),  '2019-01-04',  '39.50'),
((SELECT id FROM clientes WHERE nome = 'Aluísio'),   '2018-11-30',  '123.45'),
((SELECT id FROM clientes WHERE nome = 'Úrsula'),    '2018-09-07',  '987.65'),
((SELECT id FROM clientes WHERE nome = 'Salvador'),  '2018-07-06',  '456.00')

/*SELECT clientes.nome, emails.email FROM clientes
JOIN emails ON (clientes.id = emails.id_cliente)

SELECT clientes.nome, emails.email FROM clientes
JOIN emails ON (clientes.id = emails.id_cliente)
ORDER BY nome*/

SELECT clientes.nome, emails.email FROM clientes
JOIN emails ON (clientes.id = emails.id_cliente)
WHERE LEN(email) = (SELECT MAX(LEN(email)) FROM emails)










