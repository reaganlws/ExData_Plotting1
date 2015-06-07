core_data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", quote ='\"', na.strings = "?")
core_data$Date <- as.Date(core_data$Date, format ="%d/%m/%Y")
core_data$Time <- as.POSIXct(paste(core_data$Date, core_data$Time), format="%Y-%m-%d %H:%M:%S")

plot1_subset <- subset(core_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
hist(plot1_subset$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off