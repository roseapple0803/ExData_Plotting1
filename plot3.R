library(datasets)
library(lubridate)


## a function to construct plot3
draw_plot3 <- function()
{
	## get the source data for plotting
	source("getdata.R")
	thedata <- retrieveData()

	png(file="plot3.png", width=480, height=480) ## call a graphics device and send the plot to the file, plot3.png
	par(lwd=2) ## set parameter
	
	## draw the plot
	with(thedata, plot(datetime, Sub_metering_1, type="l", xlab="", ylab ="Energy sub metering"))
	with(thedata, lines(datetime, Sub_metering_2, col="red"))
	with(thedata, lines(datetime, Sub_metering_3, col="blue"))
	legend("topright", cex = 0.9, pch = c(NA, NA, NA), lwd = 1, lty = c(1, 1, 1), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")  )
	dev.off() ## close the device
}
