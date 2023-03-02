# Gráficos em R - Bar Plots (Grafico de Barras)

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()

# Eles representam informações através de barras retangulares horizontais ou verticais, onde a altura ou comprimento
# das barras é proporcional ao valor que está sendo representado. Cada barra representa uma categoria específica
# e a largura da barra pode ser ajustada de acordo com as preferências do usuário.

# Os gráficos de barra são frequentemente usados para visualizar contagens, frequências ou proporções de uma variável
# categórica em particular. Eles podem ser criados usando a função "barplot" no R. Além disso, as barras podem ser
# preenchidas com diferentes cores para representar diferentes categorias ou níveis de uma variável categórica.


?barplot


# Preparando os dados - exemplo com numero de casamentos em uma igreja de SP
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67),
                nrow = 3, ncol = 4, byrow = T)
dados

# Nomeando linhas e colunas da matriz acima
colnames(dados) <- c('0', '1-150', '151-300', '>300')
rownames(dados) <- c('Jovem', 'Adulto', 'Idoso')
dados
View(dados)


# Construindo o Barplot
barplot(dados)
barplot(dados, beside = T)


# Construindo o plot - Stacked Bar Plot (grafico de barras empilhado, onde cada barra contem informacao)
# As 3 faixas de idade sao representadas na mesma coluna para as diferentes quantidades
barplot(dados, col = c('steelblue1', 'tan3', 'seagreen3'))

# Colocando legenda

# Forma 1 (pch e o simbolo da legenda)
barplot(dados, col = c('steelblue1', 'tan3', 'seagreen3'))
legend('topright', legend = c('Jovem', 'Adulto', 'Idoso'),
       col = c('steelblue1', 'tan3', 'seagreen3'), pch = 1)

# Forma 2 (fill ja coloca um quadrado, nao precisa do pch)
barplot(dados, col = c('steelblue1', 'tan3', 'seagreen3'))
legend('topright', legend = rownames(dados), fill = c('steelblue1', 'tan3', 'seagreen3'))

# Forma 3 (colocando a legenda direto no barplot)
barplot(dados, col = c('steelblue1', 'tan3', 'seagreen3'),
        beside = T, legend.text = c('Jovem', 'Adulto', 'Idoso'))

# Forma 4 (colocando a legenda direto no barplot utilizando rownames)
barplot(dados, col = c('steelblue1', 'tan3', 'seagreen3'),
        beside = T, legend.text = rownames(dados),
        xlab = 'xlab', ylab = 'ylab')

# Com a Transposta da Matriz, invertemos as posicoes entre faixa etaria e faixa de quantidade
# funcao t() de transposta (convertemos linha em coluna e coluna em linha)
t(dados)

barplot(t(dados), beside = T, col = c('steelblue1', 'tan3', 'seagreen3', 'peachpuff1'))
legend('topright', legend = rownames(t(dados)), fill = c('steelblue1', 'tan3', 'seagreen3', 'peachpuff1'))


# *** Outros exemplos ***

# Grafico de barra que mostra o comprimento medio das petalas (em centimetros) por especie
# para as flores no conjunto de dados "iris". O grafico usa as cores definidas no vetor "cores" e inclui
# uma legenda que identifica cada espécie correspondente à cor correspondente.

# Carregar o conjunto de dados "iris"
data(iris)

# Criar um vetor de cores para o gráfico
cores <- c("#F8766D", "#00BA38", "#619CFF")

# Criar um gráfico de barra da média do comprimento das pétalas (Petal.Length) por espécie
barplot(tapply(iris$Petal.Length, iris$Species, mean),
        xlab = "Espécie", ylab = "Comprimento médio da pétala (cm)",
        main = "Comprimento médio da pétala por espécie (Petal.Length)",
        col = cores)

# Adicionar uma legenda
legend(0.15, 5, legend = levels(iris$Species), fill = cores)


# Exemplo 2

df_altura <- data.frame(altura = c(1.92, 1.68, 1.82, 1.55, 1.75, 1.61, 1.88, 1.60, 1.79, 1.59),
                        genero = rep(c('Homem', 'Mulher'), 5))
View(df_altura)

cores_altura <- c('blue', 'pink')

# Criar um gráfico de barra da média do comprimento de altura de homens x mulheres
# ylim modifica os valores do eixo Y

ylim <- c(0.0, 2.2)

media_homem <- tapply(df_altura$altura, df_altura$genero, mean)['Homem']
media_homem <- as.numeric(media_homem)
media_homem <- round(media_homem, 2)
media_homem

media_mulher <-  tapply(df_altura$altura, df_altura$genero, mean)['Mulher']
media_mulher <- as.numeric(media_mulher)
media_mulher <- round(media_mulher, 2)
media_mulher

barplot(tapply(df_altura$altura, df_altura$genero, mean),
        xlab = 'Genero', ylab = 'Altura media',
        main = 'Comprimento medio da altura por genero',
        col = cores_altura,
        ylim = ylim)

legend('topright', legend = c('Homem', 'Mulher'), fill = cores_altura, cex = 0.75)

text(x = 0.7, y = .9, labels = media_homem, col = 'white', cex = 2)
text(x = 1.9, y = .8, labels = media_mulher, col = 'white', cex = 2)

png('GraficoBarPlotCasamentoIgrejaTransposta.png', width = 1500, height = 1000, res = 100)

dev.off() # fecha o dispositivo de graficos
  
