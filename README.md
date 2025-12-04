# 🐱‍👤 Modelagem de Banco de Dados – Pokémon

**Disciplina:** Banco de Dados – Modelagem  
**Aluno:** *seu nome aqui*  

Projeto de modelagem conceitual, lógica e implementação parcial utilizando dados da Pokédex (1ª geração).

---

## 📌 Objetivo do Projeto

Este repositório apresenta um projeto completo de modelagem de banco de dados baseado no universo Pokémon, passando pelas etapas:

- Modelagem Conceitual (BR Modelo)  
- Modelagem Lógica (MySQL Workbench)  
- Normalização e organização das planilhas (Excel)  
- Criação das tabelas em SQL  
- Relacionamentos e integridade referencial  

Foram utilizados os **151 Pokémon da 1ª Geração**, com dados como:

- Tipos  
- Formas  
- Atributos de batalha  
- Relação com treinadores  

---

*Os nomes podem variar conforme seus arquivos reais.*

---

## 🧩 Modelagem Conceitual (BR Modelo)

A modelagem conceitual contempla as seguintes entidades:

- **Treinador**
- **Pokémon_Treinador**
- **Especie_Pokemon**
- **Tipo**
- **Forma**
- **Especie_Tipo** (associativa – N:N)

### Relacionamentos Principais

- Treinador → Pokémon_Treinador (**1:N**)  
- Pokémon_Treinador → Espécie_Pokémon (**1:N**)  
- Espécie_Pokémon → Tipo (**N:N**, via Espécie_Tipo)  
- Espécie_Pokémon → Forma (**0/1 : N**)  

---

## 🗄 Modelagem Lógica (MySQL Workbench)

A seguir estão as tabelas geradas no **modelo lógico**, conforme o diagrama criado no MySQL Workbench.

---

### 🧍‍♂️ Treinador

```sql
CREATE TABLE Treinador (
    idTreinador INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    aparencia VARCHAR(150),
    gostos VARCHAR(150)
);

CREATE TABLE Tipo (
    idTipo INT PRIMARY KEY,
    nome VARCHAR(40)
);

CREATE TABLE Forma (
    idForma INT PRIMARY KEY,
    nome VARCHAR(60)
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

CREATE TABLE Especie_tipo (
    idEspecie INT NOT NULL,
    idTipo INT NOT NULL,
    PRIMARY KEY (idEspecie, idTipo),
    FOREIGN KEY (idEspecie) REFERENCES Especie_pokemon(idEspecie),
    FOREIGN KEY (idTipo) REFERENCES Tipo(idTipo)
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
```


---

## 🧮 Normalização (Excel)

As planilhas foram criadas seguindo **boas práticas de normalização** e estruturadas conforme os princípios de modelagem de dados.

---

### 📁 Tabelas Normalizadas

| Planilha         | Conteúdo                           |
|------------------|------------------------------------|
| `tipos.xlsx`     | Lista única de tipos               |
| `formas.xlsx`    | Lista de formas (1ª geração)       |
| `especie.xlsx`   | Dados das 151 espécies             |
| `especie_tipo.xlsx` | Relação entre espécie e tipos |

---

### ✔ Características da Modelagem

- **Sem duplicações**
- **Cada coluna representa apenas um atributo**
- **Dados multivalorados separados corretamente**
- **Aderência à 1FN, 2FN e 3FN**

---

## ▶ Como Executar o Projeto

### 1. Abrir o modelo lógico no MySQL Workbench
Carregue o arquivo `.mwb` e gere o script automaticamente.

### 2. Rodar o script SQL
Use o comando abaixo no MySQL:

SOURCE caminho/para/create_tables.sql;


dados brutos → tabelas normalizadas → modelo conceitual → modelo lógico → implementação em SQL.

Esse repositório serve como base didática e técnica para evolução em projetos relacionais mais complexos.
