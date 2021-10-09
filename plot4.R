library(readr)
library(dplyr)

# Loading the data and filter the data only in Date 1-2-2007 to 2-2-2007

"dataset" <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
"df" <- filter(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")

# Combine "Date" and "Time" column and fix the format

df$datetime <- paste(df$Date, df$Time, sep = " ")
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S")

# Make a plot

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Voltage <- as.numeric(df$Voltage)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Global_reactive_power <- as.numeric(df$Global_active_power)

png("plot4.png", width = 480, height = 480)

"plot4" <- par(mfrow = c(2,2), mar = c(4,4,2,1))
plot(df$datetime, df$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
plot(df$datetime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df$datetime, df$Sub_metering_1, type = "l", xlab = " ", ylab = "Energi sub metering", col = "black")
lines(df$datetime, df$Sub_metering_2, type = "l", col = "red")
lines(df$datetime, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue", lty = 1))
plot(df$datetime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
