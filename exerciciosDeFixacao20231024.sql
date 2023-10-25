CREATE DATABASE exercicios_trigger;
USE exercicios_trigger;

-- Criação das tabelas
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

DELIMITER //
CREATE TRIGGER cliente_insert_trigger
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (mensagem)
    VALUES (CONCAT('Novo cliente inserido em ', NOW()));
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER cliente_delete_trigger
BEFORE DELETE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (mensagem)
    VALUES (CONCAT('Tentativa de exclusão de cliente em ', NOW()));
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER cliente_update_trigger
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    IF OLD.nome <> NEW.nome THEN
        INSERT INTO Auditoria (mensagem)
        VALUES (CONCAT('Nome antigo: ', OLD.nome, ', Novo nome: ', NEW.nome));
    END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER cliente_no_empty_name_trigger
BEFORE UPDATE ON Clientes
FOR EACH ROW
BEGIN
    IF NEW.nome IS NULL OR NEW.nome = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é permitido atualizar o nome vazio';
    END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER pedido_insert_trigger
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Produtos
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.produto_id;
    
    IF (SELECT estoque FROM Produtos WHERE id = NEW.produto_id) < 5 THEN
        INSERT INTO Auditoria (mensagem)
        VALUES (CONCAT('Estoque baixo para o produto ', NEW.produto_id, ' em ', NOW()));
    END IF;
END;
//
DELIMITER ;
