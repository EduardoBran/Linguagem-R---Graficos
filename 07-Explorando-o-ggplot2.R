# Explorando o ggplot2

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()

# Descricao

# Um sistema grafico completo, alternativo ao sistema basico de graficos do R
# Oferece mais opcoes de modificacao, legendas prontas e formatacao mais solidade


# Instalando e carregando o pacote
install.packages('ggplot2')
library(ggplot2)

# Plotando um grafico basico com qplot()

# O primeiro comando data(tips, package = 'reshape2') carrega o conjunto de dados tips (que difernte do iris
# nao vem ja carregado) do pacote reshape2 na sessão atual do R.

# O segundo comando qplot(total_bill, tip, data = tips, geom = 'point') cria um gráfico de dispersão
# (também chamado de gráfico de pontos) usando a função qplot() do pacote ggplot2.

# O comando qplot() toma as seguintes entradas:
  
#  total_bill e tip (nao precisa colocar tips$total_bill e tips$tip), pode colocar apenas o nome da
#  coluna total_bill e tip e estes serao os valores que irao ser plotados no eixo x e eixo y, respectivamente.

#  data = tips especifica que os dados para o gráfico vêm do data frame tips.

#  geom = 'point' especifica que o gráfico deve ser criado com pontos.

data(tips, package = 'reshape2')
View(tips)
qplot(total_bill, tip, data = tips, geom = 'point', xlab = 'Valor da Conta', ylab = 'Vaor da Gorgeta') # 'total_bill - valor da conta | 'tip' - valor da gorgeta


# Outro exemplo usando qplot()

# criando df com valores direto na funcao
df_valor_casas <- data.frame(Preco = c(572, 780, 859, 950, 450, 680, 980),
                              `N de Quartos` = c('2', '3', '4', '5', '2', '3', '5'),
                              Bairro = c('Classe Alta', 'Classe Media', 'Classe Alta', 'Classe Alta', 'Classe Media', 'Classe Media', 'Classe Alta'),
                              row.names = c('Casa 1', 'Casa 2', 'Casa 3', 'Casa 4', 'Casa 5', 'Casa 6', 'Casa 7'))

# criando o qplot
qplot(df_valor_casas$Preco, df_valor_casas$N.de.Quartos, data = df_valor_casas,
      geom = 'point', xlab = 'Preco', ylab = 'N de quartos')



# *** Agora vamos construir um grafico utlizando camada a camada ***

# Camada 1
# - vamos utilizar geom_point() que permite colocar os pontos no grafico
# - vamos utilizar o mapping que e um dos parametros de geom_point()
# - vamos usar o aes (funcao de 'aesthetics' que é usada para mapear variáveis aos atributos estéticos (visuais) de um gráfico,
#   como a posição, cor, tamanho, forma ou transparência dos pontos, linhas ou barras.)

camada1 <- geom_point(
  mapping = aes(x = total_bill, y = tip, color = smoker), # color diz se quem deu gorgeta era fumante ou nao
  data = tips,
  size = 3
)
ggplot() + camada1

# resumido
ggplot(data = tips, aes(x = total_bill, y = tip, color = sex)) + # color diz qual o sexo de quem deu a gorgeta
  geom_point(size = 3)


# *** Construindo um modelo de regressao (modelo de regressao linear simples) ***

# - Primeiro criamos um modelo regressao linear simples (modelo_base) utilizando a formula tip ~ total_bill que vai indicar
#   que queremos prever a gorjeta com base no valor total da conta. O argumento data = tips especifica que os dados a serem usados sao do dataframe tips.

# - Depois criamos um dataframe com duas colunas. A primeira coluna é chamada de "total_bill" e contém os valores 
#   da variavel "total_bill" do conjunto de dados "tips".
# - A segunda coluna é gerada pela função "predict" que serve para gerar as previsoes da variavel resposta ('tip') com
#   base nos valores da variável preditora ("total_bill") usando modelo de regressão "modelo_base" e especificamos
#   o intervalo de confiança de 95% com o argumento "interval = "confidence".
# - O resultado é uma matriz com três colunas: os valores previstos para a variável resposta (fit),
#   o limite inferior do intervalo de confiança (lwr) e o limite superior do intervalo de confiança (upr).
# - Se o valor total da conta ('total_bill') foi de 10,34 ao lado teremos o valor medio que deve ser a gorgeta + valor alto + valor baixo

modelo_base <- lm(tip ~ total_bill, data = tips) 
summary(modelo_base)

modelo_fit <- data.frame(                        
  total_bill = tips$total_bill,
  predict(modelo_base, interval = "confidence")
)
View(modelo_fit)

# Camada 2
# - esta criando um objeto de linha (geom_line) baseada nos dados do modelo_fit
# - mapeia o eixo x (total_bill) e o eixo y (fit) para a linha que será criada com a cor 'darkred'

camada2 <- geom_line(
  mapping = aes(x = total_bill, y = fit), # fit vem do df modelo_fit
  data = modelo_fit,
  color = 'darkred'
)
ggplot() + camada1 + camada2

# Camada 3
# - utilizamos a funcao geom_ribbon() para plotar uma faixa de confianca em torno da linha de regressão ajustada.
# - essa faixa é uma especie de limite de confiança. Logo a faixa cinza pode ser considerado uma margem de erro.
# - A faixa de confianca é criada a partir dos intervalos de confianca calculados anteriormente e é mostrada como uma
#   região sombreada no gráfico. A estética ymin e ymax mapeiam os limites inferior e superior do intervalo de confiança,
#   respectivamente. O parâmetro alpha define a transparência da faixa de confiança.

camada3 <- geom_ribbon(
  mapping = aes(x = total_bill, ymin = lwr, ymax = upr),
  data = modelo_fit,
  alpha = 0.3
)
ggplot() + camada1 + camada2 + camada3


# Versao final otimizada (sem ser por camada)
ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = lm, color = 'darkred')


# Gravando o grafico em um objeto

myplot_tips <- ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

class(myplot_tips)
print(myplot_tips)


# Exemplo acima usando o df_valor_casas (sem modelo de regressao linear)

# Camada 1
camada1_df <- geom_point(
  mapping = aes(x = df_valor_casas$Preco, y = df_valor_casas$N.de.Quartos, color = df_valor_casas$Bairro),
  data = df_valor_casas,
  size = 3
)
ggplot() + camada1_df

# Versao final otimizada (sem criar a camada1)
ggplot(df_valor_casas, aes(x = df_valor_casas$Preco, y = df_valor_casas$N.de.Quartos)) +
  geom_point(aes(color = df_valor_casas$Bairro))



# Criar um ScatterPlot com linha de regressao

# Criando os dados 
# - data frame chamado "data" com três colunas: "cond", "var1" e "var2".
# - coluna "cond" tem 20 observações, sendo 10 delas com o valor "Obs1" e 10 com o valor "Obs2". Essa coluna é criada com a função "rep", que repete os valores especificados um número determinado de vezes.
# - coluna "var1" tem 100 observações e é criada com a sequência de números de 1 a 100 somada a um ruído normal gerado com a função "rnorm" com desvio padrão igual a 9.

data <- data.frame(cond = rep(c("Obs1", "Obs2"), each = 10),
                   var1 = 1:100 + rnorm(100, sd = 9),
                   var2 = 1:100 + rnorm(100, sd = 16))
View(data)

# Plot

# - O codigo abaixo cria um gráfico de dispersão (scatterplot) com os valores da variável "var1" no eixo x e os valores
#   da variável "var2" no eixo y, utilizando o pacote ggplot2.
# - A funcao geom_point() adiciona os pontos ao gráfico com o argumento "shape" especificando a forma dos pontos e "size"
#   especificando o tamanho.
# - A funcao geom_smooth() adiciona uma linha de tendência ao grafico utilizando o método de regressão linear (lm).
#   O argumento "se = FALSE" remove a sombra ao redor da linha de tendência.

ggplot(data, aes(x = var1, y = var2)) +
  geom_point(shape = 1, size = 2 ) +
  geom_smooth(method = lm, color = 'red', se = FALSE)

?lm


# BarPlot







# Residual standard error: 1.022 on 242 degrees of freedom
# Multiple R-squared:  0.4566,	Adjusted R-squared:  0.4544 
# F-statistic: 203.4 on 1 and 242 DF,  p-value: < 2.2e-16


# - A linha "Call:" indica que o modelo foi ajustado usando a função lm() com a fórmula "tip ~ total_bill" 
#   e os dados do dataframe tips.

# - A secao "Residuals:" mostra as estatísticas descritivas dos resíduos do modelo (diferença entre os valores observados 
#   e os valores preditos pelo modelo). O mínimo, 1º quartil, mediana, 3º quartil e máximo dos resíduos são exibidos.

# - A secao "Coefficients:" mostra os coeficientes do modelo, incluindo o intercepto e o coeficiente de inclinação para a
#   variável preditora total_bill. Para cada coeficiente, temos sua estimativa, erro padrão, estatística t, e valor p.
#   O intercepto é estimado em 0.920270, e o coeficiente para a variável total_bill é 0.105025. Ambos os coeficientes sao
#   significantes no nível de significância de 0.05, como indicado pelos símbolos de asterisco ao lado dos valores p.

#   * O intercepto é a estimativa do valor da variável de resposta quando a variável preditora é zero. No caso deste modelo, o 
#   intercepto é de 0.920270, o que significa que quando a conta do cliente é zero, a gorjeta esperada é de aproximadamente 92 centavos.
#   * O coeficiente de inclinação para a variável preditora (total_bill) mede a mudança esperada na variável de resposta (tip)
#   quando a variavel preditora aumenta em uma unidade. Neste modelo, o coeficiente de inclinação é de 0.105025, o que 
#   significa que a cada aumento de um dólar na conta do cliente, espera-se um aumento de 10,5 centavos na gorjeta.
#   * O erro padrao e uma medida de quão preciso é a estimativa do coeficiente. Quanto menor o erro padrão, 
#   mais confiável é a estimativa.
#   * A estatística t mede a significância estatística do coeficiente. Quanto maior a estatística t, mais significativo é
#   o coeficiente. Nesse modelo, tanto o intercepto quanto o coeficiente de inclinação são estatisticamente significativos,
#   com estatísticas t de 5.761 e 14.260, respectivamente.
#   * O valor p mede a probabilidade de obter uma estatística t tão grande ou maior do que a observada se a hipotese nula de
#   que o coeficiente é zero fosse verdadeira. Um valor p menor que o nível de significância (geralmente 0,05) indica que é
#   improvável que o coeficiente seja zero e que ele é estatisticamente significativo. Neste modelo, ambos os coeficientes
#   têm valores p muito baixos, indicando que são altamente significativos.

# - A secao "Residual standard error:" mostra o desvio padrão dos resíduos, que é uma medida da variabilidade nao
#   explicada pelo modelo.

# - A secao "Multiple R-squared:" mostra o coeficiente de determinação R², que é uma medida de quão bem o modelo se ajusta
#   aos dados. Nesse caso, o modelo explica cerca de 45,66% da variabilidade na gorjeta.

# - A secao "Adjusted R-squared:" mostra o R² ajustado, que leva em consideração o número de preditores no modelo.
#   Nesse caso, o R² ajustado é ligeiramente menor que o R², indicando que o modelo pode estar sofrendo de superajuste.

# - A secao "F-statistic:" mostra a estatistica F para testar se pelo menos um dos coeficientes é diferente de zero.
#   Nesse caso, o valor de F é 203.4, indicando que há forte evidência de que pelo menos um dos coeficientes é diferente de zero.

# - A secao "p-value:" mostra o valor p para a estatística F. O valor p é muito baixo, menor que 2.2e-16,
#   indicando que há forte evidência contra a hipótese nula de que todos os coeficientes são zero.
#   Isso confirma a conclusão da seção "F-statistic".


png('GraficoDisperComModeloDeRegressao.png', width = 1500, height = 1000, res = 100)

dev.off() # fecha o dispositivo de graficos

