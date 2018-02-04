## set working directory
setwd("E:/Мои документы/! R")

## load data to new variable data_File
data_File <- "household_power_consumption.txt"

## reads a file in table format and creates a data frame from it, with cases corresponding to lines and variables to fields in the file
data <- read.table(data_File, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## convert between character representations and objects of classes "POSIXlt" and "POSIXct" representing calendar dates and times
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## creates objects of type "numeric" is a more general test of an object being interpretable as numbers.
globalActivePower <- as.numeric(subSetData$Global_active_power)

# open device
png("plot2.png", width = 480, height = 480)

# plot data
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close device
dev.off()
