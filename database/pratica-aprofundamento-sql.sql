-- Active: 1693505407549@@127.0.0.1@3306
-- Conecte o arquivo pratica-aprofundamento-sql.db com a extensão MySQL e ative a conexão aqui

-- Deletar tabela
DROP TABLE pokemons;

-- Criar tabela
CREATE TABLE pokemons (
    id INTEGER PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL,
    type TEXT NOT NULL,
    hp INTEGER NOT NULL,
    attack INTEGER NOT NULL,
    defense INTEGER NOT NULL,
    special_attack INTEGER NOT NULL,
    special_defense INTEGER NOT NULL,
    speed INTEGER NOT NULL
);

-- Popular tabela
-- lembrando que o SQLite no windows tem seus probleminhas com a passagem de strings com aspas duplas ("");
INSERT INTO pokemons (
    id,
    name,
    type,
    hp,
    attack,
    defense,
    special_attack,
    special_defense,
    speed
)
VALUES 
    (1, 'bulbasaur', 'grass', 45, 49, 49, 65, 65, 45),
    (2, 'ivysaur', 'grass', 60, 62, 63, 80, 80, 60),
    (3, 'venusaur', 'grass', 80, 82, 83, 100, 100, 80),
    (4, 'charmander', 'fire', 39, 52, 43, 60, 50, 65),
    (5, 'charmeleon', 'fire', 58, 64, 58, 80, 65, 80),
    (6, 'charizard', 'fire', 78, 84, 78, 109, 85, 100),
    (7, 'squirtle', 'water', 44, 48, 65, 50, 64, 43),
    (8, 'wartortle', 'water', 59, 63, 80, 65, 80, 58),
    (9, 'blastoise', 'water', 79, 83, 100, 85, 105, 78);

-- Buscar todos os pokemons
SELECT * FROM pokemons;

-- Práticas
-- selecionando os pokemons com speed maior que 60;
SELECT * FROM pokemons
WHERE speed > 60;

-- selecionando os pokemons com ataque e ataque especial maiores ou iguais a 60
SELECT * FROM pokemons
WHERE attack >= 60
AND special_attack >= 60;

-- selecionando pokemons por alguma string no nome
SELECT * FROM pokemons
WHERE name LIKE '%saur';

-- trazendo a média simples da coluna hp
SELECT AVG(hp) AS media_HP
from pokemons;

-- contando o número de linhas na tabela
SELECT COUNT(*) FROM pokemons;

-- somando os itens de uma coluna
SELECT SUM (hp) AS soma_HP FROM pokemons;

-- liste todos os itens ordenados de forma decrescente
SELECT * FROM pokemons
ORDER BY defense DESC;

--list todos os itens ordenados de forma ascendente
SELECT * FROM pokemons
ORDER BY defense ASC;

-- contando os itens da tabela e agrupando por uma propriedade. no caso TYPE
SELECT COUNT(*), type 
FROM pokemons
GROUP BY type;

-- mesma coisa mas renomeando a coluna da contagem
SELECT COUNT(*) AS numeroDePokemons,
type 
FROM pokemons
GROUP BY type;

-- limitando o número de retornos
SELECT * FROM pokemons
LIMIT 3;

-- limitando o número de retornos e apresentando os retornos a partir do item 5 / útil para paginação
SELECT * FROM pokemons
LIMIT 3
OFFSET 4;

-- EXERCICIO FIXAÇÃO --

-- listando os com type fire ou grass
SELECT * FROM pokemons
WHERE 
type = 'fire' 
OR 
type = 'grass'
ORDER BY attack ASC
LIMIT 3
OFFSET 2;

-- listando com ordem crescente baseado na coluna attack
SELECT * FROM pokemons
ORDER BY attack ASC;

SELECT * FROM pokemons
LIMIT 3
OFFSET 2