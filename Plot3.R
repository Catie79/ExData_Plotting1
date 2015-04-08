#Creating Plot 3

#Importing data and subsetting
household_power_consumption <- read.csv("C:/R Files/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
household_power_consumption$DateTime <- paste (household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DateTimeProper = strptime(household_power_consumption$DateTime, "%d/%m/%Y %H:%M:%S")
household_power_consumption$DateTimeProper2 <- as.Date (household_power_consumption$DateTimeProper)
dataset <- household_power_consumption[ which(household_power_consumption$DateTimeProper2 == "2007-02-01"| household_power_consumption$DateTimeProper2 == "2007-02-02"), ]

#subsetting data
temp <- c(7,8,9,11)
plot3 <- dataset[temp]

#Creating the line graph

png(filename = "Plot3.png",width = 480, height = 480, units = "px")
with(plot3, plot(DateTimeProper, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(plot3, lines(DateTimeProper, Sub_metering_1, col = "black"))
with(plot3, lines(DateTimeProper, Sub_metering_2, col = "red"))
with(plot3, lines(DateTimeProper, Sub_metering_3, col = "blue"))
legend ("topright", names, col = colors, lty = 1)
dev.off()

