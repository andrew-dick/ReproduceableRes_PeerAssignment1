# download data

download.file(url="https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip", 
              destfile="../data/activitydata.zip", 
              method="curl")
unzip(zipfile="../data/activitydata.zip", exdir="../data/", overwrite=TRUE)

rawdata <- read.csv(file="../data/activity.csv")

# set up plot type
plotdata <- na.omit(rawdata)
plotdata$date <- as.Date(plotdata$date)
plotdata$day <- weekdays(plotdata$date)
plotdata$weekpart <- "weekday"
plotdata[ which(plotdata$day == "Saturday" | plotdata$day == "Sunday"), ]$weekpart <- "weekend"
plotdata$weekpart <- as.factor(plotdata$weekpart)

# plot data

library(ggplot2)

qplot(interval, steps, data = plotdata, facets = weekpart ~. ,stat = "summary", fun.y = "mean", geom = "line")
