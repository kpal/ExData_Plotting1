attach(subsetData)

png("plot2.png",width=400, height=500)
plot(subsetData$Global_active_power, type="l", xaxt='n', 
     ylab='Global Active Power (kilowatts)', xlab='')
axis(1, at=c(1, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()