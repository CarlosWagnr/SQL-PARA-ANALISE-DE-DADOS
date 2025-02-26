-- DISTINCT - Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas.
-- SINTAXE 
select distinct coluna_1, coluna_2, coluna_3
from schema_1.tabela_1;


-- EXEMPLOS
-- (Exemplo 1) Seleção de uma coluna com DISTINCT
-- Liste as marcas de carro distintas que constam na tabela products
select distinct brand
from sales.products;


-- (Exemplo 2) Seleção de mais de uma coluna com DISTINCT
-- Liste as marcas e anos de modelo distintos que constam na tabela products
select distinct brand, model_year
from sales.products;


-- RESUMO
-- (1) Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas.
-- (2) Caso mais de uma coluna seja selecionada, o comando SELECT DISTINCT irá 
-- retornar todas as combinações distintas.
