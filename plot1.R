raw <- read.table("household_power_consumption.txt",
                  header=T, sep=";", na.strings = "?")
epc <- raw[raw$Date=="1/2/2007"| raw$Date== "2/2/2007",]
png("plot1.png")
hist(epc$Global_active_power, col="red", 
    xlab="Global Active Power (kilowatts)", main ="Global Active Power")
dev.off()