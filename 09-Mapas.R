# Mapas

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()


# Instalando os pacotes
install.packages(c('ggplot2', 'maps', 'mapdata'))

# Carregando pacotes
library(ggplot2)
library(maps)
library(mapdata)


# Funcao que busca as coordenadas dos paises
?map_data

mapa <- map_data("world")

# Visualizando o dataframe
dim(mapa)
View(mapa)


# Gerando o Mapa (apenas com preenchimento)

ggplot() + 
  geom_polygon(data = mapa,
               aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3)

# tirando preenchimento e colocando apenas contorno
ggplot() + 
  geom_polygon(data = mapa,
               aes(x = long, y = lat, group = group),
               fill = NA, color = 'black') +
  coord_fixed(1.3)

# preenchimento com contorno
gg1 <- 
  ggplot() + 
  geom_polygon(data = mapa,
               aes(x = long, y = lat, group = group),
               fill = "seagreen1", color = 'black') +
  coord_fixed(1.3)
gg1



# Escolhendo a localização para 2 pontos no mapa
labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512),
  names = c('Ponto1', 'Ponto2'),
  stringsAsFactors = FALSE
)

# Marcando os 2 pontos no mapa (temos dois para criar com contorno preto e a bolinha amarelo)
gg1 +
  geom_point(data = labs, aes(x = long, y = lat), color = 'black', size = 2) +
  geom_point(data = labs, aes(x = long, y = lat), color = 'yellow', size = 2)


# Divisao por paises

ggplot(data = mapa) +
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = 'white') +
  coord_fixed(1.3) +
  guides(fill = FALSE)
