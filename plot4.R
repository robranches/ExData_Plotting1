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

## 4 plot
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(subsetTable, {
        plot(Global_active_power ~ Datetime, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
             xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
               bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type = "l", 
             ylab = "Global_rective_power", xlab = "datetime")
})