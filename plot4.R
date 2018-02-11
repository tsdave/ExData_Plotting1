## Load house hold power consumption data
hpc_data <- read.table("household_power_consumption.txt",header=TRUE,sep = ';',dec = ".",stringsAsFactors = FALSE,na.strings = "?")
hpc_data <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"), ] #subset data to required dates
hpc_data$datetime <- paste(hpc_data$Date,hpc_data$Time) # paste data and time column to make datatime column/variable
hpc_data$datetime <- strptime(hpc_data$datetime,format="%d/%m/%Y %H:%M:%S") # change datetime data to date & time format

## Plot multiple graphs to a file
png(filename = 'plot4.png') # plot to file
par(mfrow=c(2,2)) # set page format - four graphs on one page

## Plot 1: Global active power and datatime
plot(hpc_data$datetime,hpc_data$Global_active_power,type="l",ylab="Global Active Power(Kilowatts)",xlab = "")

## Plot 2: datatime and voltage
plot(hpc_data$datetime,hpc_data$Voltage,type="l",ylab="Volatage",xlab = "datetime")

## Plot 3: datatime and Energy sub metering
plot(hpc_data$datetime,hpc_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab = "")
lines(hpc_data$datetime,hpc_data$Sub_metering_2,col="Red")
lines(hpc_data$datetime,hpc_data$Sub_metering_3,col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n",col=c("black","red","blue"))

## Plot 4: datatime and Global reactive power
plot(hpc_data$datetime,hpc_data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab = "datetime")

dev.off() 