## Plot 4 script for programming assignment 1

## Load the sqldf package
library(sqldf)

## Read in File Values for two days
fileloc <- paste(getwd(), "household_power_consumption.txt", sep = "/")
filename <- file(fileloc)
df <- sqldf("select * from filename where Date in('1/2/2007', '2/2/2007')", file.format = list(header = TRUE, sep = ";"))
close(filename)

## Create Datetime Column in df
plotdate <- paste(as.Date(df$Date, "%d/%m/%Y"), df$Time)
df$fulldatetime <- as.POSIXct(plotdate)

## Open png graphics device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

## Create 4 graph Plot
par(mfrow = c(2,2), mar = c(5,4,2,1))
plot(df$Global_active_power~df$fulldatetime, type="l", xlab="", ylab="Global Active Power (kilowatts)" )
plot(df$Voltage~df$fulldatetime, type = "l", xlab = "dateime", ylab = "Voltage")
plot(df$Sub_metering_1~df$fulldatetime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$Sub_metering_2~df$fulldatetime, col = "red")
lines(df$Sub_metering_3~df$fulldatetime, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(df$Global_reactive_power~df$fulldatetime, type="l", xlab="datetime", ylab="Global_reactive_power" )

## close png graphics device
dev.off()