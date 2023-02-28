# Gráficos em R - Boxplots

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()


# Boxplots (ou gráficos de caixa) são uma forma gráfica de apresentar a distribuição de um conjunto de dados numéricos
# por meio de cinco estatísticas: valor mínimo, primeiro quartil (Q1), mediana, terceiro quartil (Q3) e valor máximo.

# Na linguagem R, o boxplot pode ser criado usando a função boxplot(). A caixa do gráfico é desenhada a partir dos
# valores do primeiro e terceiro quartis, enquanto a linha vertical dentro da caixa representa a mediana.
# Os "bigodes" (ou "whiskers") estendem-se desde a caixa até o valor mínimo e máximo que estão dentro de um intervalo
# específico, que é calculado usando uma medida de variabilidade (como o desvio padrão ou a amplitude interquartil).
# Os pontos individuais que estão fora desse intervalo são marcados como outliers.

# Os boxplots são úteis para comparar a distribuição de um conjunto de dados entre diferentes grupos ou variáveis.
# Eles permitem identificar a presença de outliers, a assimetria da distribuição e a presença de valores extremos.
# Além disso, os boxplots podem ser personalizados com diferentes opções, como cores e escalas de eixos,
# para tornar a visualização mais informativa e atraente.


?boxplot
?sleep

# "sleep" é um conjunto de dados já presente no R. O conjunto de dados "sleep" 
# contém informações sobre o efeito de dois tratamentos em dez pacientes sobre a duração do sono.
# A variável "extra" representa o tempo adicional que o paciente dormiu em relação ao tempo que leva para adormecer. 

# Permite utilizar as colunas sem especificar o nome do dataset
# Dessa forma podemos acessar os dados da variavel 'extra' do df 'sleep' apenas digitando 'extra' ao inves de 'sleep$extra'
attach(sleep)

# remove o efeito do attach acima
detach("sleep")
View(sleep)

# Construcao do boxplot (com o efeito attach ativado com 'sleep', nao precisaria colocar 'data = sleep')
# A variável "extra" do dataframe "sleep" é especificada como a variável dependente a ser exibida no eixo y,
# e a variável "group" é especificada como a variável independente a ser exibida no eixo x.
# A linha preta dentro de cada box do representa a mediana. A linha acima o valor mais alto e a linha abaixo o valor mais baixo.

sleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = 'Duracao do Sono',
                       col.main = 'red', ylab = 'Horas', xlab = 'Droga')

# Calculo da media

medias = by(extra, group, mean) # sem efeito attach ficaria by(sleep$extra, sleep$group, mean)
medias

# Adicina valores da media ao grafico

points(medias, col = 'red')
sleepboxplot



# Criando Boxplot na horizontal


horizontalsleepboxplot = boxplot(data = sleep, extra ~ group,
                       main = 'Duracao do Sono',
                       col.main = 'red', ylab = 'Droga', xlab = 'Horas',
                       horizontal = T)

# Adicionando cores

horizontalsleepboxplot = boxplot(data = sleep, extra ~ group,
                                 main = 'Duracao do Sono',
                                 col.main = 'red', ylab = 'Droga', xlab = 'Horas',
                                 horizontal = T, col = c('blue', 'red'))

points(medias, col = 'green')
horizontalsleepboxplot




# Adicionando o valor numerico das medias no boxplot horizontal

# outra forma de calcular a media (aqui e salva em forma de array)
medias <- tapply(sleep$extra, sleep$group, mean)
medias

# criando plot

horizontalsleepboxplot = boxplot(data = sleep, extra ~ group,
                                 main = 'Duracao do Sono',
                                 col.main = 'red', ylab = 'Droga', xlab = 'Horas',
                                 horizontal = T, col = c('blue', 'red'))

points(medias, col = 'green3')
horizontalsleepboxplot

# adiciona o valor numerico no grafico 
text(medias, 1:length(medias), round(medias, 2), pos = 4)

# adiciona legenda
legend(-1.5,2, legend = 'Media', pch = 'o',
       col = 'green3', cex = 0.75)

png('GraficoBoxPlotSleep.png', width = 1500, height = 1000, res = 100)

dev.off() # fecha o dispositivo de graficos


