# Gráfico com maiores goleadores de 2016 a 2021

# Configurando Diretorio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/3.Linguagem-R-Fatores-Estruturas-de-Controle-e-Funcoes")
getwd()


# Criação do conjunto de dados

jogadores <- c("Lionel Messi", "Cristiano Ronaldo", "Luis Suárez", "Robert Lewandowski", "Zlatan Ibrahimovic")
gols <- c(404, 399, 284, 273, 250)

df <- data.frame(Jogador = jogadores,
                 Gols = gols)

View(df)

# Reordenando os jogadores de acordo com a quantidade de gols

df$Jogador <- reorder(df$Jogador, -df$Gols)


# Criação do gráfico de barras

library(ggplot2)

ggplot(df, aes(x = Jogador, y = Gols, fill = Jogador)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Gols), vjust = -0.5, size = 3.5) +
  labs(title = "Maiores artilheiros do futebol mundial nos últimos 10 anos",
       x = 'Jogador',
       y = 'Gols',
       fill = 'Jogador') +
  theme_classic()


# Criando um data frame com os dados de gols do Messi entre os anos de 2010 e 2020

# Criando um data frame com os dados de gols do Messi

library(tidyverse)

messi_gols <- tibble(
  Ano = c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020),
  Gols = c(60, 59, 91, 45, 58, 52, 59, 54, 51, 45, 31)
)

View(messi_gols)


# Criando o gráfico de pizza com os dados de gols do Messi

messi_gols %>%
  ggplot(aes(x = "", y = Gols, fill = factor(Ano))) +
  geom_bar(width = 1, stat = "identity") +
  geom_text(aes(label = Gols), position = position_stack(vjust = 0.5), color = "black", size = 4.5) +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Set3") +
  theme_void() +
  labs(title = "Gols de Lionel Messi entre 2010 e 2020", fill = "Ano")


# Criando o gráfico de barras com os dados de gols do Messi

messi_gols %>%
  ggplot(aes(x = Ano, y = Gols)) +
  geom_col(fill = "blue") +
  geom_text(aes(label = Gols), vjust = -1) +
  scale_x_continuous(breaks = seq(2010, 2020, 1)) + # exibir os anos como inteiros, sem a parte decimal, você pode utilizar a função scale_x_continuous() e especificar o argumento breaks com os valores desejados para o eixo x
  labs(title = "Gols de Lionel Messi entre 2010 e 2020", x = "Ano", y = "Gols")



# Gráfico de barras com a quantidade de jogos, gols e assistências do ano de 2015

# criando o dataframe com os dados dos jogadores

jogadores <- data.frame(
  nome = c("Lionel Messi", "C. Ronaldo", "R. Lewandowski", "Neymar", "Z. Ibrahimovic", "L. Suarez", "E. Cavani"),
  jogos = c(38, 36, 31, 34, 31, 43, 31),
  gols = c(41, 48, 30, 24, 19, 40, 19),
  assistencias = c(19, 16, 3, 15, 9, 16, 6)
)

View(jogadores)

# carregando o pacote ggplot2
library(ggplot2)

# criando o gráfico de barras

ggplot(jogadores, aes(x = nome)) +
  geom_bar(aes(y = jogos, fill = "Jogos"), alpha = 0.5, stat="identity", position="dodge") +
  geom_bar(aes(y = gols, fill = "Gols"), alpha = 0.5, stat="identity", position="dodge") +
  geom_bar(aes(y = assistencias, fill = "Assistências"), alpha = 0.5, stat="identity", position="dodge") +
  scale_fill_manual(values = c("Jogos" = "blue", "Gols" = "red", "Assistências" = "green")) +
  labs(title = "Desempenho dos jogadores em 2015", x = "Jogador", y = "Quantidade") +
  scale_y_continuous(limits = c(0, 50), expand = c(0, 0.1), breaks = seq(0, 50, by = 10)) +
  theme_bw()

