-- Tabela Autor
CREATE TABLE Autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(255) NOT NULL,
    ultimo_nome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    nacionalidade VARCHAR(255)
);

-- Tabela Genero
CREATE TABLE Genero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_genero VARCHAR(255) NOT NULL
);

-- Tabela Editora
CREATE TABLE Editora (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

-- Tabela Livro
CREATE TABLE Livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ISBN VARCHAR(15) NOT NULL UNIQUE,
    data_publicacao DATE,
    resumo TEXT,
    id_genero INT,
    id_editora INT,
    imagem_capa BLOB,
    FOREIGN KEY (id_genero) REFERENCES Genero(id),
    FOREIGN KEY (id_editora) REFERENCES Editora(id)
);

-- Tabela Livro_Autor
CREATE TABLE Livro_Autor (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES Livro(id),
    FOREIGN KEY (id_autor) REFERENCES Autor(id)
);

-- Populando a tabela Autor
INSERT INTO Autor (primeiro_nome, ultimo_nome, data_nascimento, nacionalidade) VALUES
('João', 'Silva', '1985-02-15', 'Brasileiro'),
('Maria', 'Fernandes', '1990-08-10', 'Portuguesa'),
('Pedro', 'Alvares', '1975-05-20', 'Brasileiro'),
('Lucia', 'Pereira', '1980-09-30', 'Portuguesa'),
('Bruno', 'Machado', '1995-12-05', 'Brasileiro'),
('Ana', 'Lima', '1992-03-25', 'Brasileira'),
('Carlos', 'Menezes', '1989-07-19', 'Brasileiro'),
('Fernanda', 'Rocha', '1986-10-23', 'Brasileira'),
('Miguel', 'Andrade', '1978-11-12', 'Português'),
('Luisa', 'Santos', '1983-04-02', 'Portuguesa');

-- Populando a tabela Genero
INSERT INTO Genero (nome_genero) VALUES
('Romance'),
('Ficção Científica'),
('História'),
('Terror'),
('Biografia');

-- Populando a tabela Editora
INSERT INTO Editora (nome_editora, endereco, telefone) VALUES
('Editora Central', 'Rua das Flores, 100', '(11) 1234-5678'),
('Publicações Modernas', 'Avenida Central, 500', '(11) 8765-4321'),
('Literatura Pura', 'Rua dos Livros, 55', '(11) 2345-6789'),
('Narrativas Ltda', 'Alameda dos Autores, 300', '(11) 3456-7890'),
('Contos e Cia', 'Boulevard dos Contos, 400', '(11) 4567-8901');

-- Populando a tabela Livro
INSERT INTO Livro (titulo, ISBN, data_publicacao, resumo, id_genero, id_editora) VALUES
('Aventuras Espaciais', '123-4567890123', '2020-05-15', 'Um livro sobre aventuras em um universo distante.', 2, 1),
('Amor em Lisboa', '789-0123456789', '2022-01-10', 'Uma história de amor na capital portuguesa.', 1, 2),
('História das Civilizações', '456-7890123456', '2015-06-10', 'Uma análise profunda das maiores civilizações.', 3, 3),
('Pesadelo no Vale', '123-7894561230', '2019-08-23', 'Uma história aterrorizante em um vale sombrio.', 4, 1),
('Segredos do Oceano', '890-1234567890', '2021-03-10', 'Mistérios ocultos nas profundezas do oceano.', 2, 5),
('A Casa da Colina', '123-4567894561', '2018-10-25', 'Uma casa antiga esconde segredos perturbadores.', 4, 4),
('A Vida de Einstein', '456-7891234562', '2019-04-18', 'Biografia detalhada do grande físico.', 5, 3),
('Floresta Encantada', '789-1234561234', '2017-12-12', 'Criaturas mágicas em uma floresta secreta.', 1, 2),
('Guerra dos Planetas', '321-6549873210', '2020-08-21', 'Conflito intergaláctico entre civilizações alienígenas.', 2, 1),
('Passado Esquecido', '654-9873216543', '2014-11-10', 'Segredos de família vêm à tona após uma descoberta.', 1, 4),
('Caminhos da Revolução', '987-3216549876', '2015-02-23', 'Análise de revoluções históricas e suas consequências.', 3, 3),
('Montanha da Perdição', '147-2583691472', '2016-05-15', 'Expedição a uma montanha amaldiçoada.', 4, 5),
('Mentes Brilhantes', '258-3691472583', '2021-09-09', 'Perfis de grandes gênios da humanidade.', 5, 2),
('Império Estelar', '369-1472583694', '2022-06-30', 'A ascensão e queda de um império no espaço.', 2, 1),
('Vozes do Passado', '741-8529637415', '2013-07-17', 'Romance histórico ambientado na Roma Antiga.', 1, 5),
('Jornada ao Núcleo', '852-9637418526', '2019-03-03', 'Aventura ao centro da Terra.', 2, 4),
('Catedral das Sombras', '963-7418529637', '2018-04-04', 'Mistérios envolvendo uma antiga catedral.', 4, 3),
('Homens de Ciência', '159-3574861598', '2021-11-11', 'Retratos biográficos de cientistas revolucionários.', 5, 2),
('Paixões Proibidas', '357-4861593579', '2017-08-19', 'Romance ambientado na França do século XVIII.', 1, 4),
('Galáxias Distantes', '753-1594867531', '2020-10-01', 'Descobertas em galáxias nunca antes exploradas.', 2, 1);

-- Populando a tabela Livro_Autor
INSERT INTO Livro_Autor (id_livro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 6), 
(5, 7),
(6, 1),
(7, 8),
(8, 2),
(9, 4),
(10, 3),
(11, 9),
(12, 5),
(13, 6),
(14, 7),
(15, 8),
(16, 2),
(17, 3),
(18, 10),
(19, 9),
(20, 4);

DELIMITER //
CREATE FUNCTION total_livros_por_genero(nome_genero VARCHAR(255)) RETURNS INT
BEGIN
    DECLARE total INT;
    SET total = 0;

    DECLARE done INT DEFAULT 0;
    DECLARE id_genero INT;
    DECLARE cur CURSOR FOR SELECT id FROM Genero WHERE nome_genero = nome_genero;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    FETCH cur INTO id_genero;
    
    IF done = 0 THEN
        SELECT COUNT(*) INTO total FROM Livro WHERE id_genero = id_genero;
    END IF;

    CLOSE cur;
    RETURN total;
END //
DELIMITER ;


DELIMITER //
CREATE FUNCTION listar_livros_por_autor(primeiro_nome VARCHAR(255), ultimo_nome VARCHAR(255)) RETURNS TEXT
BEGIN
    DECLARE lista_livros TEXT;
    SET lista_livros = '';

    DECLARE done INT DEFAULT 0;
    DECLARE id_autor INT;
    DECLARE cur CURSOR FOR SELECT id FROM Autor WHERE primeiro_nome = primeiro_nome AND ultimo_nome = ultimo_nome;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    FETCH cur INTO id_autor;
    
    IF done = 0 THEN
        SELECT GROUP_CONCAT(Livro.titulo) INTO lista_livros
        FROM Livro_Autor
        JOIN Livro ON Livro_Autor.id_livro = Livro.id
        WHERE Livro_Autor.id_autor = id_autor;
    END IF;

    CLOSE cur;
    RETURN lista_livros;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION atualizar_resumos()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE id_livro INT;
    DECLARE novo_resumo TEXT;
    DECLARE cur CURSOR FOR SELECT id, resumo FROM Livro;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    
    resumo_loop: LOOP
        FETCH cur INTO id_livro, novo_resumo;
        IF done = 1 THEN
            LEAVE resumo_loop;
        END IF;
        
        SET novo_resumo = CONCAT(novo_resumo, ' Este é um excelente livro!');
        UPDATE Livro SET resumo = novo_resumo WHERE id = id_livro;
    END LOOP;

    CLOSE cur;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION media_livros_por_editora() RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total_livros INT;
    DECLARE total_editoras INT;
    DECLARE media DECIMAL(10, 2);

    SELECT COUNT(*) INTO total_editoras FROM Editora;
    
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT id FROM Editora;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    editora_loop: LOOP
        FETCH cur;
        IF done = 1 THEN
            LEAVE editora_loop;
        END IF;
        
        SELECT COUNT(*) INTO total_livros FROM Livro WHERE id_editora = cur.id;
        SET media = media + total_livros;
    END LOOP;

    CLOSE cur;
    
    IF total_editoras > 0 THEN
        SET media = media / total_editoras;
    ELSE
        SET media = 0.00;
    END IF;
    
    RETURN media;
END //
DELIMITER ;
