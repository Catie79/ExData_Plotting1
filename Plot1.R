#Creating Plot 1

#Importing data and subsetting
household_power_consumption <- read.csv("C:/R Files/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
household_power_consumption$DateTime <- paste (household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DateTimeProper = strptime(household_power_consumption$DateTime, "%d/%m/%Y %H:%M:%S")
household_power_consumption$DateTimeProper2 <- as.Date (household_power_consumption$DateTimeProper)
dataset <- household_power_consumption[ which(household_power_consumption$DateTimeProper2 == "2007-02-01"| household_power_consumption$DateTimeProper2 == "2007-02-02"), ]

#make character string numeric
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

#Creating histogram as png
png(filename = "Plot1.png",width = 480, height = 480, units = "px")
hist(dataset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
