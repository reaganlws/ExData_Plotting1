core_data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", quote = '\"', na.strings = "?") 
core_data$Date <- as.Date(core_data$Date, format ="%d/%m/%Y") 
core_data$Time <- as.POSIXct(paste(core_data$Date, core_data$Time), format="%Y-%m-%d %H:%M:%S") 
 

#Subset Data 
plot3_subset  <- subset(core_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
 

## Send a copy to the plot3.png output file 
png("plot3.png", height=480, width=480) 
 

# Plot Graphs and annotate where necessary 
plot(plot3_subset$Time, plot3_subset$Sub_metering_1, type = "l",   
      xlab = "", ylab = "Energy sub metering") 
lines(plot3_subset$Time, plot3_subset$Sub_metering_2, col = "Red") 
lines(plot3_subset$Time, plot3_subset$Sub_metering_3, col = "Blue") 
legend("topright", pch = "--",  col = c("Black", "Red", "Blue"),  
        legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")) 
 

dev.off() 
