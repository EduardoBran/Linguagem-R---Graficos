# Gráficos em R - Histogramas

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()


# Os histogramas mostram a frequência com que os valores de um conjunto de dados aparecem em determinados 
# intervalos de classe. Na linguagem R, os histogramas podem ser criados usando a função hist().

# A função hist() divide o intervalo dos dados em um número especificado de intervalos e conta o número de observações
# que caem em cada intervalo. O número de intervalos padrão é de 10, mas pode ser alterado especificando o argumento
# breaks na função hist(). Além disso, a largura dos intervalos também pode ser modificada especificando o argumento width.

# O gráfico resultante consiste em barras verticais que representam a frequência das observações em cada intervalo de classe.
# Os eixos x e y mostram os valores dos dados e as frequências, respectivamente.

# Os histogramas são úteis para entender a distribuição de um conjunto de dados contínuos, permitindo identificar valores
# atípicos (outliers), determinar se os dados estão normalmente distribuídos e comparar a distribuição de diferentes
# conjuntos de dados.



# Definindo os dados a serem usados neste exemplo

# cars contém informações sobre a velocidade (em milhas por hora) e a distância necessária para parar (em pés) para 50 carros diferentes.

View(cars)
dados = cars$speed

# Construindo um histograma

?hist
hist(dados) # aqui ele pegou os dados da variavel speed e as dividiu em classes(classe de 0 a 5, 5 a 10, 10 a 15, 15 a 20 e 20 a 25 na horizontal e na vertical a quantidade de frequencia que aparecerao esses resultados)

# aqui foi adicionado mais uma linha com no df cars e vai aparecer mais uma classe com 25 a 30

cars_novo <- cars
cars_novo <- rbind(cars_novo, c(27, 598))

View(cars_novo)  

dados2 = cars_novo$speed
hist(dados2)


# Conforme consta no help, o parameto breaks pode ser um dis itens abaixo:
# - um vetor para os pontos de quebra entre as celulas do histograma
# - uma funcao para calcular o vetor dos breakpoints
# - um unico numero que representa o numero de celulas para o histograma
# - uma cadeia de caracteres que nomeia um algoritmo para calcular o numero de cedulas
# - uma funcao para calcular o numero de celulas

# histograma com 10 breaks (10 caixinhas)
hist(dados, breaks = 10, main = 'Histograma das Velocidades')
hist(dados2, breaks = 5, main = 'Histograma das Velocidades')

# utilizando um vetor de tamanho para os breaks e labels(que é o total de frequencia de cada uma das classes)
hist(dados, labels = T, breaks = c(0,5,10,15,20,25), main = 'Histograma das Velocidades')
hist(dados, labels = T, breaks = c(0,5,10,20,30), main = 'Histograma das Velocidades')

# histograma com 10 breaks (10 caixinhas) com label
hist(dados, labels = T, breaks = 10, main = 'Histograma das Velocidades')
hist(dados2, labels = T, breaks = 5, main = 'Histograma das Velocidades')

# histograma com 10 breaks (10 caixinhas) com label e com limite de tamanho para o eixo y (frequencia)
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = 'Histograma das Velocidades')
hist(dados2, labels = T, ylim = c(0,20), breaks = 5, main = 'Histograma das Velocidades')



# Adicionando linhas ao histograma


grafico <- hist(dados, breaks = 10, main = 'Histograma das Velocidades')
grafico

# criando os dados para adicionar uma linha com a distribuicao normal desse conjunto de dados
# e assim comparar em um unico grafico a distribuicao de frequencias e tambem a distribuicao normal

xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis * diff(grafico$mids) * length(dados)

lines(xaxis, yaxis, col = 'red')

png('GraficoHistogramaCars.png', width = 1500, height = 1000, res = 100)

dev.off() # fecha o dispositivo de graficos

