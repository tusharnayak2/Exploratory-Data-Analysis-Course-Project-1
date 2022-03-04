## Getting full dataset
sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Subsetting the data
dateddata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Histogram for Plot 1
activepower <- as.numeric(dateddata$Global_active_power)
png("plot1.png")
hist(activepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
