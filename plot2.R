# Read data from the file
Cl1 <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
Data <- read.table("household_power_consumption.txt", sep = ';', header = T, colClasses = Cl1, na.strings = "?")

# Check data
head(Data)
str(Data)

# Data filtering and Date&Time conversion
Data$Date1 <- as.Date(Data$Date, format = "%d/%m/%Y")
Data <- Data[Data$Date1>="2007-02-01" & Data$Date1 <= "2007-02-02", ]
Data$Time <- strptime(paste(Data$Date, Data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
Data <- Data[, 2:9]
str(Data)

# Figure creation (the background is white because transparent is inconvenient)
png(file="plot2.png")
par(bg="white", mfrow = c(1, 1))
plot(Data$Time, Data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", main = "", type="n")
lines(Data$Time, Data$Global_active_power, type="l")
dev.off()