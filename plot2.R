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
png(filename = "plot2.png", width = 480, height = 480)

# show global active power over time during these two days, specify type "l" for line, with y label but no x label
plot(df2$DateTime, df2$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# end writing to device
dev.off()