
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  wellPanel(
    splitLayout(
      verticalLayout(
        wellPanel(titlePanel("Squat Volume"), plotOutput("squat")),
        wellPanel(titlePanel("Bench Press Volume"), plotOutput("bench"))
      ),
      verticalLayout(
        wellPanel(titlePanel("Deadlift Volume"), plotOutput("deadlift")),
        wellPanel(titlePanel("Press Volume"), plotOutput("press"))
      )
    )
  )
  # Application title
  # titlePanel("Old Faithful Geyser Data"),

  
    # Show a plot of the generated distribution

    )
  )

