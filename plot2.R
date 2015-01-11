#setwd("D:/Cédric/Repositery/R-repo/EDA/Project1")

raw_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

subset <- raw_data[which(raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007"),]

subset[,10] <- as.POSIXct(paste(subset[,1], subset[,2]), format="%d/%m/%Y %H:%M:%S")

for (i in 3:9)
    subset[,i] <- as.double(as.character(subset[,i]))


png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)

plot(subset$V10, subset$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
axis(side=2, at=seq(0, 6000, 2000), labels=c(0,2,4,6))

dev.off()

