#reading "household_power_consumption.txt" into HPCdatatable
HPCdatatable <- "./household_power_consumption.txt"

#reading the data from dataFile
data <- read.table(HPCdatatable, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#selecting data points between 1/2/2007 and 2/2/2007
HPCsubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(HPCsubSet$Date, HPCsubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

HPCglobalActivePower <- as.numeric(HPCsubSet$Global_active_power)
  subMetering1 <- as.numeric(HPCsubSet$Sub_metering_1)
  subMetering2 <- as.numeric(HPCsubSet$Sub_metering_2)
  subMetering3 <- as.numeric(HPCsubSet$Sub_metering_3)

#Defining output png settings
png("plot3.png", width=480, height=480)

#Generating Plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()