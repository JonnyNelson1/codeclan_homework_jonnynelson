library(shinythemes)
library(tidyverse)
library(shiny)
library(CodeClanData)

clean_game_sales <- game_sales


# UI


ui <- fluidPage(
    
    # Adding a title to the page
    titlePanel(tags$b("Game Data")), 
    
    # Making the shiny web app less of a strain on the eyes, using themes
    theme = shinytheme("darkly"),
    
    # Sidebar layout
    sidebarLayout(
        sidebarPanel(
            
            # A select option for publishers, to filter
            selectInput("publisher_input",
                         "Publisher",
                         choices = unique(clean_game_sales$publisher)),
            
            
            knobInput(
                inputId = "myKnob",
                label = "jQuery knob example:",
                value = 100,
                min = 0,
                displayPrevious = TRUE,
                lineCap = "round",
                fgColor = "#428BCA",
                inputColor = "#428BCA"
            )

            
        ),
        
        
        # Main Panel will output the plot
        mainPanel(
            
            plotOutput("game_plot")
            
            
            
        )
    )
)


# Server

# server will render the plot

server <- function(input, output, session) {
    output$game_plot <- renderPlot({
        
    clean_game_sales %>%
        filter(publisher == input$publisher_input) %>%
        filter((critic_score >= 90) == input$id) %>%
        ggplot() +
        aes(x = critic_score) +
        geom_bar(fill = "#3333cc")
    })
}

shinyApp(ui, server)