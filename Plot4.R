consraw <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
consrawdt <- cbind(DateTime = as.POSIXct(paste(consraw$Date,consraw$Time), format="%d/%m/%Y %H:%M:%S"),consraw[c(3:9)])
consplot <- subset(consrawdt, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:59")
png("Plot4.png")
par(mfrow = c(2,2))
par(mar(0,0,0,0))
plot(consplot$DateTime,consplot$Global_active_power,ylab = "Global Active Power",xlab="",type="l")

plot(consplot$DateTime,consplot$Voltage,ylab = "Voltage",xlab="datetime",type="l")

plot(consplot$DateTime,consplot$Sub_metering_1,xlab = "", ylab = "Energy sub metering", col="black", type="l")
lines(consplot$DateTime,consplot$Sub_metering_2,col="red",type="l")
lines(consplot$DateTime,consplot$Sub_metering_3,col="blue",type="l")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")

plot(consplot$DateTime,consplot$Global_reactive_power,ylab = "Global_reactive_power",xlab="datetime",type="l")
dev.off()
