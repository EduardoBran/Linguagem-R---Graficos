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
