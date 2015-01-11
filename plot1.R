setwd("D:/Cédric/Repositery/R-repo/EDA/Project1")

raw_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

subset <- raw_data[which(raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007"),]

subset[,1] <- dmy(subset[,1])
subset[,2] <- hms(subset[,2])

for (i in 3:9)
    subset[,i] <- as.double(as.character(subset[,i]))

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)

hist(subset$Global_active_power, col = "red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")

dev.off()

