library(dplyr)
library(data.table)

ex_data <- read.csv("strong.csv", stringsAsFactors = F)
ex_data$Date <- as.Date(ex_data$Date)
ex_data$Volume <- ex_data$kg*ex_data$Reps
ex_data$RM1 <- ex_data$kg*(36/(37-ex_data$Reps))

powerlifts <- c("Squat", "Bench Press", "Deadlift", "Shoulder Press")

max_weight <- ex_data %>% group_by(Exercise.Name, Reps) %>% top_n(1, kg) %>% filter(Exercise.Name %in% powerlifts) %>% arrange(Reps) %>% select(c(Date,Exercise.Name, kg, Reps)) %>% distinct()
max_reps <- ex_data %>% filter(Exercise.Name %in% powerlifts) %>% group_by(Exercise.Name,kg) %>% top_n(1, Reps) %>% arrange(desc(kg, Date)) %>% top_n(1, Date) %>% select(c(Date,Exercise.Name, kg, Reps)) %>% distinct(.keep_all = TRUE)
ggplot(max_reps, aes(y = kg, x = Reps)) + geom_point() + facet_grid(.~Exercise.Name) + ggtitle("Rep record by weight")
ggplot(max_weight, aes(y = kg, x = Reps)) + geom_point() + facet_grid(.~Exercise.Name) + ggtitle("Max weight by rep")
