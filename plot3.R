## Full Dataset
mytable <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
mytable$Date <- as.Date(mytable$Date, format = "%d/%m/%Y")

##Subset
subsetTable <- subset(mytable, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mytable)

## StringtoDate
datetime <- paste(as.Date(subsetTable$Date), subsetTable$Time)
subsetTable$Datetime <- as.POSIXct(datetime)


#3rd plot

with(subsetTable, {
        plot(Sub_metering_1 ~ Datetime, type = "l", 
             ylab = "Energy Sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))