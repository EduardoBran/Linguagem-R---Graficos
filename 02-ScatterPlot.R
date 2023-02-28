# Gráficos em R - Scatterplots

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()


# Scatterplots são um tipo de gráfico de dispersão bidimensional que é usado para visualizar a relação entre duas
# variáveis numéricas em um conjunto de dados. Na linguagem R, a função plot() é usada para criar scatterplots.

# Um scatterplot é formado por uma coleção de pontos, onde cada ponto representa uma observação nos dados.
# O eixo horizontal do gráfico é usado para representar uma variável, enquanto o eixo vertical é usado para
# representar a outra variável. Cada ponto no gráfico é posicionado de acordo com os valores correspondentes nas duas variáveis.

# Os scatterplots são úteis para identificar padrões e relações entre duas variáveis. Eles podem ser usados
# para detectar a existência de uma relação linear ou não-linear entre as variáveis, bem como para identificar
# valores extremos (outliers) ou agrupamentos de observações (clusters).

# Na linguagem R, os scatterplots podem ser personalizados com diferentes opções, como cores, 
# tamanhos de pontos e escalas de eixos, para tornar a visualização mais informativa e atraente.



# Definindo os dados

# o set.seed(67) é uma forma de produzir sempre os mesmos dados aleatorios (uma forma de compartilhar seu trabalho)
# com o set.seed(67) mesmo usando funcao que produzem numeros aleoatorios, eles sempre terao o mesmo valor toda vez q rodar o script

set.seed(67)
x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)

# Criar o plot

plot(x, y, col = 'green3', pch = 10, main = 'Multi Scatterplot',
     col.main = 'red', cex.main = 1.5,
     xlab = 'Variavel Independente', ylab = 'Variavel Dependente')

# Adiciona outros dados
points(z, t, col = 'blue', pch = 4)

# Adiciona mais dados
points(y, t, col = 777, pch = 9)

# Adiciona legenda

legend(-6, 5.9, legend = c('Nivel 1', 'Nivel 2', 'Nivel 3'),
       col = c('green3', 'blue', 777), pch = c(10,4,9),
       cex = 0.75, bty = 'n')




# exemplo com 4 casas com preco e numero de quartos (preco seria variavel dependente e n de quartos independente)

# criar dataframe com 2 colunas e 4 linhas
df_valor_casas <- data.frame(matrix(ncol = 2, nrow = 4))
View(df_valor_casas)

# renomear as colunas
colnames(df_valor_casas) <- c('Preco', 'N de Quartos')
rownames(df_valor_casas) <- c('Casa 1', 'Casa 2', 'Casa 3', 'Casa 4')

# atribuindo valores
df_valor_casas$Preco <- c(780, 572, 859, 950)
df_valor_casas$`N de Quartos` <- c(3, 2, 4, 5)

# criando direto na funcao
df_valor_casas2 <- data.frame(Preco = c(572, 780, 859, 950),
                              `N de Quartos` = c('2', '3', '4', '5'),
                               row.names = c('Casa 1', 'Casa 2', 'Casa 3', 'Casa 4'))

# criando plot

plot(df_valor_casas$Preco, df_valor_casas$`N de Quartos`, col = 'blue',
     pch = 10, cex = 1.5,
     main = 'Valor De Imovel x N de Quartos', col.main = 'black', cex.main = 1.5,
     xlab = 'Preco', ylab = 'N de quartos')


png('GraficoDisperSaoCasa.png', width = 1500, height = 1000, res = 100)

dev.off() # fecha o dispositivo de graficos
