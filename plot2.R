library(datasets)
library(lubridate)


## a file to construct plot2
draw_plot2 <- function(workDir)
{
	setwd(workDir)
	
	## get the source data for plotting
	source("getdata.R")
	thedata <- retrieveData()

	png(file="plot2.png", width=480, height=480) ## call a graphics device and send the plot to the file, plot2.png
	par(lwd=2) ## set parameter
	
	## draw the plot
	with(thedata, plot(datetime, Global_active_power, type="l",  xlab="", ylab="Global Active Power (kilowatts)"))
	dev.off() ## close the device
}
