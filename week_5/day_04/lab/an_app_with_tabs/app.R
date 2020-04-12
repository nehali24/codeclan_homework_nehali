library(ggplot2)
library(dplyr)
library(CodeClanData)
library(shiny)



ui <- fluidPage(

    
    titlePanel("Comparing importance of internat access v/s reducing pollution"),
    setBackgroundColor(
        color = c("#e5f5e0", "#a1d99b"),
        gradient = "radial",
        direction = c("top", "left")
    ),
    
    fluidRow(row(3,
                 dropdownButton("Gender", choices = c("Male", "Female"), "Region", choices = unique(students_big$region)))
        
        
    ),
    fluidRow(
        
        column(9, )
    )
    
    
    
    

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
