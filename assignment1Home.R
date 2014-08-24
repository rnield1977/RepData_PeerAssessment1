library(lubridate)
library(caret)
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip","repdata.zip")
activitydt <- read.csv(unz("repdata.zip","activity.csv"))
acna <- is.na(activitydt$steps)

activitydt[acna,]$steps = 0

activitydt$date <- ymd(activitydt$date)



meanstepsday <- aggregate(steps ~ date, data=activitydt, mean)
medstepsday <- aggregate(steps ~ date, data=activitydt, median)
aggregate(steps ~ cut(date, breaks="week"), data=activitydt, mean)

meanstepsweek <- aggregate(steps ~ cut(date, breaks="week"), data=activitydt, mean)
medstepsweek <- aggregate(steps ~ cut(date, breaks="week"), data=, median)

plot(activitydt$date, activitydt$steps, type="h", ylab="Steps", xlab="Date")
title("Steps via Date")

plot(meansteps$date, meansteps$steps, xlab="Date", ylab="Steps", type="h")
title("Steps each day")

plot(medsteps$date, medsteps$steps, xlab="Date", ylab="Steps", type="h")
title("Steps each day")

plot(cut(meansteps$date, breaks="month"), meansteps$steps, xlab="Date", ylab="Steps", type="l")
