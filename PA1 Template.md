# Reproducible Research Project 1: Activity Monitoring

#### Author: Bobby Sims

### Load package

`library(tidyverse)`

### Import file and create data object

`activity <- read_csv("activity.csv") sum(activity$steps, na.rm = TRUE)`

### Designate values for aggregation

`Steps = activity$steps`

`Date = activity$date`

`Interval = activity$interval`

`SD <- aggregate(Steps~Date, data = activity, sum)`

`SDI <- aggregate(Steps~Date + Interval, activity, sum)`

### Calculate Total Number of Steps Taken per Day

#### Histogram

`ggplot(SD, aes( x = Date, weight = Steps))+  geom_histogram(binwidth = 1, fill = "blue", color = "black")+  labs(title = "Total Steps Taken Each Day",  x = "Date", y = "Steps")`

![](https://github.com/Bc5Neep/Reproducible-Research-Coursera/blob/main/Activity%20Monitoring%20plots/Total%20Steps%20Taken%20Each%20Day_activity.png)

### Calculate and report mean and median of the total number of steps taken daily

#### Mean

`mean(SD$Steps, trim = 0, na.rm =TRUE)`

`hist(SD$Steps, breaks = 53, main = "Total Steps Daily", xlab = "steps") abline(v = mean(SD$Steps), col ="red", lwd = 3) text( x = mean(SD$Steps),       y = 5.5,       labels = sprintf("Mean = %.2f", mean(SD$Steps)), col ="black", pos = 4)`

![](https://github.com/Bc5Neep/Reproducible-Research-Coursera/blob/main/Activity%20Monitoring%20plots/Mean%20Total%20Steps%20Daily_activity.png)

#### Median

`median(SD$Steps)`

`hist(SD$Steps, breaks = 53, main = "Total Steps Daily", xlab = "steps") abline(v = median (SD$Steps), col = "black", lwd =5) text( x = median(SD$Steps),       y = 5.5,       labels = sprintf("Median = %.2f", median(SD$Steps)), col ="black", pos = 4)`

![](https://github.com/Bc5Neep/Reproducible-Research-Coursera/blob/main/Activity%20Monitoring%20plots/Median%20Total%20Steps_activity.png)

### Time series plot with 5 minute interval and average number of steps taken

### Average steps per interval across days

`SD1 <- aggregate(Steps~Interval, data = activity, mean)`

### Determine Range

`range(SD1$Steps)`

### Identify max mean steps and interval

`Max1 <- SD1 [which.max(SD1$Steps),]`

`x1 <- Max1$Interval`

`y1 <- Max1\$Steps`

### Generate plot

`plot(SD1$Interval, SD1$Steps,  type = "l", xlab = "Intervals (5 min)", ylab = "Steps", main = "Average Daily Step Activity") abline( v = 835, col ="red", lwd =2)  text(x = 865, y = 190,  labels = sprintf("Max Avg Steps = %.2f at interval 835", (y1)), adj = 0, cex =0.6)`

![](https://github.com/Bc5Neep/Reproducible-Research-Coursera/blob/main/Activity%20Monitoring%20plots/Average%20Daily%20Step_activity.png)

### Calculate total number of NA values

`colSums(is.na(activity))`

### What are their row numbers? First expand max.print then print list

`options(max.print = 3000)`

`which(is.na(activity))`

### Identify and isolate NA

`NA_ROWS <- activity %>%  slice (c(1:288, 2017:2304, 8929:9216, 9793:10080, 11233:11520, 11521:11808, 12673:12960, 17281:17568))`

### Preview comparison of isolated NA with mean activity values per interval (optional)

`NA_OCT1 <- NA_ROWS[1:288,]`

`NA_compare_Oct1 <- cbind(SD1, NA_OCT1)`

## Create a new dataset that is equal to the original dataset but with the missing data filled in

### Make duplicate activity dataset for imputing NAs

`activity_1 <- activity`

### Concatenate NA row segments

`segments <- c(1:288, 2017:2304, 8929:9216, 9793:10080, 11233:11520, 11521:11808, 12673:12960, 17281:17568)`

### Define NA replacement schema

`Idx <- is.na(activity_1$steps) & seq_along(activity_1$steps) %in% segments`

### Impute mean interval values into NAs

`activity_1$steps <- replace(activity_1$steps, Idx, SD1$Steps[match(activity_1$interval[Idx], SD1$Interval)])`

## Begin plots using imputed values dataset, activity_1

### Calculate and report mean and median of the total number of steps taken daily

`SD2 <- aggregate(steps~date, data = activity_1, sum)`

### Generate Total Daily Steps Histogram

`ggplot(SD2, aes( x = date, weight = steps))+  geom_histogram(binwidth = 1, fill = "blue", color = "black")+  labs(title = "Total Steps Taken Each Day", x = "Date", y = "Steps")`

![](https://github.com/Bc5Neep/Reproducible-Research-Coursera/blob/main/Activity%20Monitoring%20plots/Average%20Daily%20Step_activity.png)

### Generate new plots of mean and median total steps daily

#### Mean

mean(SD2\$steps, trim = 0, na.rm =TRUE)

`hist(SD2$steps, breaks = 61, main = "Total Steps Daily", xlab = "steps") abline(v = mean(SD2$steps), col = "red", lwd = 3) text( x = mean(SD2$steps),       y = 5.5,       labels = sprintf("Mean = %.2f", mean(SD2$steps)), col ="black", pos = 4)`

![](https://github.com/Bc5Neep/Reproducible-Research-Coursera/blob/main/Activity%20Monitoring%20plots/Mean%20Total%20Steps%20Daily_activity_1.png)

#### Median

`median(SD2$steps)`

`hist(SD2$steps, breaks = 61, main = "Total Steps Daily", xlab = "steps") abline(v = median (SD2$steps), col = "black", lwd =5) text( x = median(SD2$steps),       y = 5.5,       labels = sprintf("Median = %.2f", median(SD2$steps)), col ="black", pos = 4)`

![](https://github.com/Bc5Neep/Reproducible-Research-Coursera/blob/main/Activity%20Monitoring%20plots/Median%20Total%20Steps%20Daily_activity_1.png)

### Generate weekday daily step activity subset from activity_1

`weekday <- activity_1 %>% slice (c(1:1440,2017:3457, 4033:3457, 4033:5473, 6049:7488, 8066:9505, 10082:11521, 12098:13536, 14113:15552, 16129:17568))`

### Generate weekend daily step activity subset from activity_1

`weekend <- activity_1 %>% slice (c(1441:2016, 3458:4032, 5474:6048, 7489:8065, 9506:10081, 11522:12097, 13537:14112, 11553:16128))`

### Designate values for aggregate and plot generation

`WD_Steps = weekday$steps`

`WD_Interval = weekday$interval WE_Steps = weekend$steps`

`WE_Interval = weekend$interval`

### Obtain means per interval for weekdays

`SD_WD <- aggregate(WD_Steps~WD_Interval, data=weekday, mean)`

### Obtain means per interval for weekends

`SD_WE <- aggregate(WE_Steps~WE_Interval, data=weekday, mean)`

### Determine coordinates for mean and median

`Max2 <- SD_WD [which.max(SD_WD$WD_Steps),]`

`x2 <- Max2$WD_Steps`

`y2 <- Max2$WD_Interval`

`Max3 <- SD_WE [which.max(SD_WE$WE_Steps),]`

`x3 <- Max3$WE_Steps`

`y3 <- Max3$WE_Interval`

### Generate plot for weekday vs weekend time series

`par(mfrow=c(2,1)) par(mar =c(4,4,2,2))`

`plot(SD_WD, type = "l",  xlab = "Intervals (5min)",  ylab = "Steps", main = "Weekday")  abline( v = 835, col ="red", lwd =2)  text(x = 865, y = 190, labels = sprintf("Max Steps = %.2f at interval 835", (x2)),  adj = 0, cex =0.6)`

`plot(SD_WE, type ="l",  xlab = "Intervals (5 min)",  ylab = "Steps", main = "Weekend")  abline( v = 855, col ="red", lwd =2)  text(x = 865, y = 150, labels = sprintf("Max Steps = %.2f at interval 855", (x3)),  adj = 0, cex = 0.6)`

![](https://github.com/Bc5Neep/Reproducible-Research-Coursera/blob/main/Activity%20Monitoring%20plots/Daily%20Step%20Activity%20Weekday%20vs%20Weekend%20Activity_1.png)
