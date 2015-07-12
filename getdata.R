library(lubridate)
library(datasets)

## a helper file to read in the data for the plotting
retrieveData <- function()
{
	## go retrieve the source file on the remote site if it doesn't exist
	if (!file.exists("household_power_consumption.txt"))
	{
		fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
		download.file(fileUrl, "source.zip")
		##sourcefile <- unzip("source.zip", exdir=".")
		unzip("source.zip", exdir=".")
	}

	## the source file exists already
	## retrieve data from these two days: 2007-02-01 and 2007-02-02 only
	sourcefile <- "household_power_consumption.txt"
	mydb <- read.table(sourcefile, skip=66636, header=T, sep=";", nrows=2880, na.strings="?")

	## assign descriptive names to the dataset
	names(mydb) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

	date1 <- as.character(mydb$Date)
	date1 <- dmy(date1)
	time1 <- as.character(mydb$Time)
	time1 <- hms(time1)
	date_time <- date1 + time1

	## create another field containing both date and time for making plots
	mydb$datetime <- date_time

	mydb
}