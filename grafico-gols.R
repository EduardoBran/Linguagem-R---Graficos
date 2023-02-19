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


