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

install.packages('plotrix') # permite acessorios personalizados para plotagem
library(plotrix)

?plotrix

# definindo area de plotagem para 1 grafico por imagem e cor vermelho

par(mfrow = c(1,1), col.axis = 'red')

plot(1:6, las = 3, xlab = 'lty 1:6', ylab = '', main = 'Mais opcoes ao plot')
ablineclip(v=1, lty=1, col='sienna2', lwd=8) # adiciona uma linha vertical na posição x = 1 com estilo de linha sólida (lty = 1), cor sienna2 e espessura de linha 2.
ablineclip(v=2, lty=1, col='green3', lwd=2)
ablineclip(v=3, lty=1, col='sienna2', lwd=2)
ablineclip(v=4, lty=1, col='sienna2', lwd=2)
ablineclip(v=5, lty=1, col='sienna2', lwd=2)
ablineclip(v=6, lty=1, col='sienna2', lwd=2)
ablineclip(v=7, lty=1, col='sienna2', lwd=2)


plot(lynx)
plot(lynx, type='p', main='Type p') # grafico com pontos
plot(lynx, type='l', main='Type l') # grafico com linhas (padrao)
plot(lynx, type='b', main='Type b') # grafico com linhas e alguns pontos
plot(lynx, type='o', main='Type o') # grafico com linhas continuas e alguns pontos
plot(lynx, type='h', main='Type h') # grafico com linhas na vertical
plot(lynx, type='s', main='Type s') # grafico com linhas com degraus
plot(lynx, type='n', main='Type n') # limpando completamente o grafico



# Outros exemplos de graficos

# Dois plots juntos

# definindo area de plotagem (define as margens (em unidades de linhas de texto) do gráfico para 4 linhas na parte inferior, 3 linhas à esquerda, 3 linhas na parte superior e 3 linhas à direita. Também define a cor dos rótulos dos eixos como preto.)

par(mar = c(4,3,3,3), col.axis = 'black')


plot(cars$speed, type='s',
     col='red', bty='n',
     xlab='Cars ID', ylab='')
text(8, 14, 'Velocidade', cex=0.85, col='red')

par(new=T)                                                         # A função par(new = TRUE) é usada em conjunto com a função plot() para sobrepor um gráfico existente com um novo gráfico. Quando par(new = TRUE) é definido, o novo gráfico é sobreposto no gráfico anterior em vez de substituí-lo. 

plot(cars$dist, type = 's',
     col='darkblue', bty='n',
     ann=F, axes=F)
axis(side=4)                                                       # Resumindo, ann=F e axes=F são usados para personalizar o gráfico removendo as anotações padrão e os eixos e adicionando eixos personalizados usando a função axis().
text(37, 18, 'Distancia', cex=0.85, col='darkblue')

title(main='Velocidade x Distancia')



# Plots a partir de datasets

df <- read.csv('pibpercap.csv', stringsAsFactors = F)              # Em resumo, o parâmetro stringsAsFactors controla se as colunas de texto em um arquivo de dados devem ser lidas como fatores ou caracteres simples em R.
View(df)

df_1982 <- subset(df, ano == 1982)                                 # A função subset() é usada para extrair uma parte dos dados de um dataframe com base em uma ou mais condições especificadas.
View(df_1982)

plot(expectativa ~ pibpercap, data = df_1982, log = 'x')           #gráfico de dispersão usando a função plot() com a variável expectativa no eixo y e a variável pibpercap no eixo x. A opção data = df_1982 informa que os dados usados para o gráfico são do dataframe df_1982. Além disso, a opção log = 'x' é usada para transformar o eixo x em uma escala logarítmica. Isso significa que a distância entre os valores no eixo x não será uniforme, mas aumentará exponencialmente à medida que nos afastamos da origem.

# Nomeando as colunas

mycol <- c(Asia = 'tomato', Europe = 'chocolate4', Africa = 'dodgerblue2',
           Amercias = 'darkgoldenrod1', Oceania = 'green4')

plot(expectativa ~ pibpercap, data = df_1982, log = 'x', col = mycol[continente])
legend('bottomright', legend = names(mycol), fill = mycol, title = 'Continente')


