create database cadastro;

use cadastro;

CREATE TABLE cidade (
    id int PRIMARY KEY,
    cidade varchar(80),
    estado char(2)
) default charset utf8;

CREATE TABLE pessoas (
    id int PRIMARY KEY,
    nome varchar(80) not null,
    cpf int(11) unique not null,
    data_de_nasc date not null,
    telefone char(10),
    celular char(11) not null,
    email varchar(80),
    logradouro varchar(80) not null,
    numero int(4) not null,
    complemento text,
    cep char(8) not null,
    sexo enum('m','f') not null,
    fk_cidade_id int not null
) default charset utf8;
 
ALTER TABLE pessoas ADD CONSTRAINT FK_pessoas_2
    FOREIGN KEY (fk_cidade_id)
    REFERENCES cidade (id)
    ON DELETE CASCADE;