# download data

download.file(url="https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip", 
              destfile="../data/activitydata.zip", 
              method="curl")
unzip(zipfile="../data/activitydata.zip", exdir="../data/", overwrite=TRUE)
