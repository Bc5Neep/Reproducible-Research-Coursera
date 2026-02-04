# Load libraries
library(tidyverse)

# Import file and create data object

activity <- read_csv("activity.csv")
sum(activity$steps, na.rm = TRUE)

# Designate values for aggregation
Steps = activity$steps
Date = activity$date
Interval = activity$interval
SD <- aggregate(Steps~Date, data = activity, sum)
SDI <- aggregate(Steps~Date + Interval, activity, sum)

# Calculate and report mean and median of the total number of steps taken daily# Mean

#Mean
mean(SD$Steps, trim = 0, na.rm =TRUE)

par(mfcol =c(1,1))

hist(SD$Steps, breaks = 53, main = "Steps Daily", xlab = "steps")
abline(v = mean(SD$Steps),
       col ="red",
       lwd = 3)
text( x = mean(SD$Steps),
      y = 5.5,
      labels = sprintf("Mean = %.0f", mean(SD$Steps)),
      col ="black",
      pos = 4)
# Median
median(SD$Steps)

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

# Average steps per interval across days      
SD1 <- aggregate(Steps~Interval, data = activity, mean)

# Determine Range
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


# Calculate total number of NA values

colSums(is.na(activity))

# What are their row numbers?
which(is.na(activity))

NAS <- colSums(is.na(activity))

data.frame(table(NAS))

# Print list
# First expand max.print
options(max.print = 3000)
data.frame(which(is.na(activity)))

# Isolate NAs

NA_ROWS <- activity %>%
  slice (c(1:288, 2017:2304, 8929:9216, 9793:10080, 11233:11520, 11521:11808, 12673:12960, 17281:17568))

# Isolate NA Value dates  

NA_OCT1 <- NA_ROWS[1:288,]

# Overlay with mean activity values per interval

NA_Overlay_Oct1 <- cbind(SD1, NA_OCT1)

NA_OCT8 <- NA_ROWS[289:576,]

NA_NOV1 <- NA_ROWS[577:864,]

NA_NOV4 <- NA_ROWS[865:1152,]

NA_NOV9 <- NA_ROWS[1153:1440,]

NA_NOV10 <- NA_ROWS[1441:1728,]

NA_NOV14 <- NA_ROWS[1729:2016,]

NA_NOV30 <- NA_ROWS[2017:2304,]