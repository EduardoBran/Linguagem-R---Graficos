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
# pch    - simbolo no plot
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

# caso queira fazer ajustes em dos parametros, temos a funcao par()
?par
