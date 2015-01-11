
raw_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

subset <- raw_data[which(raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007"),]

subset[,10] <- as.POSIXct(paste(subset[,1], subset[,2]), format="%d/%m/%Y %H:%M:%S")

for (i in 3:9)
  subset[,i] <- as.double(as.character(subset[,i]))

png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12)

plot(subset$V10, subset$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering", col="black")
lines(subset$V10, subset$Sub_metering_2, type = "l", xlab ="", ylab = "Energy sub metering", col="red")
lines(subset$V10, subset$Sub_metering_3, type = "l", xlab ="", ylab = "Energy sub metering", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), lwd =c(1, 1, 1), col=c("black", "red", "blue"), x.intersp=0.5, y.intersp=0.75)

dev.off()
