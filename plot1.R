library(readr)
library(dplyr)


# Loading the data

"dataset" <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# change format type of "Date" & "Time" column 

dataset$Date <- strptime(dataset$Date, format = "%d/%m/%Y")  # Date-time Conversion Functions to and from Character
dataset$Date<- as.Date(dataset$Date)                         # Formating "date" column as.Date

# subset data from 2007-02-01 to 2007-02-02

"dataset" <- filter(dataset, dataset$Date >= "2007-02-01" , dataset$Date <= "2007-02-02" )

# Making plot1

dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

png("plot1.png", width = 480, height = 480)

"plot1" <- hist(dataset$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()
