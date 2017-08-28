
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(data.table)
source("helper_functions.R")


# source("helper_functions.R")

# windowing <- Sys.Date() - 90

shinyServer(function(input, output) {


  # output$squat_vol <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == "Squat",], aes(x=Date))
  #   plot <- plot + geom_bar(aes(y=Volume, colour = "Volume") ,stat = "identity")
  #   plot <- plot + geom_line(aes(y=`30-day-volume`, colour = "30-day-average volume")) 
  #   plot <- plot + labs(colour = "Parameter") + scale_colour_manual(values = c("red", "black")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date))) + ggtitle("Squat Volume")
  #   plot
  # })
  # output$squat_weight <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == "Squat",], aes(x=Date))
  #   plot <- plot + geom_point(aes(y=`Max_Weight`, colour = "Max Session Weight")) 
  #   plot <- plot + geom_line(aes(y=`90-day-1RM`, colour = "90-day-max 1RM")) 
  #   plot <- plot + labs(colour = "Parameter", y = "Weight") + scale_colour_manual(values = c("green", "blue")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date)),
  #                                  ylim = c(10,max(big_table$`90-day-1RM`[big_table$Exercise.Name == "Squat"]))) + ggtitle("Squat Weight")
  #   plot
  # })
  # output$bench_vol <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == "Incline Dumbbell Press",], aes(x=Date))
  #   plot <- plot + geom_bar(aes(y=Volume, colour = "Volume") ,stat = "identity")
  #   plot <- plot + geom_line(aes(y=`30-day-volume`, colour = "30-day-average volume")) 
  #   plot <- plot + labs(colour = "Parameter") + scale_colour_manual(values = c("red", "black")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date))) + ggtitle("Bench Volume")
  #   plot
  # })
  # output$bench_weight <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == "Incline Dumbbell Press",], aes(x=Date))
  #   plot <- plot + geom_point(aes(y=`Max_Weight`, colour = "Max Session Weight")) 
  #   plot <- plot + geom_line(aes(y=`90-day-1RM`, colour = "90-day-max 1RM")) 
  #   plot <- plot + labs(colour = "Parameter", y = "Weight") + scale_colour_manual(values = c("green", "blue")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date)),
  #                                  ylim = c(10,max(big_table$`90-day-1RM`[big_table$Exercise.Name == "Incline Dumbbell Press"]))) + ggtitle("Bench Weight")
  #   plot
  # })
  # output$dead_vol <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == "Romanian Deadlift",], aes(x=Date))
  #   plot <- plot + geom_bar(aes(y=Volume, colour = "Volume") ,stat = "identity")
  #   plot <- plot + geom_line(aes(y=`30-day-volume`, colour = "30-day-average volume")) 
  #   plot <- plot + labs(colour = "Parameter") + scale_colour_manual(values = c("red", "black")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date))) + ggtitle("Deadlift Volume")
  #   plot
  # })
  # output$dead_weight <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == "Romanian Deadlift",], aes(x=Date))
  #   plot <- plot + geom_point(aes(y=`Max_Weight`, colour = "Max Session Weight")) 
  #   plot <- plot + geom_line(aes(y=`90-day-1RM`, colour = "90-day-max 1RM")) 
  #   plot <- plot + labs(colour = "Parameter", y = "Weight") + scale_colour_manual(values = c("green", "blue")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date)),
  #                                  ylim = c(10,max(big_table$`90-day-1RM`[big_table$Exercise.Name == "Romanian Deadlift"]))) + ggtitle("Deadlift Weight")
  #   plot
  # })
  # output$press_vol <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == "Shoulder Press",], aes(x=Date))
  #   plot <- plot + geom_bar(aes(y=Volume, colour = "Volume") ,stat = "identity")
  #   plot <- plot + geom_line(aes(y=`30-day-volume`, colour = "30-day-average volume")) 
  #   plot <- plot + labs(colour = "Parameter") + scale_colour_manual(values = c("red", "black")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date))) + ggtitle("Overhead Press Volume")
  #   plot
  # })
  # output$press_weight <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == "Shoulder Press",], aes(x=Date))
  #   plot <- plot + geom_point(aes(y=`Max_Weight`, colour = "Max Session Weight")) 
  #   plot <- plot + geom_line(aes(y=`90-day-1RM`, colour = "90-day-max 1RM")) 
  #   plot <- plot + labs(colour = "Parameter", y = "Weight") + scale_colour_manual(values = c("green", "blue")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date)),
  #                                  ylim = c(10,max(big_table$`90-day-1RM`[big_table$Exercise.Name == "Shoulder Press"]))) + ggtitle("Overhead Press Weight")
  #   plot
  # })
  # 
  # output$total_volume <- renderPlot({
  #   plot_data <- data.table(big_table)[,list(Volume = sum(Volume),
  #                                            `30-day-volume` = sum(`30-day-volume`),
  #                                            `90-day-volume` = sum(`90-day-volume`)),
  #                                      by="Date"]
  #   plot <- ggplot(data = plot_data, aes(x = Date))
  #   plot <- plot + geom_bar(aes(y=Volume, colour = "Daily Volume") ,stat = "identity", position = "stack")
  #   plot <- plot + geom_line(aes(y=`30-day-volume`, colour = "30-day-average volume")) 
  #   plot <- plot + geom_line(aes(y=`90-day-volume`, colour = "90-day-average volume")) 
  #   plot <- plot + labs(colour = "Parameter") + scale_colour_manual(values = c("red", "blue", "black")) + theme(legend.position = "bottom") + ggtitle("Total Volume")
  #   plot
  # })
  # output$powerlifting <- renderPlot({
  #   plot_data <- big_table[big_table$Exercise.Name == "Bench Press" | big_table$Exercise.Name == "Deadlift" |big_table$Exercise.Name == "Squat",
  #                          c("Date","Exercise.Name","One_Rep_Max","30-day-Max","90-day-Max")]
  #   plot_data <- plot_data[plot_data$One_Rep_Max!=0 | plot_data$`30-day-Max`!=0 | plot_data$`90-day-Max` !=0,]
  #   
  #   powerlifting_total <- data.table(plot_data)[,list(`30-day-Max` = sum(`30-day-Max`),
  #                                                     `90-day-Max` = sum(`90-day-Max`),
  #                                                     One_Rep_Max = 0,
  #                                                     Exercise.Name = "Powerlifting Total")
  #                                               ,by="Date"]
  #   plot_data <- rbind(plot_data, powerlifting_total)
  #   
  #   plot <- ggplot(data = plot_data, aes(x = Date))
  #   plot <- plot + geom_point(aes(y = One_Rep_Max, colour = Exercise.Name))
  #   # plot <- plot + geom_line(aes(y = `30-day-Max`, colour = Exercise.Name))
  #   plot <- plot + geom_line(aes(y = `90-day-Max`, colour = Exercise.Name))
  #   plot <- plot + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(ylim = c(30,max(plot_data$`90-day-Max`))) + labs(y = "Weight") + ggtitle("Powerlifting Maxes")
  #   plot
  # })
  # output$exercise_selector_chart_vol <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == input$exercise,], aes(x=Date))
  #   plot <- plot + geom_bar(aes(y=Volume, colour = "Volume") ,stat = "identity")
  #   plot <- plot + geom_line(aes(y=`30-day-volume`, colour = "30-day-average volume")) 
  #   plot <- plot + labs(colour = "Parameter") + scale_colour_manual(values = c("red", "black")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date))) + ggtitle(paste(input$exercise, "Volume"))
  #   plot
  # })
  # output$exercise_selector_chart_weight <- renderPlot({
  #   plot <- ggplot(big_table[big_table$Exercise.Name == input$exercise,], aes(x=Date))
  #   plot <- plot + geom_point(aes(y=`Max_Weight`, colour = "Max Session Weight")) 
  #   plot <- plot + geom_line(aes(y=`90-day-1RM`, colour = "90-day-max 1RM")) 
  #   plot <- plot + labs(colour = "Parameter", y = "Weight") + scale_colour_manual(values = c("green", "blue")) + theme(legend.position = "bottom")
  #   plot <- plot + coord_cartesian(xlim = c(max(big_table$Date) - 90, 
  #                                           max(big_table$Date)),
  #                                  ylim = c(10,max(big_table$`90-day-1RM`[big_table$Exercise.Name == input$exercise]))) + ggtitle(paste(input$exercise, "Weight"))
  #   plot
  # })
  output$aggregate_volume <- renderPlot({
    plot <- ggplot(data = big_table, aes(x = Date, y = Volume, fill = Exercise.Name))
    plot <- plot + geom_bar(stat = "identity") + theme(legend.position = "bottom") + ggtitle("Volume by Exercise")
    plot
  })
  
})
