library(ggplot2)
library(shiny)
library(CodeClanData)
library(dplyr)

ui <- fluidPage(
    fluidRow(
        column(9,
               radioButtons("Age", 
                            "Age of children",
                            c(10,11,12,13,14,15,16,17,18),inline = TRUE)
        )
        
        
    ),
    
    fluidRow(6,
               plotOutput("histogram")
               
        )
    )

server <- function(input, output) {
    
    students_filtered <- eventReactive({
        students_big %>%
            filter(height <= input$max_height)
    })
output$histogram <- renderPlot({
        ggplot(students_filtered()) +
            aes(x = height) +
            geom_histogram(height = input$age)
    })
    
    output$histogram <-renderPlot({
        ggplot(students_filtered()) +
            aes(x = arm_span) +
            geom_histogram(arm_span = input$age)
    })

}
shinyApp(ui = ui, server = server)