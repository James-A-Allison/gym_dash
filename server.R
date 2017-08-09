
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(data.table)

ex_data <- read.csv("strong.csv", stringsAsFactors = F)
ex_data$Date <- as.Date(ex_data$Date)
ex_data$Volume <- ex_data$kg*ex_data$Reps
ex_data <- data.table(ex_data)[,list(Volume = sum(Volume)),by=c("Date","Exercise.Name")]

shinyServer(function(input, output) {


  output$squat <- renderPlot({
    plot <- ggplot(ex_data[ex_data$Exercise.Name == "Squat",], aes(Date, Volume))
    plot <- plot + geom_bar(stat = "identity")
    plot
  })
  output$bench <- renderPlot({
    plot <- ggplot(ex_data[ex_data$Exercise.Name == "Bench Press",], aes(Date, Volume))
    plot <- plot + geom_bar(stat = "identity")
    plot
  })
  output$deadlift <- renderPlot({
    plot <- ggplot(ex_data[ex_data$Exercise.Name == "Deadlift",], aes(Date, Volume))
    plot <- plot + geom_bar(stat = "identity")
    plot
  })
  output$press <- renderPlot({
    plot <- ggplot(ex_data[ex_data$Exercise.Name == "Shoulder Press",], aes(Date, Volume))
    plot <- plot + geom_bar(stat = "identity")
    plot
  })
  
})
