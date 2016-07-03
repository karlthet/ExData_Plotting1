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
png("plot2.png")

# Plot the data, with lines, converting the factored variable to numeric 
# and setting apropiate labels. 
plot(data$DateTime,as.numeric(as.character(data$Global_active_power)),
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# close the device
dev.off()
