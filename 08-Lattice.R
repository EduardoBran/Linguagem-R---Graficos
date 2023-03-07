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
# - O argumento data indica que os dados utilizados são aqueles do objeto Titanic, que é um conjunto de dados disponível no pacote datasets do R.
# - O argumento Class ~ Freq indica que a variável de classe (Class) é representada no eixo x e a variável de frequência (Freq) é representada no eixo y.
# - O operador | separa as variáveis do eixo x de acordo com os valores de outras variáveis. Neste caso, as variáveis Sex e Age são
#   usadas para separar as barras no eixo x.
# - O argumento groups indica que as barras empilhadas são separadas de acordo com os valores da variável Survived, que representa se
#   o passageiro sobreviveu ou não ao naufrágio.
# - O argumento stack indica que as barras devem ser empilhadas uma em cima da outra.
# - O argumento layout indica que as barras devem ser organizadas em um layout com 4 linhas e 1 coluna.
# - O argumento auto.key indica que o gráfico deve incluir uma legenda automática, com o título "Dados Titanic" e duas colunas.

barchart(data = as.data.frame(Titanic), Class ~ Freq | Sex + Age, 
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = 'Dados Titanic', columns =2))
