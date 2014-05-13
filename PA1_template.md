# Peer Assignment

## Download data script

```r
download.file(url = "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip", 
    destfile = "../data/activitydata.zip", method = "curl")
unzip(zipfile = "../data/activitydata.zip", exdir = "../data/", overwrite = TRUE)
```


## Impute missing values

* TODO - fill in the missing values (5 minute equivalence)


```r
rawdata <- read.csv(file = "../data/activity.csv")
plotdata <- na.omit(rawdata)
```


## Set up data for plotting

```r
plotdata$date <- as.Date(plotdata$date)
plotdata$day <- weekdays(plotdata$date)
plotdata$weekpart <- "weekday"
plotdata[which(plotdata$day == "Saturday" | plotdata$day == "Sunday"), ]$weekpart <- "weekend"
plotdata$weekpart <- as.factor(plotdata$weekpart)
```


## Show totals

### Histogram

TODO - Histogram

### Mean and median

TODO - Mean data

## Plot daily activity pattern

```r
library(ggplot2)
qplot(interval, steps, data = plotdata, facets = weekpart ~ ., stat = "summary", 
    fun.y = "mean", geom = "line")
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 
