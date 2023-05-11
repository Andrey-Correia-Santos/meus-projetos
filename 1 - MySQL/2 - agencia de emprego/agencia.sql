create database agencia;

use agencia;


CREATE TABLE cidade (
    id smallint PRIMARY KEY auto_increment not null,
    nome varchar(80) not null,
    estado char(2) not null
) default charset utf8;


CREATE TABLE estado_civil (
    id tinyint PRIMARY KEY auto_increment not null,
    estado varchar(30) unique
) default charset utf8;


CREATE TABLE profissoes (
    id tinyint PRIMARY KEY auto_increment not null,
    cargo varchar(80) not null unique
) default charset utf8;


CREATE TABLE formacao (
	id tinyint PRIMARY key auto_increment not null, 
	formacao varchar(80) not null unique
)default charset utf8;


CREATE TABLE candidato (
	id int PRIMARY KEY auto_increment not null,
    nome varchar(80) not null,
    cpf char(11) unique not null,
    sexo enum('m','f') not null,
    data_de_nasc date not null,
    estado_civil_id tinyint not null default 1,
    telefone char(12),
    celular char(13) not null,
    e_mail varchar(80) not null,
	cidade_id smallint not null,
    logradouro varchar(80) not null,
    numero smallint not null,
    complemento text,
    formacao_id tinyint not null,
	cargo_id tinyint not null,
    experiencia text not null,
    situacao enum('A','D') not null
) default charset utf8;
 
ALTER TABLE candidato ADD CONSTRAINT cidade_candidato
    FOREIGN KEY (cidade_id)
    REFERENCES cidade (id)
    ON DELETE CASCADE on update cascade;
 
ALTER TABLE candidato ADD CONSTRAINT estado_civil_candidato
    FOREIGN KEY (estado_civil_id)
    REFERENCES estado_civil (id)
    ON DELETE CASCADE on update cascade;
 
ALTER TABLE candidato ADD CONSTRAINT candidato_profissao
    FOREIGN KEY (cargo_id)
    REFERENCES profissoes (id)
    ON DELETE CASCADE on update cascade;

Alter table candidato add constraint candidato_formacao
foreign key (formacao_id)
references formacao (id)
on delete cascade on update cascade;
    

CREATE TABLE empresa (
    id int PRIMARY KEY auto_increment not null,
    nome varchar(80) not null,
    cnpj char(14) unique not null,
    telefone char(10) not null,
    e_mail varchar(80) not null,
	cidade_id smallint not null,
    logradouro varchar(80) not null,
    numero smallint not null,
    complemento text
) default charset utf8;
 
ALTER TABLE empresa ADD CONSTRAINT cidade_empresa
    FOREIGN KEY (cidade_id)
    REFERENCES cidade (id)
    ON DELETE CASCADE on update cascade;
    

CREATE TABLE vagas (
    id int PRIMARY KEY auto_increment not null,
    empresa_id int not null,
	cargo_id tinyint not null,
    formacao_id tinyint not null,
    descrissao text not null,
    salario decimal(5, 2),
    quantidade_de_vagas int not null,
    candidato_id int
) default charset utf8;

ALTER TABLE vagas ADD CONSTRAINT vagas_cargo
    FOREIGN KEY (cargo_id)
    REFERENCES profissoes (id)
    ON DELETE CASCADE;
 
ALTER TABLE vagas ADD CONSTRAINT vagas_candidato
    FOREIGN KEY (candidato_id)
    REFERENCES candidato (id);
 
ALTER TABLE vagas ADD CONSTRAINT vagas_empresa
    FOREIGN KEY (empresa_id)
    REFERENCES empresa (id);
    
Alter table vagas add constraint vagas_formacao
foreign key (formacao_id)
references formacao (id)
on delete cascade on update cascade;