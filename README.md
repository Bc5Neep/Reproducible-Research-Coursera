# Physical Activity Dataset

## Introduction

Gyroscope facilitated quantification of movement in the form of step count was the original, foundational physical activity metric captured by electronic device. This is expanded upon with capture of other periodic physiological metrics for the generation real time health profiles in the age of fitness wearables. This study in particular collects the step count pattern of a single user, collected in 5 minute intervals over the course of 61 days, from October 1, 2012 to November 30, 2012. This makes use of the principle that increases in sampling rate yield proportionately higher resolution information that can potentially reveal meaningful trends and patterns in data.

The dataset [Activity monitoring data](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip) data is a 17568 x 3 .csv file contains the all data and consists of the following variables:

```         
• steps: Number of steps taking in a 5-minute interval (missing values are coded as NA)
• date: The date on which the measurement was taken in YYYY-MM-DD format
• interval: Identifier for the 5-minute interval in which measurement was taken
```

## Assignment

The assignment calls for the following: Calculate and/or represent in plot form

1)  Total number of steps taken per day

2)  Average number of steps taken per day (Calculate and represent in plot form)

3)  Mean number of steps taken per day (Calculate and represent in plot form)

4)  Time series profile of average step activity per 5 minute interval and determination of the maximum step number

## Impute Missing NA values

Impute missing NA values (like empirical, inductive, interpolation) in activity.csv to generate a modified activity.csv dataset (activity_1).

Perform analyses and generate plots 1-3 in new activity_1 dataset with NAs replaced by imputed values.

Separate weekday and weekend dates are into individual variables and generate time series activity(step)/interval plots of each.

Compare average activity rate between weekdays and weekends.

Determine time of week and interval with highest step activity.

Author: [Bc5Neep](https://github.com/Bc5Neep)

License: [GPL-3.0-1](https://github.com/Bc5Neep/Reproducible-Research-Coursera?tab=GPL-3.0-1-ov-file#readme)
