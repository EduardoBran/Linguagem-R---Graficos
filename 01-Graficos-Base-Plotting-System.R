# Gráficos em R - Base Plotting System

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()


# Lista de pacotes base carregados
search()


# Demo - funcao que demonstra como utilizar as funcoes de um determinado pacote (nao funciona com todos os pacotes)
demo('graphics')


# Plot Basico

# exemplo 1

x <- 5:7
y <- 8:10
plot(x, y) # cruzar informações de duas variáveis

# exemplo 2

altura <- c(145, 167, 176, 123, 150)
largura <- c(51, 63, 64, 40, 55)

plot(altura, largura)


# Plotando um DataFrame

?lynx # dataframe "lynx" contém duas colunas: "Year" (ano) e "trappings" (armadilhas), com 114 observações para cada variável

plot(lynx)
plot(lynx, ylab = 'Plots com Dataframes', xlab = '')             # adiciona um titulo ao label do eixo y
plot(lynx, ylab = 'Plots com Dataframes', xlab = 'Observações')  # adiciona um titulo ao label do eixo y e x
plot(lynx, main = 'Plots com Dataframes', col = 'red')           # adiciona um titulo e mudar a cor do traço para vermelho

plot(lynx, main = 'Plots com Dataframes', col = 'red', col.main = 52,  cex.main = 1.5) # muda a cor e o tamanho da fonte do titulo


# carregando pacote datasets (para nos exemplos abaixo)

library(datasets) 

# visao geral de histograma e boxplot

hist(warpbreaks$breaks)

airquality
transform(airquality, Month = factor(Month))

boxplot(Ozone ~ Month, airquality, xlab = 'Month', ylab = 'Ozone (ppb)')


# Especificando os parametros que podemos usar em plot(), hist() e boxplot()

# col    - cor do plot
# lty    - tipo de linha
# lwd    - largura da linha
# pch    - valor do simbolo no plot
# xlab   - label no eixo x 
# ylab   - label no eixo y
# las    - como os labels dos eixos sao orientados
# bg     - background color
# mfrow  - numero de plots por linha
# mfcool - numero de plots por coluna 

# Funcoes Basicas de Plot 

# plot()   - scatterplots (graficos de dispersao)
# lines()  - adiciona linhas ao grafico 
# points() - adiciona pontos ao grafico
# text()   - adiciona label ao grafico
# title()  - adiciona titulo ao grafico

# caso queira fazer consultas ou configurar um dos parametros, temos a funcao par()

?par
par()
par('pch')
par('lty')
par('bg')

x = 2:4
y = 1:8

plot(x, pch = 'c') # alterando o valor do simbolo no grafico


# O comando par(mfrow = c(2,2), col.axis = 'red') é usado em R para configurar o layout
# dos gráficos em uma matriz 2x2 e definir a cor dos rótulos dos eixos como vermelha.

# Explicando cada argumento:

# - mfrow é um parâmetro que define o layout dos gráficos que serão criados. No caso de mfrow = c(2,2),
#   isso significa que serão criados quatro gráficos, organizados em uma matriz de duas linhas e duas colunas.
# - col.axis é um parâmetro que define a cor dos rótulos dos eixos dos gráficos.
#   No caso de col.axis = 'red', a cor será vermelha.
# Dessa forma, quando os gráficos forem criados usando funções como plot(),
# eles serão organizados em uma matriz 2x2 e terão rótulos de eixos vermelhos.

par(mfrow = c(2,2), col.axis = 'red') # para retirar essa cong basta clicar na vassoura na area de plotagem abaixo

# Em resumo, o argumento las é usado para controlar a orientação dos rótulos dos eixos nos gráficos
# produzidos pela função plot().

plot(y, las = 0, xlab = 'xlab', ylab = 'ylab', main = 'LAS = 0')
plot(y, las = 1, xlab = 'xlab', ylab = 'ylab', main = 'LAS = 1')
plot(y, las = 2, xlab = 'xlab', ylab = 'ylab', main = 'LAS = 2')
plot(y, las = 3, xlab = 'xlab', ylab = 'ylab', main = 'LAS = 3')

legend('topright', pch = 1, col = c('blue', 'red'), legend = c('Var1', 'Var2')) # só entra no ultimo grafico

par(mfrow = c(1,1)) # voltando a exibir apenas 1 grafico


# Visualizando cores disponiveis das cores que podemos usar na linguagem r
colors()



# Salvando os graficos


# png (quando chamado a funcao png(), ele nao exibe o grafico na area de plotagem e salva direto)

# exemplo1 

png('GraficoIris2.png', width = 1000, height = 1000, res = 100)

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = 'Grafico gerado a partir de Iris')

dev.off() # fecha o dispositivo de graficos


# exemplo2 

png('GraficoAltura.png', width = 1000, height = 1000, res = 100)

times = c('Flamengo', 'Fluminense', 'Vasco', 'Botafogo', 'Avai')
df = data.frame(Altura = c(1.78, 1.82, 1.98, 1.89, 1.69),
                Peso = c(80, 92, 115, 95, 78),
                Times = factor(times, levels = c('Flamengo', 'Fluminense', 'Vasco', 'Botafogo', 'Avai')))

cores <- c('red', 'green4', 'black', 'gray', 'blue')

plot(df$Altura, df$Peso,
     col = cores, # col = df$Time escolhe as cores automaticamente
     pch = 'O',
     main = 'Grafico gerado com altura e peso da média dos times')

legend('topleft',
       legend = levels(df$Time),
       col = cores,  # col = 1:length(levels(df$Time)) - escolhe cores automaticamente
       pch = 'O')

dev.off()


# Salvando em pdf

pdf('GraficoTimesPdf.pdf')

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = 'Grafico gerado a partir de Iris')

dev.off()



# Estendendo as funcoes do plot