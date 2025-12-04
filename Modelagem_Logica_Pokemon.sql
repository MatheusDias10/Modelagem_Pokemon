use banco_pokemon;

CREATE TABLE Treinador (
    idTreinador INT PRIMARY KEY,
    nome_treinador VARCHAR(100),
    idade_treinador INT,
    aparencia_treinador VARCHAR(255),
    gostos_treinador VARCHAR(255)
);

CREATE TABLE Especie_pokemon (
    idEspecie INT PRIMARY KEY,
    nome_pokemon VARCHAR(100),
    hp_pokemon INT,
    ataque_base INT,
    defesa_base INT,
    ataque_especial INT,
    defesa_especial INT,
    agilidade_base INT,
    idForma INT NULL,
    FOREIGN KEY (idForma) REFERENCES Forma(idForma)
);


CREATE TABLE Tipo (
    idTipo INT PRIMARY KEY,
    nome_tipo VARCHAR(50)
);

CREATE TABLE Forma (
    idForma INT PRIMARY KEY,
    nome_forma VARCHAR(100)
);


CREATE TABLE Pokemon_treinador (
    idPokemon INT PRIMARY KEY,
    apelido VARCHAR(100),
    nivel INT,
    local VARCHAR(20),
    idTreinador INT NOT NULL,
    idEspecie INT NOT NULL,
    FOREIGN KEY (idTreinador) REFERENCES Treinador(idTreinador),
    FOREIGN KEY (idEspecie) REFERENCES Especie_pokemon(idEspecie)
);

CREATE TABLE Especie_tipo (
    idEspecie INT NOT NULL,
    idTipo INT NOT NULL,
    ordem INT NOT NULL,
    PRIMARY KEY (idEspecie, idTipo),
    FOREIGN KEY (idEspecie) REFERENCES Especie_pokemon(idEspecie),
    FOREIGN KEY (idTipo) REFERENCES Tipo(idTipo)
);

