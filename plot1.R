# read in the data, assuming we are in the same working directory as the text file
df <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

# filter to the days we want
df2 <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

# initialize png device
png(filename = "plot1.png", width = 480, height = 480)

# create a histogram with red bars, main title, and axis labels
hist(df2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# end writing to device
dev.off()