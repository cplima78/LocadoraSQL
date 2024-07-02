create table profissao (
    cod_prof int not null, -- Aqui não fiquei esclarecido sobre usar int ou serial (Nas outras tabelas abaixo também)
    nome varchar(60),
    primary key (cod_prof)
);

create table categoria (
    cod_cat int not null,
    nome varchar(60),
    valor numeric(15,2),
    primary key (cod_cat)
);


create table genero (
    cod_gen int not null,
    nome varchar(60),
    primary key (cod_gen)
);


create table cliente (
    cod_cli int not null,
    cpf char(11),
    nome varchar(60),
    telefone varchar(10),
    cod_prof int,
    primary key (cod_cli),
    foreign key (cod_prof) references profissao (cod_prof)
);


create table endereco (
    cod_end int not null, 
    logradouro varchar(40),
    tipo_log varchar(40),
    complemento varchar(20),
    cidade varchar(60),
    uf char(2),
    cep char(8),
    numero varchar(10),
    bairro varchar(60),
    primary key (cod_end)
);


create table dependente (
    cod_cli int not null,
    cod_dep int not null,
    parentesco varchar(20),
    primary key (cod_cli, cod_dep),
    foreign key (cod_cli) references cliente (cod_cli)
);


create table cli_endereco (
    cod_end int not null,
    cod_cli int not null,
    primary key (cod_end, cod_cli),
    foreign key (cod_end) references endereco (cod_end),
    foreign key (cod_cli) references cliente (cod_cli)
);


create table locacao (
    cod_loc int not null,
    data_loc date,
    desconto numeric(15,2),
    multa numeric(15,2),
    sub_total numeric(15,2),
    cod_cli int not null,
    primary key (cod_loc),
    foreign key (cod_cli) references cliente (cod_cli)
);


create table ator (
    cod_ator int not null,
    nome varchar(60),
    primary key (cod_ator)
);


create table filmes (
    cod_filme int not null,
    titulo_original varchar(100),
    titulo varchar(100),
    quantidade int,
    cod_cat int not null,
    cod_gen int not null,
    primary key (cod_filme),
    foreign key (cod_cat) references categoria (cod_cat),
    foreign key (cod_gen) references genero (cod_gen)
);


create table locacao_filme (
    cod_loc int not null,
    cod_filme int not null,
    valor numeric(15,2),
    num_dias int,
    data_devol date,
    primary key (cod_loc, cod_filme),
    foreign key (cod_loc) references locacao (cod_loc),
    foreign key (cod_filme) references filmes (cod_filme)
);


create table filme_ator (
    cod_ator int not null,
    cod_filme int not null,
    primary key (cod_ator, cod_filme),
    foreign key (cod_ator) references ator (cod_ator),
    foreign key (cod_filme) references filmes (cod_filme)
);


-- Inserir categorias
insert into categoria (cod_cat, nome, valor) values
(1, 'Drama', 10.00),
(2, 'Ação', 12.00),
(3, 'Histórico', 15.00),
(4, 'Crime', 8.00),
(5, 'Fantasia', 20.00),
(6, 'Suspense', 10.00),
(7, 'Romance', 7.00),
(8, 'Ficção Científica', 12.00),
(9, 'Biografia', 14.00),
(10, 'Aventura', 18.00),
(11, 'Mistério', 9.00),
(12, 'Terror', 11.00),
(13, 'Guerra', 16.00),
(14, 'Suspense', 8.00),
(15, 'Épico', 13.00);

-- Inserir gêneros
insert into genero (cod_gen, nome) values
(1, 'Drama'),
(2, 'Ação'),
(3, 'Histórico'),
(4, 'Crime'),
(5, 'Fantasia'),
(6, 'Suspense'),
(7, 'Romance'),
(8, 'Ficção Científica'),
(9, 'Biografia'),
(10, 'Aventura'),
(11, 'Mistério'),
(12, 'Terror'),
(13, 'Guerra'),
(14, 'Suspense'),
(15, 'Épico');

-- Inserir 15 filmes
insert into filmes (cod_filme, titulo_original, titulo, quantidade, cod_cat, cod_gen) values
(1, 'The Godfather', 'O Poderoso Chefão', 10, 1, 1),
(2, 'The Dark Knight', 'O Cavaleiro das Trevas', 8, 2, 2),
(3, 'Schindlers List', 'A Lista de Schindler', 5, 3, 3),
(4, 'Pulp Fiction', 'Pulp Fiction: Tempo de Violência', 7, 4, 4),
(5, 'The Lord of the Rings', 'O Senhor dos Anéis', 6, 5, 5),
(6, 'Fight Club', 'Clube da Luta', 4, 6, 6),
(7, 'Forrest Gump', 'Forrest Gump: O Contador de Histórias', 9, 7, 7),
(8, 'Inception', 'A Origem', 7, 8, 8),
(9, 'Goodfellas', 'Os Bons Companheiros', 5, 9, 9),
(10, 'The Matrix', 'Matrix', 6, 10, 10),
(11, 'Seven', 'Se7en: Os Sete Crimes Capitais', 5, 11, 11),
(12, 'The Silence of the Lambs', 'O Silêncio dos Inocentes', 4, 12, 12),
(13, 'Saving Private Ryan', 'O Resgate do Soldado Ryan', 6, 13, 13),
(14, 'The Usual Suspects', 'Os Suspeitos', 3, 14, 14),
(15, 'Braveheart', 'Coração Valente', 4, 15, 15);

-- Inserir profissões
insert into profissao (cod_prof, nome) values
(1, 'Engenheiro'),
(2, 'Médico'),
(3, 'Advogado'),
(4, 'Professor'),
(5, 'Arquiteto'),
(6, 'Designer'),
(7, 'Programador'),
(8, 'Jornalista'),
(9, 'Músico'),
(10, 'Artista');

-- Inserir 10 clientes
insert into cliente (cod_cli, cpf, nome, telefone, cod_prof) values
(1, '12345678901', 'João Silva', '1111111111', 1),
(2, '23456789012', 'Maria Oliveira', '2222222222', 2),
(3, '34567890123', 'Pedro Santos', '3333333333', 3),
(4, '45678901234', 'Ana Souza', '4444444444', 4),
(5, '56789012345', 'Carlos Lima', '5555555555', 5),
(6, '67890123456', 'Paula Ferreira', '6666666666', 6),
(7, '78901234567', 'Marcos Pereira', '7777777777', 7),
(8, '89012345678', 'Rita Rodrigues', '8888888888', 8),
(9, '90123456789', 'Roberto Almeida', '9999999999', 9),
(10, '01234567890', 'Fernanda Costa', '1010101010', 10);

-- Inserir 20 locações
insert into locacao (cod_loc, data_loc, desconto, multa, sub_total, cod_cli) values
(1, '2023-01-01', 0, 0, 15.00, 1),
(2, '2023-01-02', 0, 0, 12.00, 2),
(3, '2023-01-03', 0, 0, 18.00, 3),
(4, '2023-01-04', 0, 0, 10.00, 4),
(5, '2023-01-05', 0, 0, 20.00, 5),
(6, '2023-01-06', 0, 0, 8.00, 6),
(7, '2023-01-07', 0, 0, 14.00, 7),
(8, '2023-01-08', 0, 0, 22.00, 8),
(9, '2023-01-09', 0, 0, 16.00, 9),
(10, '2023-01-10', 0, 0, 19.00, 10),
(11, '2023-01-11', 0, 0, 13.00, 1),
(12, '2023-01-12', 0, 0, 11.00, 2),
(13, '2023-01-13', 0, 0, 9.00, 3),
(14, '2023-01-14', 0, 0, 17.00, 4),
(15, '2023-01-15', 0, 0, 21.00, 5),
(16, '2023-01-16', 0, 0, 15.00, 6),
(17, '2023-01-17', 0, 0, 20.00, 7),
(18, '2023-01-18', 0, 0, 12.00, 8),
(19, '2023-01-19', 0, 0, 18.00, 9),
(20, '2023-01-20', 0, 0, 14.00, 10);

-- Inserir filmes em locações (locacao_filme)
insert into locacao_filme (cod_loc, cod_filme, valor, num_dias, data_devol) values
(1, 1, 3.00, 5, '2023-01-06'),
(2, 2, 4.00, 3, '2023-01-05'),
(3, 3, 5.00, 4, '2023-01-07'),
(4, 4, 3.00, 2, '2023-01-06'),
(5, 5, 4.00, 6, '2023-01-11'),
(6, 6, 2.00, 3, '2023-01-09'),
(7, 7, 4.00, 5, '2023-01-12'),
(8, 8, 5.00, 4, '2023-01-12'),
(9, 9, 3.00, 3, '2023-01-12'),
(10, 10, 3.00, 5, '2023-01-15'),
(11, 11, 2.00, 2, '2023-01-13'),
(12, 12, 4.00, 3, '2023-01-15'),
(13, 13, 3.00, 4, '2023-01-17'),
(14, 14, 4.00, 5, '2023-01-19'),
(15, 15, 3.00, 3, '2023-01-18'),
(16, 1, 5.00, 6, '2023-01-22'),
(17, 2, 2.00, 4, '2023-01-20'),
(18, 3, 4.00, 3, '2023-01-21'),
(19, 4, 3.00, 5, '2023-01-24'),
(20, 5, 5.00, 6, '2023-01-26');

-- Inserir dependentes
insert into dependente (cod_cli, cod_dep, parentesco) values
(1, 1, 'Filho'),
(1, 2, 'Esposa'),
(2, 3, 'Marido'),
(2, 4, 'Filha'),
(3, 5, 'Esposa'),
(3, 6, 'Filho'),
(4, 7, 'Filho'),
(5, 8, 'Esposa'),
(5, 9, 'Filho'),
(6, 10, 'Marido'),
(7, 11, 'Filha'),
(8, 12, 'Filho'),
(8, 13, 'Marido'),
(9, 14, 'Esposa'),
(10, 15, 'Filho');

-- Inserir endereços
insert into endereco (cod_end, logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro) values
(1, 'Rua A', 'Rua', 'Apto 101', 'São Paulo', 'SP', '01001000', '100', 'Centro'),
(2, 'Av. B', 'Avenida', 'Sala 201', 'Rio de Janeiro', 'RJ', '20020000', '200', 'Copacabana'),
(3, 'Rua C', 'Rua', 'Casa', 'Belo Horizonte', 'MG', '30030000', '300', 'Pampulha'),
(4, 'Av. D', 'Avenida', 'Conjunto 301', 'Porto Alegre', 'RS', '40040000', '400', 'Centro'),
(5, 'Rua E', 'Rua', 'Apto 501', 'Curitiba', 'PR', '50050000', '500', 'Batel'),
(6, 'Av. F', 'Avenida', 'Casa 601', 'Salvador', 'BA', '60060000', '600', 'Barra'),
(7, 'Rua G', 'Rua', 'Apto 701', 'Recife', 'PE', '70070000', '700', 'Boa Viagem'),
(8, 'Av. H', 'Avenida', 'Conjunto 801', 'Brasília', 'DF', '80080000', '800', 'Asa Sul'),
(9, 'Rua I', 'Rua', 'Casa 901', 'Fortaleza', 'CE', '90090000', '900', 'Meireles'),
(10, 'Av. J', 'Avenida', 'Sala 1001', 'Manaus', 'AM', '10010000', '1000', 'Centro');

-- Inserir relacionamentos entre clientes e endereços (cli_endereco)
insert into cli_endereco (cod_end, cod_cli) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserir atores
insert into ator (cod_ator, nome) values
(1, 'Marlon Brando'),
(2, 'Al Pacino'),
(3, 'Liam Neeson'),
(4, 'John Travolta'),
(5, 'Elijah Wood'),
(6, 'Brad Pitt'),
(7, 'Tom Hanks'),
(8, 'Leonardo DiCaprio'),
(9, 'Robert De Niro'),
(10, 'Keanu Reeves'),
(11, 'Brad Pitt'),
(12, 'Anthony Hopkins'),
(13, 'Tom Hanks'),
(14, 'Kevin Spacey'),
(15, 'Mel Gibson');

-- Inserir relacionamentos entre filmes e atores (filme_ator)
insert into filme_ator (cod_ator, cod_filme) values
(1, 1),
(2, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);



-- Exercicio 01 -> Filmes alugados por cliente especifico
select c.nome as nome_cliente,
       f.titulo_original as titulo_original_filme,
       l.data_loc as data_locacao,
       lf.data_devol as data_devolucao
from locacao_filme lf
join locacao l on lf.cod_loc = l.cod_loc
join filmes f on lf.cod_filme = f.cod_filme
join cliente c on l.cod_cli = c.cod_cli
where c.cod_cli = 5;


--Excercicio 02 -> Lista clientes e dependentes
select c.cod_cli, c.nome as cliente, d.cod_dep, d.parentesco
from cliente c
left join dependente d on c.cod_cli = d.cod_cli;


--Exercicio 03 -> Listar filmes de um determinado genero
select f.cod_filme, f.titulo
from filmes f
join genero g on f.cod_gen = g.cod_gen
where g.nome = 'Suspense';
--
select * from locacao_filme
select * from endereco
--

--Exercicio 04 -> Exibir todos os clientes qye tem uma profissao especifica
select c.cod_cli, c.nome
from cliente c
join profissao p on c.cod_prof = p.cod_prof
where p.nome = 'Arquiteto';

-- Exercicio 05 -> Encontrar todos os filmes de uma categoria com quantidade acima de 5
select f.cod_filme, f.titulo_original, f.titulo, f.quantidade, c.nome as nome_categoria
from filmes f
join categoria c on f.cod_cat = c.cod_cat
where c.cod_cat = 2
and f.quantidade > 5;

--Exercicio 06 -> Lista de todos os atores que participaram de filmes com determinado titulo
select a.nome
from ator a
join filme_ator fa on a.cod_ator = fa.cod_ator
join filmes f on fa.cod_filme = f.cod_filme
where f.titulo = 'Matrix';

--Exercicio 07 -> Obtendo endereço completo de um cliente
select e.*
from endereco e
join cli_endereco ce on e.cod_end = ce.cod_end
join cliente c on ce.cod_cli = c.cod_cli
where c.cod_cli = 5;

--Exercicio 08 -> Listar todos os filmes con generos e categorias
select f.cod_filme, f.titulo, g.nome as genero, c.nome as categoria
from filmes f
join genero g on f.cod_gen = g.cod_gen
join categoria c on f.cod_cat = c.cod_cat;


--Exercicio 09 -> Mostrar todos os clientes que alugaram um filme específico e a data de locação
select c.cod_cli, c.nome, l.data_loc
from cliente c
join locacao l on c.cod_cli = l.cod_cli
join locacao_filme lf on l.cod_loc = lf.cod_loc
where lf.cod_filme = 5;









