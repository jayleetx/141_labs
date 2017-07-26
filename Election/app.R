#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

load("US2016.Rda")
# Define UI for application that draws a density plot
ui <- fluidPage(
   
   # Application title
   titlePanel("Benford's Law in 2012 US Election by Precinct"),
   
   # Sidebar with a select input for state 
   sidebarLayout(
     sidebarPanel(
       selectInput(inputId = "state_choice",
                   label = "State:",
                   choices = c("All", unique(US2016$state)))),
      
      # Show a plot of the state's distribution
       mainPanel(
         plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a density plot
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # filter data based on input$states from ui.R
     if (input$state_choice != "All")  {
       US2016 <- filter(US2016, state == input$state_choice)
     }

      # draw the density plot
      ggplot(US2016, aes(x = digit, color = party)) +
        geom_density() +
        scale_color_manual(values=c("blue", "red", "black")) +
        labs(title = "Density Plot")
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

