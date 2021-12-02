library(CodeClanData)
library(shiny)
library(shinythemes)
library(tidyverse)

inflation_data <- inflation4
all_countries <- unique(inflation_data$variable)

ui <- fluidPage(
  
  titlePanel("Consumer Price Inflation by Country"),
  
  plotOutput("inflation_plot"),
  
  fluidRow(
    
    column(1,
           ),
    
    column(5,
           selectInput("country_input",
                       "Which Country?",
                       choices = all_countries)
    ),
    
    column(5,
           br(),
           tags$a("Chapwood Index: Inflation Measured with Financial Assets",
                  href = "http://www.chapwoodindex.org/")
           
    )
  ),
  
  fluidPage(
    img(src = "www/glootie.gif",
        # align = "left",
        height = 352,
        width = 640)
  )
)



server <- function(input, output) {
  
  output$inflation_plot <- renderPlot({
    inflation_data %>%
      filter(variable == input$country_input) %>%
      ggplot() +
      aes(x = Year, y = value) +
      geom_line()
  })
  
}

shinyApp(ui = ui, server = server)

