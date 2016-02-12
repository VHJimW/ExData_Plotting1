## Plot 3 script for programming assignment

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
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

## Create color line graph Plot
plot(df$fulldatetime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(df$fulldatetime, df$Sub_metering_2, col = "red")
lines(df$fulldatetime, df$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## close png graphics device
dev.off()