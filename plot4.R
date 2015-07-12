library(datasets)
library(lubridate)


## a file to construct plot4
draw_plot4 <- function()
{
	## get the source data for plotting
	source("getdata.R")
	thedata <- retrieveData()	

	png(file="plot4.png", width=480, height=480) ## call a graphics device and send the plot to the file, plot4.png
	par(mfrow = c(2, 2), lwd = 2) ## set parameter

	## draw the plot
	with(thedata, {
	  plot(datetime, Global_active_power, xlab="", type="l")
	  plot(datetime, Voltage, type="l")
	  plot(datetime, Sub_metering_1, type="l", xlab="", ylab ="Energy sub metering")
 	  lines(datetime, Sub_metering_2, col="red")
 	  lines(datetime, Sub_metering_3, col="blue")
 	  legend("topright", lwd = 1, cex = 0.9, bty="n", pch = c(NA, NA, NA), lty = c(1, 1, 1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 	  plot(datetime, Global_reactive_power, type="l")
 	})

	dev.off() ## close the device
}
