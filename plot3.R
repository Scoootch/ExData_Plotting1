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
png(file="plot3.png")
par(bg="white", mfrow = c(1, 1))
plot(Data$Time, Data$Sub_metering_1, ylab = "Energy sub metering", xlab="", main = "", type="n")
lines(Data$Time, Data$Sub_metering_1, type="l")
lines(Data$Time, Data$Sub_metering_2, type="l", col = "red")
lines(Data$Time, Data$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()