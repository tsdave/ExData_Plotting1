setwd("~/Documents/DSS/Course 4 - Exploratory Data Analysis /WorkingDirCourse4")

## Load house hold power consumption data
hpc_data <- read.table("household_power_consumption.txt",header=TRUE,sep = ';',dec = ".",stringsAsFactors = FALSE,na.strings = "?")
hpc_data <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"), ] #subset data to required dates
hpc_data$datetime <- paste(hpc_data$Date,hpc_data$Time) # paste data and time column to make datatime column/variable
hpc_data$datetime <- strptime(hpc_data$datetime,format="%d/%m/%Y %H:%M:%S") # change datetime data to date & time format

##Plot 2: Plot Global Active power and datetime & print to file
png(filename = 'plot2.png') # plot to file
plot(hpc_data$datetime,hpc_data$Global_active_power,type="l",ylab="Global Active Power(Kilowatts)",xlab = "")
dev.off()
