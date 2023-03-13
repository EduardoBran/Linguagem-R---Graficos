# Mapas

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos")
getwd()


# Instalando os pacotes
install.packages(c('ggplot2', 'maps', 'mapdata'))
install.packages(c("maptools", "geosphere"))

# Carregando pacotes
library(ggplot2)
library(maps)
library(mapdata)


library(maptools)
library(geosphere)

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



# rMaps
# http://rmaps.github.io


require(devtools)
install_github('ramnathv/rCharts@dev')
install_github('ramnathv/rMaps')
install.packages("rjson")
install.packages("htmlwidgets")
install.packages("IRdisplay")

library(rMaps)
library(htmlwidgets)
library(IRdisplay)

# Example 1: CrossLet 

# - CrossLet é uma biblioteca de mapeamento incrível que combina Leaflet e CrossFilter, permitindo a criação de visualizações
# impressionantes. rMaps envolve o CrossLet e fornece aos usuários do R uma interface simples para acessar seus recursos.


crosslet(
  x = "country", 
  y = c("web_index", "universal_access", "impact_empowerment", "freedom_openness"),
  data = web_index
)


# Example 2: DataMaps

ichoropleth(Crime ~ State, data = subset(violent_crime, Year == 2010))
ichoropleth(Crime ~ State, data = violent_crime, animate = "Year")
ichoropleth(Crime ~ State, data = violent_crime, animate = "Year", play = TRUE)


# Example 3: Leaflet

map <- Leaflet$new()
map$setView(c(51.505, -0.09), zoom = 13)
map$tileLayer(provider = 'Stamen.Watercolor')
map$marker(
  c(51.5, -0.09),
  bindPopup = 'Hi. I am a popup'
)
map



# Carrega os dados do Brasil
brasil_map <- map_data("world", "Brazil")

View(brasil_map)

# Plota o mapa do Brasil
ggplot() +
  geom_polygon(data = brasil_map, aes(x = long, y = lat, group = group), 
               fill = "gray", color = "white") +
  coord_fixed(1.3) +
  theme_void()



