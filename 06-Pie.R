# Gráficos em R - Pizza

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()


# Pie chart (gráfico de pizza) é um tipo de gráfico que apresenta dados em formato circular, no qual cada categoria e
# representada por uma fatia da pizza proporcional ao valor absoluto ou relativo daquela categoria em relação ao total.

# Na linguagem R, é possível criar um gráfico de pizza com a função pie().

?pie

# Criando as fatias
fatias = c(40, 20, 40)

# Nomeando os labels
paises <- c('Brasil', 'Argentina', 'Chile')

# Unindo paises e fatias
paises <- paste(paises, fatias) # sep = ' '
paises

# Incluindo mais detalhes no label
paises <- paste(paises, '%', sep = '')
paises

# cores
colors()
cores <- c('darksalmon', 'gainsboro', 'lemonchiffon4')

# Construindo o grafico (labels representam cada fatia)
pie(fatias, labels = paises, col = cores, main = 'Distribuicao de Vendas')



# Trabalhando com dataframes 1

# Exemplo 1
View(iris)

# A função table() é usada na linguagem R para contar a frequência com que valores ocorrem em um vetor, ou combinações de 
# valores em vários vetores. Exemplo: no df iris ele vai mostra quais Especies tem em Species e a quantidade que aparecem

Values <- table(iris$Species)
View(Values)

labels <- paste(names(Values)) # pegando atraves da funcao names() os nomes dos vetores encontrado acima
View(labels)

pie(Values, labels = labels, main = 'Distribuicao de Especies')


# Exemplo 2
View(ChickWeight)

Values2 <- table(ChickWeight$Diet)
View(Values2)

names(Values2) <- c('Dieta 1', 'Dieta 2', 'Dieta 3', 'Dieta 4')
View(Values2)

labels2 <- paste(names(Values2))
View(labels2)

pie(Values2, labels = labels2, col = rainbow(length(labels2)), main = 'Distribuicao das Dietas usadas')



# 3D (explosa e a divisao entre as fatias)
install.packages('plotrix')
library(plotrix)

pie3D(fatias, labels = paises, explode = 0.05,
      col = cores, main = 'Distribuicao de Vendas')

pie3D(Values, labels = labels, explode = 0.10,
      col = cores, main = 'Distribuicao de Especies')

pie3D(Values2, labels = labels2, explode = 0.45,
      col = rainbow(length(labels2)), main = 'Distribuicao das Dietas usadas')


# Exemplo simples

# Neste exemplo, o argumento dados representa os valores absolutos de cada categoria, nomes é um vetor de 
# caracteres com os nomes de cada categoria e col é um vetor de cores que pode ser definido manualmente ou
# usando a função rainbow() para gerar cores em sequência.

# Dados para o gráfico de pizza
dados <- c(20, 30, 50)

# Nomes das categorias
nomes <- c("Categoria 1", "Categoria 2", "Categoria 3")

# Definindo as cores
cores <- c('steelblue1', 'tan3', 'seagreen3')

# Criar grafico de pizza usando as cores do vetor criado
pie(dados, labels = nomes, col = cores)

# Criar gráfico de pizza usando a funcao rainbow()
pie(dados, labels = nomes, col = rainbow(length(dados)))

