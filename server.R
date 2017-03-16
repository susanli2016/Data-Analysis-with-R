
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(choroplethr)
library(choroplethrMaps)

shinyServer(function(input, output) {

  output$map <- renderPlot({

    data('df_state_demographics')
    df_state_demographics$value = df_state_demographics[, input$select]
    state_choropleth(df_state_demographics,
                     title = input$select, 
                     num_colors = input$num_colors)

  })
  
  
  output$table <- renderDataTable({
   
    data("df_state_demographics")
    df_state_demographics[, c('region', input$select)]
  })
  
  output$downloadData <- downloadHandler(
     filename = function() {
       paste('data-', Sys.Date(), '.csv', sep='')
      },
     content = function(con) {
       data("df_state_demographics")
       data = df_state_demographics[, c('region', input$select)]
         
       write.csv(data, con)
      }
   )

})
