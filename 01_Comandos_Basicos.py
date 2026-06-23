# Databricks notebook source
# /// script
# [tool.databricks.environment]
# environment_version = "5"
# ///
# MAGIC %md
# MAGIC # CURSO DE SQL PARA ANÁLISE DE DADOS 

# COMMAND ----------

# MAGIC %md
# MAGIC ---
# MAGIC #### SELECT - Comando usado para selecionar colunas de tabelas.

# COMMAND ----------

# MAGIC %sql
# MAGIC -- (Exemplo 1) Seleção de todas as colunas de uma tabela
# MAGIC -- Liste todos as informações dos clientes da tabela sales.customers
# MAGIC -- SELECT * FROM sales.customers LIMIT 10;
# MAGIC
# MAGIC -- (Exemplo 2) Seleção de mais de uma coluna de uma tabela
# MAGIC -- Liste os emails e nomes dos clientes da tabela sales.customers
# MAGIC SELECT email, first_name, last_name FROM sales.customers LIMIT 10;
# MAGIC
# MAGIC -- RESUMO
# MAGIC -- (1) Comando usado para selecionar colunas de tabelas.

# COMMAND ----------

# MAGIC %md
# MAGIC ---
# MAGIC ### DISTINCT - Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas.
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC -- (Exemplo 1) Seleção de uma coluna com DISTINCT
# MAGIC -- Liste as marcas de carro distintas que constam na tabela products
# MAGIC -- SELECT DISTINCT brand FROM sales.products;
# MAGIC
# MAGIC -- (Exemplo 2) Seleção de mais de uma coluna com DISTINCT
# MAGIC -- Liste as marcas e anos de modelo distintos que constam na tabela products
# MAGIC  SELECT DISTINCT brand, model_year FROM sales.products LIMIT 10;
# MAGIC
# MAGIC -- RESUMO
# MAGIC -- (1) Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas.
# MAGIC -- (2) Caso mais de uma coluna seja selecionada, o comando SELECT DISTINCT irá 
# MAGIC -- retornar todas as combinações distintas.
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC ---
# MAGIC ### WHERE - Comando utilizado para filtrar linhas de acordo com uma condição
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC -- (Exemplo 1) Filtro com condição única
# MAGIC -- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
# MAGIC -- SELECT email, state FROM sales.customers WHERE state='SC' LIMIT 10;
# MAGIC
# MAGIC -- (Exemplo 2) Filtro com mais de uma condição
# MAGIC -- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
# MAGIC -- ou Mato Grosso do Sul
# MAGIC -- SELECT email, state FROM sales.customers WHERE state='SC' or state='MS' LIMIT 10;
# MAGIC
# MAGIC -- (Exemplo 3) Condições com datas
# MAGIC -- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
# MAGIC -- ou Mato Grosso do Sul e que tem mais de 30 anos
# MAGIC SELECT email, state, birth_date FROM sales.customers WHERE (state='SC' or state='MS') and birth_date < '1991-12-28' LIMIT 10;
# MAGIC
# MAGIC -- SELECT email, state, birth_date FROM sales.customers WHERE (state='SC' or state='MS') and birth_date < '19911228' LIMIT 10;
# MAGIC
# MAGIC -- RESUMO
# MAGIC -- (1) Comando utilizado para filtrar linhas de acordo com uma condição.
# MAGIC -- (2) string = sequência de caracteres = texto.
# MAGIC -- (3) Pode-se combinar mais de uma condição utilizando os operadores lógicos.
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC ---
# MAGIC ### ORDER BY - Comando utilizado para ordenar a seleção de acordo com uma regra definida.
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC -- EXEMPLOS
# MAGIC -- (Exemplo 1) Ordenação de valores numéricos
# MAGIC -- Liste produtos da tabela products na ordem crescente com base no preço
# MAGIC -- SELECT * FROM sales.products ORDER BY price LIMIT 10;
# MAGIC
# MAGIC -- SELECT * FROM sales.products ORDER BY price DESC LIMIT 10; -- Caso queira na ordem decrescente
# MAGIC
# MAGIC -- (Exemplo 2) Ordenação de texto
# MAGIC -- Liste os estados distintos da tabela customers na ordem crescente
# MAGIC SELECT DISTINCT state FROM sales.customers ORDER BY state LIMIT 10;
# MAGIC
# MAGIC -- RESUMO
# MAGIC -- (1) Comando utilizado para ordenar a seleção de acordo com uma regra definida.
# MAGIC -- (2) Por padrão o comando ordena na ordem crescente. Para mudar para a ordem 
# MAGIC -- decrescente usar o comando DESC.
# MAGIC -- (3) No caso de strings a ordenação será seguirá a ordem alfabetica.
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC ---
# MAGIC ### LIMIT - Comando utilizado para limitar o nº de linhas da consulta.
# MAGIC

# COMMAND ----------

# MAGIC %sql
# MAGIC -- EXEMPLOS
# MAGIC -- (Exemplo 1) Seleção das N primeiras linhas usando LIMIT
# MAGIC -- Liste as 10 primeiras linhas da tabela funnel
# MAGIC -- SELECT * FROM sales.funnel LIMIT 10;
# MAGIC
# MAGIC -- (Exemplo 2) Seleção das N primeiras linhas usando LIMIT e ORDER BY
# MAGIC -- Liste os 10 produtos mais caros da tabela products
# MAGIC SELECT * FROM sales.products ORDER BY price DESC LIMIT 10;
# MAGIC
# MAGIC -- RESUMO
# MAGIC -- (1) Comando utilizado para limitar o nº de linhas da consulta.
# MAGIC -- (2) Muito utilizado na etapa de exploração dos dados.
# MAGIC -- (3) Muito utilizado em conjunto com o comando ORDER BY quando o que importa são
# MAGIC -- os TOP N. Ex: "N pagamentos mais recentes", "N produtos mais caros".
# MAGIC

# COMMAND ----------

# MAGIC %md
# MAGIC ---
# MAGIC ### EXERCÍCIOS

# COMMAND ----------

# MAGIC %sql
# MAGIC -- (Exercício 1) Selecione os nomes de cidades distintas que existem no estado de
# MAGIC -- Minas Gerais em ordem alfabética (dados da tabela sales.customers)
# MAGIC --SELECT DISTINCT city FROM sales.customers WHERE state = 'MG' ORDER BY city LIMIT 10;
# MAGIC
# MAGIC -- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
# MAGIC -- (dados da tabela sales.funnel)
# MAGIC --SELECT visit_id FROM sales.funnel WHERE paid_date is not null ORDER BY paid_date DESC LIMIT 10;
# MAGIC
# MAGIC
# MAGIC -- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
# MAGIC -- após 01/01/2000 (dados da tabela sales.customers)
# MAGIC SELECT * FROM sales.customers WHERE birth_date >= '2000-01-01' ORDER BY score DESC LIMIT 10;
# MAGIC

# COMMAND ----------


