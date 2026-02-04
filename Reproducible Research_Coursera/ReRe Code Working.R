library(tidyverse)
activity <- read_csv("activity.csv")
sum(activity$steps, na.rm = TRUE)

Steps = activity$steps
Date = activity$date
Interval = activity$interval
SD <- aggregate(Steps~Date, data = activity, sum)
SDI <- aggregate(Steps~Date + Interval, activity, sum)

# Barplot/Histogram
ggplot(SD, aes (x = Date, y = Steps))+
  stat_summary( fun = sum, geom = "bar",
    fill = "blue", color = "black" )+
  labs(title = "Total Steps Taken Each Day",
       x = "Date",
       y = "Steps")
# Calculate Total Number of Steps Taken per Day
# Histogram
ggplot(SD, aes( x = Date, weight = Steps))+
  geom_histogram(binwidth = 1,
                 fill = "blue",
                 color = "black")+
  labs(title = "Total Steps Taken Each Day",
       x = "Date",
       y = "Steps")



# Calculate and report mean and median of the total number of steps taken daily

mean(SD$Steps, trim = 0, na.rm =TRUE)

median(SD$Steps)

hist(SD$Steps, breaks = 53, main = "Steps Daily", xlab = "steps")
abline(v = mean(SD$Steps),
        col ="red",
        lwd = 3)
text( x = mean(SD$Steps),
      y = 5.5,
       labels = sprintf("Mean = %.0f", mean(SD$Steps)),
        col ="black",
        pos = 4)

hist(SD$Steps, breaks = 53, main = "Steps Daily", xlab = "steps")
abline(v = median (SD$Steps),
        col = "black",
        lwd =5)
text( x = median(SD$Steps),
      y = 5.5,
      labels = sprintf("Median = %.0f", median(SD$Steps)),
      col ="black",
      pos = 4)
# Time series plot with 5 minute interval and average number of steps taken

# Calculate mean steps taken across all 5 minute intervals

mean(activity$steps, na.rm =TRUE)
SM <- mean(activity$steps, na.rm =TRUE)
# Identify Range

range(activity$steps, na.rm = TRUE)

# Identify interval with most step activity

MaxStep <- activity %>%
  filter(activity$steps == "806")
print(MaxStep)

MMS <- which.max(SD1$Steps)


MaxStepRE <- activity %>%
  filter(activity$steps == "16492")
print(MaxStepRE)

# Generate plot

plot(activity$interval, activity$steps, 
     type = "l",
     xlab = "interval", 
     ylab = "steps", 
     main = "Daily Activity Pattern")
text( x = 50,
      y = 300,
      labels = sprintf("Mean = %.2f", SM),
      col ="black",
      pos = 4)
arrows( x = 806,
        y = 615,
        col = "red",
        lwd = 2)
text( x = 850,
      y = 620,
      labels = ("MaxSteps = 806"),
                col ="red"
                )


Max <- which.max(activity$steps)

x0 <- activity$interval[Max]
y0 <- activity$steps[Max]


  
# Generate time series plot
  
  plot(activity$interval, activity$steps, 
       type = "l",
       xlab = "Intervals (5 min)", 
       ylab = "Steps", 
       main = "Daily Activity Pattern")
       abline( v = 615,
               col ="red",
               lwd =2)
       text(x = 615, y = 810,
            labels = sprintf("MaxSteps = %d at interval 615", (y0)),
            adj = 0,
            cex =0.6)
       text(x = 150,
            y = 300,
            labels = sprintf("Mean = %.2f", SM),
            col ="black",
            cex = 0.8)
# Average steps per interval across days      
SD1 <- aggregate(Steps~Interval, data = activity, mean)

SD2 <- aggregate(Steps~Interval, data = activity, mean, na.rm =TRUE)
MMS <- which.max(SD1$Steps)

y1 <- SD1$Steps[MMS]
range(SD1$Steps)

# Interval with max mean steps 
Max1 <- SD1 [which.max(SD1$Steps),]
x1 <- Max1$Interval
y1 <- Max1$Steps


# Generate plot
plot(SD1$Interval, SD1$Steps, 
     type = "l",
     xlab = "Intervals (5 min)", 
     ylab = "Steps", 
     main = "Average Daily Activity Pattern")
abline( v = 835,
        col ="red",
        lwd =2)
text(x = 865, y = 190,
     labels = sprintf("Max Avg Steps = %.2f at interval 835", (y1)),
     adj = 0,
     cex =0.6)

NAS <- activity %>%
select(activity$steps = "NA")
NAS0 = (activity$steps == "NA")
NAS<- aggregate(NAS0~Date, data = activity, sum)

NAS <- activity %>%
  length(which(activity$steps == "NA"))