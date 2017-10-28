# read in the data, assuming we are in the same working directory as the text file
df <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# filter to the days we want
df2 <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

# create new datetime variable as suggested by the instructions
df2$DateTime <- strptime(paste0(df2$Date, " ", df2$Time), format = "%d/%m/%Y %H:%M:%S")

# convert Date column to Date type
df2$Date <- as.Date(df2$Date, format = "%d/%m/%Y")

# create new column for day of week, abbreviated
df2$DOW <- weekdays(df2$Date, abbreviate = T)

# initialize png device
png(filename = "plot4.png", width = 480, height = 480)

# set up our panels
par(mfrow = c(2, 2))

# first panel, recycle code from plot2, y label is slightly shorter
plot(df2$DateTime, df2$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power")

# second panel, voltage over time
plot(df2$DateTime, df2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# third panel, recycle code from plot3
plot(df2$DateTime, df2$Sub_metering_1, type= "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(df2$DateTime, df2$Sub_metering_2, col = "red")
lines(df2$DateTime, df2$Sub_metering_3, col = "blue")
legend("topright", "groups", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

# fourth panel, global reactive power over time
plot(df2$DateTime, df2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# end writing to device
dev.off()