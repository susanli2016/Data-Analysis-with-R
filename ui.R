
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(choroplethr)
data('df_state_demographics')

shinyUI(fluidPage(

  # Application title
  titlePanel("USA Census - by Susan Li"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("num_colors",
                  "Number of colors:",
                  min = 1,
                  max = 9,
                  value = 7),
      selectInput("select", label = "Select demographic:", 
                  choices = colnames(df_state_demographics)[2:9], 
                  selected = 1),
      
      downloadButton('downloadData', 'Download')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("map"),
      dataTableOutput("table")
    )
  )
))
