#reading "household_power_consumption.txt" into HPCdatatable
HPCdatatable <- "./household_power_consumption.txt"

#reading the data from dataFile
data <- read.table(HPCdatatable, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#selecting data points between 1/2/2007 and 2/2/2007
HPCsubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(HPCsubSet$Date, HPCsubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#reading Global_active_power column
HPCglobalActivePower <- as.numeric(HPCsubSet$Global_active_power)

#Defining output png settings
png("plot2.png", width=480, height=480)

#Generating Plot
plot(datetime, HPCglobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()