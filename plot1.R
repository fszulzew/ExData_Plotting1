#reading "household_power_consumption.txt" into HPCdatatable
HPCdatatable <- "./household_power_consumption.txt"

#reading the data from dataFile
data <- read.table(HPCdatatable, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#selecting data points between 1/2/2007 and 2/2/2007
HPCsubSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#reading Global_active_power column
HPCglobalActivePower <- as.numeric(HPCsubSet$Global_active_power)

#Defining output png settings
png("plot1.png", width=480, height=480)

#Generating Histogram
hist(HPCglobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()