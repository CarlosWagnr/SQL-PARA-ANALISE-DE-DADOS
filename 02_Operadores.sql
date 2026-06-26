-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Operadores: Aritméticos, Comparação e Lógicos
-- MAGIC ---

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Operadores Aritméticos
-- MAGIC ##### Servem para executar operações matemáticas. Muito utilizados para criar colunas calculadas
-- MAGIC ##### Tipos: +, -, *, /, ^, %    
-- MAGIC ##### || --> não é um operador aritmético

-- COMMAND ----------

-- (Exemplo 1) Criação de coluna calculada
-- Crie uma coluna contendo a idade do cliente da tabela sales.customers
--SELECT email, birth_date, (CURRENT_DATE - birth_date) / 365 as idade_do_cliente FROM sales.customers;

-- (Exemplo 2) Utilização da coluna calculada nas queries
-- Liste os 10 clientes mais novos da tabela customers
SELECT email, birth_date, (CURRENT_DATE - birth_date) / 365 as idade_do_cliente FROM sales.customers ORDER BY idade_do_cliente LIMIT 10;

-- (Exemplo 3) Criação de coluna calculada com strings 
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
-- SELECT first_name || ' ' || last_name as nome_completo FROM sales.customers;

-- RESUMO 
-- (1) Servem para executar operações matemáticas.
-- (2) Muito utilizado para criar colunas calculadas.
-- (3) Alias (pseudônimos) são muito utilizados para dar nome as colunas calculadas.
-- (4) No caso de strings o operador de adição (||) irá concatenar as strings.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### Operadores de Comparação
-- MAGIC ##### Servem para comparar dois valores retornando TRUE ou FALSE. Muito utilizado em conjunto com a função WHERE para filtrar linhas de uma seleção
-- MAGIC ##### Tipos: =, >, <, >=, <=, <>

-- COMMAND ----------

-- (Exemplo 1) Uso de operadores como flag
-- Crie uma coluna que retorne TRUE sempre que um cliente for um profissional clt 
SELECT customer_id, first_name, professional_status, (professional_status = 'clt') as cliente_clt FROM sales.customers LIMIT 10;

-- RESUMO
-- (1) Servem para comparar dois valores retornando TRUE ou FALSE.
-- (2) Muito utilizado em conjunto com a função WHERE para filtrar linhas de uma seleção.
-- (3) Utilizados para criar colunas Flag que retornem TRUE ou FALSE.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### Operadores Lógicos
-- MAGIC ##### São usados para unir expressões simples em uma composta
-- MAGIC ##### Tipos: and, or, not, between, in, like, ilike, is null

-- COMMAND ----------

-- EXEMPLOS
-- (Exemplo 1) Uso do comando BETWEEN 
-- Selecione veículos que custam entre 100k e 200k na tabela products
--SELECT * FROM sales.products WHERE price between 100000 and 200000 LIMIT 10;

-- (Exemplo 2)  Uso do comando NOT
-- Selecione veículos que custam abaixo de 100k ou acima 200k 
--SELECT * FROM sales.products WHERE price NOT BETWEEN 100000 AND 200000 LIMIT 10;

-- (Exemplo 3) Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT
--SELECT * FROM sales.products WHERE brand IN ('HONDA', 'TOYOTA', 'RENAULT') LIMIT 10;

-- (Exemplo 4) Uso do comando LIKE (matchs imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam com as iniciais ANA
--SELECT DISTINCT first_name FROM sales.customers WHERE first_name LIKE 'ANA%';

-- (Exemplo 5) Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'
--SELECT DISTINCT first_name FROM sales.customers WHERE first_name ILIKE 'ana%';

-- (Exemplo 6) Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions
SELECT * FROM temp_tables.regions WHERE population IS NULL;


-- RESUMO
-- (1) Usados para unir expressões simples em uma composta.
-- (2) AND: Verifica se duas comparações são simultaneamente verdadeiras.
-- (3) OR: Verifica se uma ou outra comparação é verdadeiras.
-- (4) BETWEEN: Verifica quais valores estão dentro do range definido.
-- (5) IN: Funciona como multiplos ORs.
-- (6) LIKE e ILIKE: Comparam textos e são sempre utilizados em conjunto com o 
-- operador %, que funciona como um coringa, indicando que qualquer texto pode 
-- aparecer no lugar do campo.
-- (7) ILIKE ignora se o campo tem letras maiúsculas ou minúsculas na comparação.
-- (8) IS NULL: Verifica se o campo é nulo.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### EXERCÍCIOS

-- COMMAND ----------

-- (Exercício 1) Calcule quantos salários mínimos ganha cada cliente da tabela 
-- sales.customers. Selecione as colunas de: email, income e a coluna calculada "salários mínimos"
-- Considere o salário mínimo igual à R$1300
--SELECT email, income, (income) / 1300 AS salarios_minimos FROM sales.customers LIMIT 10;

-- (Exercício 2) Na query anterior acrescente uma coluna informando TRUE se o cliente
-- ganha acima de 5 salários mínimos e FALSE se ganha 4 salários ou menos.
-- Chame a nova coluna de "acima de 4 salários"
--SELECT email, income, (income) / 1200 AS salarios_minimos, ((income) / 1200) > 4 AS acima_4_salarios FROM sales.customers;

-- (Exercício 3) Na query anterior filtre apenas os clientes que ganham entre
-- 4 e 5 salários mínimos. Utilize o comando BETWEEN
--SELECT email, income, (income) / 1200 AS salarios_minimos, ((income) / 1200) > 4 AS acima_4_salarios FROM sales.customers
--where ((income) / 1200) BETWEEN 4 AND 5;

-- (Exercício 4) Selecione o email, cidade e estado dos clientes que moram no estado de 
-- Minas Gerais e Mato Grosso. 
--SELECT email, city, state FROM sales.customers WHERE state IN ('MT', 'MG');

-- (Exercício 5) Selecione o email, cidade e estado dos clientes que não moram no estado de São Paulo.
--SELECT email, city, state FROM sales.customers WHERE state NOT IN ('SP');

-- (Exercício 6) Selecione os nomes das cidade que começam com a letra Z.
-- Dados da tabela temp_table.regions
SELECT city FROM temp_tables.regions WHERE city ILIKE 'z%';
