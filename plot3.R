power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(power) <- c("Date", "Time", "Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3")

sub_power <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

##
GAP <- as.numeric(sub_power$Global_active_power)
datetime <- strptime(paste(sub_power$Date, sub_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_meter1 <- as.numeric(sub_power$Sub_metering_1)
sub_meter2 <- as.numeric(sub_power$Sub_metering_2)
sub_meter3 <- as.numeric(sub_power$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub_meter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_meter2, type="l", col="red")
lines(datetime, sub_meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()


