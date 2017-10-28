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
png(filename = "plot3.png", width = 480, height = 480)

# gonna be kind of similar to plot2, except with 3 lines

# draw black line for sub metering 1, with axis labels
plot(df2$DateTime, df2$Sub_metering_1, type= "l", col = "black", xlab = "", ylab = "Energy sub metering")

# draw red line for sub metering 2
lines(df2$DateTime, df2$Sub_metering_2, col = "red")

# draw blue line for sub metering 3
lines(df2$DateTime, df2$Sub_metering_3, col = "blue")

# add legend in top right corner, specifying series names, colors, and line types
legend("topright", "groups", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

# end writing to device
dev.off()