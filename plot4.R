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
png("plot4.png")

# create the layout for the four plots
par(mfcol=c(2,2))

# Plot the first (topleft) plot. (same as plot 2 with different label)
plot(data$DateTime,as.numeric(as.character(data$Global_active_power)),
     type = "l", ylab = "Global Active Power", xlab = "")

# plot the second (bottomleft) plot. (same as plot 3)
plot(data$DateTime,as.numeric(as.character(data$Sub_metering_1)),type="l",
     ylab="Energy sub metering",xlab="")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_2)),col="Red")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_3)),col="Blue")

## and its Legend
legend('topright',lty=c(1,1,1),col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot the third (topright) plot, voltage against time
plot(data$DateTime,as.numeric(as.character(data$Voltage)),
     type="l",ylab="Voltage",xlab="datetime")

# plot the fourth (bottomright) plot, reactive power against time
plot(data$DateTime,as.numeric(as.character(data$Global_reactive_power)),
     type="l",ylab="Global_reactive_power",xlab="datetime")

# close the device
dev.off()
