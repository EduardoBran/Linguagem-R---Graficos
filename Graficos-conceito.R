# Grafico Explicacao / Exemplos

setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()

# carregando pacotes
library(ggplot2)
library(lattice)


# *** Gráfico de dispersão (Scatter plot): ***
  
# - É um grafico que representa a relação entre duas variáveis numéricas. O eixo x é usado para representar uma variável,
#   enquanto o eixo y é usado para representar a outra variável. Cada ponto no gráfico representa uma observação e sua
#   posição no gráfico mostra a relação entre as duas variáveis.

# Exemplo: Vamos criar um gráfico de dispersão para visualizar a relação entre altura e peso de algumas pessoas:

altura <- c(165, 170, 168, 172, 175, 180, 182, 185, 190, 175, 185)
peso <- c(60, 68, 62, 75, 80, 85, 90, 95, 100, 85, 95)
dados <- data.frame(altura = altura, peso = peso)

# criar gráfico simples de dispersão
plot(dados$altura, dados$peso, main = "Altura vs Peso", xlab = "Altura (cm)", ylab = "Peso (kg)")

# com ggplot
ggplot(data = dados, aes(x = altura, y = peso)) +
  geom_point() +
  labs(title = "Altura vs Peso", x = 'Altura (cm)', y = 'Peso (kg)')

# com lattice
xyplot(data = dados, peso ~ altura, 
       main = "Altura vs Peso",
       xlab = "Altura (cm)", ylab = "Peso (kg)",
       pch = 16, col = "blue")




# *** Gráfico de barras (Bar plot) ***


# - É um grafico que representa a distribuição de uma variável categórica. O eixo x é usado para representar as categorias
#   e o eixo y é usado para representar a contagem ou proporção de cada categoria.

# Exemplo: Vamos criar um gráfico de barras para visualizar a quantidade de vendas por produto:

produtos <- c("Produto A", "Produto B", "Produto C", "Produto D")
vendas <- c(200, 350, 150, 250)
dados2 <- data.frame(produtos = produtos, vendas = vendas)

# criar simples gráfico de barras
barplot(dados2$vendas, names.arg = dados2$produtos, main = "Vendas por Produto", xlab = "Produtos", ylab = "Vendas")

# com ggplot
ggplot(data = dados2, aes(x = produtos, y = vendas, fill = produtos)) +
  geom_bar(stat = "identity") +
  labs(title = "Vendas por Produto", x = "Produtos", y = "Vendas")

# com lattice
barchart(vendas ~ produtos, data = dados2,
         main = "Vendas por Produto",
         xlab = "Produtos", ylab = "Vendas",
         col = c("red", "green", "blue", "yellow"))




# *** Gráfico de linhas (Line plot) ***


# - É um gráfico que representa a relação entre duas variáveis numéricas ao longo do tempo. O eixo x é usado para representar
#   o tempo e o eixo y é usado para representar a outra variável. Uma linha é desenhada conectando cada ponto no gráfico. 

# Exemplo: Vamos criar um gráfico de linhas para visualizar a evolução das vendas ao longo do tempo:

# criar dados de exemplo
meses <- c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez")
vendas_loja <- c(15000, 17500, 20000, 18500, 22000, 25000, 28000, 30000, 26500, 31000, 35000, 40000)

dados_vendas <- data.frame(Meses = meses, Vendas_Loja = vendas_loja)

# criar gráfico de linhas simples
plot(dados_vendas$Vendas_Loja ~ factor(dados_vendas$Meses, level = meses), type = "o", col = "blue",
     main = "Evolução das vendas da loja", xlab = "Mês", ylab = "Vendas")

# com ggplot
ggplot(data = dados_vendas, aes(x = Meses, y = Vendas_Loja, group = 1)) + 
  geom_line(color = "blue") +
  geom_point(color = "blue") +
  labs(title = "Evolução das vendas da loja", x = "Mês", y = "Vendas") +
  scale_x_discrete(limits = meses) +
  scale_y_continuous(limits = c(0, 40000), breaks = seq(0, 40000, by = 10000))

# com lattice
xyplot(data = dados_vendas, Vendas_Loja ~ factor(dados_vendas$Meses, level = meses), 
       type = c("o", "p"), col.line = "blue", col.symbol = "blue",
       xlab = "Mês", ylab = "Vendas",
       scales = list(x = list(at = 1:12, labels = meses),
                     y = list(at = seq(0, 40000, by = 10000), labels = seq(0, 40000, by = 10000))),
       ylim = c(0, 40000),
       main = "Evolução das vendas da loja")




# *** Gráfico de caixa (Box plot) ***


# - É um grafico que representa a distribuição de uma variável numérica. O gráfico mostra a mediana, os quartis e os
#   outliers da distribuição.

# criando dados
set.seed(123) # definindo semente aleatória para reproduzibilidade
altura_homens <- rnorm(100, mean = 175, sd = 7) # altura de 100 homens com média de 175cm e desvio padrão de 7cm
altura_mulheres <- rnorm(100, mean = 162, sd = 6) # altura de 100 mulheres com média de 162cm e desvio padrão de 6cm
altura <- c(altura_homens, altura_mulheres) # combinando alturas de homens e mulheres em um único vetor
genero <- factor(rep(c("Homens", "Mulheres"), each = 100)) # criando um fator para indicar o gênero

dados_altura <- data.frame(Altura = altura, Genero = genero)

# criar grafico de caixa simples
boxplot(data = dados_altura, Altura ~ Genero, col = c("blue", "pink"),
        main = "Altura de Homens e Mulheres", xlab = "Gênero", ylab = "Altura (cm)")

# com ggplot
ggplot(data = dados_altura, aes(x = Genero, y = Altura, fill = Genero)) +
  geom_boxplot() +
  labs(title = "Altura de Homens e Mulheres", x = "Gênero", y = "Altura (cm)") +
  scale_fill_manual(values = c("blue", "pink"))

# com lattice
bwplot(data = dados_altura, Altura ~ Genero, 
       scales = list(y = list(relation = "free")), 
       xlab = "Gênero", ylab = "Altura (cm)", 
       main = "Altura de Homens e Mulheres",
       col = c("blue", "pink"))

