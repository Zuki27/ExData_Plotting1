data<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")


dat<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 


dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time))

png("plot3.png", width = 480, height = 480)
plot(dat$DateTime, dat$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
