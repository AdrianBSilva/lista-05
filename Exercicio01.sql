DROP TABLE caracteristicas
DROP TABLE alunos
CREATE TABLE alunos(
	id		INT IDENTITY (1,1),
	nome	VARCHAR(200),
	idade   INT
	PRIMARY KEY(id)
);

CREATE TABLE caracteristicas(
	id	      INT IDENTITY (1,1),
	id_alunos INT,
	caracteristica VARCHAR (150) NOT NULL
	FOREIGN KEY (id_alunos) REFERENCES alunos(id)
);

INSERT INTO alunos(nome,idade) VALUES
('Alice',18),
('Sophia',4),
('Miguel',9),
('Heitor',23),
('Valentina',15),
('Joaquim',49)

INSERT INTO caracteristicas(id_alunos, caracteristica) VALUES
((SELECT id FROM alunos WHERE nome = 'Heitor'),'Egoísta'),
((SELECT id FROM alunos WHERE nome = 'Alice'),'Organizado(a)'),
((SELECT id FROM alunos WHERE nome = 'Sophia'),'Pontual'),
((SELECT id FROM alunos WHERE nome = 'Miguel'),'Criativo(a)'),
((SELECT id FROM alunos WHERE nome = 'Heitor'),'Proativo(a)'),
((SELECT id FROM alunos WHERE nome = 'Alice'),'Altruísta'),
((SELECT id FROM alunos WHERE nome = 'Valentina'),'Pessimista'),
((SELECT id FROM alunos WHERE nome = 'Joaquim'),'Flexível modelo'),
((SELECT id FROM alunos WHERE nome = 'Sophia'),'Observadora'),
((SELECT id FROM alunos WHERE nome = 'Joaquim'),'Paciente'),
((SELECT id FROM alunos WHERE nome = 'Heitor'),'Indelicado(a)'),
((SELECT id FROM alunos WHERE nome = 'Sophia'),'Desobediente'),
((SELECT id FROM alunos WHERE nome = 'Miguel'),'Intolerante'),
((SELECT id FROM alunos WHERE nome = 'Joaquim'),'Empático(a)'),
((SELECT id FROM alunos WHERE nome = 'Sophia'),'Egoísta'),
((SELECT id FROM alunos WHERE nome = 'Heitor'),'Altruísta'),
((SELECT id FROM alunos WHERE nome = 'Sophia'),'Sensível')


SELECT alunos.nome, caracteristicas.caracteristica FROM caracteristicas
JOIN alunos ON (alunos.id = caracteristicas.id_alunos)

SELECT COUNT(alunos.nome) 'Altruístas' FROM alunos
JOIN caracteristicas ON (caracteristicas.id_alunos = alunos.id)
WHERE caracteristicas.caracteristica  = 'Altruísta'

SELECT caracteristicas.caracteristica, COUNT(alunos.nome) 'N° de ALUNOS' FROM caracteristicas
JOIN alunos ON (alunos.id = caracteristicas.id_alunos)
GROUP BY caracteristicas.caracteristica

SELECT alunos.nome, caracteristicas.caracteristica FROM alunos
JOIN caracteristicas ON (caracteristicas.id_alunos = alunos.id)
WHERE nome = 'SOPHIA'