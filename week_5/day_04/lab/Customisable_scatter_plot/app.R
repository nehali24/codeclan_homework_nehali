library(shiny)
library(dplyr)
library(ggplot2)
library(CodeClanData)
library(shinyWidgets)

#A CUSTOMIZABLE SCATTER PLOT

ui <- fluidPage(
    titlePanel("Reaction time vs. Score in memory game"),
    
    setBackgroundColor(
        color = c("#e5f5e0", "#a1d99b"),
        gradient = "radial",
        direction = c("top", "left")
    ),
    
    fluidRow(
        column(3,
        radioButtons("Color",
            "Select Color",
            choices = c(Blue = "#2c7fb8", Yellow = "#FDE74C", Red = "#f03b20")
        )
    )),
    
    column(
        3,
        sliderInput("Points",
            "Transparency of points",
            min = 0,
            max = 1,
            value = 0.7
        )
    ),
    
    column(
        3,
        selectInput("Points",
            "Shape of points",
            choices = c(
                Square = 15 ,
                Circle = 16,
                Triangle = 17),selected = 15)
        
    ),



fluidRow(column(6,
                plotOutput("scatter"))),


server <- function(input, output) {
    students_filtered <- reactive({
        students_big %>%
            
            filter(reaction_time == input$reaction_time) %>%
        filter(score_in_memory_game == input$score_in_memory_game)
        
    })
    
}

output$scatter <- renderPlot({
    ggplot(students_filtered()) +
        
        aes(x = reaction_time, y = score_in_memory_game) +
        
        geom_point(points = input$points)
    
    
}),

shinyApp(ui = ui, server = server)
