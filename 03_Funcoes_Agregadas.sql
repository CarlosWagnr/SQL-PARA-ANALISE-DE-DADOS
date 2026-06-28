-- Databricks notebook source
-- MAGIC %md
-- MAGIC ### FUNÇÕES AGREGADAS
-- MAGIC ##### Servem para executar operações aritmética nos registros de uma coluna
-- MAGIC ##### Tipos de Funções agraegadas: COUNT(), SUM(), MIN(), MAX(), AVG()

-- COMMAND ----------

-- EXEMPLOS - COUNT()
-- (Exemplo 1) Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia
--SELECT count(*) FROM sales.funnel;

-- (Exemplo 2) Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel 
--SELECT count(paid_date) FROM sales.funnel;

-- (Exemplo 3) Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em jan/21
--SELECT count(distinct product_id) FROM sales.funnel WHERE visit_page_date BETWEEN '2021-01-01' AND '2021-01-31';

-- OUTRAS FUNÇÕES
-- (Exemplo 4) Calcule o preço mínimo, máximo e médio dos productos da tabela products
--SELECT min(price), max(price), avg(price) FROM sales.products;

-- (Exemplo 5) Informe qual é o veículo mais caro da tabela products
--SELECT max(price) FROM sales.products;

SELECT * FROM sales.products WHERE price = (SELECT max(price) FROM sales.products);

-- RESUMO
-- (1) Servem para executar operações aritmética nos registros de uma coluna 
-- (2) Funções agregadas não computam células vazias (NULL) como zero
-- (3) Na função COUNT() pode-se utilizar o asterisco (*) para contar os registros
-- (4) COUNT(DISTINCT ) irá contar apenas os valores exclusivos


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### GROUP BY
-- MAGIC ##### Serve para agrupar registros semelhantes de uma coluna. Normalmente utilizado em conjunto com as Funções de agregação

-- COMMAND ----------

-- EXEMPLOS
-- (Exemplo 1) Contagem agrupada de uma coluna
-- Calcule o nº de clientes da tabela customers por estado
--SELECT state, count(*) AS contagem FROM sales.customers GROUP BY state ORDER BY contagem DESC LIMIT 10;

-- (Exemplo 2) Contagem agrupada de várias colunas
-- Calcule o nº de clientes por estado e status profissional 
--SELECT state, professional_status, count(*) AS contagem FROM sales.customers GROUP BY 1, 2 ORDER BY state, contagem DESC LIMIT 10;

-- (Exemplo 3) Seleção de valores distintos
-- Selecione os estados distintos na tabela customers utilizando o group by
--SELECT DISTINCT state FROM sales.customers;

SELECT state FROM sales.customers GROUP BY state ORDER BY state LIMIT 10;


-- RESUMO
-- (1) Serve para agrupar registros semelhantes de uma coluna, 
-- (2) Normalmente utilizado em conjunto com as Funções de agregação
-- (3) Pode-se referenciar a coluna a ser agrupada pela sua posição ordinal 
-- (ex: GROUP BY 1,2,3 irá agrupar pelas 3 primeiras colunas da tabela) 
-- (4) O GROUP BY sozinho funciona como um DISTINCT, eliminando linhas duplicadas


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ###  HAVING
-- MAGIC ##### Serve para filtrar linhas da seleção por uma coluna agrupada

-- COMMAND ----------

-- EXEMPLOS
-- (Exemplo 1) seleção com filtro no HAVING 
-- Calcule o nº de clientes por estado filtrando apenas estados acima de 100 clientes
SELECT state, count(*) AS qtd_clientes FROM sales.customers GROUP BY state HAVING count(*) > 100 ORDER BY 2 LIMIT 10;

-- RESUMO
-- (1) Tem a mesma função do WHERE mas pode ser usado para filtrar os resultados 
-- das funções agregadas enquanto o WHERE possui essa limitação
-- (2) A função HAVING também pode filtrar colunas não agregadas

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### EXERCÍCIOS

-- COMMAND ----------

-- EXERCÍCIOS
-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos
--SELECT count(*) FROM sales.customers WHERE DATEDIFF(YEAR, birth_date, CURRENT_DATE()) < 30;

-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers
--SELECT 
	--max(DATEDIFF(YEAR, birth_date, CURRENT_DATE())) AS mais_velho,
	--min(DATEDIFF(YEAR, birth_date, CURRENT_DATE())) AS mais_novo
--FROM sales.customers;

-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)
--SELECT * FROM sales.customers WHERE income = (SELECT max(income) FROM sales.customers) LIMIT 10;

-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca
--SELECT brand, count(*) AS qtd FROM sales.products GROUP BY brand ORDER BY brand LIMIT 10;

-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo
--SELECT brand, model_year, count(*) AS qtd FROM sales.products GROUP BY brand, model_year ORDER BY brand , model_year;

-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados
SELECT brand, count(*) FROM sales.products GROUP BY brand HAVING count(*) > 10;

