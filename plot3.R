## Getting full dataset
sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Subsetting the data
dateddata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
activepower <- as.numeric(dateddata$Global_active_power)
subMetering1 <- as.numeric(dateddata$Sub_metering_1)
subMetering2 <- as.numeric(dateddata$Sub_metering_2)
subMetering3 <- as.numeric(dateddata$Sub_metering_3)

png("plot3.png")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
