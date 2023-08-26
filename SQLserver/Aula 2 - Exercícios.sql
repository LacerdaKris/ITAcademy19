-- Checagem de dominio
alter table veiculos
add constraint CK_KM check (km >= 0);

-- todo nome que come�a com a letra A
select * from pessoas
where nome LIKE 'A%';

-- todo nome que possui letra O em algum lugar
select * from pessoas
where nome LIKE '%o%';

-- placas que se encaixam no espa�o em branco
select * from veiculos
where placa LIKE 'IJ_-___2';

-- idades que se enquadrem no conjunto
select * from pessoas
where idade IN (25, 80 , 30);

-- adicionando coluna com data null
alter table pessoas
ADD nascimento DATE null;

-- alterando data de nascimento
update pessoas
set nascimento = convert(date, '24/01/2003', 103)
where cpf = '66666666666';

select nome, nascimento (sysdate - nascimento) /365
from pessoas
where cpf = '66666666666';

------------------------------------
-- SCRIPT FILMES DO PROF CALLEGARI
------------------------------------

CREATE TABLE Filmes(
titulo VARCHAR(250),
ano NUMERIC(4),
diretor VARCHAR(100),
genero VARCHAR(80),
atoresPrincipais VARCHAR(1000),
duracao NUMERIC(4),--em minutos
valorIngresso NUMERIC(5,2)
);

---------- BD INICIAL -----------
insert into filmes 
values('Cosmopolis',2012,'David Cronenberg','Drama','Robert Pattinson, Juliette Binoche, Sarah Gadon, Mathieu Amalric',108,22.99);

insert into filmes
values('The Awakening',2012,'Nick Murphy ','Horror','Rebecca Hall, Dominic West, Imelda Staunton, Lucy Cohu',107,29.99);

insert into filmes
values('The Shawshank Redemption',1994,'Frank Darabont','Drama,Crime','Tim Robbins, Morgan Freeman and Bob Gunton',142,25.99);

insert into filmes
values('Pulp Fiction',1994,'Quentin Tarantino','Crime,Thriller','John Travolta, Uma Thurman and Samuel L. Jackson',154,29.99);

insert into filmes
values('One Flew Over the Cuckoos Nest',1975,'Milos Forman','Drama','Jack Nicholson, Louise Fletcher and Michael Berryman',133,55.99);

insert into filmes
values('Inception',2010,'Christopher Nolan','Action','Leonardo DiCaprio, Joseph Gordon-Levitt and Ellen Page',148,79.99);

insert into filmes
values('Fight Club',1999,'David Fincher','Drama','Brad Pitt, Edward Norton and Helena Bonham Carter',139,75.99);

insert into filmes
values('Casablanca',1942,'Michael Curtiz','Drama','Humphrey Bogart, Ingrid Bergman and Paul Henreid',102,62.99);

insert into filmes
values('The Matrix',1999,'Andy Wachowski, Lana Wachowski','Action','Keanu Reeves, Laurence Fishburne and Carrie-Anne',136,28.99);

insert into filmes
values('Se7en',1995,'David Fincher','Crime','Morgan Freeman, Brad Pitt and Kevin Spacey',127,42.99);


---------- OUTROS DADOS --------------------------------------------------------------------------------------
--Anos 80
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Back to the Future', 1985, 'Robert Zemeckis', 'Science Fiction, Family, Adventure', 'Michael J. Fox, Christopher Lloyd, Lea Thompson', 116, 24.88);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Breakfast Club', 1985, 'John Hughes', 'Comedy, Drama', 'Emilio Estevez, Judd Nelson, Molly Ringwald', 97, 27.35);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Shining', 1980, 'Stanley Kubrick', 'Drama, Horror', 'Jack Nicholson, Shelley Duvall, Danny Lloyd, Scatman Crothers', 146, 30.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Top Gun', 1986, 'Tony Scott', 'Action, Drama, Romance', 'Tom Cruise, Tim Robbins, Kelly McGillis', 110, 22.98);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Ferris Bueller s Day Off', 1986, 'John Hughes', 'Comedy', 'Matthew Broderick, Alan Ruck, Mia Sara', 103, 17.25);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Ghost Busters', 1984, 'Ivan Reitman', 'Comedy, Action, Fantasy', 'Bill Murray, Dan Aykroyd, Sigourney Weaver', 105, 21.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Terminator', 1984, 'James Cameron', 'Action, Sci-Fi', 'Arnold Schwarzenegger, Linda Hamilton, Michael Biehn, Paul Winfield', 107, 19.00);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Goonies', 1985, 'Richard Donner', 'Adventure, Comedy, Family', 'Sean Astin, Josh Brolin, Jeff Cohen, Corey Feldman', 114, 10.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Dirty Dancing', 1984, 'Emile Ardolino', 'Drama, Music, Romance', 'Patrick Swayze, Jennifer Grey, Jerry Orbach, Cynthia Rhodes', 100, 18.75);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Conan the Barbarian', 1982, 'John Milius', 'Adventure, Fantasy', 'Arnold Schwarzenegger, James Earl Jones, Max von Sydow, Sandahl Bergman', 129, 37.00);
--Anos 90
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Scream', 1996, 'Wes Craven', 'Horror, Mystery', 'Neve Campbell, Courteney Cox, David Arquette, Skeet Ulrich', 111, 25.00);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Lost World: Jurassic Park', 1997, 'Steven Spielberg', 'Action, Adventure, Sci-Fi', 'Jeff Goldblum, Julianne Moore, Pete Postlethwaite, Vince Vaughn', 129, 20.32);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Crow', 1994, 'Alex Proyas', 'Action, Drama, Fantasy', 'Brandon Lee, Michael Wincott, Rochelle Davis, Ernie Hudson', 102, 15.19);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Simply Irresistible', 1999, 'Mark Tarlov', 'Comedy, Drama, Fantasy', 'Sarah Michelle Gellar, Sean Patrick Flanery, Patricia Clarkson, Dylan Baker', 96, 14.25);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Lion King', 1994, 'Roger Allers, Rob Minkoff', 'Animation, Adventure, Drama', 'Matthew Broderick, Jeremy Irons, James Earl Jones, Whoopi Goldberg', 88, 13.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Titanic', 1997, 'James Cameron', 'Drama, Romance', 'Leonardo DiCaprio, Kate Winslet, Billy Zane, Kathy Bates', 194, 45.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Toy Story', 1995, 'John Lasseter', 'Animation, Adventure, Comedy', 'Tom Hanks, Tim Allen, Don Rickles, Jim Varney', 81, 26.69);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('As Good As It Gets', 1997, 'James L. Brooks', 'Comedy, Drama, Romance', 'Jack Nicholson, Helen Hunt, Greg Kinnear, Cuba Gooding Jr.', 139, 32.00);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Patch Adams', 1998, 'Tom Shadyac', 'Biography, Comedy, Drama', 'Robin Williams, Daniel London, Monica Potter, Philip Seymour Hoffman', 115, 18.18);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Blair Witch Project', 1999, 'Daniel Myrick, Eduardo S�nchez', 'Horror, Mystery', 'Heather Donahue, Michael C. Williams, Joshua Leonard, Bob Griffin', 81, 14.99);
--Anos 2000
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Accidental Spy', 2001, 'Saranyoo Jiralak', 'Horror', 'Siraphan Wattanajinda, James Alexander Mackie, Penpak Sirikul', 110, 12.00);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Mr. and Ms. Smith', 2005, 'Doug Liman', 'Action, Comedy, Crime', 'Brad Pitt, Angelina Jolie, Adam Brody', 120, 45.00);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Beowulf', 2007, 'Robert Zemeckis', 'Animation, Action, Adventure', 'Ray Winstone, Crispin Glover, Angelina Jolie', 115, 99.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Gladiator', 2000, 'Ridley Scott', 'Action, Adventure, Drama', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen, Oliver Reed', 155, 62.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Bring It On', 2000, 'Peyton Reed', 'Comedy, Romance, Sport', 'Kirsten Dunst, Eliza Dushku, Jesse Bradford, Gabrielle Union', 98, 27.79);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Harry Potter and the Order of the Phoenix', 2007, 'David Yates', 'Adventure, Family, Fantasy', 'Daniel Radcliffe, Emma Watson, Rupert Grint, Brendan Gleeson', 138, 21.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Hangover', 2009, 'Todd Phillips', 'Comedy', 'Zach Galifianakis, Bradley Cooper, Justin Bartha, Ed Helms', 100, 9.00);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Pianist', 2002, 'Roman Polanski', 'Biography, Drama, Music', 'Adrien Brody, Thomas Kretschmann, Frank Finlay, Emilia Fox', 150, 45.00);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Devil Wears Prada', 2006, 'David Frankel', 'Comedy, Drama', 'Anne Hathaway, Meryl Streep, Adrian Grenier', 109, 25.89);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Lord of the Rings: The Return of the King', 2003, 'Peter Jackson', 'Action, Adventure, Drama', 'Elijah Wood, Viggo Mortensen, Ian McKellen, Orlando Bloom', 201, 33.33);
--Anos 2010
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('LEGO Batman: The Movie', 2017, 'Chris McKay', 'Animation, Action, Comedy', 'Will Arnett, Michael Cera, Rosario Dawson, Ralph Fiennes', 104, 21.94);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Maleficent', 2014, 'Robert Stromberg', 'Action, Adventure, Family', 'Angelina Jolie, Elle Fanning, Sharlto Copley', 97, 31.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Imitation Game', 2014, 'Morten Tyldum', 'Biography, Drama, Thriller', 'Benedict Cumberbatch, Keira Knightley, Matthew Goode', 114, 82.90);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Brooklyn', 2015, 'John Crowley', 'Drama, Romance', 'Saoirse Ronan, Emory Cohen, Domhnall Gleeson, Jim Broadbent', 117, 10.85);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('The Wolf of Wall Street', 2013, 'Martin Scorsese', 'Biography, Comedy, Crime', 'Leonardo DiCaprio, Jonah Hill, Margot Robbie, Matthew McConaughey', 180, 17.99);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Midnight in Paris', 2011, 'Woody Allen', 'Comedy, Fantasy, Romance', 'Owen Wilson, Rachel McAdams, Kathy Bates, Kurt Fuller', 94, 22.75);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Zootopia', 2016, 'Byron Howard, Rich Moore, Jared Bush', 'Animation, Adventure, Comedy', 'Ginnifer Goodwin, Jason Bateman, Idris Elba, Jenny Slate', 108, 21.97);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Blackswan', 2010, 'Darren Aronofsky', 'Drama, Thriller, Horror', 'Natalie Portman, Mila Kunis, Vincent Cassel, Winona Ryder', 108, 27.80);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Paranormal Activity 2', 2010, 'Tod Williams', 'Horror', 'Katie Featherston, Micah Sloat, Molly Ephraim, David Bierend', 91, 25.00);
INSERT INTO FILMES (TITULO, ANO, DIRETOR, GENERO, ATORESPRINCIPAIS, DURACAO, VALORINGRESSO) 
VALUES ('Operation Avalanche', 2016, 'Matt Johnson', 'Drama, Mystery, Thriller', 'Matt Johnson, Owen Williams, Josh Boles', 94, 40.00);

SELECT * FROM Filmes;

-- EXERCICIOS
-- 4.1.a) o título, o ano e o diretor de todos os filmes
select titulo, ano, diretor from filmes;

-- 4.1.b) os filmes de horror de 2010
select * from filmes
where genero like '%Horror%'
	AND ano = 2010;

-- 4.1.c) o título e o ano dos filmes com duração maior do que 2 horas
select titulo, ano from filmes
where duracao > 120;

-- 4.1.d)titulo/duracao das comedias de 90 com mín 1h e 20min, de diretores c/ nomes iniciados por J.
select titulo, duracao from Filmes
where genero like '%Comedy%'
	AND ano between 1990 and 1999
	AND duracao >= 1*60 + 20
	AND diretor LIKE 'J%';

-- 4.1.e) titulo/genero/valor do ingresso a partir de 2006, mostrando valores inflacionados em 8,63%.
select titulo, genero, round(valorIngresso + (8.63/100*valorIngresso), 2)
from Filmes
where ano >= 2006;

-- 4.1.f) a quantidade de filmes de ação com ingressos que custam mais do que R$ 20,00.
select count(*) as FilmesAçãoPreçoMaior20
from filmes
where genero like '%Action%'
	and valorIngresso > 20;

-- 4.1.g) os nomes de todos os diretores cadastrados, sem repetir, e em ordem alfabetica.
select distinct diretor
from filmes
order by diretor;

-- 4.2.a) aumentar em 10 minutos a duração dos filmes em que participa a atriz Angelina Jolie.
update filmes
set duracao = duracao + 10
where atoresPrincipais like '%Angelina Jolie%';
select * from filmes
where atoresPrincipais like '%Angelina Jolie%';

-- 4.2.b) dar um desconto de 10% para os filmes de acao do ano 2011.
update filmes
set valorIngresso = valorIngresso*0.90
where genero like '%Action%';
select * from filmes
where genero like '%Action%';

-- 4.2.c) acrescentar um asterisco (*) no final dos títulos dos filmes com duração menor ou igual a 30 minutos.
update filmes
set titulo = titulo + '*'
where duracao <= 30;

-- 4.3.a) excluir os filmes com valor de ingresso superior a R$ 60,00
delete filmes
where valorIngresso > 60;
select * from filmes;

-- 4.3.b) excluir filmes cujo título aparece “assombrado” ou cujo sobrenome do diretor é “Johnson”.
delete filmes
where titulo like '%assombrado%'
	OR diretor like '%Johnson%';

-- criando tabela com registros obrigatórios (NOT NULL) e chaves PK e Unique
CREATE TABLE ALUNOS
(
 nroMatricula VARCHAR(10) NOT NULL,
cpf VARCHAR(20) NOT NULL,
 email VARCHAR(100) NULL,
 nome VARCHAR(150) NOT NULL,
 anoIngresso NUMERIC(4) NOT NULL,
 endereco VARCHAR(150) NULL,
 sexo CHAR(1) NOT NULL,
 CONSTRAINT PK_ALUNOS PRIMARY KEY (nroMatricula),
 CONSTRAINT AK1_ALUNOS UNIQUE (cpf),
 CONSTRAINT AK2_ALUNOS UNIQUE (email)
);

insert into ALUNOS
values ('100', '100100', 'maria@email.com', 'Maria', 2022, NULL, 'F');
insert into ALUNOS
values ('200', '200200', 'mariapaula@email.com', 'Maria Paula', 2023, NULL, 'F');
insert into ALUNOS
values ('300', '300300', 'marioa@email.com', 'Mario', 2023, NULL, 'M');
insert into ALUNOS
values ('400', '400200', 'mariana@email.com', 'Mariana', 2023, NULL, 'F');
insert into ALUNOS
values ('500', '500200', 'marcelo@email.com', 'Marcelo', 2023, NULL, 'M');
insert into ALUNOS
values ('600', '600200', 'matheus@email.com', 'Matheus', 2023, NULL, 'M');
insert into ALUNOS
values ('700', '700200', 'miriam@email.com', 'Miriam', 2023, NULL, 'F');
insert into ALUNOS
values ('800', '800200', 'moana@email.com', 'Moana', 2023, NULL, 'F');
insert into ALUNOS
values ('900', '900200', 'murilo@email.com', 'Murilo', 2023, NULL, 'M');
insert into ALUNOS
values ('001', '000100', 'marcia@email.com', 'Marcia', 2022, NULL, 'F');

select * from ALUNOS;