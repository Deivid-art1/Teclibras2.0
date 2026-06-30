CREATE DATABASE glossario_libras_ti
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE glossario_libras_ti;

CREATE TABLE usuarios(
id_usuario INT NOT NULL auto_increment primary KEY,
nome VARCHAR(100) not null,
email VARCHAR(100) unique NOT NULL,
senha VARCHAR(255) NULL, -- vai ser null se o usuario logar com o google
id_google VARCHAR(255) UNIQUE NULL,  -- id do goole
avatar_url varchar(255) null, -- foto de perfil do google
perfil ENUM('USUARIO', 'INTÉRPRETE', 'ADM') DEFAULT 'USUARIO',
token_recuperacao varchar(255) null, -- para o esqueci minha senha
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE= InnoDB;

CREATE TABLE categorias(
id_categoria INT auto_increment primary key,
nome_categoria VARCHAR(100) NOT NULL UNIQUE,
icon_url varchar(255) null
) ENGINE = InnoDB;

CREATE TABLE sinais(
id_sinal INT auto_increment primary KEY,
termo_ti varchar(100) not null,
descricao_sinal text,
id_interprete INT,
data_publicacao timestamp default current_timestamp,
constraint fk_interprete foreign key (id_interprete) references usuarios(id_usuario)
) ENGINE = InnoDB;

CREATE TABLE sinal_categoria(
id_sinal INT NOT NULL,
id_categoria INT NOT NULL,

PRIMARY KEY(id_sinal, id_categoria),

CONSTRAINT fk_sc_sinal FOREIGN KEY(id_sinal) REFERENCES sinais(id_sinal)
ON DELETE CASCADE,

CONSTRAINT fk_sc_categoria FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
ON DELETE CASCADE
)  ENGINE = InnoDB;

CREATE TABLE midias(
id_midia INT auto_increment primary KEY,
id_sinal INT NOT NULL,
tipo_midia ENUM('VIDEO', 'GIF', 'IMAGEM') NOT NULL,
url_arquivo VARCHAR(255) not null,
formato varchar(10), -- mp4, png
tamanho_arquivo BIGINT,
data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
constraint fk_sinal_midia foreign key (id_sinal) references sinais (id_sinal)
on delete cascade -- se apagar o sinal, apaga também a midia
)ENGINE = InnoDB;

CREATE TABLE logs_atividades(
id_log INT auto_increment primary key,
id_usuario int,
acao varchar(100), -- subindo video, excluindo, editando...
id_registro int, -- id do sinal que foi alterado
data_hora timestamp default current_timestamp,
constraint fk_log_usuario foreign key (id_usuario) references usuarios (id_usuario)
) ENGINE = InnoDB;

CREATE TABLE avaliacoes (
id_avaliacao int auto_increment primary key,
id_usuario int not null,
id_sinal int not null,
nota tinyint not null check (nota between 1 and 5), -- avaliacao em estrelas
comentario text null,
data_avaliacao timestamp default current_timestamp on update current_timestamp,
unique key unique_user_signal (id_usuario, id_sinal),
constraint fk_aval_usuario foreign key (id_usuario) references usuarios (id_usuario) on delete cascade,
constraint fk_aval_signal foreign key (id_sinal) references sinais (id_sinal) on delete cascade -- se apagar o sinal ou o usuario apaga também a avaliacao
)ENGINE = InnoDB;