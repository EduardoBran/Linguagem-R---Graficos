# Big Data Na Pratica 2 - Limpeza

# Como o Pib e a Desigualdade Social influenciam no crescimento da NetFlix



# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos/BigDataNaPratica_NetFlix")
getwd()



# **************** Script de Carga e Limpeza dos Dados ****************


# Carregando os pacotes

library(dplyr)
library(tidyr)
library(readxl)
library(readr)


# *** Carga dos Dados ***

# Carregando os dados da Netflix
dados_netflix <- read.csv("datasets_originais/dados_netflix_Dec_2021.csv")
View(dados_netflix)

# Carregando os dados do World Bank
dados_pib <- read.csv("datasets_originais/dados_world_bank.csv", header = FALSE) # com header =  false, ele nao transforma em nome de coluna a primeira linha e cria nomeia automaticamente o nome das colunas com V1, V2, V3...
View(dados_pib)

# Carregando os dados de desigualdade salarial
dados_salario <- read.csv("datasets_originais/dados_desigualdade_salarial_harvard.csv")
View(dados_salario)

# Carregando os dados do IMDB
dados_IMDB <- read_tsv("datasets_originais/dados_IMDB.tsv")
View(dados_IMDB)

# Carregando os dados dos top 10 shows da NetFlix por país
dados_top10 <- read_excel("datasets_originais/top_10_shows_netflix.xlsx")
View(dados_top10)

# Carregando dados de assinantes da Netflix em Julho/2021
dados_sub <- read.csv("datasets_originais/assinantes_netflix_jul_2021.csv")
View(dados_sub)

# Carregando os dados de códigos ISO dos países
countrycode <- read.csv("datasets_originais/wikipedia-iso-country-codes.csv")
View(countrycode)





