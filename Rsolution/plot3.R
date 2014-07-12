##load data from current directory

#DataDic <- read.table("C:\\Users\\Razib\\Desktop\\result\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE, na.strings = "?")

DataDic <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE, na.strings = "?")

##get subset data from DataDic with respect to given constrain

subDate <- subset(DataDic, as.Date(DataDic$Date, "%d/%m/%Y") >='2007-02-01' & as.Date(DataDic$Date, "%d/%m/%Y") <= '2007-02-02')
#png(filenam ="C:\\Users\\Razib\\Desktop\\result\\plot3.png", width = 480, height = 480)

png(filename ="plot3.png", width = 480, height = 480)
plot(subDate$Date2, subDate$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="")
lines(subDate$Date2, subDate$Sub_metering_2, col="red")
lines(subDate$Date2, subDate$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1),col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
