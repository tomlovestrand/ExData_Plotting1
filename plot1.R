## R SCRIPT FOR THE WEEK 1 ASSIGNMENT - plot1

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

## plot1 - Histogram - Global Active Power
png("plot1.png", width=480, height=480)
hist(workingSubset$Global_active_power, 12, col="red", ylab="Frequency",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()