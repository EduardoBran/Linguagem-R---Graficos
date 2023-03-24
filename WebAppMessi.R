# Big Data Na Pratica 2 - Analytics Web App Para Grandes Volumes de Dados

# Jogos e Gols Lionel Messi


# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/4.Linguagem-R-Graficos/BigDataNaPratica_NetFlix")
getwd()

# **************** Dashboard Analítico ****************


# Imports # install.packages("shinythemes")

library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)



# Criando dados

messi_dataset1 <- data.frame(ano = c('2004/05', '2005/06', '2006/07', '2007/08', '2008/09', '2009/10', '2010/11', '2011/12', '2012/13', '2013/14', '2014/15', '2015/16', '2016/17', '2017/18', '2018/19', '2019/20', '2020/21', '2021/22', '2022/23'),
                       jogos = c(9, 25, 36, 40, 51, 53, 55, 60, 50, 46, 57, 49, 52, 54, 50, 44, 47, 34, 32),
                       gols = c(1, 8, 17, 16, 38, 47, 53, 73, 60, 41, 58, 41, 54, 45, 51, 31, 38, 11, 18),
                       assistencias = c(0, 3, 3, 13, 17, 11, 23, 30, 16, 14, 28, 23, 16, 18, 19, 25, 12, 14, 17))

View(messi_dataset1)



############################# UI - User Interface #############################


ui <- 
  navbarPage(
    theme = shinytheme("cerulean"),
    
    "Lionel Messi Stats",
    
    tabPanel(
      "Gols",
      
      sidebarLayout(
        
        sidebarPanel(
          
          selectInput(
            "select",
            label = h4("Selecione a Temporada: "),
            choices = list("Temporada 2004/05" = "2004/05", "Temporada 2005/06" = "2005/06", "Temporada 2006/07" = "2006/07", "Temporada 2007/08" = "2007/08", 
                           "Temporada 2008/09" = "2008/09", "Temporada 2009/10" = "2009/10", "Temporada 2010/11" = "2010/11", "Temporada 2011/12" = "2011/12", 
                           "Temporada 2012/13" = "2012/13", "Temporada 2013/14" = "2013/14", "Temporada 2014/15" = "2014/15", "Temporada 2015/16" = "2015/16",
                           "Temporada 2016/17" = "2016/17", "Temporada 2017/18" = "2017/18", "Temporada 2018/19" = "2018/19", "Temporada 2019/20" = "2019/20",
                           "Temporada 2020/21" = "2020/21", "Temporada 2021/22" = "2021/22", "Temporada 2022/23" = "2022/23"),
            selected = 1
            
          ), # end selectInput
          
        ), # end sidebarPanel
        
        mainPanel(plotlyOutput("barPlotGols"))
        
      ) # end sidebarLayout
      
    ), # end tabPanel
    
    
    tabPanel(
      "Assistências",
      
      sidebarLayout(
        
        sidebarPanel(
          
          selectInput(
            "select2",
            label = h4("Selecione a Temporada: "),
            choices = list("Temporada 2004/05" = "2004/05", "Temporada 2005/06" = "2005/06", "Temporada 2006/07" = "2006/07", "Temporada 2007/08" = "2007/08", 
                           "Temporada 2008/09" = "2008/09", "Temporada 2009/10" = "2009/10", "Temporada 2010/11" = "2010/11", "Temporada 2011/12" = "2011/12", 
                           "Temporada 2012/13" = "2012/13", "Temporada 2013/14" = "2013/14", "Temporada 2014/15" = "2014/15", "Temporada 2015/16" = "2015/16",
                           "Temporada 2016/17" = "2016/17", "Temporada 2017/18" = "2017/18", "Temporada 2018/19" = "2018/19", "Temporada 2019/20" = "2019/20",
                           "Temporada 2020/21" = "2020/21", "Temporada 2021/22" = "2021/22", "Temporada 2022/23" = "2022/23"),
            selected = 1
            
          ), # end selectInput
          
        ), # end sidebarPanel
        
        mainPanel(plotlyOutput("barPlotAss"))
        
      ) # end sidebarLayout
      
    ), # end tabPanel
    
    tabPanel(
      "Gols e Assistências",
      
      sidebarLayout(
        
        sidebarPanel(
          
          selectInput(
            "select3",
            label = h4("Selecione a Temporada: "),
            choices = list("Temporada 2004/05" = "2004/05", "Temporada 2005/06" = "2005/06", "Temporada 2006/07" = "2006/07", "Temporada 2007/08" = "2007/08",
                           "Temporada 2008/09" = "2008/09", "Temporada 2009/10" = "2009/10", "Temporada 2010/11" = "2010/11", "Temporada 2011/12" = "2011/12",
                           "Temporada 2012/13" = "2012/13", "Temporada 2013/14" = "2013/14", "Temporada 2014/15" = "2014/15", "Temporada 2015/16" = "2015/16",
                           "Temporada 2016/17" = "2016/17", "Temporada 2017/18" = "2017/18", "Temporada 2018/19" = "2018/19", "Temporada 2019/20" = "2019/20",
                           "Temporada 2020/21" = "2020/21", "Temporada 2021/22" = "2021/22", "Temporada 2022/23" = "2022/23"),
            selected = 1
            
          ), # end selectInput
          
        ), # end sidebarPanel
        
        mainPanel(plotlyOutput("barPlotGolseAss"))
        
      ) # end sidebarLayout
      
    ) # end tabPanel
    

  ) # end navbarPage




############################# Server - Lógica do Servidor #############################


server <- 
  
  function(input, output) {
    
    #Bar Plot Gols
    
    output$barPlotGols <- renderPlotly({
      
      # Filtra os dados de acordo com a temporada selecionada pelo usuário
      data_filtered <- messi_dataset1 %>% filter(ano == input$select)
      
      # Cria a barra para jogos
      p_jogos <- plot_ly(data_filtered, x = ~ano, y = ~jogos, name = "Jogos", type = "bar",
                         marker = list(color = '#1f77b4'))
      
      # Cria a barra para gols
      p_gols <- plot_ly(data_filtered, x = ~ano, y = ~gols, name = "Gols", type = "bar",
                        marker = list(color = '#ff7f0e'))
      
      # Combina as duas barras usando add_trace e alterando a posição de xaxis
      p_bars <- plot_ly() %>%
        add_trace(data = data_filtered, x = ~ano, y = ~jogos, name = "Jogos", type = "bar", 
                  marker = list(color = '#1f77b4'), xaxis = "x") %>%
        add_trace(data = data_filtered, x = ~ano, y = ~gols, name = "Gols", type = "bar", 
                  marker = list(color = '#ff7f0e'), xaxis = "x2") %>%
        layout(xaxis = list(title = "Jogos", domain = c(0, 0.45)),
               xaxis2 = list(title = "Assistências", domain = c(0.55, 1)),
               yaxis = list(title = "Quantidade"),
               barmode = "group")
      
      # Define o título do gráfico
      p_bars <- p_bars %>% layout(title = paste("Jogos x Gols - Temporada", input$select))
      
      # Adiciona a legenda com o número de jogos e gols
      p_bars <- p_bars %>% 
        add_annotations(
          x = data_filtered$ano,
          y = data_filtered$jogos,
          text = data_filtered$jogos,
          showarrow = FALSE,
          font = list(color = "#1f77b4"),
          xshift = -12,
          yshift = 10,
          xref = "x",
          yref = "y"
        ) %>% 
        add_annotations(
          x = data_filtered$ano,
          y = data_filtered$gols,
          text = data_filtered$gols,
          showarrow = FALSE,
          font = list(color = "#ff7f0e"),
          xshift = 15,
          yshift = 10,
          xref = "x2",
          yref = "y"
        )
      
      # Retorna o gráfico
      p_bars
        
      }) # end renderPlotly
    
    
    #Bar Plot Assistências
    
    output$barPlotAss <- renderPlotly({
      
      # Filtra os dados de acordo com a temporada selecionada pelo usuário
      data_filtered <- messi_dataset1 %>% filter(ano == input$select2)
      
      # Cria a barra para jogos
      p_jogos <- plot_ly(data_filtered, x = ~ano, y = ~jogos, name = "Jogos", type = "bar",
                         marker = list(color = '#1f77b4'))
      
      # Cria a barra para assistências
      p_ass <- plot_ly(data_filtered, x = ~ano, y = ~assistencias, name = "Assistências", type = "bar",
                        marker = list(color = '#ff7f0e'))
      
      # Combina as duas barras usando add_trace e alterando a posição de xaxis
      p_bars <- plot_ly() %>%
        add_trace(data = data_filtered, x = ~ano, y = ~jogos, name = "Jogos", type = "bar", 
                  marker = list(color = '#1f77b4'), xaxis = "x") %>%
        add_trace(data = data_filtered, x = ~ano, y = ~assistencias, name = "Assistências", type = "bar", 
                  marker = list(color = '#ff7f0e'), xaxis = "x2") %>%
        layout(xaxis = list(title = "Jogos", domain = c(0, 0.45)),
               xaxis2 = list(title = "Assistências", domain = c(0.55, 1)),
               yaxis = list(title = "Quantidade"),
               barmode = "group")
      
      # Define o título do gráfico
      p_bars <- p_bars %>% layout(title = paste("Jogos x Assistências - Temporada", input$select2))
      
      # Adiciona a legenda com o número de jogos e assistências
      p_bars <- p_bars %>% 
        add_annotations(
          x = data_filtered$ano,
          y = data_filtered$jogos,
          text = data_filtered$jogos,
          showarrow = FALSE,
          font = list(color = "#1f77b4"),
          xshift = -12,
          yshift = 10,
          xref = "x",
          yref = "y"
        ) %>% 
        add_annotations(
          x = data_filtered$ano,
          y = data_filtered$assistencias,
          text = data_filtered$assistencias,
          showarrow = FALSE,
          font = list(color = "#ff7f0e"),
          xshift = 15,
          yshift = 10,
          xref = "x2",
          yref = "y"
        )
      
      # Retorna o gráfico
      p_bars
      
    }) # end renderPlotly
    
    
    #BarPlot Gols Assistências
    
    output$barPlotGolseAss <- renderPlotly({
      
      # Filtra os dados de acordo com a temporada selecionada pelo usuário
      data_filtered <- messi_dataset1 %>% filter(ano == input$select3)
    
      # Cria a barra para jogos
      p_jogos <- plot_ly(data_filtered, x = ~ano, y = ~jogos, name = "Jogos", type = "bar",
                         marker = list(color = '#1f77b4'))
      
      # Cria a barra para gols
      p_gols <- plot_ly(data_filtered, x = ~ano, y = ~gols, name = "Gols", type = "bar",
                        marker = list(color = '#ff7f0e'))
      
      # Cria a barra para assistências
      p_ass <- plot_ly(data_filtered, x = ~ano, y = ~assistencias, name = "Assistências", type = "bar",
                       marker = list(color = '#ff7f0e'))
      
      # Combina as 3 barras usando add_trace e alterando a posição de xaxis
      p_bars <- plot_ly() %>%
        add_trace(data = data_filtered, x = ~ano, y = ~jogos, name = 'Jogos', type = 'bar',
                  marker = list(color = '#1f77b4'), xaxis = 'x') %>%
        add_trace(data = data_filtered, x = ~ano, y = ~gols, name = 'Gols', type = 'bar',
                  marker = list(color = '#ff7f0e'), xaxis = 'x2') %>%
        add_trace(data = data_filtered, x = ~ano, y = ~assistencias, name = 'Assistências', type = 'bar',
                  marker = list(color = 'green'), xaxis = 'x3') %>%
        layout(xaxis = list(title = 'Jogos', domain = c(0,0.33)),
               xaxis2 = list(title = 'Gols', domain = c(0.33, 0.66)),
               xaxis3 = list(title = 'Assistências', domain = c(0.66, 1)),
               yaxis = list(title = 'Quantidade'),
               barmode = 'group'
               )
      
      # Define o título do gráfico
      p_bars <- p_bars %>% layout(title = paste("Jogos x Gols x Assistências - Temporada", input$select3))
      
      # Adiciona a legenda com o número de jogos, gols e assistências
      p_bars <- p_bars %>%
        add_annotations(
          x = data_filtered$ano,
          y = data_filtered$jogos,
          text = data_filtered$jogos,
          showarrow = FALSE,
          font = list(color = "#1f77b4"),
          xshift = -22,
          yshift = 10,
          xref = "x",
          yref = "y"
        ) %>%
        add_annotations(
          x = data_filtered$ano,
          y = data_filtered$gols,
          text = data_filtered$gols,
          showarrow = FALSE,
          font = list(color = "#ff7f0e"),
          xshift = 0,
          yshift = 10,
          xref = "x2",
          yref = "y"
        ) %>%
        add_annotations(
          x = data_filtered$ano,
          y = data_filtered$assistencias,
          text = data_filtered$assistencias,
          showarrow = FALSE,
          font = list(color = "green"),
          xshift = 22,
          yshift = 10,
          xref = "x3",
          yref = "y"
        )
      
      p_bars
        
    }) # end renderPlotly
    
    
  } # end function
  

shinyApp(ui, server)







# Selecionando apenas os dados da temporada 2014/15

data_2014_15 <- messi_dataset1[messi_dataset1$ano == "2018/19", ]

# Filtrando os dados das temporadas 2014/15 e 2018/19
data_2014_15_2018_19 <- subset(messi_dataset1, ano %in% c("2014/15", "2018/19"))

# Visualizando os dados filtrados
View(data_2014_15_2018_19)


# Criando o Scatter Plot com jogos no eixo x e gols no eixo y
p_scat <- plot_ly(data_2014_15, x = ~gols, y = ~jogos, type = "scatter", mode = "markers")

# Definindo título e labels dos eixos
p_scat <- p_scat %>% layout(title = "Jogos x Gols - Temporada 2014/15", xaxis = list(title = "Jogos"), yaxis = list(title = "Gols"))

# Exibindo o gráfico
p_scat

















