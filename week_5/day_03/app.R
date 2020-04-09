library(shiny)
library(dplyr)
library(ggplot2)
library(CodeClanData)


ui <- fluidPage(
    
    theme = shinytheme("slate"), 
    titlePanel(tags$h2("Five Country Medal Comparison")),
    
    tabsetPanel(
        tabPanel("Plot", plotOutput("medal_plot")
                 ),
        
        
        tabPanel( "Season", 
                  radioButtons("Season", 
                               tags$i("Summer or Winter Olympics?"),
                                         choices = c("Summer", "Winter")
                                         
        )
        ),
        tabPanel("Medal",
                 radioButtons("Medal" , "Gold or Siver or Bronze?"),
                 choices = c("Gold", "Silver", "Bronze")
        )
        
        )
    )


    
    server <- function(input, output) {
    
    output$medal_Plot <- renderPlot({
        olympics_overall_medals %>%
            filter(team %in% c("United States",
                               "Soviet Union",
                               "Germany",
                               "Italy",
                               "Great Britain")) %>%
            filter(medal == input$Medal) %>%
            filter(Season == input$season) %>%
            ggplot() +
            aes(x = medal, y = count, fill = team) +
            geom_col() 
        
    }
    
    )
}
shinyApp(ui = ui, server = server)
