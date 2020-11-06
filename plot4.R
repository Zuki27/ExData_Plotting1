data<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")


dat<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 


dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time))

png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2)) 
plot(dat$DateTime, dat$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
plot(dat$DateTime, dat$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 
plot(dat$DateTime, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")  
plot(dat$DateTime, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  
dev.off()
