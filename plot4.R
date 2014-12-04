data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   na.strings="?", nrows=1000000, stringsAsFactors=F)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

library(dplyr)
subsetData <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"), 
                     DateTime < as.Date("2007-02-03 00:00:00"))

png("plot4.png", width=500, height=500)

par(mfrow = c(2,2))

plot(subsetData$Global_active_power, type="l", xaxt='n', 
     ylab='Global Active Power', xlab='')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

plot(subsetData$Voltage, type="l", xaxt='n', 
     ylab='Voltage', xlab='datetime')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

plot(subsetData$Sub_metering_1, type="l", xaxt='n', 
     ylab='Energy sub metering', xlab='')
lines(subsetData$Sub_metering_2, xaxt='n', 
      ylab='Energy sub metering', xlab='', col=2)
lines(subsetData$Sub_metering_3, xaxt='n', 
      ylab='Energy sub metering', xlab='', col=4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c(1, 2, 4), lty=c(1, 1), bty='n')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

plot(subsetData$Global_reactive_power, type="l", xaxt='n', 
     ylab='Global_reactive_power', xlab='datetime')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

dev.off()