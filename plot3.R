attach(subsetData)

png("plot3.png",width=400, height=500)
plot(subsetData$Sub_metering_1, type="l", xaxt='n', 
     ylab='Energy sub metering', xlab='')
lines(subsetData$Sub_metering_2, xaxt='n', 
      ylab='Energy sub metering', xlab='', col=2)
lines(subsetData$Sub_metering_3, xaxt='n', 
      ylab='Energy sub metering', xlab='', col=4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c(1, 2, 4), lty=c(1, 1))
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()