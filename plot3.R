## set working directory
setwd("E:/Мои документы/! R")

## load data to new variable data_File
dataFile <- "household_power_consumption.txt"

## reads a file in table format and creates a data frame from it, with cases corresponding to lines and variables to fields in the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert between character representations and objects of classes "POSIXlt" and "POSIXct" representing calendar dates and times
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## creates objects of type "numeric" is a more general test of an object being interpretable as numbers.
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## open device
png("plot3.png", width=480, height=480)

## plot data
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

## add connected line segments to a plot
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

## add legends to plots
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# close device
dev.off()
