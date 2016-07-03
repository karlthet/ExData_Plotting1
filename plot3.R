# Read in the data
# assumes the file is in the working directory
data <- read.csv2("household_power_consumption.txt",na.strings = "?")

# Subset to only Feb. 1 and 2 2007. The dates in question
data <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")

# Create a new column that has a Date object representing the date and time
data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# Replace the old columns with the new one
data <- data[,c(10,3:9)]

#open the device driver for PNG
png("plot3.png")

# Plot the three lines, converting the factored variables to numeric 
# and setting apropiate labels. 
plot(data$DateTime,as.numeric(as.character(data$Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_2)),col="Red")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_3)),col="Blue")

# Create the Legend
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# close the device
dev.off()
