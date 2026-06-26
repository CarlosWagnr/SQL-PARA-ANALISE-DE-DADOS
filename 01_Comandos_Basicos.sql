-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## COMANDOS BÁSICOS: SELECT, DISTINCT, WHERE, ORDER BY, LIMIT.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC #### SELECT - Comando usado para selecionar colunas de tabelas.

-- COMMAND ----------

-- (Exemplo 1) Seleção de todas as colunas de uma tabela
-- Liste todos as informações dos clientes da tabela sales.customers
-- SELECT * FROM sales.customers LIMIT 10;

-- (Exemplo 2) Seleção de mais de uma coluna de uma tabela
-- Liste os emails e nomes dos clientes da tabela sales.customers
SELECT email, first_name, last_name FROM sales.customers LIMIT 10;

-- RESUMO
-- (1) Comando usado para selecionar colunas de tabelas.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### DISTINCT - Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas.
-- MAGIC

-- COMMAND ----------

-- (Exemplo 1) Seleção de uma coluna com DISTINCT
-- Liste as marcas de carro distintas que constam na tabela products
-- SELECT DISTINCT brand FROM sales.products;

-- (Exemplo 2) Seleção de mais de uma coluna com DISTINCT
-- Liste as marcas e anos de modelo distintos que constam na tabela products
 SELECT DISTINCT brand, model_year FROM sales.products LIMIT 10;

-- RESUMO
-- (1) Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas.
-- (2) Caso mais de uma coluna seja selecionada, o comando SELECT DISTINCT irá 
-- retornar todas as combinações distintas.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### WHERE - Comando utilizado para filtrar linhas de acordo com uma condição
-- MAGIC

-- COMMAND ----------

-- (Exemplo 1) Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- SELECT email, state FROM sales.customers WHERE state='SC' LIMIT 10;

-- (Exemplo 2) Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul
-- SELECT email, state FROM sales.customers WHERE state='SC' or state='MS' LIMIT 10;

-- (Exemplo 3) Condições com datas
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos
SELECT email, state, birth_date FROM sales.customers WHERE (state='SC' or state='MS') and birth_date < '1991-12-28' LIMIT 10;

-- SELECT email, state, birth_date FROM sales.customers WHERE (state='SC' or state='MS') and birth_date < '19911228' LIMIT 10;

-- RESUMO
-- (1) Comando utilizado para filtrar linhas de acordo com uma condição.
-- (2) string = sequência de caracteres = texto.
-- (3) Pode-se combinar mais de uma condição utilizando os operadores lógicos.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### ORDER BY - Comando utilizado para ordenar a seleção de acordo com uma regra definida.
-- MAGIC

-- COMMAND ----------

-- EXEMPLOS
-- (Exemplo 1) Ordenação de valores numéricos
-- Liste produtos da tabela products na ordem crescente com base no preço
-- SELECT * FROM sales.products ORDER BY price LIMIT 10;

-- SELECT * FROM sales.products ORDER BY price DESC LIMIT 10; -- Caso queira na ordem decrescente

-- (Exemplo 2) Ordenação de texto
-- Liste os estados distintos da tabela customers na ordem crescente
SELECT DISTINCT state FROM sales.customers ORDER BY state LIMIT 10;

-- RESUMO
-- (1) Comando utilizado para ordenar a seleção de acordo com uma regra definida.
-- (2) Por padrão o comando ordena na ordem crescente. Para mudar para a ordem 
-- decrescente usar o comando DESC.
-- (3) No caso de strings a ordenação será seguirá a ordem alfabetica.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### LIMIT - Comando utilizado para limitar o nº de linhas da consulta.
-- MAGIC

-- COMMAND ----------

-- EXEMPLOS
-- (Exemplo 1) Seleção das N primeiras linhas usando LIMIT
-- Liste as 10 primeiras linhas da tabela funnel
-- SELECT * FROM sales.funnel LIMIT 10;

-- (Exemplo 2) Seleção das N primeiras linhas usando LIMIT e ORDER BY
-- Liste os 10 produtos mais caros da tabela products
SELECT * FROM sales.products ORDER BY price DESC LIMIT 10;

-- RESUMO
-- (1) Comando utilizado para limitar o nº de linhas da consulta.
-- (2) Muito utilizado na etapa de exploração dos dados.
-- (3) Muito utilizado em conjunto com o comando ORDER BY quando o que importa são
-- os TOP N. Ex: "N pagamentos mais recentes", "N produtos mais caros".

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ### EXERCÍCIOS

-- COMMAND ----------

-- (Exercício 1) Selecione os nomes de cidades distintas que existem no estado de
-- Minas Gerais em ordem alfabética (dados da tabela sales.customers)
--SELECT DISTINCT city FROM sales.customers WHERE state = 'MG' ORDER BY city LIMIT 10;

-- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
-- (dados da tabela sales.funnel)
--SELECT visit_id FROM sales.funnel WHERE paid_date is not null ORDER BY paid_date DESC LIMIT 10;


-- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 (dados da tabela sales.customers)
SELECT * FROM sales.customers WHERE birth_date >= '2000-01-01' ORDER BY score DESC LIMIT 10;

-- COMMAND ----------


