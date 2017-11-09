library(shiny)
library(ggplot2)
#user interface
# input (title), output(graph)
ui <- fluidPage(
  titlePanel("Diamonds Data", windowTitle = "Diamonds"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title", 
                label = "Chart Title", 
                value = ""),
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack", "dodge"),
                  selected = "stack")
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

#server
server <- function(input,output){
  output$plot = renderPlot(ggplot(diamonds, aes(x=cut, fill = clarity)) + geom_bar(position = input$pos) + ggtitle(input$title))
}

#run the app
shinyApp(ui,server)

