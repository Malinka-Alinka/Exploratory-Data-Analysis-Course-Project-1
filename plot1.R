## set working directory
setwd("E:/Мои документы/! R")

## load data to new variable data_File
data_File <- "household_power_consumption.txt"

## read table
data <- read.table(data_File, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subSetData$Global_active_power)

## open device
png("plot1.png", width=480, height=480)

## plot data
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Turn off device
dev.off()
