raw_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

subset <- raw_data[which(raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007"),]

subset[,10] <- as.POSIXct(paste(subset[,1], subset[,2]), format="%d/%m/%Y %H:%M:%S")

for (i in 3:9)
  subset[,i] <- as.double(as.character(subset[,i]))

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12)

par(mfrow = c(2,2), mar=c(4,4,4,4), pty="m")

plot(subset$V10, subset$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
axis(side=2, at=seq(0, 6000, 2000), labels=c(0,2,4,6))

plot(subset$V10, subset$Voltage, type = "l", xlab="datetime", ylab="Voltage")
axis(side=2, at=seq(0, 6000, 2000), labels=c(0,2,4,6), xlab ="datetime")

plot(subset$V10, subset$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering", col="black")
lines(subset$V10, subset$Sub_metering_2, type = "l", xlab ="", ylab = "Energy sub metering", col="red")
lines(subset$V10, subset$Sub_metering_3, type = "l", xlab ="", ylab = "Energy sub metering", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd =c(1, 1, 1), col=c("black", "red", "blue"), xjust=1, y.intersp=0.5)
axis(side=2, at=seq(0, 6000, 2000), labels=c(0,2,4,6))

plot(subset$V10, subset$Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power")
axis(side=2, at=seq(0, 6000, 2000), labels=c(0,2,4,6), xlab ="datetime")

dev.off()
