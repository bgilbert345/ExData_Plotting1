raw <- read.table("household_power_consumption.txt",
                  header=T, sep=";", na.strings = "?")
epc <- raw[raw$Date=="1/2/2007"| raw$Date== "2/2/2007",]
epc$Date<-weekdays(as.Date(epc$Date, "%d/%m/%Y"))
png("plot4.png")
par(mfrow=c(2,2))
plot(epc$Global_active_power,xaxt="n",type="l",xlab="",
     ylab="Global active power (kilowatts)")
axis(1, at=c(1,min(which(epc$Date=="Friday")),
             length(epc$Date)), labels<-c("Thursday","Friday","Saturday"))
plot(epc$Voltage,xaxt="n",type="l",xlab="datetime",
     ylab="Voltage")
axis(1, at=c(1,min(which(epc$Date=="Friday")),
             length(epc$Date)), labels<-c("Thursday","Friday","Saturday"))
plot(epc$Sub_metering_1,xaxt="n",type="l",xlab="",
     ylab="Energy sub metering")
lines(epc$Sub_metering_2, col="red")
lines(epc$Sub_metering_3, col="blue")
axis(1, at=c(1,min(which(epc$Date=="Friday")),
             length(epc$Date)), labels<-c("Thursday","Friday","Saturday"))
legend("topright", legend=c("Sub metering 1", "Sub metering 2",
                            "Sub metering 3"), col = c("black","blue","red"),lty=1)
plot(epc$Global_reactive_power,xaxt="n",type="l",xlab="datetime",
     ylab="Global reactive power (kilowatts)")
axis(1, at=c(1,min(which(epc$Date=="Friday")),
             length(epc$Date)), labels<-c("Thursday","Friday","Saturday"))
dev.off()