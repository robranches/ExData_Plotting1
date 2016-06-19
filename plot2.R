## Full subsetTableset
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

##Plot 2
plot(subsetTable$Global_active_power ~ subsetTable$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")