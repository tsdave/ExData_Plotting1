## Load house hold power consumption data
hpc_data <- read.table("household_power_consumption.txt",header=TRUE,sep = ';',dec = ".",stringsAsFactors = FALSE,na.strings = "?")
hpc_data <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"), ] #subset data to required dates
hpc_data$datetime <- paste(hpc_data$Date,hpc_data$Time) # paste data and time column to make datatime column/variable
hpc_data$datetime <- strptime(hpc_data$datetime,format="%d/%m/%Y %H:%M:%S") # change datetime data to date & time format

##Plot 3: Plot Engergy sub metering and datetime & print to file
png(filename = 'plot3.png') # plot to file
plot(hpc_data$datetime,hpc_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab = "")
lines(hpc_data$datetime,hpc_data$Sub_metering_2,col="Red")
lines(hpc_data$datetime,hpc_data$Sub_metering_3,col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()





