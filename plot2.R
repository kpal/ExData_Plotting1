data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.strings="?", nrows=1000000, stringsAsFactors=F)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)
subsetData <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"), 
                     DateTime < as.Date("2007-02-03 00:00:00"))

png("plot2.png", width=400, height=500)
plot(subsetData$Global_active_power, type="l", xaxt='n', 
     ylab='Global Active Power (kilowatts)', xlab='')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()