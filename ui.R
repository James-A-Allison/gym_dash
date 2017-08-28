
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("helper_functions.R")



shinyUI(fluidPage(tabsetPanel(
  tabPanel("Overview",splitLayout(
    plotOutput("total_volume"),
    plotOutput("powerlifting"))),
  tabPanel("Big Four",verticalLayout(
    splitLayout(plotOutput("squat_vol"), plotOutput("squat_weight")),
    splitLayout(plotOutput("bench_vol"), plotOutput("bench_weight")),
    splitLayout(plotOutput("dead_vol"), plotOutput("dead_weight")),
    splitLayout(plotOutput("press_vol"), plotOutput("press_weight")))),
  tabPanel("Exercise Selector",sidebarLayout(
    sidebarPanel(selectInput(inputId = "exercise",
                              label = "Select exercise:",
                              choices = exercise_choices,
                              selected = "Squat")),
    mainPanel(splitLayout(
      plotOutput("exercise_selector_chart_vol"),
      plotOutput("exercise_selector_chart_weight")
    ))
  )),
  tabPanel("Volume by Exercise", plotOutput("aggregate_volume"))
)
  
)
  
        )

