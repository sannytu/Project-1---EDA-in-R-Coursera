ibrary(readr)
library(dplyr)


# Loading the data

"dataset" <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
"df" <- filter(dataset, dataset$Date %in% c("1/2/2007","2/2/2007"))
  
# concatenate and change format type of "Date" & "Time" column 

df$DateTime <- paste(df$Date, df$Time, sep = " ")
df$DateTime <- strptime(df$DateTime,"%d/%m/%Y %H:%M:%S")  # Date-time Conversion Functions to and from Character
str(df)
# Making plot2

df$Global_active_power <- as.numeric(df$Global_active_power)

png("plot2.png", width = 480, height = 480)
"plot2" <- plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()