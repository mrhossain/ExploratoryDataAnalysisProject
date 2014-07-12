##load data from current directory

#DataDic <- read.table("C:\\Users\\Razib\\Desktop\\result\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE, na.strings = "?")

DataDic <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE, na.strings = "?")

##get subset data from DataDic with respect to given constrain

subDate <- subset(DataDic, as.Date(DataDic$Date, "%d/%m/%Y") >='2007-02-01' & as.Date(DataDic$Date, "%d/%m/%Y") <= '2007-02-02')

##Convert the subsetDate from char to Date formate.

subDate$Date2 <- strptime(paste(subDate$Date, subDate$Time), "%d/%m/%Y %H:%M:%S")
#png(filenam ="C:\\Users\\Razib\\Desktop\\result\\plot4.png", width = 480, height = 480)

png(filename ="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(subDate$Date2, subDate$Global_active_power, type = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(subDate$Date2, subDate$Global_active_power)

plot(subDate$Date2, subDate$Voltage, type = "n", 
     xlab = "datetime", ylab = "Voltage")
lines(subDate$Date2, subDate$Voltage)

plot(subDate$Date2, subDate$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub meeting")
lines(subDate$Date2,subDate$Sub_metering_1)
lines(subDate$Date2,subDate$Sub_metering_2, col = "red")
lines(subDate$Date2,subDate$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"),lty = c(1,1),bty="n")

plot(subDate$Date2,subDate$Global_reactive_power, type = "n", 
     xlab = "datetime")
lines(subDate$Date2,subDate$Global_reactive_power)
dev.off()
