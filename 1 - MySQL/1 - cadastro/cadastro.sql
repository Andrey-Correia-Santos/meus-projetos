create database cadastro;

use cadastro;

CREATE TABLE cidade (
    id int PRIMARY KEY auto_increment,
    nome varchar(80) not null,
    estado char(2) not null
) default charset utf8;

CREATE TABLE pessoas (
    id int PRIMARY KEY auto_increment,
    nome varchar(80) not null,
    sexo enum('m','f') not null,
    cpf char(11) unique key not null,
    data_de_nasc date not null,
    telefone char(10),
    celular char(11) not null,
    email varchar(80),
    logradouro varchar(80) not null,
    numero int(4) not null,
    complemento text,
    cep char(8) not null,
    cidade_id int not null
) default charset utf8;
 
ALTER TABLE pessoas ADD CONSTRAINT cidade_pessoa
    FOREIGN KEY (cidade_id)
    REFERENCES cidade(id)
    ON DELETE CASCADE;

insert into cidade (nome, estado) 
values 

('Curitiba', 'PR'),
('Sjp', 'PR'),
('Colombo', 'PR');

insert into pessoas (nome, sexo, cpf, data_de_nasc, telefone, celular, email, logradouro, numero, complemento, cep, cidade_id) values 
('Rogerio Antonio', 'm', '11968832113','1998-03-12','23689628163','41979857987','antoniorogerio@hotmail.com','maria das dores', '123', 'proximo ao mercado', '56023440', 1),
("Brennan Yang","m","75430025426","1945-08-05","23662828163","00596578920","semper.pretium@google.ca","Gauteng",4490,"nec mauris","83742472", 2),
("Anne Price","m","26527426344","1962-09-09","48235721512","27832731865","vitae.aliquet.nec@outlook.ca","Baden Württemberg",3724,"dignissim lacus.","82611596", 2),
("Mohammad Sanford","m","36835164566","1960-05-14","10111853549","76805509742","suspendisse.aliquet@protonmail.ca","Imo",981,"eros non","52282004", 1),
("Lyle Douglas","f","66787611375","1939-03-20","82216872235","65271266381","nisi.cum@icloud.org","Soccsksargen",3083,"magna. Ut","25387474", 2),
("Cameron Fowler","m","66881702003","1953-08-04","76926468465","71672725684","pellentesque.a@aol.com","Jambi",4855,"arcu. Nunc","22026372", 2),
("Slade Love","f","69206432475","1992-01-07","50825983331","21206855163","ad.litora@outlook.net","Central Kalimantan",2940,"libero lacus,","16704588", 1),
("Dale Gay","m","92615631624","1945-08-17","47177305218","01822364022","aliquam.vulputate@yahoo.net","Nordrhein-Westphalen",9621,"sit amet,","47567641", 1),
("Joshua Heath","f","55401731566","2005-01-15","16115203689","35520277378","quisque.nonummy@protonmail.ca","Ninh Bình",7130,"lectus. Nullam","16278561", 2),
("Emi Powell","f","80366969513","1972-04-04","69245813466","95241223251","fames@protonmail.couk","Victoria",3037,"Donec vitae","86373777", 1),
("Dawn Rodriquez","m","13038647186","1943-10-09","13368210153","53712951534","ullamcorper.magna@yahoo.org","Kujawsko-pomorskie",5779,"ipsum. Curabitur","28336141", 2);
