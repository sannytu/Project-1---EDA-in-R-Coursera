library(readr)
library(dplyr)


# Loading the data

"dataset" <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# filter the data

"df" <- filter(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")

# combine "Date" and "Time" column and fix the format

df$datetime <- paste(df$Date, df$Time, sep = " ")
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S")
str(df)


# Making plot3

df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)


png("plot3.png", width = 480, height = 480)
"plot3" <- plot(x = df$datetime, y = df$Sub_metering_1, type = "l", col = "black", ylim = c(0,30), xlab = " ", ylab = "Energy Sub metering")
lines(x = df$datetime, y = df$Sub_metering_2, type = "l", col = "red")
lines(x = df$datetime, y = df$Sub_metering_3, type = "l", col = "blue")
legend("topright",                                       
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
