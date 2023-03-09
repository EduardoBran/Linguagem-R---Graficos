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


# Gerando o Mapa

ggplot() + 
  geom_polygon(data = mapa,
               aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3)

# tirando preenchimento e colocando contorno
ggplot() + 
  geom_polygon(data = mapa,
               aes(x = long, y = lat, group = group),
               fill = NA, color = 'black') +
  coord_fixed(1.3)

# tirando preenchimento com contorno
gg1 <- 
  ggplot() + 
  geom_polygon(data = mapa,
               aes(x = long, y = lat, group = group),
               fill = "seagreen1", color = 'black') +
  coord_fixed(1.3)
gg1





