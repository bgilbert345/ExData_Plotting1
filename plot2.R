raw <- read.table("household_power_consumption.txt",
                  header=T, sep=";", na.strings = "?")
epc <- raw[raw$Date=="1/2/2007"| raw$Date== "2/2/2007",]
epc$Date<-weekdays(as.Date(epc$Date, "%d/%m/%Y"))
png("plot2.png")
plot(epc$Global_active_power,xaxt="n",type="l",xlab="",
     ylab="Global active power (kilowatts)")
axis(1, at=c(1,min(which(epc$Date=="Friday")),
             length(epc$Date)), labels<-c("Thursday","Friday","Saturday"))
dev.off()