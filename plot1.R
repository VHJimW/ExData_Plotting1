## Plot 1 script for programming assignment 1

## Load the sqldf package
library(sqldf)

## Read in File Values for two days
fileloc <- paste(getwd(), "household_power_consumption.txt", sep = "/")
filename <- file(fileloc)
df <- sqldf("select * from filename where Date in('1/2/2007', '2/2/2007')", file.format = list(header = TRUE, sep = ";"))
close(filename)

## Open png graphics device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

## Create Histogram Plot
hist(df$Global_active_power, col = "red"
      , xlab = "Global Active Power (kilowatts)"
      , main = "Global Active Power"
     , ylim = c(0,1200)
                        )

## close png graphics device
dev.off()

