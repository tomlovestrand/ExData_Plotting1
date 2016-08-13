## plot4 - R SCRIPT FOR THE WEEK 1 ASSIGNMENT

## Read the data
working <- read.csv("./data/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?")

## convert factor dates
working$Date<-as.Date(working$Date, format="%d/%m/%Y")

## define start and stop points, subset the data
beginDate <- "2007-02-01"
endDate <- "2007-02-02"
workingSubset<-subset(working, working$Date>=beginDate & working$Date<=endDate)

## append the $Time column to the $Date column and add separator
workingSubset$Date<-strptime(paste(workingSubset$Date, workingSubset$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

## plot4 - Combination plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with (workingSubset, {
    plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(Date, Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", lty=1, lwd=1)
    lines(workingSubset$Date, workingSubset$Sub_metering_2, col="red")
    lines(workingSubset$Date, workingSubset$Sub_metering_3, col="blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), cex=0.7, lty=1,lwd=2, bty="n")
    plot(Date, Global_reactive_power, type="l", xlab="datetime", ylab= "Global_reactive_power")
})
dev.off()