library(ggplot2)
library(dplyr)
library(CodeClanData)
library(shiny)


ui <- fluidPage(
#titlePanel("Three different plots"),
sidebarLayout(
        sidebarPanel(
            radioButtons("Plot",
                        "Plot types",
                        choices = c("bar_chart", "pie_chart", "Stacked Bar")
        )

        ),
        mainPanel(
           plotOutput("bar_chart"),
           plotOutput("pie_chart"),
           plotOutput("stacked_bar")
        )
    )
)


server <- function(input, output) {

    output$bar_chart <- renderPlot({
        
        students_big%>%
        ggplot() +
            geom_bar(aes(x = gender))
        
    })
    
output$pie_chart <- renderPlot({
    students_big%>%
        ggplot()
    geom_bar(aes(x = 1, fill = gender)) +
    coord_polar("y")
        
})


output$stacked_bar <- renderPlot({
    
    students_big%>%
        ggplot()
    geom_bar(aes(x = 1, fill = gender))
})
    
}   

shinyApp(ui = ui, server = server)
