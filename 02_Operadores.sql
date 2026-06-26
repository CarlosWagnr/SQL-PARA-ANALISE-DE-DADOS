-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Operadores: Aritméticos, Comparação e Lógicos
-- MAGIC ---

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Operadores Aritméticos: Servem para executar operações matemáticas. Muito utilizados para criar colunas calculadas
-- MAGIC ##### TIPOS: +, -, *, /, ^, %    
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





-- (Exemplo 3) Criação de coluna calculada com strings 
-- Crie a coluna "nome_completo" contendo o nome completo do cliente
select
	first_name || ' ' || last_name as nome_completo
from sales.customers;


-- RESUMO 
-- (1) Servem para executar operações matemáticas.
-- (2) Muito utilizado para criar colunas calculadas.
-- (3) Alias (pseudônimos) são muito utilizados para dar nome as colunas calculadas.
-- (4) Para criar pseudônimos que contém espaços no nome são utilizadas aspas duplas.
-- (5) No caso de strings o operador de adição (||) irá concatenar as strings.
