##load data from current directory

#DataDic <- read.table("C:\\Users\\Razib\\Desktop\\result\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE, na.strings = "?")

DataDic <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors =FALSE, na.strings = "?")

##get subset data from DataDic with respect to given constrain

subDate <- subset(DataDic, as.Date(DataDic$Date, "%d/%m/%Y") >='2007-02-01' & as.Date(DataDic$Date, "%d/%m/%Y") <= '2007-02-02')

##Convert the subsetDate from char to Date formate.

subDate$Date2 <- strptime(paste(subDate$Date, subDate$Time), "%d/%m/%Y %H:%M:%S")
#png(filenam ="C:\\Users\\Razib\\Desktop\\result\\plot1.png", width = 480, height = 480)
png(filenam ="plot1.png", width = 480, height = 480)
hist(subDate$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")
dev.off()

