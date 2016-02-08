## Plot 2 script for programming assignment 1

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
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

## Create Line Graph Plot
plot(df$Global_active_power~df$fulldatetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## close png graphics device
dev.off()