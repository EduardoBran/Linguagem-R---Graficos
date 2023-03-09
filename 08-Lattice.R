# Explorando o Lattice

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()

# Descricao

# O pacote Lattice é um sistema de visualizacao de dados de alto nivel poderoso e
# elegante, com enfase em dados multivariados

# Na criacao de graficos, condicoes e agrupamentos sao 2 conceitos importantes, que nos permitem
# compreender mais facilmente os dados que temos em maos. O conceito por tras do Lattice é agrupar
# os dados e criar visualizacoes de forma que fique mais facil a busca por padroes.

# Seu objetivo é criar graficos e identificar rapidamente padroes

# Instalando e carregando o pacote
install.packages('lattice')
library(lattice)


# Scatterplot (grafico de dispersao) com Lattice

# - O grafico de dispersao de Sepal.Length em relacao a Petal.Length dos dados do conjunto de dados iris. Os pontos sao
#   agrupados por espécies (Species), identificadas por cores diferentes.
# - O eixo x representa o comprimento da petala (Petal.Length) e o eixo y representa o comprimento da sepala (Sepal.Length).
#   A relacao entre essas duas variaveis é exibida para cada especie de íris em um painel separado.
# - A funcao groups é usada para especificar a variavel que deve ser usada para agrupar os dados em diferentes conjuntos de pontos de 
#   cores diferentes. A sintaxe Sepal.Length ~ Petal.Length é usada para especificar que Sepal.Length deve ser plotado no eixo y e Petal.Length deve ser plotado no eixo x.

xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length)

# Colocando legenda. O argumento "auto.key" é usado para criar uma legenda automática para os grupos definidos pelo argumento "groups". No caso, a legenda é configurada com três colunas ("columns = 3") e o título "Species" ("title = 'Species'").

xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length, auto.key = list(colums = 3, title = 'Species'))



# *** Barplots com dataset Titanic ***

?Titanic              # A coluna Freq indica o número de passageiros que possuem as mesmas características em cada linha do dataset.
View(Titanic)         # Por exemplo, na primeira linha não há passageiros do sexo masculino, de classe 1st, com idade infantil e que não sobreviveram. Já a última linha representa a contagem de passageiras do sexo feminino que faziam parte da equipe (Crew), eram adultas e sobreviveram.


# - Grafico de barras empilhadas (stacked bar chart) usando os dados do Titanic.
# - O argumento data indica que os dados utilizados são aqueles do objeto Titanic, que é um conjunto de dados disponível no pacote datasets do R. (Foi usado o as.data.frame para transformar o Titanic (que é da class table) em dataframe)
# - O argumento Class ~ Freq indica que a variável de classe (Class) é representada no eixo x e a variável de frequência (Freq) é representada no eixo y.
# - O operador | separa as variáveis do eixo x de acordo com os valores de outras variáveis. Neste caso, as variáveis Sex e Age são
#   usadas para separar as barras no eixo x.
# - O argumento groups indica que as barras empilhadas são separadas de acordo com os valores da variável Survived, que representa se
#   o passageiro sobreviveu ou não ao naufrágio.
# - O argumento stack indica que as barras devem ser empilhadas uma em cima da outra.
# - O argumento layout indica que as barras devem ser organizadas em um layout com 4 linhas em 1 coluna.
# - O argumento auto.key indica que o gráfico deve incluir uma legenda automática, com o título "Dados Titanic" em duas colunas.
# - O argumento sclaes ajusta a escala para cada coluna

barchart(data = as.data.frame(Titanic), Class ~ Freq | Sex + Age, 
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = 'Titanic (Survived)', columns = 2))

barchart(data = as.data.frame(Titanic), Class ~ Freq | Sex + Age, 
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = 'Titanic (Survived)', columns = 2),
         scales = list(x = 'free'))

# com ggplot2
ggplot(data = as.data.frame(Titanic)) +
  geom_bar(aes(x = Class, y = Freq, fill = Survived),
           stat = 'identity', position = 'stack') +
  facet_grid(Sex ~ Age, scales = 'free', switch = 'y') +
  labs(title = 'Titanic (Survived)', x = 'Class', y = 'Freq') +
  theme_bw()
    

# exemplo com tips
barchart(data = tips, time ~ tip | sex,
         groups = time, stack = F,
         auto.key = list(title = 'Dados Restaurante', columns = 2))

barchart(data = tips, time ~ tip | sex + smoker,
         groups = time, stack = F, layout = c(4, 1),
         auto.key = list(title = 'Dados Restaurante', columns = 2),
         scales = list(x = 'free'))



# Contagem de elementos (dataset iris)

PetalGrupo <- equal.count(iris$Petal.Length, 4) # equal.count divide a coluna em 6 grupos por padrao (aqui 4)
PetalGrupo

# Scatterplots (grafico de dispersao)
# O grafico é dividido em 4 paineis, um para cada grupo gerado pela função "equal.count()". Em cada painel, são exibidos os pontos que
# correspondem às observações do conjunto de dados "iris" que pertencem ao grupo correspondente. Isso permite visualizar a relação entre
# as variáveis "Sepal.Length" e "Sepal.Width" dentro de cada grupo de tamanho igual de "Petal.Length". 
# A legenda acima de cada painel indica o intervalo de valores de "Petal.Length" correspondente ao grupo.

xyplot(data = iris, Sepal.Length ~ Sepal.Width | PetalGrupo)

# com grid
xyplot(data = iris, Sepal.Length ~ Sepal.Width | PetalGrupo,
       panel = function(...) {
         panel.grid(h = -1, v = -1, col.line = 'skyblue')
         panel.xyplot(...)
       })

# com modelo de regressao
xyplot(data = iris, Sepal.Length ~ Sepal.Width | PetalGrupo,
       panel = function(x,y,...) {
         panel.xyplot(x,y,...)
         mylm <- lm(y ~ x)
         panel.abline(mylm)
       })


# Histograma

# - histograma criado usando df "iris", e contem medidas de comprimento e largura de petalas e sepalas de 3 especies de íris.
# - O parametro "~Sepal.Length | Species" especifica que o histograma deve ser criado para a variável Sepal.Length, dividida por espécies. Ou seja, serão criados três histogramas, um para cada espécie de íris.
# - O parametro "xlab = ''" é utilizado para remover o rótulo do eixo x do gráfico. O parâmetro "type = 'density'"
#   é utilizado para exibir as densidades em vez das frequências no eixo y.
# - O parametro "layout=c(3,1)" define o layout do gráfico, que terá três painéis na vertical e um na horizontal.
# - O parametro "main = 'Histograma Lattice'" é utilizado para definir o título principal do gráfico. O parâmetro "sub = 'Iris Dataset, Sepal Length'" é utilizado para definir um subtítulo.

histogram(data = iris, ~Sepal.Length | Species,
          xlab = "", type = "density", layout=c(3,1),
          main = "Histograma Lattice", sub = "Iris Dataset, Sepal Length")


# Distribuicao dos Dados
qqmath(data = iris, ~ Sepal.Length | Species, distribution = qunif)


# Boxplot
bwplot(data = iris, Species~Sepal.Length)


# ViolinPlot
bwplot(data = iris, Species~Sepal.Length, panel = panel.violin)


View(iris)



tipsLength <- equal.count(tips$tip, 50)
tipsLength
