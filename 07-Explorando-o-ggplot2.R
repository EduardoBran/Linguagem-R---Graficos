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
df_valor_casas <- data.frame(Preco = c(572, 780, 859, 950),
                              `N de Quartos` = c('2', '3', '4', '5'),
                              Bairro = c('Classe Alta', 'Classe Media', 'Classe Alta', 'Classe Alta'),
                              row.names = c('Casa 1', 'Casa 2', 'Casa 3', 'Casa 4'))

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


?aes
??aes


# 







# Exemplo acima usando o df_valor_casas

# Camada 1
camada1_df <- geom_point(
  mapping = aes(x = df_valor_casas$Preco, y = df_valor_casas$N.de.Quartos, color = df_valor_casas$Bairro),
  data = df_valor_casas,
  size = 3
)
ggplot() + camada1_df

# resumido
ggplot(data = df_valor_casas, aes(x = df_valor_casas$Preco, y = df_valor_casas$N.de.Quartos, color = df_valor_casas$Bairro)) +
  geom_point(size = 3)

