data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dates <- data[,1]
times <- data[,2]
x <- paste(dates, times)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
data[["DateTime"]] <- DateTime
library(lubridate)
date1 <- as.POSIXct("2007-02-01 00:00:00")
date2 <- as.POSIXct("2007-02-02 24:00:00")
int <- new_interval(date1, date2)
newData <- data[data$DateTime %within% int,]
png("plot2.png")
plot(as.numeric(newData[,3])~strptime(newData$Date, "%d/%m/%Y"), xlab = NA,ylab = "Global Active Power (kilowatts)",yaxt="n", type = "l")
axis(side=2, at=seq(0,3000,1000), labels=seq(0,6,2))
dev.off()
     