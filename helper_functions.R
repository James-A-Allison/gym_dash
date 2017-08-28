library(dplyr)
library(data.table)
library(zoo)

ex_data <- read.csv("strong.csv", stringsAsFactors = F)
ex_data$Date <- as.Date(ex_data$Date)
ex_data$Volume <- ex_data$kg*ex_data$Reps
ex_data$RM1 <- ex_data$kg*(36/(37-ex_data$Reps))

start_date <- min(ex_data$Date)
end_date <- max(ex_data$Date)

all_dates <- seq.Date(start_date, end_date, 1)
all_dates <- data.frame(Date = all_dates)
unique_exercises <- data.frame(Exercise.Name = unique(ex_data$Exercise.Name))


big_table <- merge(all_dates, unique_exercises)

ex_data <- data.table(ex_data)[,list(Volume = sum(Volume),
                                     One_Rep_Max = max(RM1),
                                     Max_Weight = max(kg)),
                               by=c("Date","Exercise.Name")]
ex_data$Exercise.Name <- as.factor(ex_data$Exercise.Name)
big_table <- left_join(big_table, ex_data)
big_table$Volume[is.na(big_table$Volume)] <- 0
big_table$One_Rep_Max[is.na(big_table$One_Rep_Max)] <- 0
big_table$Max_Weight[is.na(big_table$Max_Weight)] <- 0
# 
# 
# average_vol_30 <- dcast(big_table[,1:3], Date~Exercise.Name, value.var = "Volume")
# average_vol_30[,2:49] <- apply(average_vol_30[,2:49],2,rollmean, k=30, fill = 0, align = "right")
# 
# average_vol_90 <- dcast(big_table[,1:3], Date~Exercise.Name, value.var = "Volume")
# average_vol_90[,2:49] <- apply(average_vol_90[,2:49],2,rollmean, k=90, fill = 0, align = "right")
# 
# one_rm_max_30 <- dcast(big_table[,c(1,2,4)], Date~Exercise.Name, value.var = "One_Rep_Max")
# one_rm_max_30[,2:49] <- apply(one_rm_max_30[,2:49],2,rollmax, k=30, fill = 0, align = "right")
# 
# one_rm_max_90 <- dcast(big_table[,c(1,2,4)], Date~Exercise.Name, value.var = "One_Rep_Max")
# one_rm_max_90[,2:49] <- apply(one_rm_max_90[,2:49],2,rollmax, k=90, fill = 0, align = "right")
# 
# max_30 <- dcast(big_table[,c(1,2,5)], Date~Exercise.Name, value.var = "Max_Weight")
# max_30[,2:49] <- apply(max_30[,2:49],2,rollmax, k=30, fill = 0, align = "right")
# 
# max_90 <- dcast(big_table[,c(1,2,5)], Date~Exercise.Name, value.var = "Max_Weight")
# max_90[,2:49] <- apply(max_90[,2:49],2,rollmax, k=90, fill = 0, align = "right")
# 
# average_vol_30 <- melt(average_vol_30, id.vars = "Date", variable.name = "Exercise.Name", value.name = "30-day-volume")
# average_vol_90 <- melt(average_vol_90, id.vars = "Date", variable.name = "Exercise.Name", value.name = "90-day-volume")
# one_rm_max_30 <- melt(one_rm_max_30, id.vars = "Date", variable.name = "Exercise.Name", value.name = "30-day-1RM")
# one_rm_max_90 <- melt(one_rm_max_90, id.vars = "Date", variable.name = "Exercise.Name", value.name = "90-day-1RM")
# max_30 <- melt(max_30, id.vars = "Date", variable.name = "Exercise.Name", value.name = "30-day-Max")
# max_90 <- melt(max_90, id.vars = "Date", variable.name = "Exercise.Name", value.name = "90-day-Max")
# 
# big_table <- left_join(big_table, average_vol_30)
# big_table <- left_join(big_table, average_vol_90)
# big_table <- left_join(big_table, one_rm_max_30)
# big_table <- left_join(big_table, one_rm_max_90)
# big_table <- left_join(big_table, max_30)
# big_table <- left_join(big_table, max_90)
# 
# big_table$Volume[big_table$Volume == 0] <- 0
# big_table$One_Rep_Max[big_table$One_Rep_Max == 0] <- 0
# big_table$Max_Weight[big_table$Max_Weight == 0] <- 0
# 
# # big_table <- big_table[!(is.na(big_table$Volume)),]
# 
# exercise_choices <- unique(big_table$Exercise.Name[order(big_table$Date, decreasing = T)])
