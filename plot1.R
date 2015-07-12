library(datasets)
library(lubridate)


## a file to construct plot1
draw_plot1 <- function()
{
	## get the source data for plotting
	source("getdata.R")	
	thedata <- retrieveData()

	png(file="plot1.png", width=480, height=480) ## call a graphics device and send the plot to the file, plot1.png
	par(lwd=2) ## set parameter

	## draw the plot
	with(thedata, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
	dev.off() ## close the device
}
