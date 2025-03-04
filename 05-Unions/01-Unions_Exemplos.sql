-- UNION - Serve para colar uma tabela sobre a outra, 
-- desde que as tabelas tenham as mesmas quantidades de colunas e tipagem.
-- SINTAXE
select coluna_1, coluna_2
from schema_1.tabela_1;


-- union - remove as linhas duplicadas.
-- union all - não remove as linhas duplicadas.
select coluna_3, coluna_4 
from schema_2.tabela_2;


-- EXEMPLOS
-- (Exemplo 1) União simples de duas tabelas
-- Una a tabela sales.products com a tabela temp_tables.products_2
select * from sales.products
union all
select * from temp_tables.products_2;
