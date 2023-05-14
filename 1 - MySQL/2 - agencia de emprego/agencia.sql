create database agencia;

use agencia;

CREATE TABLE cidade (
    id smallint auto_increment not null PRIMARY KEY,
    nome varchar(80) not null,
    estado char(2) not null
) default charset utf8;

CREATE TABLE Estado_civil (
    id tinyint auto_increment not null PRIMARY KEY,
    estado varchar(30) not null unique
)default charset utf8;

CREATE TABLE tipo_formacao (
    id tinyint auto_increment not null PRIMARY KEY,
    tipo varchar(30) not null unique
)default charset utf8;

CREATE TABLE formacao (
    id int auto_increment not null PRIMARY KEY,
    nome varchar(80) not null unique
)default charset utf8;

CREATE TABLE cursos (
    id tinyint auto_increment not null PRIMARY KEY,
    nome varchar(80) not null unique
)default charset utf8;


CREATE TABLE empresa (
    id int auto_increment not null PRIMARY KEY,
    nome varchar(80) not null,
    cnpj char(14) not null unique,
    telefone char(14) not null,
    e_mail varchar(80) not null,
    logradouro varchar(80) not null,
    numero char(4) not null,
    complemento text,
    fk_cidade_id smallint not null
)default charset utf8;
 
ALTER TABLE empresa ADD CONSTRAINT FK_empresa_cidade
    FOREIGN KEY (fk_cidade_id)
    REFERENCES cidade (id)
    on update cascade;
    
CREATE TABLE profissoes (
    id tinyint auto_increment not null PRIMARY KEY,
    cargo varchar(80) not null unique
)default charset utf8;


CREATE TABLE candidato (
    id int auto_increment not null PRIMARY KEY,
    nome varchar(80) not null,
    sexo enum('m','f') not null,
    data_de_nasc date not null,
    cpf char(11) not null unique,
    telefone char(14),
    celular char(15) not null,
    e_mail varchar(80) not null,
    logradouro varchar(80) not null,
    numero char(4) not null,
    complemento text,
    experiencia text,
    situacao enum('A','D') not null,
    fk_cidade_id smallint,
    fk_Estado_civil_id tinyint,
    fk_profissoes_id tinyint,
    fk_formacao_id int,
    fk_tipo_formacao_id tinyint
)default charset utf8;
 
ALTER TABLE candidato ADD CONSTRAINT FK_candidato_cidade
    FOREIGN KEY (fk_cidade_id)
    REFERENCES cidade (id)
    on update cascade;
 
ALTER TABLE candidato ADD CONSTRAINT FK_candidato_est_civ
    FOREIGN KEY (fk_Estado_civil_id)
    REFERENCES Estado_civil (id)
    on update cascade;
 
ALTER TABLE candidato ADD CONSTRAINT FK_candidato_prof
    FOREIGN KEY (fk_profissoes_id)
    REFERENCES profissoes (id)
    on update cascade;
 
ALTER TABLE candidato ADD CONSTRAINT FK_candidato_form
    FOREIGN KEY (fk_formacao_id)
    REFERENCES formacao (id)
    on update cascade;
 
ALTER TABLE candidato ADD CONSTRAINT FK_candidato_t_form
    FOREIGN KEY (fk_tipo_formacao_id)
    REFERENCES tipo_formacao (id)
    on update cascade;
    

CREATE TABLE cursos_candidato (
    id int auto_increment not null PRIMARY KEY,
    duracao int not null,
    instituicao varchar(80) not null,
    ano year not null,
    fk_cursos_id tinyint,
    fk_candidato_id int
)default charset utf8;
 
ALTER TABLE cursos_candidato ADD CONSTRAINT FK_cursos
    FOREIGN KEY (fk_cursos_id)
    REFERENCES cursos (id)
    on update cascade;
 
ALTER TABLE cursos_candidato ADD CONSTRAINT FK_candidato
    FOREIGN KEY (fk_candidato_id)
    REFERENCES candidato (id)
    on update cascade;
    

CREATE TABLE _vagas (
    id int auto_increment not null PRIMARY KEY,
    descricao text not null,
    salario decimal(5,2),
    quantidade_de_vagas smallint not null,
    fk_profissoes_id tinyint not null,
    fk_candidato_id int,
    fk_empresa_id int not null
)default charset utf8;
    
ALTER TABLE _vagas ADD CONSTRAINT FK_vagas_cargo
    FOREIGN KEY (fk_profissoes_id)
    REFERENCES profissoes (id)
    on update cascade;
 
ALTER TABLE _vagas ADD CONSTRAINT FK_vagas_candidato
    FOREIGN KEY (fk_candidato_id)
    REFERENCES candidato (id)
    on update cascade;
 
ALTER TABLE _vagas ADD CONSTRAINT FK_vagas_emp
    FOREIGN KEY (fk_empresa_id)
    REFERENCES empresa (id)
    on update cascade;
    
    
    
    
    
    
    
    
    