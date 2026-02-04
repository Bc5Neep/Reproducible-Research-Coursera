# Load libraries
library(dplyr)
library(fread)
library(tidyverse)
activity <- read_csv("activity.csv")


str(activity)
sum(activity$steps, na.rm = TRUE)

 

Steps = activity$steps
Date = activity$date
          
cumulatestep <- aggregate(Steps~Date, data = activity, sum)       


hist(cumulatestep$Date, breaks = 61, col = "magenta")


cstep <-ggplot(cumulatestep, aes(x = Date)) +
  geom_histogram( bins =53, fill = "magenta")+
  labs(title = "Cumulative Steps Per Day")
             
 
        
        cstep <-ggplot(cumulatestep, aes(x = Date)) +
          geom_histogram( binwidth = 0.3, fill = "blue")+
          labs(title = "Cumulative Steps Per Day")
        
ggsave("plot1.png", plot = cstep, width = 10, height = 5, units = 'in', dpi = 300)
         
  cstep1 <-ggplot(cumulatestep, aes(x = Date, y = after_stat(cumsum(count))) +
          geom_histogram( binwidth = 1.0, fill = "blue")+
          labs(title = "Cumulative Steps Per Day",
               x = "Date",
               y =  "Cumulative_Count"))
        
        ggsave("plot1.png", plot = cstep1, width = 10, height = 5, units = 'in', dpi = 300) 
        
        
                   
        
        
        ggplot(cumulatestep, aes (x = Date))+
          stat_bin(binwidth = 1,
                   aes (y = after_stat(cumsum(count))),
                   fill = "blue",
                   color = "black")+
          labs(title = "Cumulative Steps Per Day",
               x = "Date",
               y =  "Cumulative Count")
        
        
        ggplot(cumulatestep, aes (x = Date))+
          stat_bin(binwidth = 1,
                   aes (y = after_stat(cumsum(Steps))),
                   fill = "blue",
                   color = "black")+
          labs(title = "Cumulative Steps Per Day",
               x = "Date",
               y =  "Cumulative Count")
        
        
        ggplot(cumulatestep, aes (x = Date, y = Steps))+
          stat_summary( fun = sum, geom = "bar")
        
        
        
        ggplot(cumulatestep, aes (x = Date))+
          geom_histogram(aes( y = after_stat(count), bins = 53))
           
    
        ggplot(cumulatestep, aes (x = Date))+
          geom_histogram(y = Steps)
 
        
      ggplot(activity, aes( x = Date, y = Steps),
        fill = "blue",
        color ="black")
        labs(title = "Total Steps Taken Each Day",
             x = "Date",
             y = "Steps")
      ggplot(cumulatestep, aes( x = Date, weight = Steps))+
        geom_histogram(binwidth = 1,
         fill = "blue",
         color = "black")+
        labs(title = "Total Steps Taken Each Day",
             x = "Date",
             y = "Steps")
      
      
      
      mean(activity$steps, trim = 0, na.rm =TRUE)
      mean(activity$steps, trim = 0, na.rm =TRUE)
      
      ggplot(cumulatestep, aes( x = Date, weight = mean(Steps)))+
        geom_histogram(binwidth = 1,
                       fill = "blue",
                       color = "black")+
        labs(title = "Total Steps Taken Each Day",
             x = "Date",
             y = "Steps")
      
      CS <- cumulatestep
      
      hist(CS$Steps, main = "Steps per Day", xlab = "Steps")
      abline( v = mean(CS$Steps),
      lwd = 2,
      col = "red")
text(x = mean(CS$Steps),
     y = max(CS$Steps) * 0.01,
     paste("Mean =", mean(CS$Steps)),
     col ="red", 
     cex = 1)

ACT <-ggplot (data.frame(CS$Steps), aes(CS$Steps)) +
 geom_histogram(bins = 5)
 
ACT + geom_vline(xintercept = mean(CS$Steps))
col ="red"
lwd = 3
annotate("text",
         x = mean(CS$Step) * 0.9,
         y =mean (CS$Steps)* 0.9,
         label = paste("Mean =", mean(CS$Steps)),
         color = "red",
         size = 8)
labs(title = "Steps/Day"
     x = "Number_of_Steps"
     y = "Frequency"
     
        
         
#For label of MaxStep
     
     text( x = 615
           y = 806
           labels = sprintf("Mean = %.0f", SM),
           col ="black",
           pos = 4)

     plot(activity$interval, activity$steps, 
          type = "l",
          xlab = "interval", 
          ylab = "steps", 
          main = "Daily Activity Pattern")
     arrows( x = 806,
             y = 615,
             col = "red",
             lwd = 2,
           labels = ("MaxSteps = 806"),
            x = 850,
           y = 650,
           col ="black"
     )
     
     
     
     Max <- which.max(activity$steps)
     
     x0 <- activity$interval[Max]
     x1 <- activity$steps[Max]
     
     
     plot(activity$interval, activity$steps, 
          type = "l",
          xlab = "interval", 
          ylab = "steps", 
          main = "Daily Activity Pattern")
     
   
     #Arrows  
     arrows(  
       x0 = x0,
       y0 = y0 + 20,
       x1 =x0,
       y1 =y0,
       col ="red",
       lwd =2)
     
     #Text
     text(
       x = x0,
       y = y0 + 40,
       labels(sprintf("Max = %d", y0))
     )
     
     plot(activity$interval, activity$steps, 
          type = "l",
          xlab = "interval", 
          ylab = "steps", 
          main = "Daily Activity Pattern"),
     
     
     
     
     text( x = 615,
          y = 820,
          labels = "MaxSteps = 806",
          col = "red"),
     text( x = 25,
           y = 700,
           labels (sprintf("Mean= %0f, SM")),
           col = "black",
           pos = 4)
     
     ticks < - activity$date
     
     
     NAS <- activity %>%
       select(activity$steps)
     
NAS = activity$steps == "NA"

NAS0 <- aggregate(DATE~NAS, data = activity, sum)

weekday <- activity_1$date (c(2012-10-01-2012-10-05))



wd <- activity_1$date (c(2012-10-01-2012-10-05, 2012-10-08-2012-10-12 ))
))